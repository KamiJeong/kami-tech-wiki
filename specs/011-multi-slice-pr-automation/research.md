# Research: Spec Kit Multi-Slice Orchestration and PR Automation

**Branch**: `011-multi-slice-pr-automation` | **Date**: 2026-05-18

---

## Decision 1 — Slice Boundary Detection Strategy

**Decision**: Heuristic keyword clustering with mandatory user confirmation for ambiguous cases.

**Rationale**: The scheduler agent reads the feature description and identifies distinct concerns by detecting: (a) conjunction markers ("and", "plus", "also", "additionally"), (b) domain-specific noun clusters (auth, notification, profile, payment, report), and (c) sentence-level independence (each sentence describes a self-contained capability). When ≥ 2 distinct clusters are found, slicing is triggered. When cluster confidence is below threshold, `stop-and-ask` is chosen.

**Alternatives considered**:
- LLM-only classification without heuristics: too expensive and unpredictable for a safety-critical gate
- Fixed keyword dictionary: too rigid; misses novel domain terms
- Sentence count threshold alone: too noisy; one sentence can contain multiple concerns

---

## Decision 2 — State Persistence Format for Resume

**Decision**: One `slice-state.json` file per epic under `.specify/intake/<epic>/`, plus per-slice pipeline-state.json in each feature directory.

**Rationale**: The epic-level `slice-state.json` tracks which slices are `pending/running/completed/failed/skipped/blocked` and which pipeline stage each running slice is at. Each slice's existing `pipeline-state.json` (already used by the single-spec pipeline) records individual stage progress. On resume, the orchestrator reads `slice-state.json` to find incomplete slices, then reads each slice's `pipeline-state.json` to resume mid-pipeline.

**Alternatives considered**:
- Single monolithic state file: harder to merge with existing per-slice pipeline-state.json format
- Database: overkill for a local CLI tool

---

## Decision 3 — Parallelism Implementation

**Decision**: Claude Code `Agent` tool with multiple simultaneous calls in a single message block, capped at 3 concurrent agents.

**Rationale**: The Claude Code harness already supports parallel agent execution when multiple Agent tool calls are issued in one response. The `speckit-integrator` agent groups parallel-safe slices into batches of ≤ 3 and fires them simultaneously. Each batch completes before the next begins, preserving the safety guarantee while maximizing throughput.

**Alternatives considered**:
- Shell background jobs (`&`): not controllable from within Claude Code sessions
- Sequential only: too slow for large epics; undermines the feature's value
- Unlimited parallelism: risks rate limiting and context exhaustion

---

## Decision 4 — Selective Staging for Commit Guard

**Decision**: Record a `git status --porcelain` snapshot at epic start time and use it as a baseline; only stage files that appear in `git diff --name-only HEAD` relative to the slice's feature branch, excluding any file that was already modified before the epic began.

**Rationale**: This satisfies FR-013 (no unrelated changes) without requiring manual file lists. The guard script captures pre-existing dirty files at intake, then at commit time diffs the working tree against that baseline and stages only new/modified files that belong to the current slice's expected artifact set (known from the slice's feature directory and task list).

**Alternatives considered**:
- `git add .`: too broad; includes pre-existing user changes
- Manual file list from tasks.md: maintenance burden; tasks don't always map 1:1 to files

---

## Decision 5 — Epic Slug Generation

**Decision**: Reuse `generate_branch_name()` from `.specify/scripts/bash/create-new-feature.sh`, passing the feature description. Output is 3–4 meaningful words joined by hyphens.

**Rationale**: Reusing the existing function ensures consistency between branch names and epic slugs, and avoids duplicating the stop-word filtering and acronym-preservation logic.

**Alternatives considered**:
- SHA hash of description: not human-readable
- User-provided slug only: extra friction for the core use case

---

## Decision 6 — PR Body Generation

**Decision**: The `speckit-pr-creator` agent generates the PR body by reading: (a) the slice's `spec.md` for the slice name and spec path, (b) `plan.md` and `tasks.md` for their paths, (c) `review-report.md` for reviewer notes and remaining risks, (d) `git diff --name-only` between the slice branch and its base for changed files, and (e) the last test run output stored in `.specify/intake/<epic>/<slice>/test-results.txt`.

**Rationale**: All required PR body sections are derivable from artifacts already produced by the pipeline — no new data sources needed.

**Alternatives considered**:
- Static template filled manually: defeats the automation goal
- LLM-generated summary without source artifacts: unreliable, not traceable

---

## Decision 7 — Stacked PR Base Branch Resolution

**Decision**: The `speckit-pr-creator` reads `slice-dependency-graph.md` to find each slice's direct predecessor. If a predecessor exists, its branch name (from `slice-state.json`) is used as the PR base. If no predecessor, the repo's default branch is used.

**Rationale**: This implements the stacked PR pattern (FR-018, Clarification Q5) cleanly without hardcoding branch names.

**Alternatives considered**:
- Always use main: simpler but breaks stacked review workflow
- User prompt per slice: too many interruptions for large epics

---

## Decision 8 — Safety-Sensitive Slice Detection

**Decision**: Keyword-based detection using the same `SAFETY_KEYWORDS` array already defined in `guard.sh`, extended with slice-specific terms. A slice is marked `safety-sensitive` if any keyword appears in the slice name, description, or any of its inferred file paths.

**Rationale**: Reusing the existing guard.sh keyword list ensures consistency. The `speckit-scheduler` agent calls `guard.sh` per slice during the intake phase to pre-classify safety sensitivity.

**Alternatives considered**:
- Separate keyword list: risk of divergence
- LLM classification only: non-deterministic; safety gates must be deterministic
