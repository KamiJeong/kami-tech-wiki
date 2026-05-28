---
name: "speckit-rules"
description: "Pipeline stage sequencing rules and mode-specific halt logic for the speckit-auto orchestrator."
argument-hint: ""
compatibility: "Referenced by speckit-auto/SKILL.md"
metadata:
  author: "speckit-auto-workflow"
  source: "specs/008-speckit-auto-workflow"
user-invocable: false
disable-model-invocation: true
---

## Pipeline Stage Sequence

Stages execute in this fixed order:

```
specify → clarify → checklist → plan → tasks → analyze → [guard check] → implement → review → done
```

## Stage-to-Agent Mapping

| Stage | Agent (subagent_type) | Output Artifact |
|-------|-----------------------|-----------------|
| specify | speckit-specifier | spec.md |
| clarify | speckit-clarifier | spec.md (updated) |
| checklist | speckit-checklister | checklists/requirements.md |
| plan | speckit-planner | plan.md, research.md, data-model.md, contracts/ |
| tasks | speckit-tasker | tasks.md |
| analyze | speckit-analyzer | analysis.md |
| implement | speckit-implementer | modified source files, updated tasks.md |
| review | speckit-reviewer | review-report.md |

## Mode-Specific Halt Rules

### plan-only

- Run: specify → clarify → checklist → plan → tasks → analyze
- After analyze: write `pipeline-state.json` with `status: "done"`, `stage: "analyze"`
- Output changed-files list and `Recommended next step: /speckit-implement`
- **Stop. Do not invoke guard or implementer.**

### gated

- Run: specify → clarify → checklist → plan → tasks → analyze
- After analyze: run guard check
  - If BLOCKED: write `status: "blocked"`, print BLOCKED reason, stop
  - If PASS: write `status: "paused"`, prompt user for approval
    - On approval: run implement → review → write `status: "done"`
    - On denial: write `status: "blocked"`, `blocked_reason: "user denied"`

### auto-implement

- Run: specify → clarify → checklist → plan → tasks → analyze
- After analyze: run guard check
  - If BLOCKED: write `status: "blocked"`, print BLOCKED reason, **stop — do not implement**
  - If PASS: run implement → review → write `status: "done"`

## Resume Logic

On startup, if `pipeline-state.json` exists in the feature directory:

1. Read `stages_completed` array
2. Skip any stage already in `stages_completed`
3. Resume from the next stage in the sequence
4. `status: "paused"` → proceed to prompt user for approval (gated) or run implement (auto if guard was PASS)
5. `status: "blocked"` → print blocked reason and stop; new run required

## Inline Hook Execution (FR-013)

After each stage completes, the orchestrator MUST call these hooks inline as Agent invocations — NOT via EXECUTE_COMMAND:

```
Agent(subagent_type: "speckit-git-commit", prompt: "after_<stage>")
Agent(subagent_type: "speckit-token-analyzer-baseline", prompt: "after_<stage>")
```

Hook failures are warnings only — they do not halt the pipeline.

## Guard Check Invocation

```bash
bash .Codex/skills/speckit-guards/scripts/guard.sh \
  --description "<feature_description>" \
  --spec "<feature_dir>/spec.md" \
  --analysis "<feature_dir>/analysis.md"
```

Parse result: if `"result":"BLOCKED"` → halt; if `"result":"PASS"` → continue.
