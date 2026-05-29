# Tasks: Microsoft Fara Overview

**Input**: Design documents from `/projects/company/kami-tech-wiki/specs/026-microsoft-fara-microsoft-fara/`

**Prerequisites**: `spec.md`, `plan.md`, `research.md`, `data-model.md`, `quickstart.md`, `contracts/microsoft-fara-wiki-contract.md`

**Scope**: Implementation tasks for the Korean Microsoft Fara wiki overview. Do not modify `raw/`.

**Tests**: No TDD test tasks were requested. Validation tasks are included for frontmatter, links, source coverage, visuals, glossary consistency, and review gates.

## Phase 1: Setup

**Purpose**: Load governance, templates, and existing wiki conventions before editing.

- [X] T001 Load implementation context from `AGENTS.md`, `/home/jhjeong/.codex/RTK.md`, `specs/026-microsoft-fara-microsoft-fara/spec.md`, `specs/026-microsoft-fara-microsoft-fara/plan.md`, and `specs/026-microsoft-fara-microsoft-fara/contracts/microsoft-fara-wiki-contract.md`
- [X] T002 Inspect local wiki conventions in `.wiki/templates/tool-page.md`, `.wiki/templates/index-entry.md`, `wiki/index.md`, `wiki/ko/SUMMARY.md`, and `wiki/log.md`
- [X] T003 Capture the pre-implementation raw baseline with `git status --short raw/` and keep `raw/` unchanged

**Checkpoint**: Context is loaded, local formatting is understood, and `raw/` is confirmed read-only.

## Phase 2: Foundational Source, Visual, And Terminology Work

**Purpose**: Verify current sources and lock terminology before drafting factual prose.

- [X] T004 [P] Live-check current Microsoft or Microsoft Research sources for Fara1.5 identity, publication context, safety framing, and research-preview status for `wiki/ko/microsoft-fara/index.md`
- [X] T005 [P] Live-check the official `microsoft/fara` GitHub repository for Fara-7B implementation context, demos, benchmark notes, safety notes, and repository freshness for `wiki/ko/microsoft-fara/index.md`
- [X] T006 [P] Live-check the Fara-7B arXiv paper for FaraGen, FaraEnvs, WebTailBench, trajectory, verifier, benchmark methodology, and open-weight claims for `wiki/ko/microsoft-fara/index.md`
- [X] T007 [P] Live-check official Microsoft Foundry, Hugging Face, or model-card pages before making availability, license, hosted model, or usage-constraint claims in `wiki/ko/microsoft-fara/index.md`
- [X] T008 Consolidate source roles, URLs, publication or release dates, access dates, and claim roles into a source register for `wiki/ko/microsoft-fara/index.md`
- [X] T009 Choose at least two visual assets or linked visual references for `wiki/ko/microsoft-fara/index.md`, documenting usage type, alt text plan, caption plan, owner, URL or path, access or created date, and rights decision
- [X] T010 Create `wiki/ko/microsoft-fara/assets/` only if original diagrams, local screenshots, or defensibly licensed local visuals are needed
- [X] T011 Inspect existing glossary surfaces and create `wiki/glossary/microsoft-fara.md` with preferred terms, alternatives, abbreviations, definitions, usage notes, and Korean/English/Japanese equivalents for Microsoft Fara terms

**Checkpoint**: Official source roles, visual rights decisions, and glossary-backed terminology are ready.

## Phase 3: User Story 1 - Understand What Microsoft Fara Is (Priority: P1)

**Goal**: Readers can distinguish Microsoft Fara from generic chatbots, Microsoft Copilot, and ordinary Microsoft product announcements.

**Independent Test**: A reader can summarize Microsoft Fara, Fara-7B, and Fara1.5 in under three sentences without confusing them with Microsoft Copilot.

- [X] T012 [US1] Create `wiki/ko/microsoft-fara/README.md` as the short Korean section page with required frontmatter, `source_count: 0`, `review_cycle: fast-changing`, a concise topic summary, and a relative link to `index.md`
- [X] T013 [US1] Create `wiki/ko/microsoft-fara/index.md` with required frontmatter, `source_count: 0`, `review_cycle: fast-changing`, Korean tool-page structure, and a lead section explaining Fara as Microsoft Research computer-use-agent model work
- [X] T014 [US1] Explain the relationship between Fara-7B and the newer Fara1.5 family in `wiki/ko/microsoft-fara/index.md` using only live-verified official-source claims and date labels
- [X] T015 [US1] Explain screenshots or visual interface perception, coordinate-based actions, multi-step task trajectories, browser or software interaction, and at least one non-developer analogy in `wiki/ko/microsoft-fara/index.md`
- [X] T016 [US1] Explain why Fara emphasizes smaller or efficient agentic models in `wiki/ko/microsoft-fara/index.md`, including local or lower-latency experimentation only where official sources support it
- [X] T017 [US1] Add common misconceptions to `wiki/ko/microsoft-fara/index.md`, including "Fara is just Copilot", "Fara is ready for every desktop task", and "benchmark success means safe production automation"

**Checkpoint**: MVP Korean understanding path is complete and independently readable.

## Phase 4: User Story 2 - Read The Latest Source-Based Explanation (Priority: P2)

**Goal**: Readers can identify which official sources support current claims and which claims are availability-dependent or research-preview.

**Independent Test**: A reader can name at least three official sources and explain what each source verifies.

- [X] T018 [US2] Add a latest-documents section to `wiki/ko/microsoft-fara/index.md` listing official source titles, owners, URLs, publication or access dates, and claim roles for identity, model family, availability, benchmark, safety, and visual provenance
- [X] T019 [US2] Date every fast-changing capability, benchmark, safety, availability, and model-card claim in `wiki/ko/microsoft-fara/index.md` with the implementation access date or with a more specific source publication or release date
- [X] T020 [US2] Summarize documented capabilities, documented limits, availability status, and safety guidance in `wiki/ko/microsoft-fara/index.md` without implying unsupported production readiness
- [X] T021 [US2] Review all official-source paraphrases in `wiki/ko/microsoft-fara/index.md` for original synthesis, no copied paragraphs, and clear source attribution for major factual claims

**Checkpoint**: Latest-source explanation is dated, source-grounded, and not dependent on secondary commentary.

## Phase 5: User Story 3 - Learn Through Images And Examples (Priority: P3)

**Goal**: Readers get visual context for how Fara-style computer-use agents work and can see where every visual came from.

**Independent Test**: Every embedded or linked visual reference has alt text, caption, owner, source URL or local path, access or created date, and a rights decision.

- [X] T022 [US3] Add the first embedded visual, linked visual reference, local screenshot, or original diagram to `wiki/ko/microsoft-fara/index.md` with alt text, caption, source owner, URL or local path, access or created date, and rights decision
- [X] T023 [US3] Add the second embedded visual, linked visual reference, local screenshot, or original diagram to `wiki/ko/microsoft-fara/index.md` with alt text, caption, source owner, URL or local path, access or created date, and rights decision
- [X] T024 [US3] If any local screenshot or original diagram is used, place it under `wiki/ko/microsoft-fara/assets/` and reference the repository-relative asset path from `wiki/ko/microsoft-fara/index.md`
- [X] T025 [US3] Add visual explanation text in `wiki/ko/microsoft-fara/index.md` connecting each visual to screenshots, coordinate actions, trajectories, benchmarks, or safe-use context for non-developer readers

**Checkpoint**: Visual learning and attribution requirements are satisfied without unclear-rights copied binaries.

## Phase 6: User Story 4 - Decide Practical Use Cases And Limits (Priority: P4)

**Goal**: Teams can identify practical pilot cases, safe evaluation conditions, and situations that require avoidance or strict approval.

**Independent Test**: A reader can list at least three suitable exploratory uses and at least three high-risk uses that require avoidance or human approval.

- [X] T026 [US4] Add practical exploratory use cases to `wiki/ko/microsoft-fara/index.md`, including monitored browser task research, form-heavy workflow prototyping, benchmark study, and agent UI research where supported by sources
- [X] T027 [US4] Add safe pilot guidance to `wiki/ko/microsoft-fara/index.md`, including sandboxing, monitoring, audit logs, human approval checkpoints, sensitive-data limits, and pilot-only evaluation framing
- [X] T028 [US4] Add a caution section to `wiki/ko/microsoft-fara/index.md` covering sensitive data, money-moving or purchase-related tasks, legal/medical/financial decisions, irreversible actions, and unattended production automation
- [X] T029 [US4] Add recommended next reads and related internal links in `wiki/ko/microsoft-fara/index.md` for Microsoft Copilot, AI agent, MCP, benchmark, browser automation, human-in-the-loop, and `wiki/glossary/microsoft-fara.md` where matching pages exist

**Checkpoint**: Practical adoption and safety guidance are complete.

## Phase 7: Wiki Integration And Notification

**Purpose**: Make the Korean Microsoft Fara overview discoverable and record the wiki update after content exists.

- [X] T030 Update `wiki/index.md` with a Microsoft Fara catalog entry using the local index-entry pattern and a relative link to `wiki/ko/microsoft-fara/index.md`
- [X] T031 Update `wiki/ko/SUMMARY.md` with a Microsoft Fara navigation entry that resolves to `microsoft-fara/README.md` or `microsoft-fara/index.md` according to the existing Korean SUMMARY structure
- [X] T032 Append a timestamped Microsoft Fara work entry to `wiki/log.md` using `## [YYYY-MM-DD HH:MM] {operation} | {title}` and listing affected pages without rewriting older entries
- [X] T033 Run `.wiki/scripts/notify-slack.ts` only if `SLACK_WEBHOOK_URL` is present in the environment, passing operation, page names, and summary without printing or hardcoding the webhook

**Checkpoint**: Navigation, catalog, log, and optional Slack behavior are complete.

## Phase 8: Validation And Review Readiness

**Purpose**: Prove the implementation is complete, source-grounded, portable, and ready for human editorial review.

- [X] T034 [P] Validate frontmatter in `wiki/ko/microsoft-fara/README.md`, confirming `category: tool`, `language: ko`, `source_count: 0`, required dates, `status`, and `review_cycle: fast-changing`
- [X] T035 [P] Validate frontmatter and source coverage in `wiki/ko/microsoft-fara/index.md`, confirming `source_count: 0`, dated fast-changing claims, latest-documents source register, official-source coverage, and no process notes from planning artifacts
- [X] T036 [P] Validate visual attribution in `wiki/ko/microsoft-fara/index.md` and `wiki/ko/microsoft-fara/assets/`, confirming at least two visuals or linked references and no unclear-rights copied binary files
- [X] T037 [P] Validate navigation with `.wiki/scripts/validate-summary-links.sh` for `wiki/ko/SUMMARY.md` and run `.wiki/scripts/validate-wiki.sh` against `wiki/`
- [X] T038 [P] Verify `raw/` remains unchanged with `git status --short raw/` before final review
- [X] T039 Validate `wiki/log.md` has exactly one new appended Microsoft Fara entry for this implementation and that older log entries were not rewritten
- [X] T040 Validate terminology consistency by checking `wiki/ko/microsoft-fara/index.md` and `wiki/ko/microsoft-fara/README.md` against `wiki/glossary/microsoft-fara.md`
- [X] T041 Create or update `specs/026-microsoft-fara-microsoft-fara/review-gates.md` with the Readability gate result, evidence, and notes
- [X] T042 Create or update `specs/026-microsoft-fara-microsoft-fara/review-gates.md` with the Factual accuracy gate result, evidence, and notes
- [X] T043 Create or update `specs/026-microsoft-fara-microsoft-fara/review-gates.md` with the Source integrity gate result, evidence, and notes
- [X] T044 Create or update `specs/026-microsoft-fara-microsoft-fara/review-gates.md` with the Multilingual consistency gate result, evidence, and notes pointing to the documented Principle IV override
- [X] T045 Create or update `specs/026-microsoft-fara-microsoft-fara/review-gates.md` with the Markdown portability gate result, evidence, and notes
- [X] T046 Create or update `specs/026-microsoft-fara-microsoft-fara/review-gates.md` with the Terminology consistency gate result, evidence, and notes
- [X] T047 Create or update `specs/026-microsoft-fara-microsoft-fara/review-gates.md` with the Navigation gate result, evidence, and notes
- [X] T048 Create or update `specs/026-microsoft-fara-microsoft-fara/review-gates.md` with the Copying/plagiarism risk gate result, evidence, and notes
- [X] T049 Create or update `specs/026-microsoft-fara-microsoft-fara/review-gates.md` with the Template compliance gate result, evidence, and notes
- [X] T050 Create or update `specs/026-microsoft-fara-microsoft-fara/review-gates.md` with the Learning goal gate result, evidence, and notes confirming SC-001 through SC-006
- [X] T051 Perform final reader-scenario and human-review-readiness review of `wiki/ko/microsoft-fara/README.md`, `wiki/ko/microsoft-fara/index.md`, and `specs/026-microsoft-fara-microsoft-fara/review-gates.md`, keeping `status: draft` unless a human reviewer records approval

**Checkpoint**: All implementation outputs are ready for human editorial review; all ten quality gates have evidence; the AI implementer has not self-approved human review.

## Dependencies And Execution Order

### Phase Dependencies

- Phase 1 must complete before all other phases.
- Phase 2 must complete before drafting because source roles and visual rights decisions are blocking.
- Phase 3 is the MVP reader path and must complete before later refinements are considered complete.
- Phase 4 depends on Phase 2 source verification and Phase 3 article structure.
- Phase 5 depends on Phase 2 visual decisions and Phase 3 article structure.
- Phase 6 depends on Phase 3 identity framing and Phase 4 dated source context.
- Phase 7 depends on article and glossary files existing.
- Phase 8 depends on all implementation and integration tasks.

### User Story Dependencies

- US1 has no user-story dependency after setup and foundations.
- US2 depends on the Phase 2 source register and US1 article structure.
- US3 depends on Phase 2 visual decisions and US1 article structure.
- US4 depends on US1 identity framing and US2 dated source context.

## Parallel Execution Examples

### Source Verification

```text
Task A: T004 live-check Microsoft/Microsoft Research sources for wiki/ko/microsoft-fara/index.md
Task B: T005 live-check microsoft/fara GitHub sources for wiki/ko/microsoft-fara/index.md
Task C: T006 live-check arXiv paper sources for wiki/ko/microsoft-fara/index.md
Task D: T007 live-check Foundry/Hugging Face/model-card sources for wiki/ko/microsoft-fara/index.md
```

### Validation

```text
Task A: T034 validate wiki/ko/microsoft-fara/README.md frontmatter
Task B: T035 validate wiki/ko/microsoft-fara/index.md source coverage
Task C: T036 validate wiki/ko/microsoft-fara/index.md visual attribution
Task D: T037 validate wiki/ko/SUMMARY.md links and wiki portability
Task E: T038 validate raw/ unchanged
Task F: T040 validate glossary-backed terminology
```

## Implementation Strategy

### MVP First

Complete Phases 1, 2, and 3 first. This creates the Korean Microsoft Fara section page and core overview that satisfies the primary understanding goal.

### Incremental Delivery

1. Add US2 latest-source depth after the MVP structure is stable.
2. Add US3 visuals only after rights decisions are defensible.
3. Add US4 practical pilot and caution guidance after source-dated limits are clear.
4. Integrate into wiki navigation and log only after the content files exist.
5. Run validation, record all ten quality gates, and leave human editorial review explicit.

### Final Deliverable

The implementation is review-ready when `wiki/ko/microsoft-fara/README.md`, `wiki/ko/microsoft-fara/index.md`, `wiki/glossary/microsoft-fara.md`, `wiki/index.md`, `wiki/ko/SUMMARY.md`, `wiki/log.md`, and `specs/026-microsoft-fara-microsoft-fara/review-gates.md` satisfy the contract, `raw/` has no changes, Slack behavior follows the environment-variable rule, and SC-001 through SC-006 are verified.

## Summary

- Total tasks: 51
- Setup tasks: 3
- Foundational tasks: 8
- US1 tasks: 6
- US2 tasks: 4
- US3 tasks: 4
- US4 tasks: 4
- Integration tasks: 4
- Validation and review-readiness tasks: 18
- Parallel opportunities: source verification tasks T004-T007, independent validation tasks T034-T038, and quality-gate evidence tasks T041-T050
- Suggested MVP scope: Phases 1, 2, and 3
- Format validation: All task rows use `- [X] T###`, user-story tasks use `[US#]`, parallel tasks use `[P]`, and every task names at least one concrete file path or command target.
