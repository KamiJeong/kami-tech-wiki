# Feature Specification: Spec Kit Automated Workflow Orchestration

**Feature Branch**: `008-speckit-auto-workflow`

**Created**: 2026-05-18

**Status**: Draft

**Input**: User description: "Claude Code에서 Spec Kit workflow를 자동화하는 기능을 만들고 싶다. 사용자는 하나의 명령으로 feature request를 입력할 수 있어야 한다."

## Clarifications

### Session 2026-05-18

- Q: How is a "CRITICAL" issue identified in the analyze stage output? → A: The analyzer emits `SEVERITY: CRITICAL` lines in its output; the guard script detects them via pattern match (grep).
- Q: How does the orchestrator invoke each sub-agent? → A: The orchestrator skill uses the Claude Code Agent tool (`Agent(subagent_type: "speckit-<name>", ...)`) to spawn each sub-agent by name.
- Q: When a pipeline halts (BLOCKED or awaiting gated approval), can the user resume in a new session? → A: Yes. The orchestrator writes `pipeline-state.json` under the feature directory tracking current stage, mode, and blocked reason, enabling resume across sessions.
- Q: What does "test result summary" mean for the reviewer when deliverables are Claude Code configuration files? → A: The reviewer checks each acceptance scenario from `spec.md` against delivered artifacts and reports pass/fail per scenario (no external test runner required).
- Feedback: Existing `/speckit-*` skills stop mid-flow when extension hooks fire, requiring user re-invocation to continue. The `speckit-auto` orchestrator must execute all stages AND their associated hooks inline without pausing or requiring re-invocation between stages.

## User Scenarios & Testing *(mandatory)*

### User Story 1 - Single Command Full Workflow (Priority: P1)

A developer types one command with their feature description. The system automatically runs all Spec Kit stages — specify, clarify if needed, checklist validation, plan, tasks, analyze — and either stops at analyze (plan-only), waits for approval (gated), or proceeds to implement if safe (auto-implement).

**Why this priority**: This is the core value proposition. Without this, the feature has no purpose.

**Independent Test**: Run `/speckit-auto "add user login page"` in `plan-only` mode and verify `spec.md`, `plan.md`, `tasks.md`, and `analysis.md` are created with no application source code modified.

**Acceptance Scenarios**:

1. **Given** a developer runs `/speckit-auto "add user login page" --mode plan-only`, **When** all stages complete, **Then** `spec.md`, `plan.md`, `tasks.md`, and `checklists/requirements.md` exist under the feature directory, no application source code is modified, and the final output lists changed files plus the recommended next step.
2. **Given** a developer runs `/speckit-auto "add user login page" --mode gated`, **When** the analyze stage passes without CRITICAL issues, **Then** the system pauses and prompts the user for approval before proceeding to implement.
3. **Given** a developer runs `/speckit-auto "add user login page" --mode auto-implement`, **When** no safety keywords are detected and analyze passes, **Then** the system runs implement automatically without additional prompts.
4. **Given** any mode, **When** a stage produces output files**, **Then** the system prints the list of changed files and the recommended next command before proceeding or stopping.

---

### User Story 2 - Safe Guard Enforcement (Priority: P1)

A developer runs the workflow on a feature that involves authentication, payment, or data deletion. The system must block automatic implementation regardless of mode.

**Why this priority**: Safety is non-negotiable; an accidental `auto-implement` on a destructive operation could cause irreversible harm.

**Independent Test**: Run `/speckit-auto "delete all user accounts" --mode auto-implement` and verify the system stops after analyze with a BLOCKED status message and does not modify any application source files.

**Acceptance Scenarios**:

1. **Given** the feature description contains a safety keyword (auth, payment, security, migration, data deletion, destructive operation), **When** mode is `auto-implement`, **Then** the system runs up to analyze, then stops with a clear BLOCKED message and instructs the user to run implement manually.
2. **Given** the analyze stage returns one or more CRITICAL issues, **When** mode is `auto-implement` or `gated`, **Then** the system does not invoke the implementer sub-agent and displays the CRITICAL issues for resolution.
3. **Given** any mode at any stage before implement, **When** any stage runs, **Then** zero application source files are created or modified.

---

### User Story 3 - Sub-Agent Stage Isolation (Priority: P2)

Each pipeline stage is handled by a dedicated sub-agent. If one stage fails or is blocked, later stages are not run. Sub-agents can also be run individually for incremental workflows.

**Why this priority**: Stage isolation enables reuse, debugging, and partial re-runs without restarting the full pipeline.

**Independent Test**: Invoke the `speckit-clarifier` sub-agent directly on an existing `spec.md` and verify it produces clarification output without invoking specifier, planner, or any other agent.

**Acceptance Scenarios**:

1. **Given** a `spec.md` exists, **When** the `speckit-clarifier` agent is invoked independently, **Then** it reads the spec, identifies ambiguous requirements, and outputs clarification questions without running any other stage.
2. **Given** the `speckit-analyzer` stage finds a CRITICAL issue, **When** the pipeline is in any mode, **Then** the `speckit-implementer` agent is not invoked and the pipeline halts with an actionable error summary.
3. **Given** the pipeline completes the analyze stage, **When** the user re-runs only the implement stage manually, **Then** the `speckit-implementer` reads the existing artifacts and proceeds without regenerating spec, plan, or tasks.

---

### User Story 4 - Post-Implementation Review (Priority: P2)

After implementation, a dedicated reviewer sub-agent examines the diff, test results, and outstanding items, and produces a structured review report.

**Why this priority**: Automated review reduces the chance that partially completed or broken implementations are accepted silently.

**Independent Test**: After a completed implement run, invoke `speckit-reviewer` and verify it outputs a report covering changed files, test pass/fail status, and any items from tasks.md not yet addressed.

**Acceptance Scenarios**:

1. **Given** the implement stage has run, **When** `speckit-reviewer` is invoked, **Then** it outputs a structured report with: (a) list of changed files from git diff, (b) test result summary, (c) tasks.md items marked incomplete.
2. **Given** all tasks in tasks.md are marked complete and tests pass, **When** `speckit-reviewer` runs, **Then** it outputs a PASS status with no outstanding items.
3. **Given** one or more tasks remain incomplete or tests fail, **When** `speckit-reviewer` runs, **Then** it outputs a FAIL status with specific items requiring attention.

---

### Edge Cases

- What happens when the feature description is empty or too vague to generate a spec? — System returns an error with guidance on minimum required detail.
- What happens when clarification questions are not answered within a session? — Pipeline halts at the clarify stage; `pipeline-state.json` records `stage: clarify, status: halted`; user can resume by re-invoking the pipeline in a new session.
- What happens when the analyze stage is skipped or its output file is missing? — Implement is blocked; system requires analyze output before proceeding.
- What happens when the guard script cannot determine safety keyword presence? — System defaults to BLOCKED and requires manual confirmation.
- What happens when a hook (e.g., git commit, token baseline) fails mid-pipeline? — The orchestrator logs the hook failure as a warning, continues to the next stage, and includes the hook failure in the final stage output report. Hook failure does not halt the pipeline unless the hook is classified as a blocking prerequisite for the next stage.

## Requirements *(mandatory)*

### Functional Requirements

- **FR-001**: System MUST accept a feature description as a single command invocation and execute the Spec Kit pipeline stages in order.
- **FR-002**: System MUST support three execution modes: `plan-only`, `gated`, and `auto-implement`, selectable per invocation.
- **FR-003**: System MUST implement each pipeline stage as an independent Claude Code sub-agent (`.claude/agents/<name>.md`): specifier, clarifier, checklister, planner, tasker, analyzer, implementer, reviewer. The orchestrator invokes each via the Claude Code Agent tool (`Agent(subagent_type: "speckit-<name>")`). Each sub-agent definition must also be independently invokable by name without the orchestrator.
- **FR-004**: System MUST output the list of changed files and the recommended next stage at the end of each completed stage.
- **FR-005**: Guard logic MUST block `auto-implement` mode when the feature description or spec contains any of the following safety keywords: auth, payment, security, migration, data deletion, destructive operation.
- **FR-006**: Guard logic MUST block implement execution when the analyze stage output contains one or more lines matching the pattern `SEVERITY: CRITICAL` (case-insensitive). The `speckit-analyzer` sub-agent is responsible for emitting this sentinel format.
- **FR-007**: System MUST NOT modify application source code during any stage prior to implement.
- **FR-008**: In `gated` mode, system MUST pause after the analyze stage and require explicit user approval before invoking the implementer sub-agent.
- **FR-009**: The `speckit-reviewer` sub-agent MUST produce a structured report covering: (a) git diff of changed files, (b) pass/fail status for each acceptance scenario in `spec.md` verified against delivered artifacts, and (c) incomplete tasks from `tasks.md`. No external test runner is required.
- **FR-010**: Each sub-agent MUST be independently invokable so developers can run individual stages without executing the full pipeline.
- **FR-011**: System MUST provide three Claude Code skill files: `speckit-auto` (orchestrator), `speckit-rules` (pipeline stage rules), `speckit-guards` (safety enforcement logic).
- **FR-012**: System MUST provide a standalone guard script that evaluates safety conditions and returns a structured PASS/BLOCKED result.
- **FR-013**: The `speckit-auto` orchestrator MUST execute all pipeline stages and their associated Spec Kit extension hooks inline within a single invocation, without pausing for user re-invocation between stages. Hook execution (e.g., git commit, token baseline) must be handled as internal orchestrator steps, not as interrupts requiring a new command from the user.

### Key Entities

- **Pipeline Run**: A single execution of the automated workflow, associated with a feature directory, mode, and execution state (stage reached, blocked reason if any). State is persisted to `pipeline-state.json` in the feature directory after each stage transition, enabling resume across sessions.
- **Sub-Agent**: A Claude Code agent definition (`.claude/agents/<name>.md`) responsible for one pipeline stage. Has a defined input (artifact files), action, and output.
- **Guard Result**: The output of the guard script — either `PASS` or `BLOCKED` with a reason string (keyword match or CRITICAL issue reference).
- **Stage Output**: Files produced at each pipeline stage, written exclusively under the feature directory (`specs/<NNN>-<name>/`) until the implement stage.

## Success Criteria *(mandatory)*

### Measurable Outcomes

- **SC-001**: A developer can trigger the full pipeline from a single command and reach the analyze stage within one session without manual intervention for non-ambiguous feature descriptions.
- **SC-002**: The guard script correctly blocks `auto-implement` for 100% of feature descriptions containing defined safety keywords, verified by test cases covering all keyword variants.
- **SC-003**: Each of the 8 sub-agents can be invoked independently and produces its designated output artifact without invoking any other sub-agent.
- **SC-004**: Zero application source files are created or modified when running any mode up to and including the analyze stage, verifiable by `git diff` showing only files under `specs/`, `.claude/`, and `.specify/`.
- **SC-005**: Post-implementation review report covers git diff, test results, and tasks.md completion status in a single structured output, enabling a developer to assess completeness in under 2 minutes.

## Assumptions

- Claude Code's sub-agent and skill mechanisms (`/agents` and `/skills`) are available and support the `.claude/agents/*.md` and `.claude/skills/*/SKILL.md` file conventions used by this feature.
- The Spec Kit workflow (speckit-specify, speckit-plan, speckit-tasks, speckit-analyze, speckit-implement) is already installed and functional in the target project before this automation layer is added.
- "Application source code" is defined as any file outside the `specs/`, `.claude/`, `.specify/`, and test-only directories; the guard script will rely on this boundary definition.
- The guard script runs in a Bash environment available on the developer's machine or CI environment.
- Safety keyword matching is case-insensitive substring matching against both the feature description string and the generated spec content.
- The `speckit-reviewer` sub-agent requires `git` to be available to produce the diff portion of its report.
