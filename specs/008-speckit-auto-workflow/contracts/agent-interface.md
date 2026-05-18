# Contract: Sub-Agent Interfaces

**Feature**: 008-speckit-auto-workflow | **Version**: 1.0.0

## Invocation Pattern

All sub-agents are invoked by the `speckit-auto` orchestrator via the Claude Code Agent tool:

```
Agent(subagent_type: "speckit-<name>", prompt: "<stage-specific prompt with context>")
```

Each agent is also independently invokable by a user in a Claude Code session.

---

## speckit-specifier

**Input**: Feature description string (passed in prompt)
**Output**: `spec.md` written to `$FEATURE_DIR/spec.md`
**Delegates to**: `/speckit-specify` skill
**Done signal**: `spec.md` exists and has no `[NEEDS CLARIFICATION]` markers

---

## speckit-clarifier

**Input**: `$FEATURE_DIR/spec.md` (reads from disk)
**Output**: Updated `spec.md` with `## Clarifications` section
**Delegates to**: `/speckit-clarify` skill
**Done signal**: No `[NEEDS CLARIFICATION]` markers in spec; Clarifications section populated

---

## speckit-checklister

**Input**: `$FEATURE_DIR/spec.md`
**Output**: `$FEATURE_DIR/checklists/requirements.md`
**Delegates to**: `/speckit-checklist` skill
**Done signal**: `checklists/requirements.md` exists with all items evaluated

---

## speckit-planner

**Input**: `$FEATURE_DIR/spec.md`, `$FEATURE_DIR/checklists/requirements.md`
**Output**: `$FEATURE_DIR/plan.md`, `$FEATURE_DIR/research.md`, `$FEATURE_DIR/data-model.md`, `$FEATURE_DIR/contracts/`
**Delegates to**: `/speckit-plan` skill
**Done signal**: `plan.md` exists and Constitution Check section shows no unresolved gates

---

## speckit-tasker

**Input**: `$FEATURE_DIR/spec.md`, `$FEATURE_DIR/plan.md`
**Output**: `$FEATURE_DIR/tasks.md`
**Delegates to**: `/speckit-tasks` skill
**Done signal**: `tasks.md` exists with all tasks linked to spec requirement IDs

---

## speckit-analyzer

**Input**: `$FEATURE_DIR/spec.md`, `$FEATURE_DIR/plan.md`, `$FEATURE_DIR/tasks.md`
**Output**: `$FEATURE_DIR/analysis.md`
**Delegates to**: `/speckit-analyze` skill
**CRITICAL emission rule**: If any CRITICAL severity issue is found, the agent MUST emit at least one line matching `SEVERITY: CRITICAL — <description>` in `analysis.md`.
**Done signal**: `analysis.md` exists

---

## speckit-implementer

**Input**: `$FEATURE_DIR/tasks.md`, `$FEATURE_DIR/plan.md`, `$FEATURE_DIR/spec.md`
**Output**: Modified/created application source files; updated `tasks.md` (tasks marked `[X]`)
**Delegates to**: `/speckit-implement` skill
**Pre-condition**: Guard result MUST be PASS before this agent is invoked (enforced by orchestrator)
**Done signal**: All tasks in `tasks.md` marked `[X]`

---

## speckit-reviewer

**Input**: `$FEATURE_DIR/spec.md`, `$FEATURE_DIR/tasks.md`, git diff (from `git diff HEAD~1`)
**Output**: `$FEATURE_DIR/review-report.md`
**Report structure**:
```markdown
# Review Report

## Changed Files
<git diff --stat output>

## Acceptance Scenario Validation
| Scenario | Status | Notes |
|----------|--------|-------|
| User Story 1 - Scenario 1 | ✅ PASS / ❌ FAIL | <evidence> |
...

## Task Completion
| Task | Status |
|------|--------|
| T-001 | ✅ Complete |
| T-002 | ❌ Incomplete |

## Overall Status
PASS / FAIL
```
**Done signal**: `review-report.md` exists with `## Overall Status` line

---

## Orchestrator Invocation Sequence

```
speckit-auto invokes:
  1. speckit-specifier   → writes spec.md
  2. speckit-clarifier   → updates spec.md
  3. speckit-checklister → writes checklists/requirements.md
  4. speckit-planner     → writes plan.md + research + contracts
  5. speckit-tasker      → writes tasks.md
  6. speckit-analyzer    → writes analysis.md
     [guard check after step 6]
  7. speckit-implementer → [only if guard PASS + mode allows]
  8. speckit-reviewer    → writes review-report.md
```
