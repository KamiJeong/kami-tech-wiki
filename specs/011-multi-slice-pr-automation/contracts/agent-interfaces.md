# Agent Interface Contracts

**Feature**: 011-multi-slice-pr-automation | **Date**: 2026-05-18

Defines the input/output contracts for each new or updated agent.

---

## speckit-scheduler (NEW)

**Role**: Intake analysis — decompose a large feature request into slices, build the dependency graph and conflict matrix, and select an execution strategy.

**Trigger**: Called by `speckit-auto` SKILL.md before the per-slice pipeline begins.

**Inputs** (from prompt):
- `EPIC_DESCRIPTION`: full user-provided feature description string
- `REPO_ROOT`: absolute path to repo root

**Outputs** (written to disk):
- `.specify/intake/<slug>/slice-state.json` — epic and slice state (schema in data-model.md)
- `.specify/intake/<slug>/slice-dependency-graph.md`
- `.specify/intake/<slug>/conflict-matrix.md`
- `.specify/intake/<slug>/execution-plan.md`

**Return value** (in agent response text):
```
SCHEDULER_RESULT: <slug> | <strategy> | <slice_count> | PASS|STOP_AND_ASK
```

**Preconditions**: None (first agent called in multi-slice path).

**Safety constraint**: Must classify each slice as `safety_sensitive: true/false` by running keyword check against `SAFETY_KEYWORDS` from `guard.sh`.

---

## speckit-integrator (UPDATED)

**Role**: Orchestrate multi-slice execution — read the execution plan, dispatch per-slice pipelines in batches, and persist intermediate state.

**Trigger**: Called by `speckit-auto` after `speckit-scheduler` returns `PASS`.

**Inputs** (from prompt):
- `EPIC_SLUG`: slug string
- `EPIC_DIR`: path to `.specify/intake/<slug>/`
- `MODE`: `plan-only | gated | auto-implement`

**Reads**:
- `.specify/intake/<slug>/slice-state.json`
- `.specify/intake/<slug>/execution-plan.md`

**Outputs**:
- Updated `slice-state.json` after each batch completes

**Behavior**:
1. Read batches from `execution-plan.md`.
2. For each batch: dispatch ≤ 3 slice pipelines via `speckit-auto` (single-spec mode) in parallel (if `is_parallel: true`) or sequentially.
3. After each slice: update `state` and `pipeline_stage` in `slice-state.json`.
4. If a slice reaches `failed`: evaluate dependents → mark as `skipped`.
5. If a slice reaches `blocked`: log and continue with next batch (do not cascade to dependents automatically).

**Resume behavior**: On startup, skip all slices with `state = "completed"`. Resume slices with `state = "running"` from their last `pipeline_stage`.

---

## speckit-committer (NEW)

**Role**: Run the commit guard, stage only slice-relevant files, and create a git commit.

**Trigger**: Called by `speckit-integrator` after a slice passes post-implementation validation.

**Inputs** (from prompt):
- `SLICE_ID`
- `EPIC_SLUG`
- `FEATURE_DIR`: path to the slice's spec directory

**Reads**:
- `.specify/intake/<slug>/slice-state.json` (for `dirty_files_baseline`)
- `guard-before-commit.sh` output

**Outputs**:
- Git commit on the slice's feature branch
- Updated `commit_sha` in `slice-state.json`
- `.specify/intake/<slug>/<slice-id>/test-results.txt` (written by guard script)

**Preconditions** (enforced by `guard-before-commit.sh`):
1. Not on a protected branch (`main`, `master`, `develop`).
2. Test runner exits 0.
3. No unrelated pre-existing changes in staged set.

**Return value**: `COMMIT_RESULT: <sha> | PASS|FAIL | <reason>`

---

## speckit-pr-creator (NEW)

**Role**: Run the PR guard, push the branch, and create a GitHub draft PR.

**Trigger**: Called by `speckit-integrator` after `speckit-committer` returns `PASS`.

**Inputs** (from prompt):
- `SLICE_ID`
- `EPIC_SLUG`
- `FEATURE_DIR`
- `BASE_BRANCH`: resolved by reading `slice-dependency-graph.md`

**Reads**:
- `<FEATURE_DIR>/spec.md` (slice name, spec path)
- `<FEATURE_DIR>/plan.md` (plan path)
- `<FEATURE_DIR>/tasks.md` (tasks path)
- `<FEATURE_DIR>/review-report.md` (reviewer notes, remaining risks)
- `.specify/intake/<slug>/<slice-id>/test-results.txt` (test results)
- `git diff --name-only <base_branch>..HEAD` (changed files)
- `guard-before-pr.sh` output

**Outputs**:
- GitHub draft PR (via `gh pr create --draft`)
- Updated `pr_url` and `pr_base_branch` in `slice-state.json`

**Preconditions** (enforced by `guard-before-pr.sh`):
1. `commit_sha` is set in `slice-state.json` (commit guard already passed).
2. Branch has been pushed to remote (`git push -u origin <branch>`).
3. GitHub CLI (`gh`) is available and authenticated.

**PR body sections** (all required per FR-016):
1. Implemented slice (name and feature directory)
2. Artifact paths (spec.md, plan.md, tasks.md)
3. Changed files summary
4. Test results
5. Remaining risks
6. Reviewer notes

**Graceful degradation**: If `gh` is unavailable, skip PR creation and log warning; commit is preserved.

---

## Guard Scripts

### guard-before-commit.sh

**Location**: `.claude/skills/speckit-guards/scripts/guard-before-commit.sh`

**Inputs** (env vars or args):
- `SLICE_ID`
- `EPIC_SLUG`
- `FEATURE_DIR`

**Checks** (in order):
1. Current branch is not `main`, `master`, or `develop` → exit 1 if true
2. Run test discovery: find `bun test`, `npm test`, or `pytest` → run it → capture output to `test-results.txt` → exit 1 if non-zero
3. Load `dirty_files_baseline` from `slice-state.json` → diff working tree against baseline → if any pre-existing file appears in staged set, exclude it and warn

**Output**: JSON `{"result":"PASS|FAIL","reason":"...","test_results_path":"..."}`

### guard-before-pr.sh

**Location**: `.claude/skills/speckit-guards/scripts/guard-before-pr.sh`

**Inputs** (env vars or args):
- `SLICE_ID`
- `EPIC_SLUG`
- `BASE_BRANCH`

**Checks** (in order):
1. `commit_sha` present in `slice-state.json` → exit 1 if missing
2. Run local wiki validation before push: markdownlint on `wiki/**/*.md`, `validate-summary-links.sh wiki/ko`, and `validate-wiki.sh` → exit 1 if validation fails
3. `git push -u origin <current-branch>` → exit 1 if push fails
4. `gh` CLI available → exit 1 with graceful warning if missing
5. `gh auth status` → exit 1 with graceful warning if unauthenticated

**Output**: JSON `{"result":"PASS|FAIL","reason":"...","branch_pushed":true|false}`
