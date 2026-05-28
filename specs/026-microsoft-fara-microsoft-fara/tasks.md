# Tasks: Microsoft Fara Overview

**Input**: Design documents from `/projects/company/kami-tech-wiki/specs/026-microsoft-fara-microsoft-fara/`

**Prerequisites**: `spec.md`, `plan.md`, `research.md`, `data-model.md`, `quickstart.md`, `contracts/microsoft-fara-wiki-contract.md`

**Scope**: Generate implementation tasks only. This task-generation stage must not modify `raw/` or reader-facing `wiki/` content.

**Organization**: Tasks are dependency-ordered by setup, foundations, reader scenarios, publication surfaces, validation, and review readiness. Reader-scenario task labels map to the scenarios in `spec.md`.

## Format: `[ID] [P?] [RS?] Description with file path and requirement IDs`

- **[P]**: Can run in parallel because it is read-only or touches a different output path.
- **[RS]**: Reader scenario from `spec.md`.
- **Req**: Linked requirement IDs from `spec.md`; contract-only obligations are also named where the spec has no separate ID.

---

## Phase 1: Setup

**Purpose**: Load governance, templates, and existing wiki structure before implementation edits.

- [ ] T001 Load implementation context from `AGENTS.md`, `/home/jhjeong/.codex/RTK.md`, `specs/026-microsoft-fara-microsoft-fara/spec.md`, `specs/026-microsoft-fara-microsoft-fara/plan.md`, and `specs/026-microsoft-fara-microsoft-fara/contracts/microsoft-fara-wiki-contract.md` before editing `wiki/ko/microsoft-fara/index.md` (Req: CR-001, CR-002, CR-006, SR-008)
- [ ] T002 Inspect local wiki conventions in `.wiki/templates/tool-page.md`, `.wiki/templates/index-entry.md`, `wiki/index.md`, `wiki/ko/SUMMARY.md`, and `wiki/log.md` before creating Microsoft Fara pages (Req: CR-001, CR-006, CR-007)
- [ ] T003 Capture a pre-implementation `raw/` unchanged baseline with `git status --short raw/` and keep `raw/` read-only during all later edits (Req: SR-008, SR-009)

**Checkpoint**: Implementation context is loaded, local formatting is understood, and `raw/` is confirmed read-only.

---

## Phase 2: Foundational Source And Visual Decisions

**Purpose**: Verify current official sources live and decide how visuals can be used before drafting factual article prose.

**Critical**: Drafting must not begin until current-source roles, dates, and visual rights decisions are known.

- [ ] T004 Live-check current Microsoft or Microsoft Research sources for Fara1.5 identity, publication context, safety framing, and research-preview status, then record source roles for `wiki/ko/microsoft-fara/index.md` (Req: FR-002, FR-005, FR-006, SR-001, SR-005, SR-008, SC-002, SC-005)
- [ ] T005 Live-check the official `microsoft/fara` GitHub repository for Fara-7B implementation context, demos, benchmark notes, safety notes, and repository freshness, then record source roles for `wiki/ko/microsoft-fara/index.md` (Req: FR-002, FR-003, FR-005, FR-006, SR-002, SR-005, SR-008, SC-002, SC-005)
- [ ] T006 Live-check the Fara-7B arXiv paper for research framing, FaraGen, FaraEnvs, WebTailBench, trajectory, verifier, benchmark methodology, and open-weight claims, then record source roles for `wiki/ko/microsoft-fara/index.md` (Req: FR-002, FR-003, FR-004, FR-006, SR-003, SR-005, SR-008, TR-001, SC-002, SC-005)
- [ ] T007 Live-check official Microsoft Foundry, Hugging Face, or model-card pages before making availability, license, hosted model, or usage-constraint claims in `wiki/ko/microsoft-fara/index.md` (Req: FR-002, FR-005, FR-006, SR-004, SR-005, SR-006, SR-008, SC-002, SC-005)
- [ ] T008 Prepare the latest-documents source register for later insertion into `wiki/ko/microsoft-fara/index.md`, with title, owner, URL, publication or release date where available, access date, and claim role for every official source used; do not overwrite the final article skeleton when T013 creates it (Req: FR-006, SR-001, SR-002, SR-003, SR-004, SR-005, SR-006, SC-002, SC-005)
- [ ] T009 Choose at least two visual assets or linked visual references for `wiki/ko/microsoft-fara/index.md`, documenting usage type, alt text plan, caption plan, owner, URL or path, access or created date, and rights decision (Req: FR-007, SR-007, SR-009, SC-006)
- [ ] T010 Create `wiki/ko/microsoft-fara/assets/` only if the implementation needs original diagrams, locally captured screenshots, or defensibly licensed local visuals; do not add unclear-rights copied binaries to that path (Req: FR-007, SR-007, SR-009, SC-006)
- [ ] T011 Inspect existing wiki glossary and related-term surfaces, then create or update `wiki/glossary/microsoft-fara.md` with preferred terms, alternatives, abbreviations, definitions, usage notes, and Korean/English/Japanese equivalents for the Microsoft Fara terms introduced in `specs/026-microsoft-fara-microsoft-fara/spec.md` (Req: TR-001, TR-002, TR-003, TR-004, CR-008)

**Checkpoint**: Official sources are live-verified, dated source roles are ready, visual rights decisions are defensible, and glossary-backed terminology is locked.

---

## Phase 3: Reader Scenario 1 - Understand What Microsoft Fara Is (Priority: P1)

**Goal**: Readers can distinguish Microsoft Fara from generic chatbots, Microsoft Copilot, and ordinary Microsoft product announcements.

**Independent Test**: A reader can summarize Microsoft Fara, Fara-7B, and Fara1.5 in under three sentences without confusing them with Microsoft Copilot.

- [ ] T012 [RS1] Create `wiki/ko/microsoft-fara/README.md` as the short Korean section page with required frontmatter, `source_count: 0`, `review_cycle: fast-changing`, a concise topic summary, and a relative link to `wiki/ko/microsoft-fara/index.md` (Req: FR-001, CR-001, CR-002, CR-003, CR-007, SC-001)
- [ ] T013 [RS1] Create `wiki/ko/microsoft-fara/index.md` with required frontmatter, `source_count: 0`, `review_cycle: fast-changing`, Korean tool-page structure, and a lead section explaining Fara as Microsoft Research computer-use-agent model work rather than ordinary Copilot (Req: FR-001, CR-001, CR-002, CR-003, CR-007, SC-001)
- [ ] T014 [RS1] Explain the relationship between Fara-7B and the newer Fara1.5 family in `wiki/ko/microsoft-fara/index.md`, using only live-verified official-source claims and date labels (Req: FR-002, FR-005, SR-001, SR-002, SR-004, SR-005, SC-001, SC-005)
- [ ] T015 [RS1] Explain the computer-use-agent mental model in `wiki/ko/microsoft-fara/index.md`, covering screenshots or visual interface perception, coordinate-based actions, multi-step task trajectories, browser or software interaction, and at least one non-developer analogy or worked example in plain Korean (Req: FR-003, CR-003, CR-004, TR-001, TR-003, SC-003)
- [ ] T016 [RS1] Explain why Fara emphasizes smaller or efficient agentic models in `wiki/ko/microsoft-fara/index.md`, including local or lower-latency experimentation only where official sources support it (Req: FR-004, FR-005, SR-003, SR-005, SC-005)
- [ ] T017 [RS1] Add common misconceptions to `wiki/ko/microsoft-fara/index.md`, including "Fara is just Copilot", "Fara is ready for every desktop task", and "benchmark success means safe production automation" (Req: FR-010, CR-005, SC-001)

**Checkpoint**: MVP Korean understanding path is complete and independently readable.

---

## Phase 4: Reader Scenario 2 - Read The Latest Source-Based Explanation (Priority: P2)

**Goal**: Readers can identify which official sources support current claims and which claims are availability-dependent or research-preview.

**Independent Test**: A reader can name at least three official sources and explain what each source verifies.

- [ ] T018 [RS2] Add a latest-documents section to `wiki/ko/microsoft-fara/index.md` listing official source titles, owners, URLs, publication or access dates, and claim roles for identity, model family, availability, benchmark, safety, and visual provenance (Req: FR-006, SR-001, SR-002, SR-003, SR-004, SR-005, SR-006, SC-002)
- [ ] T019 [RS2] Date every fast-changing capability, benchmark, safety, availability, and model-card claim in `wiki/ko/microsoft-fara/index.md` as "2026-05-28 기준" or with a more specific source publication or release date (Req: FR-005, FR-006, SR-005, SR-008, SC-005)
- [ ] T020 [RS2] Summarize documented capabilities, documented limits, availability status, and safety guidance in `wiki/ko/microsoft-fara/index.md` without implying unsupported production readiness (Req: FR-005, FR-008, FR-009, SR-001, SR-002, SR-004, SR-005, SC-004, SC-005)
- [ ] T021 [RS2] Review all official-source paraphrases in `wiki/ko/microsoft-fara/index.md` for original synthesis, avoiding copied paragraphs and preserving source attribution for major factual claims (Req: SR-006, SR-008, FR-006, SC-002, SC-005)

**Checkpoint**: Latest-source explanation is dated, source-grounded, and not dependent on secondary commentary.

---

## Phase 5: Reader Scenario 3 - Learn Through Images And Examples (Priority: P3)

**Goal**: Readers get visual context for how Fara-style computer-use agents work and can see where every visual came from.

**Independent Test**: Every embedded or linked visual reference has alt text, caption, owner, source URL or local path, access or created date, and a rights decision.

- [ ] T022 [RS3] Add the first embedded visual, linked visual reference, local screenshot, or original diagram to `wiki/ko/microsoft-fara/index.md` with alt text, caption, source owner, URL or local path, access or created date, and rights decision (Req: FR-007, SR-007, SR-009, SC-006)
- [ ] T023 [RS3] Add the second embedded visual, linked visual reference, local screenshot, or original diagram to `wiki/ko/microsoft-fara/index.md` with alt text, caption, source owner, URL or local path, access or created date, and rights decision (Req: FR-007, SR-007, SR-009, SC-006)
- [ ] T024 [RS3] If any local screenshot or original diagram is used, place it under `wiki/ko/microsoft-fara/assets/` and reference the repository-relative asset path from `wiki/ko/microsoft-fara/index.md` (Req: FR-007, SR-007, SR-009, SC-006)
- [ ] T025 [RS3] Add visual explanation text in `wiki/ko/microsoft-fara/index.md` connecting each visual to screenshots, coordinate actions, trajectories, benchmarks, or safe-use context for non-developer readers (Req: FR-003, FR-007, CR-003, CR-004, SC-003, SC-006)

**Checkpoint**: Visual learning requirements and image attribution requirements are satisfied without unclear-rights copied binaries.

---

## Phase 6: Reader Scenario 4 - Decide Practical Use Cases And Limits (Priority: P4)

**Goal**: Teams can identify practical pilot cases, safe evaluation conditions, and situations that require avoidance or strict approval.

**Independent Test**: A reader can list at least three suitable exploratory uses and at least three high-risk uses that require avoidance or human approval.

- [ ] T026 [RS4] Add practical exploratory use cases to `wiki/ko/microsoft-fara/index.md`, including monitored browser task research, form-heavy workflow prototyping, benchmark study, and agent UI research where supported by sources (Req: FR-008, CR-003, SC-004)
- [ ] T027 [RS4] Add safe pilot guidance to `wiki/ko/microsoft-fara/index.md`, including sandboxing, monitoring, audit logs, human approval checkpoints, sensitive-data limits, and pilot-only evaluation framing (Req: FR-008, FR-009, CR-005, SC-004)
- [ ] T028 [RS4] Add a "not for" or caution section to `wiki/ko/microsoft-fara/index.md` covering sensitive data, payments, legal, medical, financial decisions, irreversible actions, and unattended production automation (Req: FR-009, FR-010, CR-005, SC-004)
- [ ] T029 [RS4] Add recommended next reads and related internal links in `wiki/ko/microsoft-fara/index.md` for Microsoft Copilot, AI agent, MCP, benchmark, browser automation, human-in-the-loop, and `wiki/glossary/microsoft-fara.md` where matching pages exist (Req: CR-005, TR-002, TR-004, SC-001, SC-003)

**Checkpoint**: Practical adoption and safety guidance are complete.

---

## Phase 7: Wiki Integration And Notification

**Purpose**: Make the Korean Microsoft Fara overview discoverable and record the wiki update after content exists.

- [ ] T030 Update `wiki/index.md` with a Microsoft Fara catalog entry using the local index-entry pattern and a relative link to `wiki/ko/microsoft-fara/index.md` (Req: CR-006)
- [ ] T031 Update `wiki/ko/SUMMARY.md` with a Microsoft Fara navigation entry that resolves to `microsoft-fara/README.md` or `microsoft-fara/index.md` according to the existing Korean SUMMARY structure (Req: CR-006)
- [ ] T032 Append, without rewriting existing entries, a timestamped Microsoft Fara work entry to `wiki/log.md` using `## [YYYY-MM-DD HH:MM] {operation} | {title}` and listing affected pages (Req: CR-006; Contract: Log)
- [ ] T033 Run `.wiki/scripts/notify-slack.ts` only if `SLACK_WEBHOOK_URL` is present in the environment, passing operation, page names, and summary without printing or hardcoding the webhook; skip without failure when the variable is absent (Req: CR-006; Contract: Slack)

**Checkpoint**: Navigation, catalog, log, and optional Slack behavior are complete.

---

## Phase 8: Validation And Review Readiness

**Purpose**: Prove the implementation is complete, source-grounded, portable, and ready for human editorial review.

- [ ] T034 [P] Validate frontmatter in `wiki/ko/microsoft-fara/README.md`, confirming `category: tool`, `language: ko`, `source_count: 0`, required dates, `status`, and `review_cycle: fast-changing` (Req: CR-007)
- [ ] T035 [P] Validate frontmatter and source coverage in `wiki/ko/microsoft-fara/index.md`, confirming `source_count: 0`, dated fast-changing claims, latest-documents source register, official-source coverage, and no process notes from planning artifacts (Req: FR-006, CR-007, SR-005, SR-008, SC-002, SC-005)
- [ ] T036 [P] Validate visual attribution in `wiki/ko/microsoft-fara/index.md` and `wiki/ko/microsoft-fara/assets/`, confirming at least two visuals or linked references and no unclear-rights copied binary files (Req: FR-007, SR-007, SR-009, SC-006)
- [ ] T037 [P] Validate navigation with `.wiki/scripts/validate-summary-links.sh` for `wiki/ko/SUMMARY.md` and run `.wiki/scripts/validate-wiki.sh` against `wiki/` if broader existing wiki warnings do not block this feature review (Req: CR-006)
- [ ] T038 [P] Verify `raw/` remains unchanged with `git status --short raw/` before final review, and do not include any `raw/` edits in the implementation diff (Req: SR-008, SR-009)
- [ ] T039 Validate `wiki/log.md` has exactly one new appended Microsoft Fara entry for this implementation and that older log entries were not rewritten (Req: CR-006; Contract: Log)
- [ ] T040 Validate terminology consistency by checking `wiki/ko/microsoft-fara/index.md` and `wiki/ko/microsoft-fara/README.md` against `wiki/glossary/microsoft-fara.md`, confirming new terms and related terms use the governed renderings (Req: TR-001, TR-002, TR-003, TR-004, CR-008)
- [ ] T041 Create or update `specs/026-microsoft-fara-microsoft-fara/review-gates.md` with the Readability gate result, evidence, and notes showing a non-developer can understand the article without external help (Req: CR-009; Constitution XII: Readability)
- [ ] T042 Create or update `specs/026-microsoft-fara-microsoft-fara/review-gates.md` with the Factual accuracy gate result, evidence, and notes linking major claims to cited reliable sources (Req: CR-009; Constitution XII: Factual accuracy)
- [ ] T043 Create or update `specs/026-microsoft-fara-microsoft-fara/review-gates.md` with the Source integrity gate result, evidence, and notes showing borrowed ideas are synthesized and rewritten (Req: CR-009; Constitution XII: Source integrity)
- [ ] T044 Create or update `specs/026-microsoft-fara-microsoft-fara/review-gates.md` with the Multilingual consistency gate result, evidence, and notes pointing to the documented Principle IV override, its approver, and its 2026-08-28 review/expiry date; keep wiki page status `draft` unless the override is human-approved or parity is implemented (Req: CR-009; Constitution XII: Multilingual consistency)
- [ ] T045 Create or update `specs/026-microsoft-fara-microsoft-fara/review-gates.md` with the Markdown portability gate result, evidence, and notes confirming portable Markdown syntax, relative internal links, and standard image/link syntax (Req: CR-009; Constitution XII: Markdown portability)
- [ ] T046 Create or update `specs/026-microsoft-fara-microsoft-fara/review-gates.md` with the Terminology consistency gate result, evidence, and notes confirming glossary coverage and article terminology match (Req: CR-009; Constitution XII: Terminology consistency)
- [ ] T047 Create or update `specs/026-microsoft-fara-microsoft-fara/review-gates.md` with the Navigation gate result, evidence, and notes confirming all internal links resolve and prerequisites/related articles are declared (Req: CR-009; Constitution XII: Navigation)
- [ ] T048 Create or update `specs/026-microsoft-fara-microsoft-fara/review-gates.md` with the Copying/plagiarism risk gate result, evidence, and notes confirming no paragraph-length source reproduction or copied marketing prose (Req: CR-009; Constitution XII: Copying/plagiarism risk)
- [ ] T049 Create or update `specs/026-microsoft-fara-microsoft-fara/review-gates.md` with the Template compliance gate result, evidence, and notes confirming the Korean tool-page structure or documented exceptions (Req: CR-009; Constitution XII: Template compliance)
- [ ] T050 Create or update `specs/026-microsoft-fara-microsoft-fara/review-gates.md` with the Learning goal gate result, evidence, and notes confirming SC-001 through SC-006 are satisfied without relying on an advanced-only section (Req: CR-009; Constitution XII: Learning goal)
- [ ] T051 Perform final reader-scenario and human-review-readiness review of `wiki/ko/microsoft-fara/README.md`, `wiki/ko/microsoft-fara/index.md`, and `specs/026-microsoft-fara-microsoft-fara/review-gates.md`, keeping `status: draft` unless `review-gates.md` or `review-report.md` records a human reviewer name, review date, and approval decision (Req: SC-001, SC-002, SC-003, SC-004, SC-005, SC-006, CR-007, CR-009; Contract: Human Review)

**Checkpoint**: All implementation outputs are ready for human editorial review; all ten quality gates have evidence; the AI implementer must not self-approve the human review gate.

---

## Dependencies And Execution Order

### Phase Dependencies

- Phase 1 must complete before all other phases.
- Phase 2 must complete before drafting phases because factual claims and visual rights decisions are blocking.
- Phase 3 is the MVP reader path and must complete before source-depth, visual, and practical-use refinements are treated as complete.
- Phase 4 depends on Phase 2 and strengthens the current-source explanation in the full article.
- Phase 5 depends on Phase 2 visual decisions and Phase 3 article structure.
- Phase 6 depends on Phase 3 article structure and Phase 4 source framing.
- Phase 7 depends on article files existing from Phases 3 through 6.
- Phase 8 depends on all implementation and integration tasks.

### Reader Scenario Dependencies

- RS1 has no reader-scenario dependency after setup and foundations; it is the MVP.
- RS2 depends on the Phase 2 source register and RS1 article structure.
- RS3 depends on Phase 2 visual decisions and RS1 article structure.
- RS4 depends on RS1 identity framing and RS2 dated source context.

### Parallel Opportunities

- T004 through T007 can be researched in parallel, but their results must be consolidated by T008 before drafting.
- T022 and T023 can be prepared in parallel if they use different source visuals, but the final article edit should be reconciled once.
- T034 through T038 are independent validation checks and can run in parallel after Phase 7.
- T041 through T050 can be prepared in parallel after article, glossary, navigation, and log outputs exist, but the final `review-gates.md` reconciliation should happen once.

---

## Parallel Execution Examples

### Source Verification

```text
Task A: T004 live-check Microsoft/Microsoft Research sources for wiki/ko/microsoft-fara/index.md
Task B: T005 live-check microsoft/fara GitHub sources for wiki/ko/microsoft-fara/index.md
Task C: T006 live-check arXiv paper sources for wiki/ko/microsoft-fara/index.md
Task D: T007 live-check Foundry/Hugging Face/model-card sources for wiki/ko/microsoft-fara/index.md
```

### Visual Preparation

```text
Task A: T022 prepare first attributed visual reference for wiki/ko/microsoft-fara/index.md
Task B: T023 prepare second attributed visual reference for wiki/ko/microsoft-fara/index.md
Task C: T024 prepare local asset placement only if wiki/ko/microsoft-fara/assets/ is needed
```

### Validation

```text
Task A: T034 validate wiki/ko/microsoft-fara/README.md frontmatter
Task B: T035 validate wiki/ko/microsoft-fara/index.md source coverage
Task C: T036 validate wiki/ko/microsoft-fara/index.md visual attribution
Task D: T037 validate wiki/ko/SUMMARY.md links and wiki/ portability
Task E: T038 validate raw/ unchanged
Task F: T040 validate glossary-backed terminology
Task G: T041-T050 record quality-gate evidence
```

---

## Implementation Strategy

### MVP First

Complete Phases 1, 2, and 3 first. This creates the Korean Microsoft Fara section page and core overview that satisfies the primary understanding goal without navigation publication.

### Incremental Delivery

1. Add RS2 latest-source depth after the MVP structure is stable.
2. Add RS3 visuals only after rights decisions are defensible.
3. Add RS4 practical pilot and caution guidance after source-dated limits are clear.
4. Integrate into wiki navigation and log only after the content files exist.
5. Run validation, record all ten quality gates, and leave human editorial review explicit.

### Final Deliverable

The implementation is review-ready when `wiki/ko/microsoft-fara/README.md`, `wiki/ko/microsoft-fara/index.md`, `wiki/glossary/microsoft-fara.md`, `wiki/index.md`, `wiki/ko/SUMMARY.md`, `wiki/log.md`, and `specs/026-microsoft-fara-microsoft-fara/review-gates.md` satisfy the contract, `raw/` has no changes, Slack behavior follows the environment-variable rule, and SC-001 through SC-006 are verified.

---

## Summary

- Total tasks: 51
- Setup tasks: 3
- Foundational tasks: 8
- RS1 tasks: 6
- RS2 tasks: 4
- RS3 tasks: 4
- RS4 tasks: 4
- Integration tasks: 4
- Validation and review-readiness tasks: 18
- Suggested MVP scope: Phases 1, 2, and 3
- Format validation: All checklist tasks use `- [ ] T###`, include exact paths, and link to spec requirement IDs or named contract obligations where the spec has no separate ID.
