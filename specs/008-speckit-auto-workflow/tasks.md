# Tasks: Spec Kit Automated Workflow Orchestration

**Input**: Design documents from `specs/008-speckit-auto-workflow/`

**Prerequisites**: plan.md ✅, spec.md ✅, research.md ✅, data-model.md ✅, contracts/ ✅

**Organization**: Tasks are grouped by user story to enable independent implementation and testing of each story.

## Format: `[ID] [P?] [Story] Description`

- **[P]**: Can run in parallel (different files, no dependencies)
- **[Story]**: Which user story this task belongs to (US1–US4)
- Exact file paths included in all descriptions

---

## Phase 1: Setup (Shared Infrastructure)

**Purpose**: Create directory structure and base configuration required by all deliverables.

- [X] T001 Create .claude/agents/ directory and .claude/skills/speckit-auto/, .claude/skills/speckit-rules/, .claude/skills/speckit-guards/scripts/ directories
- [X] T002 Create .claude/settings.json with permissions for Write(specs/**), Write(.claude/**), Bash(.specify/**), Bash(.claude/skills/speckit-guards/scripts/**)

---

## Phase 2: Foundational (Blocking Prerequisites)

**Purpose**: Core enforcement logic and pipeline rules that ALL user story phases depend on.

**⚠️ CRITICAL**: No user story work can begin until this phase is complete.

- [X] T003 Create .claude/skills/speckit-guards/SKILL.md — define YAML frontmatter (name: "speckit-guards", description, user-invocable: true) and the canonical safety keyword list (auth, authentication, payment, billing, security, migration, data deletion, destructive operation, drop table, truncate, wipe, purge) as the Single Source of Truth per Principle II
- [X] T004 Implement .claude/skills/speckit-guards/scripts/guard.sh — Bash script accepting --description, --analysis, --spec, --test flags; case-insensitive keyword substring match; grep -i "SEVERITY: CRITICAL" on analysis file; stdout single JSON line {"result":"PASS"} or {"result":"BLOCKED","reason":"safety_keyword","matched":"<kw>"} or {"result":"BLOCKED","reason":"critical_issue","line":"<line>"}; exit 0=PASS, 1=BLOCKED, 2=error; --test flag runs built-in self-tests and exits 0 on all pass
- [X] T005 [P] Create .claude/skills/speckit-rules/SKILL.md — define YAML frontmatter (name: "speckit-rules", user-invocable: false) and pipeline stage sequence (specify→clarify→checklist→plan→tasks→analyze→implement→review→done), stage-to-agent mapping, and mode-specific halt rules (plan-only stops after analyze; gated pauses post-analyze for approval; auto-implement continues if guard PASS)

**Checkpoint**: Foundation ready — guard.sh and pipeline rules exist; user story work can now begin.

---

## Phase 3: User Story 1 — Single Command Full Workflow (Priority: P1) 🎯 MVP

**Goal**: A developer can invoke `/speckit-auto "<description>" --mode <mode>` and the pipeline runs all stages inline without requiring re-invocation between hooks.

**Independent Test**: Run `/speckit-auto "add a README badge" --mode plan-only` on an empty feature directory. Verify spec.md, plan.md, tasks.md, checklists/requirements.md are created; pipeline-state.json shows `status: "done"`, `stage: "analyze"`; CLAUDE.md SPECKIT block updated; zero application source files modified.

- [X] T006 [US1] Create .claude/skills/speckit-auto/SKILL.md — YAML frontmatter (name: "speckit-auto", description: "Orchestrate full Spec Kit pipeline from a single command", argument-hint: '"<feature description>" --mode plan-only|gated|auto-implement', user-invocable: true); body: parse feature description and --mode from $ARGUMENTS; read .specify/feature.json for FEATURE_DIR; read pipeline-state.json (if exists) to determine resume point from stages_completed
- [X] T007 [US1] Implement plan-only mode in .claude/skills/speckit-auto/SKILL.md — invoke stages specify→clarify→checklist→plan→tasks→analyze sequentially via Agent(subagent_type: "speckit-<name>", prompt: "..."); after each stage write pipeline-state.json (feature_dir, mode, stage, status:"running", stages_completed[...]); after analyze write status:"done"; output changed-files list and "Recommended next step: /speckit-implement" before halting
- [X] T008 [US1] Implement gated mode in .claude/skills/speckit-auto/SKILL.md — after analyze completes, run guard check; if PASS write pipeline-state.json with status:"paused", prompt user "Approve implementation? (yes/no)"; on approval write status:"running" and invoke speckit-implementer then speckit-reviewer; on denial write status:"blocked", blocked_reason:"user denied"
- [X] T009 [US1] Implement auto-implement mode in .claude/skills/speckit-auto/SKILL.md — after analyze, call guard.sh with --description and --spec and --analysis args; if result=PASS invoke speckit-implementer then speckit-reviewer; if result=BLOCKED write pipeline-state.json with status:"blocked", blocked_reason from guard result, print BLOCKED message and stop
- [X] T010 [US1] Implement inline hook execution in .claude/skills/speckit-auto/SKILL.md — after each stage Agent call returns, invoke Agent(subagent_type:"speckit-git-commit") and Agent(subagent_type:"speckit-token-analyzer-baseline") as explicit inline calls (NOT via EXECUTE_COMMAND pattern); this satisfies FR-013; hook failures are logged as warnings and do not halt the pipeline
- [X] T011 [US1] Implement stage output reporting in .claude/skills/speckit-auto/SKILL.md — after each stage completion, print "## Stage Complete: <stage-name>", list files changed since last pipeline-state.json write (git diff --name-only), and print "Recommended next stage: <next-stage-name or final-step>"

**Checkpoint**: User Story 1 independently testable — single command runs full plan-only pipeline inline.

---

## Phase 4: User Story 2 — Safe Guard Enforcement (Priority: P1)

**Goal**: The pipeline blocks automatic implementation for safety-sensitive features and CRITICAL analyze issues, in all modes.

**Independent Test**: Run `bash .claude/skills/speckit-guards/scripts/guard.sh --test` and verify exit 0 with all test cases passing. Separately verify that `/speckit-auto "delete all user data" --mode auto-implement` stops after analyze with BLOCKED status in pipeline-state.json and zero application source files written.

- [X] T012 [US2] Expand guard.sh --test suite to cover: (1) each of the 12 safety keywords individually via --description, (2) CRITICAL detection via --analysis pointing to a temp file with "SEVERITY: CRITICAL — test", (3) keyword in spec body via --spec, (4) case-insensitive match ("AUTH", "Auth"), (5) clean description returns PASS, (6) analysis without CRITICAL returns PASS; each test prints PASS/FAIL and the suite exits 0 only if all pass
- [X] T013 [US2] Wire guard.sh into speckit-auto/SKILL.md auto-implement branch — before invoking speckit-implementer, call `bash .claude/skills/speckit-guards/scripts/guard.sh --description "$DESC" --spec "$FEATURE_DIR/spec.md" --analysis "$FEATURE_DIR/analysis.md"`; parse JSON result with string match; on BLOCKED update pipeline-state.json status:"blocked", print reason with BLOCKED marker, do not invoke speckit-implementer
- [X] T014 [US2] Validate guard self-test by running `bash .claude/skills/speckit-guards/scripts/guard.sh --test` and confirming exit code 0 and all cases print PASS

**Checkpoint**: Guard enforcement complete — safety keywords and CRITICAL issues correctly block auto-implement.

---

## Phase 5: User Story 3 — Sub-Agent Stage Isolation (Priority: P2)

**Goal**: Each pipeline stage is a standalone `.claude/agents/*.md` file invokable independently from the orchestrator.

**Independent Test**: Read .claude/agents/speckit-clarifier.md and confirm the `name` frontmatter field is "speckit-clarifier". Invoke it directly via Agent(subagent_type:"speckit-clarifier") on an existing spec.md and verify it runs /speckit-clarify without triggering any other agent.

- [X] T015 [P] [US3] Create .claude/agents/speckit-specifier.md — frontmatter: name:"speckit-specifier", description:"Run /speckit-specify for the feature description provided in the prompt"; body: receive feature description from prompt, invoke Skill("speckit-specify") with description as argument, return spec.md path on completion
- [X] T016 [P] [US3] Create .claude/agents/speckit-clarifier.md — frontmatter: name:"speckit-clarifier"; body: read spec.md from FEATURE_DIR, invoke Skill("speckit-clarify"), return updated spec.md path
- [X] T017 [P] [US3] Create .claude/agents/speckit-checklister.md — frontmatter: name:"speckit-checklister"; body: read spec.md from FEATURE_DIR, invoke Skill("speckit-checklist"), return checklists/requirements.md path
- [X] T018 [P] [US3] Create .claude/agents/speckit-planner.md — frontmatter: name:"speckit-planner"; body: read spec.md and checklists/requirements.md from FEATURE_DIR, invoke Skill("speckit-plan"), return plan.md path
- [X] T019 [P] [US3] Create .claude/agents/speckit-tasker.md — frontmatter: name:"speckit-tasker"; body: read spec.md and plan.md from FEATURE_DIR, invoke Skill("speckit-tasks"), return tasks.md path
- [X] T020 [P] [US3] Create .claude/agents/speckit-analyzer.md — frontmatter: name:"speckit-analyzer"; body: read spec.md, plan.md, tasks.md from FEATURE_DIR, invoke Skill("speckit-analyze"), ensure any CRITICAL severity finding is written to analysis.md as a line matching "SEVERITY: CRITICAL — <description>", return analysis.md path
- [X] T021 [US3] Create .claude/agents/speckit-implementer.md — frontmatter: name:"speckit-implementer"; body: read tasks.md and plan.md from FEATURE_DIR, verify pipeline-state.json shows guard PASS (status not "blocked"), invoke Skill("speckit-implement"), mark completed tasks [X] in tasks.md, return list of modified files
- [X] T022 [P] [US3] Create .claude/agents/speckit-reviewer.md — frontmatter: name:"speckit-reviewer"; body: read spec.md and tasks.md from FEATURE_DIR, run git diff --stat to get changed files, validate each acceptance scenario from spec.md against delivered artifacts (file exists + content matches scenario intent), check tasks.md for incomplete tasks, write review-report.md with sections "## Changed Files", "## Acceptance Scenario Validation" (table: scenario/status/notes), "## Task Completion" (table), "## Overall Status: PASS|FAIL"

**Checkpoint**: All 8 sub-agents independently invokable; agent names match subagent_type references in speckit-auto/SKILL.md.

---

## Phase 6: User Story 4 — Post-Implementation Review (Priority: P2)

**Goal**: After implementation, `speckit-reviewer` produces a structured report covering acceptance scenarios, git diff, and tasks.md completeness.

**Independent Test**: After a completed implement stage, invoke Agent(subagent_type:"speckit-reviewer"). Verify review-report.md contains "## Changed Files", "## Acceptance Scenario Validation", "## Task Completion", and "## Overall Status" sections. A run with all tasks complete and passing scenarios produces "## Overall Status: PASS".

- [X] T023 [US4] Expand speckit-reviewer.md body to include: acceptance scenario table generation (iterate over each "Given/When/Then" block in spec.md, check that the relevant output artifact exists and contains the expected content, mark ✅ PASS or ❌ FAIL with one-sentence evidence note); this satisfies FR-009's "test result summary" requirement (no external test runner needed per spec clarification)

**Checkpoint**: Reviewer produces complete structured report; developer can assess completeness in under 2 minutes (SC-005).

---

## Phase 7: Polish & Cross-Cutting Concerns

**Purpose**: Consistency, validation, and integration verification across all deliverables.

- [X] T024 [P] Cross-reference safety keyword list in speckit-guards/SKILL.md with guard.sh — confirm guard.sh reads keywords from a shared source or the SKILL.md body documents the list with a comment "canonical list — keep in sync with guard.sh"; satisfies Principle II (Single Source of Truth)
- [X] T025 Validate full pipeline end-to-end in plan-only mode: invoke `/speckit-auto "add a hello world script" --mode plan-only` on a new test feature directory; confirm pipeline-state.json ends with status:"done", all expected artifact files exist, CLAUDE.md SPECKIT block is updated, zero non-spec files modified
- [X] T026 [P] Update specs/008-speckit-auto-workflow/checklists/requirements.md — mark all checklist items complete post-implementation

---

## Dependencies & Execution Order

### Phase Dependencies

- **Setup (Phase 1)**: No dependencies — start immediately
- **Foundational (Phase 2)**: Depends on Phase 1 — blocks all user story phases
- **User Story 1 (Phase 3)**: Depends on Phase 2 (needs guard.sh + speckit-rules)
- **User Story 2 (Phase 4)**: Depends on Phase 2 (guard.sh already scaffolded) and Phase 3 (wires into orchestrator)
- **User Story 3 (Phase 5)**: Depends on Phase 2 (agents invoke skills); independent of Phases 3–4
- **User Story 4 (Phase 6)**: Depends on T022 in Phase 5 (expands speckit-reviewer.md)
- **Polish (Phase 7)**: Depends on all prior phases

### User Story Dependencies

- **US1 (P1)**: Requires Phase 2 complete. No dependency on US2, US3, US4.
- **US2 (P1)**: Requires Phase 2 + US1 Phase 3 (guard wired into orchestrator). Parallel to US3.
- **US3 (P2)**: Requires Phase 2 only. Parallel to US1 and US2.
- **US4 (P2)**: Requires T022 (speckit-reviewer.md scaffold) from Phase 5.

### Within Each Phase

- All tasks marked [P] within a phase can run in parallel
- speckit-auto/SKILL.md tasks (T006–T011) are sequential — each builds on the prior
- Sub-agent files T015–T022 are all parallel after T005

### Parallel Opportunities

```
Phase 2: T003, T004 sequential (T004 depends on T003 keyword list); T005 parallel with T003/T004
Phase 3: T006→T007→T008→T009→T010→T011 sequential (single file)
Phase 4: T012, T013 parallel; T014 after T012
Phase 5: T015, T016, T017, T018, T019, T020 all parallel; T021, T022 after T020
Phase 7: T024, T026 parallel; T025 sequential after all prior
```

---

## Parallel Execution Example: Phase 5 (Sub-Agents)

```
# Launch all stateless sub-agent files in parallel (different files, no deps):
Task T015: Create .claude/agents/speckit-specifier.md
Task T016: Create .claude/agents/speckit-clarifier.md
Task T017: Create .claude/agents/speckit-checklister.md
Task T018: Create .claude/agents/speckit-planner.md
Task T019: Create .claude/agents/speckit-tasker.md
Task T020: Create .claude/agents/speckit-analyzer.md

# After T020 completes:
Task T021: Create .claude/agents/speckit-implementer.md
Task T022: Create .claude/agents/speckit-reviewer.md (parallel with T021)
```

---

## Implementation Strategy

### MVP First (User Stories 1 + 2)

1. Complete Phase 1: Setup
2. Complete Phase 2: Foundational (guard.sh + speckit-rules)
3. Complete Phase 3: US1 — orchestrator with all three modes
4. Complete Phase 4: US2 — guard wired in, self-tests pass
5. **STOP and VALIDATE**: Run guard.sh --test; run plan-only pipeline on test feature
6. US1 + US2 together deliver the safe, automated pipeline as the core deliverable

### Incremental Delivery

1. Setup + Foundational → base ready
2. US1 + US2 → safe pipeline orchestrator (MVP — all three modes work)
3. US3 → individual agents independently invokable (reusability)
4. US4 → reviewer produces structured report (review quality)
5. Each phase adds value without breaking prior phases

---

## Notes

- [P] = different files, no blocking dependencies
- All deliverables are `.md` or `.sh` files — no `src/` or `tests/` directory needed
- guard.sh --test flag is the self-contained test suite for Principle VII compliance
- speckit-auto/SKILL.md is a single file updated across T006–T011; tasks are sequential
- SC-004 (zero app source modified pre-implement) is enforced by the orchestrator logic in T007–T009, not by a separate task
