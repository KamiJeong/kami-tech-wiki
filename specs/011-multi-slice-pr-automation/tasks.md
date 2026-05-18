# Tasks: Spec Kit Multi-Slice Orchestration and PR Automation

**Input**: Design documents from `specs/011-multi-slice-pr-automation/`

**Prerequisites**: plan.md ✅, spec.md ✅, research.md ✅, data-model.md ✅, contracts/agent-interfaces.md ✅

**Spec requirements covered**: FR-001–FR-022, SC-001–SC-007

---

## Format: `[ID] [P?] [Story] Description`

- **[P]**: Can run in parallel (no dependency on an incomplete task)
- **[Story]**: User story label (US1–US4)
- All paths are relative to repository root

---

## Phase 1: Setup (Shared Infrastructure)

**Purpose**: Create the `.specify/intake/` runtime directory and any shared template files needed by all phases.

- [x] T001 Create `.specify/intake/` directory with `.gitkeep` so the runtime epic directory structure is established
- [x] T002 [P] Create `.specify/intake/README.md` documenting the epic slug naming convention and the schema of `slice-state.json` (ref: data-model.md)

**Checkpoint**: Intake directory exists and is documented.

---

## Phase 2: Foundational (Blocking Prerequisites)

**Purpose**: Update `speckit-auto/SKILL.md` with the multi-slice routing step. This is the central integration point that all user stories depend on — no per-slice agent work can be verified end-to-end until this routing exists.

**⚠️ CRITICAL**: Phases 3–6 can be implemented independently, but end-to-end testing requires this phase to be complete.

- [x] T003 Read `.claude/skills/speckit-auto/SKILL.md` in full; insert a **Step 1.5 — Multi-slice intake check** block immediately after the argument parsing step (Step 1). The new block must: (a) call `speckit-scheduler` agent with `FEATURE_DESCRIPTION`, (b) parse `SCHEDULER_RESULT` for strategy and slice count, (c) if `slice_count > 1` and strategy ≠ `single-spec`, hand off to `speckit-integrator` and stop the single-spec pipeline, (d) if `stop-and-ask`, present conflict to user and halt, (e) if `single-spec` or `slice_count = 1`, fall through to existing Step 2 unchanged. Do NOT modify any other part of SKILL.md. (ref: spec §FR-001, FR-005, plan.md §Multi-Slice Routing)

**Checkpoint**: `speckit-auto/SKILL.md` routes multi-slice epics without breaking the existing single-spec path.

---

## Phase 3: User Story 1 — Intake and Slice Planning (Priority: P1) 🎯 MVP

**Goal**: Accept a large feature description, split it into slices, and produce all three intake artifacts before any pipeline stage begins.

**Independent test**: Submit a 3-concern feature description to `speckit-scheduler`; verify `execution-plan.md`, `slice-dependency-graph.md`, and `conflict-matrix.md` appear in `.specify/intake/<slug>/` with correct content.

- [x] T004 [US1] Create `.claude/agents/speckit-scheduler.md` with the agent definition. The agent must: (a) receive `EPIC_DESCRIPTION` and `REPO_ROOT` from the prompt, (b) generate the epic slug using the same heuristic as `generate_branch_name()` in `.specify/scripts/bash/create-new-feature.sh`, (c) detect slice boundaries via conjunction markers and domain noun clustering, (d) classify each candidate slice as `safety_sensitive: true/false` by keyword-matching against `SAFETY_KEYWORDS` from `.claude/skills/speckit-guards/scripts/guard.sh`, (e) build the dependency graph by identifying shared contracts (TypeScript interfaces, API schemas, migration files, config files), (f) build the conflict matrix for all slice pairs, (g) select the execution strategy per spec §FR-005–FR-008, (h) write all four output files to `.specify/intake/<slug>/`. Return `SCHEDULER_RESULT: <slug> | <strategy> | <slice_count> | PASS|STOP_AND_ASK`. (ref: spec §FR-001–FR-008, contracts/agent-interfaces.md §speckit-scheduler)
- [x] T005 [P] [US1] Create `.specify/intake/` template for `execution-plan.md`: write a Markdown template file at `.specify/templates/intake-execution-plan.md` documenting all required sections (chosen strategy, rationale, batch table with columns Batch/Slices/Mode/Dependencies, safety-sensitive slices list, resumability note). (ref: spec §FR-004, FR-019, data-model.md §execution-plan.md)
- [x] T006 [P] [US1] Create `.specify/templates/intake-conflict-matrix.md`: Markdown template with required columns (Slice A, Slice B, Shared Resource, Resource Type, Resolvable Automatically?) and a notes section for unresolvable conflicts. (ref: spec §FR-003, FR-019, data-model.md §conflict-matrix.md)
- [x] T007 [P] [US1] Create `.specify/templates/intake-slice-dependency-graph.md`: Markdown template with required sections (summary table with columns Slice ID/Slice Name/Depends On/Safety Sensitive, optional Mermaid diagram block, batch assignment table). (ref: spec §FR-002, FR-019, data-model.md §slice-dependency-graph.md)

**Checkpoint**: `speckit-scheduler` agent produces all three intake artifacts for a multi-concept input. Single-concern input produces strategy `single-spec`.

---

## Phase 4: User Story 2 — Dependency-Aware Execution Orchestration (Priority: P2)

**Goal**: Read the execution plan, dispatch slice pipelines in dependency-correct order (≤ 3 parallel), persist state, and support resume.

**Independent test**: Given a pre-written `slice-state.json` and `execution-plan.md` with 3 slices (2 parallel + 1 dependent), verify `speckit-integrator` dispatches the first 2 simultaneously and the third only after both complete.

- [x] T008 [US2] Create `.claude/agents/speckit-integrator.md` with the agent definition. The agent must: (a) receive `EPIC_SLUG`, `EPIC_DIR`, and `MODE` from the prompt, (b) read `slice-state.json` and `execution-plan.md`, (c) on startup skip slices with `state = "completed"` and resume slices with `state = "running"` from their last `pipeline_stage`, (d) for each batch, dispatch ≤ 3 slice pipelines via `speckit-auto` (single-spec mode) — fire parallel-safe batches as simultaneous Agent calls in one message block, sequential batches one at a time, (e) after each slice completes, update `state` and `pipeline_stage` in `slice-state.json`, (f) if a slice reaches `"failed"`, evaluate its dependents and set their state to `"skipped"`, (g) if a slice reaches `"blocked"`, log and continue with the next batch without cascading. (ref: spec §FR-009, FR-021, FR-022, Clarifications Q1 Q2, contracts/agent-interfaces.md §speckit-integrator)
- [x] T009 [P] [US2] Add `slice-state.json` schema validation to `speckit-integrator.md`: document the six valid `state` values (`pending`, `running`, `completed`, `failed`, `skipped`, `blocked`) and their valid transitions as a reference table within the agent definition. (ref: spec §Clarifications Q3, data-model.md §Slice)

**Checkpoint**: `speckit-integrator` reads a pre-populated `execution-plan.md`, processes all batches in dependency order, and correctly updates `slice-state.json` after each slice.

---

## Phase 5: User Story 3 — Per-Slice Pipeline Execution (Priority: P3)

**Goal**: Each slice runs the complete 8-stage Spec Kit pipeline. Implementation is blocked if analyze returns CRITICAL.

**Independent test**: Configure a single slice in `slice-state.json`; run `speckit-integrator` in `plan-only` mode and verify all 8 stages complete with artifacts present in the slice's feature directory.

- [x] T010 [US3] Update `speckit-integrator.md` to add the guard-check routing logic: after the `analyze` stage completes for a slice, read the slice's `pipeline-state.json` and `analysis.md`; if the guard check result is `BLOCKED`, set slice state to `"blocked"` and skip `implement` and `review` for that slice; if `PASS`, continue to `implement`. Document this as the **Guard Check Routing** section within the agent definition. (ref: spec §FR-010, US3 Acceptance Scenario 2)
- [x] T011 [P] [US3] Update `speckit-integrator.md` to add the post-implementation validation step: after `implement` completes for a slice, call `guard-before-commit.sh` (not yet implemented — reference the contract); if the script exits non-zero, set slice state to `"failed"` and do not proceed to commit or review; if zero, continue to `review`. (ref: spec §FR-011, FR-012, US3 Acceptance Scenario 3)

**Checkpoint**: `speckit-integrator` skips a slice's implementation when analysis is BLOCKED, and marks a slice failed when post-implementation validation fails.

---

## Phase 6: User Story 4 — Commit Guard, PR Guard, and Draft PR Creation (Priority: P4)

**Goal**: After validation passes, create a commit with only slice-relevant files, push the branch, and open a GitHub draft PR with a structured body.

**Independent test**: Given a slice with a passing `test-results.txt`, a clean working tree (no pre-existing dirty files), and a pushed branch, verify `speckit-committer` creates a commit and `speckit-pr-creator` opens a draft PR with all six required body sections.

- [x] T012 [US4] Create `.claude/skills/speckit-guards/scripts/guard-before-commit.sh`. The script must: (a) exit 1 if current branch is `main`, `master`, or `develop` (spec §FR-014), (b) run test discovery — search for `bun test`, `npm test`, or `pytest` in order; run the first found; capture stdout+stderr to `.specify/intake/<slug>/<slice-id>/test-results.txt`; exit 1 if non-zero (spec §FR-012), (c) load `dirty_files_baseline` from `slice-state.json`; diff current working tree against baseline; exclude any pre-existing files from the staged set; warn user of excluded files (spec §FR-013). Output JSON: `{"result":"PASS|FAIL","reason":"...","test_results_path":"..."}`. Make executable with `chmod +x`. (ref: spec §FR-012–FR-014, contracts/agent-interfaces.md §guard-before-commit.sh)
- [x] T013 [P] [US4] Create `.claude/skills/speckit-guards/scripts/guard-before-pr.sh`. The script must: (a) read `slice-state.json` and exit 1 with clear message if `commit_sha` is null/missing (spec §FR-015), (b) run `git push -u origin <current-branch>`; exit 1 if push fails with message preserving the git error (spec §FR-014), (c) check `gh` CLI availability via `command -v gh`; if missing, output JSON with `result: "FAIL"` and a graceful warning that PR creation is skipped but commits are preserved (spec §FR-015, Edge Cases), (d) run `gh auth status`; exit 1 with graceful warning if unauthenticated. Output JSON: `{"result":"PASS|FAIL","reason":"...","branch_pushed":true|false}`. Make executable with `chmod +x`. (ref: spec §FR-015, contracts/agent-interfaces.md §guard-before-pr.sh)
- [x] T014 [US4] Create `.claude/agents/speckit-committer.md` with the agent definition. The agent must: (a) receive `SLICE_ID`, `EPIC_SLUG`, `FEATURE_DIR` from the prompt, (b) run `guard-before-commit.sh` and parse its JSON output, (c) if `FAIL`, set slice state to `"failed"` in `slice-state.json` and return `COMMIT_RESULT: FAIL | <reason>`, (d) if `PASS`, stage only the files not in `dirty_files_baseline` using `git add -- <file>...` for each new/modified file in the slice's feature dir and source output, (e) create a commit with message `[Spec Kit] <slice-name>: implement slice`, (f) update `commit_sha` in `slice-state.json`, (g) return `COMMIT_RESULT: <sha> | PASS`. (ref: spec §FR-012–FR-014, contracts/agent-interfaces.md §speckit-committer)
- [x] T015 [P] [US4] Create `.claude/agents/speckit-pr-creator.md` with the agent definition. The agent must: (a) receive `SLICE_ID`, `EPIC_SLUG`, `FEATURE_DIR`, `BASE_BRANCH` from the prompt, (b) run `guard-before-pr.sh` and parse its JSON output, (c) if `FAIL` and `branch_pushed: false`, return `PR_RESULT: SKIP | push failed`, (d) if `gh` unavailable, return `PR_RESULT: SKIP | gh not available`, (e) if `PASS`, assemble the PR body by reading: `spec.md` (slice name + path), `plan.md` path, `tasks.md` path, `review-report.md` (reviewer notes + remaining risks), `.specify/intake/<slug>/<slice-id>/test-results.txt` (test results), `git diff --name-only <BASE_BRANCH>..HEAD` (changed files), (f) resolve `BASE_BRANCH` from `slice-dependency-graph.md` — use predecessor slice's branch if a dependency exists, else repo default branch (spec §FR-018, Clarification Q5), (g) run `gh pr create --draft --base <BASE_BRANCH> --title "<slice-name>" --body "<assembled body>"`, (h) update `pr_url` and `pr_base_branch` in `slice-state.json`. The PR body MUST contain all six sections per spec §FR-016. (ref: spec §FR-015–FR-018, contracts/agent-interfaces.md §speckit-pr-creator)

**Checkpoint**: `guard-before-commit.sh` blocks commits on protected branches and when tests fail. `guard-before-pr.sh` skips PR creation gracefully when `gh` is unavailable. `speckit-committer` and `speckit-pr-creator` complete the full commit→push→PR flow for a passing slice.

---

## Phase 7: Polish and Cross-Cutting Concerns

**Purpose**: Wire all components together in `speckit-integrator`, add PR body template, and verify the end-to-end flow.

- [x] T016 Update `speckit-integrator.md` to add the final post-review commit+PR dispatch: after a slice completes `review`, call `speckit-committer` then `speckit-pr-creator` in sequence; pass correct `SLICE_ID`, `EPIC_SLUG`, `FEATURE_DIR`, and resolved `BASE_BRANCH`; update `slice-state.json` with `pr_url`. (ref: spec §US4 Acceptance Scenarios 1–5, contracts §speckit-integrator)
- [x] T017 [P] Add PR body template to `.specify/templates/pr-body-template.md` with the six required sections as Markdown headings: `## Implemented Slice`, `## Artifact Paths`, `## Changed Files`, `## Test Results`, `## Remaining Risks`, `## Reviewer Notes`. Include placeholder text under each heading. (ref: spec §FR-016)
- [x] T018 [P] Verify shell scripts are executable and pass `shellcheck` linting: run `shellcheck .claude/skills/speckit-guards/scripts/guard-before-commit.sh` and `shellcheck .claude/skills/speckit-guards/scripts/guard-before-pr.sh`; fix any warnings at severity `error` or `warning`. (ref: constitution §VI Code Quality)
- [x] T019 [P] Add a `## Optional Pre-Hook` block to `speckit-auto/SKILL.md` documenting that `before_specify` hook runs per-slice inside the multi-slice path (each slice calls the existing hook chain). Confirm the multi-slice routing added in T003 does not duplicate hook execution for the single-spec fallback path. (ref: spec §FR-020, constitution §II Single Source of Truth)

---

## Dependencies

```
T001, T002 (setup)
    ↓
T003 (foundational — multi-slice routing in speckit-auto)
    ↓
T004, T005, T006, T007  (US1 — parallel within phase)
    ↓
T008, T009              (US2 — parallel within phase)
    ↓
T010, T011              (US3 — parallel within phase)
    ↓
T012, T013, T014, T015  (US4 — T012/T013 parallel, T014/T015 parallel)
    ↓
T016, T017, T018, T019  (polish — parallel within phase)
```

## Parallel Execution Opportunities

- **Within Phase 3 (US1)**: T005, T006, T007 can all run in parallel after T004 starts
- **Within Phase 4 (US2)**: T008 and T009 can run in parallel
- **Within Phase 5 (US3)**: T010 and T011 can run in parallel
- **Within Phase 6 (US4)**: T012+T013 in parallel, then T014+T015 in parallel
- **Within Phase 7**: T017, T018, T019 can all run in parallel after T016

## Implementation Strategy

**MVP scope (US1 only)**: T001 → T003 → T004–T007 → verify `speckit-scheduler` produces intake artifacts for a multi-concept description.

**Full delivery order**: Complete each phase in sequence; within each phase, use parallel tasks where marked `[P]`.

**Total tasks**: 19
**Tasks per user story**: US1=4, US2=2, US3=2, US4=4, Polish=4, Setup+Foundation=3
