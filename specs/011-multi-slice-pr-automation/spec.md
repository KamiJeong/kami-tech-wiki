# Feature Specification: Spec Kit Multi-Slice Orchestration and PR Automation

**Feature Branch**: `011-multi-slice-pr-automation`

**Created**: 2026-05-18

**Status**: Active

**Input**: User description: "Spec Kit multi-slice orchestration and PR automation"

## User Scenarios & Testing *(mandatory)*

### User Story 1 - Single Large Request → Auto-Split into Slices (Priority: P1)

A developer submits a large feature request (e.g., "add authentication, notification system, and user profile management") in a single command. The system analyzes the request, determines it should be split into independent slices, builds a dependency graph and conflict matrix, and produces an execution plan before any implementation begins.

**Why this priority**: This is the core entry point of the entire feature. Without correct intake and slicing, all downstream steps are invalid.

**Independent Test**: Can be fully tested by submitting a multi-concept feature description and verifying that the system outputs a structured `execution-plan.md`, `slice-dependency-graph.md`, and `conflict-matrix.md` without proceeding to implementation.

**Acceptance Scenarios**:

1. **Given** a large feature request with 3+ distinct concerns, **When** the user runs the orchestration command, **Then** the system identifies at least 2 slices and outputs the three intake artifacts before proceeding.
2. **Given** a request that is clearly small and self-contained, **When** the system analyzes it, **Then** it chooses `single-spec` strategy and runs the standard Spec Kit pipeline without splitting.
3. **Given** a request containing auth and payment concerns together, **When** the system classifies slices, **Then** both slices are marked as `sequential-only` and not auto-parallelized.

---

### User Story 2 - Dependency-Aware Execution Strategy (Priority: P2)

After slices are identified, the system determines whether they can run in parallel, must run sequentially, or need a foundation-first approach. The user sees a clear execution plan before any slice begins the Spec Kit pipeline.

**Why this priority**: Incorrect parallelization can cause merge conflicts, broken shared contracts, or data corruption. Getting execution order right is the second most critical step.

**Independent Test**: Can be tested by submitting a request with clearly independent slices (e.g., "add analytics dashboard and add export feature") and verifying that the system marks them as `parallel-safe`.

**Acceptance Scenarios**:

1. **Given** two slices with no shared files or contracts, **When** the system evaluates the conflict matrix, **Then** both are marked as `parallel-safe` and scheduled to run concurrently.
2. **Given** a slice that introduces a shared data model used by a second slice, **When** the system evaluates dependencies, **Then** the first slice is scheduled before the second (`foundation-first-then-parallel`).
3. **Given** slices where conflicts cannot be automatically resolved, **When** the system evaluates them, **Then** it chooses `stop-and-ask` strategy and presents the conflict to the user before proceeding.

---

### User Story 3 - Per-Slice Spec Kit Pipeline Execution (Priority: P3)

Each slice is treated as an independent Spec Kit feature and runs through the complete pipeline: specify → clarify → checklist → plan → tasks → analyze → implement → review. The system blocks implementation if analyze reports a CRITICAL issue.

**Why this priority**: Correct per-slice execution is the core value delivery, but it depends on correct slicing and scheduling (P1, P2) being in place first.

**Independent Test**: Can be tested by configuring a single pre-defined slice and verifying it completes all 8 pipeline stages, producing the expected artifacts at each stage.

**Acceptance Scenarios**:

1. **Given** a slice ready for execution, **When** the pipeline runs, **Then** each of the 8 stages (specify, clarify, checklist, plan, tasks, analyze, implement, review) completes and produces its artifact.
2. **Given** a slice where analyze reports a CRITICAL issue, **When** the guard check runs, **Then** the system halts and does not invoke the implementer for that slice.
3. **Given** a slice where implementation fails validation, **When** the post-implementation check runs, **Then** no commit is created and the slice is marked as failed.

---

### User Story 4 - Commit and Draft PR Creation (Priority: P4)

After each slice passes validation, the system creates a git commit, pushes the feature branch, and creates a GitHub draft PR using the CLI. PR bodies include all required context: slice name, artifact paths, changed files, test results, remaining risks, and reviewer notes.

**Why this priority**: PR creation is the final delivery step. It depends on all prior stages completing successfully.

**Independent Test**: Can be tested by using a pre-implemented slice with passing validation and verifying that a draft PR is created with the required sections in the body.

**Acceptance Scenarios**:

1. **Given** a slice with passing validation, **When** the committer and PR creator run, **Then** a commit is created on the feature branch, the branch is pushed, and a draft PR is opened.
2. **Given** a slice whose tests fail, **When** the commit guard runs, **Then** no commit is created and no PR is opened.
3. **Given** two parallel slices that both pass validation, **When** PRs are created, **Then** each slice receives its own separate draft PR.
4. **Given** a dependent slice that builds on a prior slice, **When** its PR is created, **Then** the PR base branch is set to the prior slice's branch, not to main/master/develop.
5. **Given** any slice PR, **When** the PR body is examined, **Then** it contains: slice name, spec/plan/tasks paths, changed file summary, test results, remaining risks, and reviewer notes.

---

### Edge Cases

- What happens when the system cannot determine slice boundaries automatically? → Strategy `stop-and-ask` is selected; user is prompted.
- What happens when git push fails (e.g., no remote configured)? → Commit is preserved locally; PR creation is skipped with a clear error message.
- What happens when `gh` CLI is not installed or not authenticated? → PR creation is skipped with a warning; commits are still created.
- What happens when a shared contract changes mid-execution of parallel slices? → The conflict matrix is re-evaluated; affected parallel slices are demoted to sequential.
- What happens if a pre-existing user change is detected in the working tree before committing? → The commit guard excludes unrelated changes and warns the user.

## Requirements *(mandatory)*

### Functional Requirements

**Intake and Slicing**

- **FR-001**: System MUST accept a single large feature description as input and determine whether it should produce one spec or multiple feature slices.
- **FR-002**: System MUST output `slice-dependency-graph.md` documenting which slices depend on which others before any pipeline stage runs.
- **FR-003**: System MUST output `conflict-matrix.md` listing potential file and contract conflicts between slices.
- **FR-004**: System MUST output `execution-plan.md` specifying the chosen strategy, batch assignments, and parallelization decision for each slice.

**Execution Strategies**

- **FR-005**: System MUST support five execution strategies: `single-spec`, `sequential`, `foundation-first-then-parallel`, `parallel-safe`, `stop-and-ask`.
- **FR-006**: System MUST automatically select `stop-and-ask` when conflicts cannot be resolved deterministically.
- **FR-007**: System MUST NOT auto-parallelize slices classified as auth, payment, security, migration, data deletion, or destructive operations.
- **FR-008**: System MUST NOT parallelize slices when shared contracts between them are not yet finalized.

**Per-Slice Pipeline**

- **FR-009**: Each slice MUST run through all eight Spec Kit stages: specify, clarify, checklist, plan, tasks, analyze, implement, review.
- **FR-010**: System MUST run the guard check after the `analyze` stage and block implementation if the result is `BLOCKED`.
- **FR-011**: System MUST run post-implementation validation before creating any commit.

**Commit Safety**

- **FR-012**: System MUST NOT create commits when validation fails.
- **FR-013**: System MUST NOT include unrelated untracked or pre-existing user changes in commits.
- **FR-014**: System MUST NOT push directly to `main`, `master`, or `develop` branches.

**PR Creation**

- **FR-015**: System MUST create draft PRs by default using the GitHub CLI (`gh`).
- **FR-016**: Each draft PR body MUST contain: slice name, paths to spec/plan/tasks artifacts, changed file summary, test results, remaining risks, and reviewer notes.
- **FR-017**: Parallel slices MUST receive separate draft PRs where possible.
- **FR-018**: Dependent slices MUST use the stacked PR pattern: each slice's PR targets the immediately preceding slice's feature branch, not main/master/develop. When an earlier slice merges, GitHub automatically retargets the dependent PR.

**Artifact Locations**

- **FR-019**: Intake artifacts for an epic MUST be written to `.specify/intake/<epic>/execution-plan.md`, `.specify/intake/<epic>/conflict-matrix.md`, and `.specify/intake/<epic>/slice-dependency-graph.md`.
- **FR-021**: System MUST persist slice-level progress state so that an interrupted orchestration session can be resumed from the last successfully completed slice without re-running earlier slices.
- **FR-022**: System MUST NOT execute more than 3 slice pipelines in parallel simultaneously, regardless of how many slices are marked `parallel-safe`.
- **FR-020**: System MUST NOT overwrite existing `.claude/` settings, agents, or skills beyond what is explicitly required by the feature.

### Key Entities

- **Epic**: A large user-submitted feature request that may be decomposed into multiple slices. Its slug is auto-generated from the first 3–4 meaningful words of the feature description (same heuristic as Spec Kit branch naming) and used as the directory name under `.specify/intake/`.
- **Slice**: An independently specifiable sub-feature derived from an epic. Each slice maps to one Spec Kit feature directory and one git branch. A slice progresses through six lifecycle states: `pending` → `running` → `completed` | `failed` | `skipped` | `blocked`. `blocked` is a distinct terminal state for slices halted by the guard check; `skipped` is for slices not attempted because a dependency failed.
- **Execution Plan**: A document specifying the chosen strategy, the ordered batch list, and the parallelization decision for each slice.
- **Conflict Matrix**: A table mapping pairs of slices to the files, contracts, or data models they share, and whether the conflict is resolvable automatically.
- **Dependency Graph**: A directed graph where an edge from Slice A to Slice B means B cannot begin until A's contracts are frozen.
- **Guard Check**: A validation step run after `analyze` that blocks implementation when CRITICAL issues are found.
- **Commit Guard**: A pre-commit check that ensures only slice-related changes are staged and that validation has passed.
- **PR Guard**: A pre-PR check that verifies the branch has been pushed and that the commit guard has already passed.

## Success Criteria *(mandatory)*

### Measurable Outcomes

- **SC-001**: A user can submit a request with 3 or more distinct concerns and receive a structured execution plan within the same session, without manual intervention for slice identification.
- **SC-002**: The system correctly identifies parallelizable vs. sequential slices with zero false positives on the safety-sensitive slice types (auth, payment, security, migration, data deletion, destructive).
- **SC-003**: Each slice completes the full 8-stage pipeline and produces all required artifacts (spec, plan, tasks, analysis, review report).
- **SC-004**: Commits are never created when post-implementation validation fails.
- **SC-005**: Every draft PR body contains all six required sections (slice name, artifact paths, changed files, test results, remaining risks, reviewer notes).
- **SC-006**: No commit or PR is created that targets `main`, `master`, or `develop` directly.
- **SC-007**: The system adds new agents and skills without modifying or deleting any existing `.claude/` configuration that is not in scope.

## Clarifications

### Session 2026-05-18

- Q: If the orchestration session is interrupted mid-run, should the system support resuming from the last completed slice? → A: Resume from last completed slice; re-run only incomplete slices.
- Q: How many Spec Kit slice pipelines should be allowed to run simultaneously? → A: Up to 3 parallel slices at a time.
- Q: What canonical states should a slice pass through during orchestration? → A: `pending`, `running`, `completed`, `failed`, `skipped`, `blocked` (blocked is a distinct state for guard-halted slices).
- Q: How should the epic directory name under `.specify/intake/<epic>/` be determined? → A: Auto-generated from first 3–4 meaningful words of the feature description, using the same heuristic as Spec Kit branch naming.
- Q: For a chain of dependent slices, how should the PR base branch be set? → A: Each dependent slice PR targets the immediately preceding slice's feature branch (stacked PR pattern).

## Assumptions

- GitHub CLI (`gh`) is installed and authenticated in the environment where implementation runs; if not, PR creation degrades gracefully with a clear warning.
- The Spec Kit pipeline agents (`speckit-specifier`, `speckit-clarifier`, etc.) are already installed in `.claude/agents/` and function correctly for individual slices.
- "Validation" after implementation means running any test scripts discoverable in the project (e.g., `bun test`, `npm test`, `pytest`) or confirming that the implementation review passes if no automated tests exist.
- Slice boundary detection is performed by the `speckit-scheduler` agent using heuristics on the feature description; the scheduler may request user confirmation in ambiguous cases.
- Shared contracts include: TypeScript interfaces, API schemas, database migration files, and shared configuration files referenced by multiple slices.
- A "frozen" contract means the artifact has been committed and no further changes are planned by any earlier slice before later slices begin.
