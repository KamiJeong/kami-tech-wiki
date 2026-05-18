# Data Model: Spec Kit Automated Workflow Orchestration

**Feature**: 008-speckit-auto-workflow | **Date**: 2026-05-18

---

## Entities

### PipelineRun

Represents a single execution of the automated workflow. Persisted to `pipeline-state.json` in the feature directory.

| Field | Type | Values | Required | Notes |
|-------|------|--------|----------|-------|
| `feature_dir` | string | path | ✅ | Relative path from repo root, e.g., `specs/008-speckit-auto-workflow` |
| `mode` | enum | `plan-only`, `gated`, `auto-implement` | ✅ | Set at invocation; immutable for the run |
| `stage` | enum | see Stage enum below | ✅ | Current active or last completed stage |
| `status` | enum | `running`, `paused`, `blocked`, `done` | ✅ | |
| `blocked_reason` | string \| null | free text | — | Populated when `status = blocked` |
| `timestamp` | ISO 8601 | datetime | ✅ | Last update time |
| `stages_completed` | string[] | subset of Stage enum | ✅ | Used to detect resume; ordered by completion |

**Stage enum** (ordered):
```
specify → clarify → checklist → plan → tasks → analyze → implement → review → done
```

**Status transitions**:
```
(new) → running
running → paused        [gated mode, post-analyze, awaiting approval]
running → blocked       [guard BLOCKED result OR CRITICAL issue detected]
running → done          [plan-only: after analyze; auto-implement: after review]
paused → running        [user resumes with approval]
blocked → (terminal)    [requires manual intervention; new run needed]
```

**Validation rules**:
- `blocked_reason` MUST be non-null when `status = blocked`
- `stages_completed` entries MUST be a contiguous prefix of the Stage enum order (no skipping)
- `stage` MUST match the last entry in `stages_completed` or the next stage if `status = running`

---

### GuardResult

Output of `guard.sh`. Ephemeral — not persisted; orchestrator reads from stdout.

| Field | Type | Values | Required | Notes |
|-------|------|--------|----------|-------|
| `result` | enum | `PASS`, `BLOCKED` | ✅ | |
| `reason` | enum \| null | `safety_keyword`, `critical_issue` | — | Populated when `result = BLOCKED` |
| `matched` | string \| null | matched keyword or line | — | Populated when `result = BLOCKED` |

**Exit codes**: `0` = PASS, `1` = BLOCKED, `2` = error (guard script itself failed)

---

### SubAgentDefinition

A `.claude/agents/<name>.md` file. Describes one pipeline stage's agent.

| Field | Type | Notes |
|-------|------|-------|
| `name` | string (frontmatter) | Matches the `subagent_type` used in Agent tool invocations |
| `description` | string (frontmatter) | One-line summary of the stage's responsibility |
| `tools` | string[] (frontmatter, optional) | Allowed tools; defaults to all if omitted |
| body | markdown | Agent system prompt — stage-specific instructions |

**One agent per stage**:
| Agent Name | Stage | Input Artifacts | Output Artifact |
|------------|-------|-----------------|-----------------|
| `speckit-specifier` | specify | feature description (string) | `spec.md` |
| `speckit-clarifier` | clarify | `spec.md` | updated `spec.md` + `## Clarifications` |
| `speckit-checklister` | checklist | `spec.md` | `checklists/requirements.md` |
| `speckit-planner` | plan | `spec.md` + `checklists/requirements.md` | `plan.md`, `research.md`, `data-model.md`, `contracts/` |
| `speckit-tasker` | tasks | `spec.md` + `plan.md` | `tasks.md` |
| `speckit-analyzer` | analyze | `spec.md` + `plan.md` + `tasks.md` | `analysis.md` (with `SEVERITY: CRITICAL` lines if issues found) |
| `speckit-implementer` | implement | `tasks.md` + `plan.md` | modified application source files |
| `speckit-reviewer` | review | `spec.md` + `tasks.md` + git diff | `review-report.md` |

---

### SafetyKeywordList

Static configuration. Single authoritative definition in `speckit-guards/SKILL.md`, referenced by `guard.sh`.

| Keyword | Category |
|---------|----------|
| `auth` | authentication |
| `authentication` | authentication |
| `payment` | financial |
| `billing` | financial |
| `security` | security |
| `migration` | data-ops |
| `data deletion` | destructive |
| `destructive operation` | destructive |
| `drop table` | destructive |
| `truncate` | destructive |
| `wipe` | destructive |
| `purge` | destructive |

**Matching**: case-insensitive substring match against both the feature description string and the body of `spec.md`.

---

### StageOutput

Files produced at each stage. All pre-implement outputs are confined to the feature directory.

| Stage | Output Files | Allowed Paths |
|-------|-------------|---------------|
| specify | `spec.md` | `specs/<NNN>/` |
| clarify | `spec.md` (updated) | `specs/<NNN>/` |
| checklist | `checklists/requirements.md` | `specs/<NNN>/checklists/` |
| plan | `plan.md`, `research.md`, `data-model.md`, `contracts/*` | `specs/<NNN>/` |
| tasks | `tasks.md` | `specs/<NNN>/` |
| analyze | `analysis.md` | `specs/<NNN>/` |
| implement | application source files | anywhere (guarded by FR-007 up to this point) |
| review | `review-report.md` | `specs/<NNN>/` |
| (all stages) | `pipeline-state.json` | `specs/<NNN>/` |

---

## State Machine Diagram

```
[start]
   │
   ▼
specify ──► clarify ──► checklist ──► plan ──► tasks ──► analyze
                                                              │
                              ┌───────────────────────────────┤
                              │                               │
                         CRITICAL?                       mode=plan-only?
                         guard BLOCKED?                       │
                              │                               ▼
                              ▼                            [done]
                          [blocked]
                              │
                    mode=gated? ────► [paused] ──► user approves ──► implement ──► review ──► [done]
                              │
                    mode=auto-implement? ──► implement ──► review ──► [done]
```
