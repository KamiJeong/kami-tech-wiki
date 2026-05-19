---
name: "speckit-issue-run"
description: "Auto-scan GitHub issues by label and run the full Spec Kit pipeline. Handles concurrency via claim-based locking, auto-retries ai:blocked issues, and permanently halts after 3 failures."
argument-hint: "[--issue <number>] [--mode plan-only|gated|auto-implement] [--force-restart]"
user-invocable: true
---

## User Input

```text
$ARGUMENTS
```

## Purpose

Invoke with no arguments to automatically find and process the next actionable GitHub issue.
All retry/resume decisions are made automatically from issue labels and the embedded state comment —
no manual `--retry` flags needed.

**State is stored on GitHub** (issue comment), not only locally, so any PC can pick up where another left off.

---

## Glossary

| Term | Meaning |
|------|---------|
| State record | A hidden JSON block embedded in a pinned issue comment — the single source of truth |
| Claim | Writing `claimed_by` + `last_claim_at` to the state record before doing work |
| Stale claim | A claim whose `last_claim_at` is older than 30 minutes |
| Retry count | Number of times the pipeline has failed on this issue (stored in state record) |

---

## Step 1 — Parse arguments

Extract:
- `ISSUE_NUMBER`: value of `--issue` (optional integer). Empty = auto-scan.
- `MODE`: value of `--mode`. Default: `auto-implement`. Valid: `plan-only`, `gated`, `auto-implement`.
- `FORCE_RESTART`: true if `--force-restart` is present.

Generate a unique run identifier for this execution:
```bash
RUN_ID=$(date +%s%N | sha256sum | head -c 8)
```

---

## Step 2 — Determine repo

```bash
REPO=$(gh repo view --json nameWithOwner --jq '.nameWithOwner')
```

---

## Step 3 — Find target issue

### 3a — Auto-scan (no `--issue` given)

Query GitHub in this priority order. Take the **first match** found.

**Priority 1** — `ai: queued`:
```bash
gh issue list --repo "$REPO" --label "ai: queued" --state open \
  --json number,title,body --limit 1 --jq '.[0]'
```
If found → `ISSUE_NUMBER = .number`, `SCAN_LABEL = queued`.

**Priority 2** — `ai: in-progress` with a **stale claim** (potential stuck):
```bash
gh issue list --repo "$REPO" --label "ai: in-progress" --state open \
  --json number,title,body --limit 5 --jq '.[]'
```
For each result: load its state record (Step 4) and check if claim is stale (> 30 min).
Take the first one with a stale or missing claim → `ISSUE_NUMBER`, `SCAN_LABEL = in-progress-stale`.
Skip issues with a fresh claim (another PC is actively working on them — print a notice and skip).

**Priority 3** — `ai: blocked`:
```bash
gh issue list --repo "$REPO" --label "ai: blocked" --state open \
  --json number,title,body --limit 1 --jq '.[0]'
```
If found → `ISSUE_NUMBER`, `SCAN_LABEL = blocked`.

If nothing found in any priority:
```
INFO: 처리할 이슈 없음.
- ai: queued 이슈가 없습니다.
- ai: in-progress 이슈가 있지만 다른 프로세스가 활성 실행 중입니다 (클레임 유효).
- ai: blocked 이슈가 없습니다.
```
Stop (normal exit, not failure).

### 3b — Specific issue (`--issue N` given)

```bash
gh issue view "$ISSUE_NUMBER" --repo "$REPO" \
  --json number,title,body,labels,state \
  --jq '{number:.number, title:.title, body:.body, state:.state, labels:[.labels[].name]}'
```

If `state == "CLOSED"` → print error and stop.

Determine `SCAN_LABEL` from current labels:
- `ai: queued` or no `ai:` label → `SCAN_LABEL = queued`
- `ai: in-progress` → `SCAN_LABEL = in-progress-stale` (user explicitly targeted it, treat as resumable)
- `ai: blocked` → `SCAN_LABEL = blocked`
- `ai: failed` → print:
  ```
  ERROR: Issue #N은 ai: failed 상태입니다 (3회 이상 실패).
  수동으로 원인을 분석하고 이슈를 수정한 뒤 레이블을 'ai: queued'로 변경하세요.
  ```
  Stop.
- `ai: done` → if `FORCE_RESTART`: `SCAN_LABEL = queued`; otherwise print info and stop.

---

## Step 4 — Load state record from issue comments

Search the issue's comments for the state record comment:
```bash
COMMENTS=$(gh issue view "$ISSUE_NUMBER" --repo "$REPO" \
  --json comments --jq '.comments[] | {id: .databaseId, body: .body}')
```

Find the comment whose body contains `<!-- pipeline-state:begin`. This is the **state record comment**.
Store its `COMMENT_ID`.

Parse the JSON block between `<!-- pipeline-state:begin` and `pipeline-state:end -->`:
- `STATE_RUN_ID`
- `STATE_BRANCH`
- `STATE_FEATURE_DIR`
- `STATE_RETRY_COUNT` (default 0 if missing)
- `STATE_CLAIMED_BY`
- `STATE_LAST_CLAIM_AT`
- `STATE_STAGES_COMPLETED` (array, default [])

If no state record comment exists → initialize defaults:
```
STATE_RETRY_COUNT = 0
STATE_STAGES_COMPLETED = []
STATE_BRANCH = ""
STATE_FEATURE_DIR = ""
COMMENT_ID = ""  (will be created in Step 5)
```

---

## Step 5 — Concurrency check

If `SCAN_LABEL != in-progress-stale` and `SCAN_LABEL != blocked`:
- Skip concurrency check (issue is queued, no active runner).

If `STATE_LAST_CLAIM_AT` is set:
```bash
NOW_EPOCH=$(date +%s)
CLAIM_EPOCH=$(date -d "$STATE_LAST_CLAIM_AT" +%s 2>/dev/null || echo 0)
AGE_SECONDS=$((NOW_EPOCH - CLAIM_EPOCH))
```

If `AGE_SECONDS < 1800` (30 minutes) AND `STATE_CLAIMED_BY != $RUN_ID`:
```
INFO: Issue #N is claimed by run '$STATE_CLAIMED_BY' (${AGE_SECONDS}s ago). Skipping to avoid conflict.
```
Stop (normal exit).

If claim is stale or missing → proceed to Step 6.

---

## Step 6 — Retry count check

If `SCAN_LABEL == blocked`:
  - Increment: `NEW_RETRY_COUNT = STATE_RETRY_COUNT + 1`
  - If `NEW_RETRY_COUNT >= 3`:
    ```bash
    gh issue edit "$ISSUE_NUMBER" --repo "$REPO" \
      --remove-label "ai: blocked" \
      --add-label "ai: failed"

    gh issue comment "$ISSUE_NUMBER" --repo "$REPO" --body "$(cat <<'COMMENT'
> [!CAUTION]
> ## 🚫 자동 처리 중단
>
> 이 이슈는 **3회 연속 실패**하여 자동 재시도가 중단되었습니다.
>
> **레이블**: `ai: blocked` → `ai: failed`
>
> ### 필요한 조치
> 1. 아래 실패 이력을 검토하세요.
> 2. 이슈 내용을 수정하거나 원인을 해결하세요.
> 3. 준비가 되면 레이블을 `ai: queued`로 변경하여 재등록하세요.
COMMENT
    )"
    ```
    Stop.

Otherwise set `RETRY_COUNT = NEW_RETRY_COUNT` (will be written in next step).

If `SCAN_LABEL == queued` → `RETRY_COUNT = 0`.
If `SCAN_LABEL == in-progress-stale` → `RETRY_COUNT = STATE_RETRY_COUNT` (resume, not a new failure).

---

## Step 7 — Claim the issue

Determine `RUN_MODE`:
- `queued` → `RUN_MODE = fresh`
- `in-progress-stale` → `RUN_MODE = resume`
- `blocked` → if `STATE_FEATURE_DIR` is set and that directory exists → `RUN_MODE = resume`; otherwise `RUN_MODE = fresh`
- `FORCE_RESTART = true` → override `RUN_MODE = fresh` regardless

Update labels:
```bash
gh issue edit "$ISSUE_NUMBER" --repo "$REPO" \
  --remove-label "ai: queued" \
  --remove-label "ai: blocked" \
  --add-label "ai: in-progress"
```

Write (or update) the state record comment with the claim:

**State record comment format:**
```markdown
<!-- pipeline-state:begin
{
  "run_id": "<RUN_ID>",
  "branch": "<STATE_BRANCH or TBD>",
  "feature_dir": "<STATE_FEATURE_DIR or TBD>",
  "retry_count": <RETRY_COUNT>,
  "claimed_by": "<RUN_ID>",
  "last_claim_at": "<ISO 8601 now>",
  "stages_completed": <STATE_STAGES_COMPLETED>
}
pipeline-state:end -->

## 🤖 AI 파이프라인 상태

| 항목 | 내용 |
|------|------|
| 상태 | in-progress |
| 브랜치 | `<branch or 생성 중...>` |
| 실행 ID | `<RUN_ID>` |
| 재시도 | <RETRY_COUNT> / 3 |
| 마지막 업데이트 | <ISO 8601 now> |
| 완료된 단계 | <stages_completed or 없음> |

> 이 댓글은 파이프라인이 자동으로 관리합니다. 수정하지 마세요.
```

If `COMMENT_ID` exists:
```bash
gh api "repos/$REPO/issues/comments/$COMMENT_ID" \
  --method PATCH \
  -f body="<state record comment>"
```

If no existing state record comment:
```bash
NEW_COMMENT=$(gh issue comment "$ISSUE_NUMBER" --repo "$REPO" \
  --body "<state record comment>" --json id --jq '.id')
COMMENT_ID="$NEW_COMMENT"
```

Save `COMMENT_ID` to local `pipeline-state.json` cache for this session:
```bash
echo "{\"comment_id\": \"$COMMENT_ID\", \"run_id\": \"$RUN_ID\"}" \
  > "${FEATURE_DIR:-/tmp}/pipeline-lock.json"
```

---

## Step 8 — Route by RUN_MODE

### fresh → Step 9 (fresh start)
### resume → Step 10 (resume from state)

---

## Step 9 — Fresh start: create feature branch

Extract `FEATURE_DESCRIPTION` from issue body (strip HTML comments `<!-- -->`).
Set `ISSUE_TITLE` from issue title.

```bash
OUTPUT=$(bash .specify/scripts/bash/create-new-feature.sh \
  --json "$FEATURE_DESCRIPTION")
FEATURE_DIR=$(echo "$OUTPUT" | jq -r '.feature_dir')
BRANCH=$(echo "$OUTPUT" | jq -r '.branch')
```

If fails → **Failure Handler**: stage=`branch-creation`.

Set `STAGES_COMPLETED = []`.

Update state record comment: set `branch = BRANCH`, `feature_dir = FEATURE_DIR`.

Go to **Step 11**.

---

## Step 10 — Resume: locate existing state

Use `STATE_BRANCH` and `STATE_FEATURE_DIR` from Step 4.

If `STATE_FEATURE_DIR` is empty or directory does not exist:
- Attempt to find by scanning `specs/` for a directory matching a slug of `ISSUE_TITLE`.
- If still not found → **Failure Handler**: stage=`resume-locate`, reason=`Cannot locate feature directory. Use --force-restart to start fresh.`

Set `FEATURE_DIR = STATE_FEATURE_DIR`, `BRANCH = STATE_BRANCH`.
Set `STAGES_COMPLETED = STATE_STAGES_COMPLETED`.

Verify local `pipeline-state.json` in `$FEATURE_DIR`:
- If exists: cross-check `stages_completed` and merge (union of both arrays).
- If missing: use `STATE_STAGES_COMPLETED` from GitHub as authoritative.

Post resume notice:
```bash
_update_state_comment "resume" "재개: 완료된 단계 ${STAGES_COMPLETED[*]}"
```

Go to **Step 11**.

---

## Helper: _update_state_comment

Called throughout the pipeline to refresh the state record comment.
Inputs: `STATUS` (string), `NOTE` (string).

1. Re-read current state from GitHub (in case another update happened):
   ```bash
   CURRENT=$(gh api "repos/$REPO/issues/comments/$COMMENT_ID" --jq '.body')
   ```
2. Parse and update the JSON block: set `last_claim_at`, `stages_completed`, `status`.
3. Patch the comment:
   ```bash
   gh api "repos/$REPO/issues/comments/$COMMENT_ID" \
     --method PATCH \
     -f body="<updated state record comment>"
   ```

---

## Step 11 — Planning stages (specify → analyze)

For each stage in `[specify, clarify, checklist, plan, tasks, analyze]`:

**Skip** if stage is in `STAGES_COMPLETED`: print `SKIP: <stage>` and continue.

**Run stage:**

1. `_update_state_comment "running:<stage>" ""`
2. Post progress comment:
   ```bash
   gh issue comment "$ISSUE_NUMBER" --repo "$REPO" \
     --body "**[<stage> 시작]** ⚙️ \`<stage>\` 단계 실행 중..."
   ```
3. Invoke agent:
   ```
   Agent(subagent_type: "speckit-<stage>",
         prompt: "Feature: $FEATURE_DESCRIPTION. Feature directory: $FEATURE_DIR. Run your stage now.")
   ```
   On failure → **Failure Handler**: stage=`<stage>`.

4. Append stage to `STAGES_COMPLETED`.
5. Write local `pipeline-state.json`:
   ```json
   {
     "feature_dir": "<FEATURE_DIR>",
     "mode": "<MODE>",
     "stage": "<stage>",
     "status": "running",
     "stages_completed": ["..."],
     "timestamp": "<ISO 8601>"
   }
   ```
6. `_update_state_comment "completed:<stage>" ""` — updates GitHub state record.
7. Post completion comment:
   ```bash
   gh issue comment "$ISSUE_NUMBER" --repo "$REPO" \
     --body "**[<stage> 완료]** ✅"
   ```
8. Auto-commit (warning only):
   ```bash
   bash .specify/extensions/git/scripts/bash/auto-commit.sh "after_<stage>" 2>/dev/null || true
   ```

---

## Step 12 — Guard check

Skip if `guard` is in `STAGES_COMPLETED`.

```bash
bash .claude/skills/speckit-guards/scripts/guard.sh \
  --description "$FEATURE_DESCRIPTION" \
  --spec "$FEATURE_DIR/spec.md" \
  --analysis "$FEATURE_DIR/analysis.md"
```

- `PASS` → append `guard` to `STAGES_COMPLETED`, proceed.
- `BLOCKED` → **Failure Handler**: stage=`guard`, reason=blocked reason from output.

---

## Step 13 — Mode routing

**plan-only**:
- Update local + GitHub state: `status: done`.
- Remove `ai: in-progress`, apply `ai: done`.
- Post comment: plan-only complete, how to continue.
- Stop.

**gated**:
- Update state: `status: paused`.
- Post comment asking for approval (include issue number for reference).
- Print approval prompt to console and wait.
  - Approved → continue.
  - Denied → **Failure Handler**: stage=`gated-approval`, reason=`User cancelled`.

**auto-implement** → proceed.

---

## Step 14 — Implement stage

Skip if `implement` is in `STAGES_COMPLETED`.

`_update_state_comment "running:implement" ""`

```bash
gh issue comment "$ISSUE_NUMBER" --repo "$REPO" \
  --body "**[implement 시작]** 🔨 구현 단계 실행 중..."
```

```
Agent(subagent_type: "speckit-implementer",
      prompt: "Feature directory: $FEATURE_DIR. Implement all tasks in tasks.md.")
```

On failure → **Failure Handler**: stage=`implement`.

Append `implement` to `STAGES_COMPLETED`. Update both local and GitHub state.

```bash
gh issue comment "$ISSUE_NUMBER" --repo "$REPO" \
  --body "**[implement 완료]** ✅"
```

---

## Step 15 — Review stage

Skip if `review` is in `STAGES_COMPLETED`.

`_update_state_comment "running:review" ""`

```bash
gh issue comment "$ISSUE_NUMBER" --repo "$REPO" \
  --body "**[review 시작]** 🔍 검토 단계 실행 중..."
```

```
Agent(subagent_type: "speckit-reviewer",
      prompt: "Feature directory: $FEATURE_DIR. Review the implementation.")
```

On failure → **Failure Handler**: stage=`review`.

Append `review` to `STAGES_COMPLETED`. Update state.

```bash
gh issue comment "$ISSUE_NUMBER" --repo "$REPO" \
  --body "**[review 완료]** ✅"
```

---

## Step 16 — Auto-commit

```bash
git add -- specs/ wiki/
SPEC_TITLE=$(grep -m1 '^# ' "$FEATURE_DIR/spec.md" | sed 's/^# //')
git commit -m "feat: ${SPEC_TITLE}

Implements #${ISSUE_NUMBER} via AI pipeline." 2>/dev/null || true
COMMIT_SHA=$(git rev-parse HEAD 2>/dev/null || echo "")
```

---

## Step 17 — Create draft PR

```bash
CHANGED_FILES=$(git diff --name-only main..HEAD 2>/dev/null | head -30 || echo "없음")
SPEC_TITLE=$(grep -m1 '^# ' "$FEATURE_DIR/spec.md" | sed 's/^# //')
RISKS=$(grep -A10 -E '(Remaining Risks|잔여 리스크)' "$FEATURE_DIR/review-report.md" 2>/dev/null | tail -9 || echo "N/A")

PR_URL=$(gh pr create \
  --draft \
  --base main \
  --title "$SPEC_TITLE" \
  --body "$(cat <<PRBODY
## 개요

Closes #${ISSUE_NUMBER}

$(head -5 "$FEATURE_DIR/spec.md" | grep -v '^#')

## 아티팩트

| 파일 | 경로 |
|------|------|
| 스펙 | \`${FEATURE_DIR}/spec.md\` |
| 설계 | \`${FEATURE_DIR}/plan.md\` |
| 작업 목록 | \`${FEATURE_DIR}/tasks.md\` |
| 검토 보고서 | \`${FEATURE_DIR}/review-report.md\` |

## 변경 파일

\`\`\`
${CHANGED_FILES}
\`\`\`

## 잔여 리스크

${RISKS}

---
🤖 AI 파이프라인(Spec Kit)으로 자동 생성된 PR입니다.
PRBODY
)" 2>&1)
```

On failure → **Failure Handler**: stage=`pr-creation`, reason=`$PR_URL` (captured error).

---

## Step 18 — Success

```bash
gh issue edit "$ISSUE_NUMBER" --repo "$REPO" \
  --remove-label "ai: in-progress" \
  --add-label "ai: done"
```

Final state record update (mark done, release claim):
```json
{
  "run_id": "<RUN_ID>",
  "branch": "<BRANCH>",
  "feature_dir": "<FEATURE_DIR>",
  "retry_count": <RETRY_COUNT>,
  "claimed_by": "",
  "last_claim_at": "",
  "stages_completed": ["specify","clarify","checklist","plan","tasks","analyze","guard","implement","review"]
}
```

```bash
gh issue comment "$ISSUE_NUMBER" --repo "$REPO" --body "$(cat <<'COMMENT'
## ✅ 파이프라인 완료

| 항목 | 내용 |
|------|------|
| PR | <PR_URL> |
| 커밋 | `<COMMIT_SHA>` |
| 브랜치 | `<BRANCH>` |
| 재시도 횟수 | <RETRY_COUNT> / 3 |

PR을 검토 후 main으로 병합해주세요.
COMMENT
)"
```

---

## Failure Handler

Inputs: `STAGE`, `REASON` (may be empty — use last stderr if so).

### F1 — Release claim in state record
Update state record comment: `claimed_by: ""`, `last_claim_at: ""`, `status: blocked`.
This allows other PCs to pick up the issue without waiting 30 minutes.

### F2 — Update labels
```bash
gh issue edit "$ISSUE_NUMBER" --repo "$REPO" \
  --remove-label "ai: in-progress" \
  --remove-label "ai: queued" \
  --add-label "ai: blocked"
```

### F3 — Write local pipeline state
```json
{
  "stage": "<STAGE>",
  "status": "blocked",
  "blocked_reason": "<REASON>",
  "stages_completed": ["..."],
  "timestamp": "<ISO 8601>"
}
```

### F4 — Post failure comment
```bash
gh issue comment "$ISSUE_NUMBER" --repo "$REPO" --body "$(cat <<'COMMENT'
> [!CAUTION]
> ## ❌ 파이프라인 실패
>
> **실패 단계**: `<STAGE>`
> **실패 원인**: <REASON>
> **재시도 횟수**: <RETRY_COUNT> / 3
>
> 파이프라인이 자동으로 재시도를 예약했습니다.
> `/speckit-issue-run` 을 다시 실행하면 이 이슈를 자동으로 재개합니다.
>
> 처음부터 다시 시작하려면 레이블을 `ai: queued`로 변경하세요.
>
> **실패 시각**: <ISO 8601 timestamp>
COMMENT
)"
```

### F5 — Console output
```
PIPELINE FAILED
  Issue  : #<ISSUE_NUMBER>
  Stage  : <STAGE>
  Reason : <REASON>
  Retries: <RETRY_COUNT> / 3

Label 'ai: blocked' applied.
Next '/speckit-issue-run' run will auto-pick this issue for retry.
```

Stop.
