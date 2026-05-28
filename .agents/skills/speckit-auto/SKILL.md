---
name: "speckit-auto"
description: "Orchestrate the full Spec Kit pipeline from a single command — specify through review — with safety guards and inline hook execution."
argument-hint: '"<feature description>" --mode plan-only|gated|auto-implement'
compatibility: "Requires Spec Kit skills and .Codex/agents/speckit-*.md definitions"
metadata:
  author: "speckit-auto-workflow"
  source: "specs/008-speckit-auto-workflow"
user-invocable: true
disable-model-invocation: false
---

## User Input

```text
$ARGUMENTS
```

## Purpose

Run the complete Spec Kit workflow from one command. Each stage is handled by a dedicated
sub-agent. Hooks (git commit, token baseline) execute inline — no user re-invocation needed.

## Stage Reference

See `.Codex/skills/speckit-rules/SKILL.md` for the full stage sequence, agent mapping, and mode rules.

## Execution

### Step 1 — Parse arguments

Extract from `$ARGUMENTS`:
- `FEATURE_DESCRIPTION`: everything before any `--mode` flag (trim whitespace)
- `MODE`: value of `--mode` flag; default to `plan-only` if absent
- Valid modes: `plan-only`, `gated`, `auto-implement`

If `FEATURE_DESCRIPTION` is empty, output:
```
ERROR: Feature description is required.
Usage: /speckit-auto "<feature description>" --mode plan-only|gated|auto-implement
```
and stop.

### Step 1.5 — Multi-slice intake check

After parsing `FEATURE_DESCRIPTION` and `MODE`, determine whether the request should be split into multiple feature slices:

1. Invoke: `Agent(description: "Intake analysis", subagent_type: "speckit-scheduler", prompt: "EPIC_DESCRIPTION: $FEATURE_DESCRIPTION. REPO_ROOT: <repo root path>. Run your stage now.")`
2. Parse `SCHEDULER_RESULT` from the agent response:
   - Format: `SCHEDULER_RESULT: <slug> | <strategy> | <slice_count> | PASS|STOP_AND_ASK`
3. Route based on result:
   - If `STOP_AND_ASK`: print the conflict details from the agent response, ask the user to clarify slice boundaries, and **stop**. Do not proceed until user re-runs with a revised description.
   - If `strategy = "single-spec"` or `slice_count = 1`: continue to Step 2 (existing single-spec pipeline) unchanged.
   - If `slice_count > 1` and `strategy ≠ "single-spec"`: invoke the multi-slice orchestrator and **stop** the single-spec pipeline:
     ```
     Agent(description: "Multi-slice orchestration", subagent_type: "speckit-integrator",
           prompt: "EPIC_SLUG: <slug>. EPIC_DIR: .specify/intake/<slug>/. MODE: $MODE. Run your stage now.")
     ```
     After the integrator returns, print the epic summary and stop. Do not continue to Steps 2–7.

**Note**: The `before_specify` hook runs per-slice inside the multi-slice path (each slice invokes the existing hook chain independently). Hook execution is NOT duplicated for the single-spec fallback path.

### Step 2 — Resolve feature directory

1. Run: `bash .specify/scripts/bash/check-prerequisites.sh --json --paths-only`
2. Parse `FEATURE_DIR` from JSON output.
3. Set `STATE_FILE` = `$FEATURE_DIR/pipeline-state.json`

### Step 3 — Determine resume point

If `$STATE_FILE` exists:
- Read `stages_completed` array and `status` field.
- If `status` is `"blocked"`: print `Pipeline is BLOCKED: <blocked_reason>. Fix the issue and start a new run.` and stop.
- If `status` is `"done"`: print `Pipeline already complete for this feature. Run /speckit-implement or /speckit-reviewer to re-run individual stages.` and stop.
- If `status` is `"paused"` (gated awaiting approval): jump to the approval prompt in Step 7.
- Otherwise: skip stages already in `stages_completed`.

If `$STATE_FILE` does not exist, start from the beginning.

### Step 4 — Run planning stages (specify → analyze)

For each stage in `[specify, clarify, checklist, plan, tasks, analyze]` (skipping completed):

1. Print: `## Running stage: <stage>`
2. Invoke: `Agent(subagent_type: "speckit-<stage>", prompt: "Feature: $FEATURE_DESCRIPTION. Feature directory: $FEATURE_DIR. Run your stage now.")`
3. After agent returns:
   a. Append stage to `stages_completed`
   b. Write `pipeline-state.json`:
      ```json
      {
        "feature_dir": "<FEATURE_DIR relative to repo root>",
        "mode": "<MODE>",
        "stage": "<stage>",
        "status": "running",
        "blocked_reason": null,
        "timestamp": "<ISO 8601 now>",
        "stages_completed": [<updated array>]
      }
      ```
   c. Run inline hooks (do NOT use EXECUTE_COMMAND — call directly):
      - `Agent(subagent_type: "speckit-git-commit", prompt: "after_<stage>")`
      - `Agent(subagent_type: "speckit-token-analyzer-baseline", prompt: "after_<stage>")`
      - Hook failures are warnings only; do not halt the pipeline.
   d. Print stage output report:
      ```
      ### Stage complete: <stage>
      Changed files: <git diff --name-only HEAD output, or "none" if git unavailable>
      Recommended next stage: <next stage name or "guard check">
      ```

### Step 5 — Guard check

After analyze completes, run:

```bash
bash .Codex/skills/speckit-guards/scripts/guard.sh \
  --description "<FEATURE_DESCRIPTION>" \
  --spec "<FEATURE_DIR>/spec.md" \
  --analysis "<FEATURE_DIR>/analysis.md"
```

Parse result:
- `"result":"PASS"` → proceed to Step 6
- `"result":"BLOCKED"` → write `pipeline-state.json` with `status: "blocked"`, `blocked_reason: "<reason from guard result>"`, print:
  ```
  🚫 BLOCKED: <reason>
  Pipeline halted. Fix the issue or run /speckit-implement manually after resolving.
  ```
  and stop.

### Step 6 — Mode routing

**plan-only**:
- Write `pipeline-state.json` with `status: "done"`, `stage: "analyze"`
- Print:
  ```
  ✅ Plan-only pipeline complete.
  Artifacts: spec.md, plan.md, tasks.md, analysis.md
  Recommended next step: /speckit-implement
  ```
- Stop.

**gated**:
- Write `pipeline-state.json` with `status: "paused"`, `stage: "analyze"`
- Print:
  ```
  ⏸ Pipeline paused after analyze. Guard check: PASS.
  Review the analysis at <FEATURE_DIR>/analysis.md
  Approve implementation? (yes/no)
  ```
- Wait for user input.
  - If "yes" or "y" or "approve": update `status: "running"`, proceed to Step 7
  - Otherwise: write `status: "blocked"`, `blocked_reason: "user denied"`, print `Implementation cancelled.` and stop.

**auto-implement**:
- Guard already passed in Step 5. Proceed directly to Step 7.

### Step 7 — Implement and review

1. Print: `## Running stage: implement`
2. Invoke: `Agent(subagent_type: "speckit-implementer", prompt: "Feature directory: $FEATURE_DIR. Implement all tasks in tasks.md.")`
3. After implement returns: write `pipeline-state.json` stage: "implement", run inline hooks.
4. Print stage output report (changed files, next: review).

5. Print: `## Running stage: review`
6. Invoke: `Agent(subagent_type: "speckit-reviewer", prompt: "Feature directory: $FEATURE_DIR. Review the implementation.")`
7. After review returns: write `pipeline-state.json` status: "done", stage: "review", stages_completed includes "review". Run inline hooks.

8. Print final summary:
   ```
   ✅ Pipeline complete.
   Mode: <MODE>
   Stages: specify → clarify → checklist → plan → tasks → analyze → implement → review
   Review report: <FEATURE_DIR>/review-report.md
   Pipeline state: <FEATURE_DIR>/pipeline-state.json
   ```
