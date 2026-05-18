# Contract: pipeline-state.json

**Feature**: 008-speckit-auto-workflow | **Version**: 1.0.0

## Location

`specs/<NNN>-<feature-name>/pipeline-state.json`

## Schema

```json
{
  "feature_dir": "<string: relative path from repo root>",
  "mode": "<'plan-only' | 'gated' | 'auto-implement'>",
  "stage": "<'specify' | 'clarify' | 'checklist' | 'plan' | 'tasks' | 'analyze' | 'implement' | 'review' | 'done'>",
  "status": "<'running' | 'paused' | 'blocked' | 'done'>",
  "blocked_reason": "<string | null>",
  "timestamp": "<ISO 8601 datetime>",
  "stages_completed": ["<stage>", ...]
}
```

## Example: Running (post-plan)

```json
{
  "feature_dir": "specs/008-speckit-auto-workflow",
  "mode": "gated",
  "stage": "plan",
  "status": "running",
  "blocked_reason": null,
  "timestamp": "2026-05-18T10:15:00Z",
  "stages_completed": ["specify", "clarify", "checklist", "plan"]
}
```

## Example: Paused (gated, awaiting approval)

```json
{
  "feature_dir": "specs/008-speckit-auto-workflow",
  "mode": "gated",
  "stage": "analyze",
  "status": "paused",
  "blocked_reason": null,
  "timestamp": "2026-05-18T10:30:00Z",
  "stages_completed": ["specify", "clarify", "checklist", "plan", "tasks", "analyze"]
}
```

## Example: Blocked (safety keyword)

```json
{
  "feature_dir": "specs/009-user-auth",
  "mode": "auto-implement",
  "stage": "analyze",
  "status": "blocked",
  "blocked_reason": "safety_keyword matched: 'auth'",
  "timestamp": "2026-05-18T11:00:00Z",
  "stages_completed": ["specify", "clarify", "checklist", "plan", "tasks", "analyze"]
}
```

## Invariants

- `blocked_reason` MUST be non-null when `status = "blocked"`
- `stages_completed` MUST be a contiguous ordered prefix of the full stage sequence
- `stage` MUST equal the last entry in `stages_completed` when `status` is `paused`, `blocked`, or `done`
- `timestamp` MUST be updated on every write
