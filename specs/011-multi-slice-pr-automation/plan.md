# Implementation Plan: Spec Kit Multi-Slice Orchestration and PR Automation

**Branch**: `011-multi-slice-pr-automation` | **Date**: 2026-05-18 | **Spec**: [spec.md](./spec.md)

**Input**: Feature specification from `specs/011-multi-slice-pr-automation/spec.md`

---

## Summary

Add a multi-slice orchestration layer to the existing Spec Kit workflow. When a user submits a large feature request, the system analyzes it, splits it into independent feature slices, builds a dependency graph and conflict matrix, selects an execution strategy, and runs each slice through the existing 8-stage pipeline. After each slice passes validation, a commit is created and a GitHub draft PR is opened. The implementation adds four new `.claude/` agent definitions, two shell guard scripts, updates the `speckit-auto` SKILL.md, and defines three intake artifact templates under `.specify/intake/`.

---

## Technical Context

**Language/Version**: Bash (shell scripts), Markdown (agent/skill definitions), TypeScript 6.0.3 (Bun runtime for any new scripts)

**Primary Dependencies**: Claude Code sub-agent system, GitHub CLI (`gh`), existing Spec Kit agents (`speckit-specifier`, `speckit-clarifier`, `speckit-planner`, `speckit-tasker`, `speckit-analyzer`, `speckit-implementer`, `speckit-reviewer`)

**Storage**: File system only — `.specify/intake/<epic>/` for epic-level state, `specs/<NNN>-<slug>/` for per-slice artifacts

**Testing**: `bun test`; shell scripts validated via `shellcheck` and integration tests

**Target Platform**: Any Unix shell with git ≥ 2.0, GitHub CLI ≥ 2.0, Claude Code CLI

**Project Type**: Configuration/automation (agent .md definitions + shell scripts)

**Performance Goals**: Intake analysis (scheduler) completes in one agent call; wall time for full epic depends on slice count

**Constraints**: Must not overwrite existing `.claude/` settings; must not push to `main`/`master`/`develop`; max 3 parallel slices

**Scale/Scope**: Epics with 2–10 slices; max 3 concurrent pipeline runs

---

## Constitution Check

*GATE: Must pass before Phase 0 research. Re-checked after Phase 1 design.*

| Principle | Status | Notes |
|-----------|--------|-------|
| I. Spec Before Code | ✅ PASS | spec.md exists with 22 FRs and 7 SCs |
| II. Single Source of Truth | ✅ PASS | `slice-state.json` is the single state store; per-slice pipeline-state.json is the slice-level store |
| III. Explicit Overrides Only | ✅ PASS | No overrides needed |
| IV. Version-Pinned Stack | ✅ PASS | TypeScript 6.0.3, Bun 1.3.14 both current; version-guard report generated |
| V. Type Safety | ✅ PASS | Shell scripts are typed via shellcheck; any Bun scripts use strict TypeScript |
| VI. Code Quality | ✅ PASS | Each shell script has a single responsibility; agents are minimal |
| VII. Testing Standards | ✅ PASS | Guard scripts will have bun test coverage; agents validated by review stage |
| XII. Security & Privacy | ✅ PASS | No secrets in code; protected branch guard enforced in commit script |
| XV. AI Agent Governance | ✅ PASS | New agents respect constitution; do not self-approve PRs |
| XVI. Definition of Done | ✅ PASS | Tasks map to numbered FRs; DoD tracked per slice |

**Post-Phase 1 re-check**: All principles still pass. No violations to justify.

---

## Project Structure

### Documentation (this feature)

```text
specs/011-multi-slice-pr-automation/
├── plan.md                    # This file
├── research.md                # Phase 0 output
├── data-model.md              # Phase 1 output
├── contracts/
│   └── agent-interfaces.md   # Phase 1 output
├── version-guard-report.md    # Version guard output
├── checklists/
│   ├── requirements.md        # specify-stage checklist
│   └── orchestration.md       # checklist-stage output
└── tasks.md                   # Phase 2 output (speckit-tasks)
```

### Source Files (repository root)

```text
.claude/
├── agents/
│   ├── speckit-scheduler.md        # NEW: intake analysis and slice planning
│   ├── speckit-integrator.md       # NEW: multi-slice execution orchestration
│   ├── speckit-committer.md        # NEW: commit guard and creation
│   └── speckit-pr-creator.md       # NEW: draft PR creation
├── skills/
│   ├── speckit-auto/
│   │   └── SKILL.md               # UPDATE: add multi-slice routing step
│   └── speckit-guards/
│       └── scripts/
│           ├── guard-before-commit.sh   # NEW
│           └── guard-before-pr.sh       # NEW

.specify/intake/                    # NEW directory (runtime, gitignored-optional)
└── <epic-slug>/
    ├── slice-state.json            # Epic + slice lifecycle state
    ├── execution-plan.md           # Chosen strategy and batch plan
    ├── conflict-matrix.md          # Slice-pair conflict analysis
    └── slice-dependency-graph.md   # Directed dependency graph
```

**Structure Decision**: Single-project layout with additions to existing `.claude/` directories. No new top-level directories except `.specify/intake/` (runtime artifact, not source code).

---

## Phase 0: Research

All unknowns resolved. See [research.md](./research.md).

Key decisions:
- Slice boundary detection: heuristic keyword clustering + mandatory `stop-and-ask` for ambiguous cases
- State persistence: `slice-state.json` per epic + existing `pipeline-state.json` per slice
- Parallelism: ≤ 3 concurrent Agent calls in one message block
- Selective staging: baseline snapshot of dirty files at epic start
- Epic slug: reuse `generate_branch_name()` heuristic
- PR body: assembled from existing pipeline artifacts
- Stacked PR base: resolved from `slice-dependency-graph.md`
- Safety detection: keyword check via existing `guard.sh` `SAFETY_KEYWORDS`

---

## Phase 1: Design & Contracts

See [data-model.md](./data-model.md) and [contracts/agent-interfaces.md](./contracts/agent-interfaces.md).

**Key design decisions**:

### Multi-Slice Routing in speckit-auto SKILL.md

The updated `speckit-auto` SKILL.md adds a **Step 1.5 — Multi-slice intake check** between argument parsing and the existing pipeline. If the feature description triggers slice detection:

1. Call `speckit-scheduler` agent with the full description.
2. If result is `STOP_AND_ASK`: present conflict to user and halt.
3. If result is `PASS` with `slice_count > 1`: hand off to `speckit-integrator` for multi-slice execution.
4. If result is `PASS` with `slice_count = 1` (or `single-spec` strategy): fall through to the existing single-spec pipeline unchanged.

This ensures the existing single-spec workflow is not disrupted for small features.

### Commit and PR Flow per Slice

```
[implement] → guard-before-commit.sh → speckit-committer
                                          ↓ (PASS)
                                       guard-before-pr.sh → speckit-pr-creator
                                                                ↓
                                                          gh pr create --draft
```

### Dependency-Aware PR Base Resolution

```python
# Pseudocode in speckit-pr-creator
for slice in completed_slices:
    deps = slice.depends_on
    if deps:
        base = slice_state[deps[-1]].branch  # immediate predecessor
    else:
        base = repo_default_branch
    create_pr(base_branch=base)
```

---

## Complexity Tracking

No constitution violations requiring justification. All new components are minimal and single-purpose.
