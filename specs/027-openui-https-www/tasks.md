# Tasks: OpenUI Personalization Case Reference

**Input**: Design documents from `/specs/027-openui-https-www/`

**Prerequisites**: `plan.md`, `spec.md`, `research.md`, `data-model.md`, `quickstart.md`, `contracts/openui-personalization-wiki-contract.md`

**Organization**: Tasks are grouped by reader scenario so each scenario produces an independently reviewable content increment. Requirement IDs in parentheses map tasks to `spec.md` content requirements, source requirements, terminology requirements, and success criteria.

## Format: `[ID] [P?] [US?] Description with file path`

- **[P]**: Can run in parallel because it writes a different file or has no dependency on an incomplete task.
- **[US1]**: Feasibility Screening (P1)
- **[US2]**: Case Discovery (P2)
- **[US3]**: Stakeholder Summary (P3)

## Phase 1: Setup

**Purpose**: Prepare the implementation context without drafting reader-facing article prose.

- [X] T001 Read `specs/027-openui-https-www/spec.md`, `specs/027-openui-https-www/plan.md`, `specs/027-openui-https-www/research.md`, `specs/027-openui-https-www/data-model.md`, `specs/027-openui-https-www/quickstart.md`, and `specs/027-openui-https-www/contracts/openui-personalization-wiki-contract.md` before implementation (CR-001, SR-006)
- [X] T002 Inspect existing OpenUI pages in `wiki/ko/openui/`, `wiki/en/openui/`, and `wiki/ja/openui/` to identify reusable background links and avoid duplicate explanations (CR-001, TR-002)
- [X] T003 Inspect existing navigation files `wiki/index.md`, `wiki/ko/SUMMARY.md`, `wiki/en/SUMMARY.md`, `wiki/ja/SUMMARY.md`, `wiki/ko/openui/index.md`, `wiki/en/openui/index.md`, and `wiki/ja/openui/index.md` for placement patterns (CR-001)
- [X] T004 Confirm the working tree has no intended changes under `raw/` before implementation by recording `git status --short raw` output in implementation notes (SR-006)

## Phase 2: Foundational Source and Terminology Work

**Purpose**: Establish verified evidence, case classification, terminology, and split/no-split decision before article drafting.

**Critical dependency**: User story drafting must not begin until Phase 2 is complete.

- [X] T005 Verify the official OpenUI site, documentation, and repository live and collect source owner, URL, publication date when available, access date, and supported claims for use in `wiki/ko/openui/personalization-case-reference.md` (SR-001, SR-002, SR-006)
- [X] T006 Research public OpenUI demos, examples, case studies, and adoption references live; classify each candidate as `Verified OpenUI`, `Partially supported`, `Unclear`, or `Excluded` using `specs/027-openui-https-www/research.md` (SR-003, SR-006, SC-004)
- [X] T007 Research comparable real-time personalization or adaptive UI sites live until there are enough useful candidates to support a target matrix of 10 examples with at least 12 total verifiable sources in `wiki/ko/openui/personalization-case-reference.md` (CR-005, SR-001, SC-002)
- [X] T008 Create the final selected case set and evidence-status decisions in `specs/027-openui-https-www/review-gates.md` or another non-reader-facing evidence artifact, ensuring no unverified example is described as using OpenUI and no process notes are embedded in article files (SR-003, SR-004, SC-004)
- [X] T009 Decide whether the case evidence fits one article or requires companion case-list pages by applying the threshold from `specs/027-openui-https-www/research.md` and record the decision in `specs/027-openui-https-www/review-gates.md` (CR-004, SC-006)
- [X] T010 Inspect terminology coverage for OpenUI, generative UI, real-time personalization, adaptive screen, evidence status, AI tool, user interface, personalization, recommendation system, prompt, and large language model across existing pages under `wiki/` (TR-001, TR-002)
- [X] T011 Add or update missing glossary, terminology, or concept coverage for OpenUI, generative UI, real-time personalization, adaptive screen, evidence status, AI tool, user interface, personalization, recommendation system, prompt, and large language model in the appropriate `wiki/` files identified by T010, or record existing coverage evidence in `specs/027-openui-https-www/review-gates.md` when no file change is needed (TR-001, TR-002)
- [X] T012 Define Korean, English, and Japanese term choices for OpenUI, generative UI, real-time personalization, adaptive screen, and evidence status in `specs/027-openui-https-www/review-gates.md` (TR-001, TR-003, SC-005)
- [X] T013 Resolve prerequisite and related article targets from `specs/027-openui-https-www/spec.md`, creating only required glossary/navigation entries or recording future-article placeholders consistently in `specs/027-openui-https-www/review-gates.md` before link verification (CR-001, TR-002)

## Phase 3: User Story 1 - Feasibility Screening (P1)

**Goal**: A non-developer reader can explain what OpenUI appears to help with, what remains unproven, and what validation step is needed before committing to real-time personalized screens.

**Independent Test**: Read only the summary, plain-language explanation, feasibility findings, evidence-status explanation, and misconceptions in each language and verify the reader can distinguish proven OpenUI evidence from assumptions.

- [X] T014 [US1] Create the Korean article file with complete frontmatter and 13-section structure in `wiki/ko/openui/personalization-case-reference.md` (CR-001, SC-001)
- [X] T015 [US1] Draft Korean plain-language OpenUI and real-time personalization explanation for non-developers in `wiki/ko/openui/personalization-case-reference.md` (CR-002, TR-001, SC-001)
- [X] T016 [US1] Add the Korean "how to read this evidence" explanation covering vendor demos, public production sites, case studies, and analogous examples in `wiki/ko/openui/personalization-case-reference.md` (CR-008, SR-003)
- [X] T017 [US1] Add Korean feasibility findings that separate confirmed facts, reasonable interpretations, assumptions, and open questions in `wiki/ko/openui/personalization-case-reference.md` (CR-006, SC-001)
- [X] T018 [US1] Add Korean common misconceptions covering personalization versus OpenUI adoption, AI-generated UI versus real-time behavior, and demos versus production readiness in `wiki/ko/openui/personalization-case-reference.md` (CR-003, SC-001)
- [X] T019 [P] [US1] Create the English article file preserving the Korean structure, feasibility labels, and complete frontmatter in `wiki/en/openui/personalization-case-reference.md` (CR-001, SC-005)
- [X] T020 [P] [US1] Create the Japanese article file preserving the Korean structure, feasibility labels, and complete frontmatter in `wiki/ja/openui/personalization-case-reference.md` (CR-001, SC-005)
- [X] T021 [US1] Verify `source_count: 0`, `status: draft`, `review_cycle: fast-changing`, localized title, and correct `language` field in all three article files (SR-001, SC-005)

## Phase 4: User Story 2 - Case Discovery (P2)

**Goal**: A reader can scan approximately 10 examples and understand each site's description, personalization pattern, evidence status, source support, access date, and practical takeaway.

**Independent Test**: Review the case matrix in each language and confirm every row has all required fields, uses the same classification across languages, and labels comparable examples as not verified as OpenUI.

- [X] T022 [US2] Add a portable Markdown case matrix with target 10 examples to `wiki/ko/openui/personalization-case-reference.md` (CR-005, SC-002, SC-003)
- [X] T023 [US2] Add source links, publication dates where available, access dates, and supported-claim summaries for every Korean case row in `wiki/ko/openui/personalization-case-reference.md` (SR-001, SR-002, SC-003)
- [X] T024 [US2] Label every Korean comparable example as not verified as OpenUI and ensure verified OpenUI wording appears only where directly sourced in `wiki/ko/openui/personalization-case-reference.md` (SR-003, SR-004, SC-004)
- [X] T025 [P] [US2] Add the same case matrix, classifications, source support, access dates, practical takeaways, and supported-claim summaries in English to `wiki/en/openui/personalization-case-reference.md` (CR-005, SR-004, SC-005)
- [X] T026 [P] [US2] Add the same case matrix, classifications, source support, access dates, practical takeaways, and supported-claim summaries in Japanese to `wiki/ja/openui/personalization-case-reference.md` (CR-005, SR-004, SC-005)
- [X] T027 [US2] If the split threshold is met, create linked companion case-list pages in `wiki/ko/openui/personalization-case-reference-cases.md`, `wiki/en/openui/personalization-case-reference-cases.md`, and `wiki/ja/openui/personalization-case-reference-cases.md`; otherwise record no-split evidence in `specs/027-openui-https-www/review-gates.md` (CR-004, SC-006)
- [X] T028 [US2] Verify the article set contains at least 12 verifiable sources total, translated source references match the Korean source set, supported-claim summaries remain equivalent across languages, and no paragraph-length copied source text appears in `wiki/ko/openui/personalization-case-reference.md`, `wiki/en/openui/personalization-case-reference.md`, and `wiki/ja/openui/personalization-case-reference.md` (SR-001, SR-005, SC-005)

## Phase 5: User Story 3 - Stakeholder Summary (P3)

**Goal**: A reader can extract a concise recommendation, key risks, and follow-up validation questions for a meeting.

**Independent Test**: Read only the one-sentence summary, recommendation, risks, and next experiments in each language and verify the decision message is consistent across Korean, English, and Japanese.

- [X] T029 [US3] Add a concise Korean decision summary and recommendation section to `wiki/ko/openui/personalization-case-reference.md` (CR-007, SC-001)
- [X] T030 [US3] Add Korean key risks, evidence gaps, and next validation experiments to `wiki/ko/openui/personalization-case-reference.md` (CR-006, CR-007, SC-001)
- [X] T031 [P] [US3] Add the same decision summary, recommendation, risks, evidence gaps, and next validation experiments in English to `wiki/en/openui/personalization-case-reference.md` (CR-007, SC-005)
- [X] T032 [P] [US3] Add the same decision summary, recommendation, risks, evidence gaps, and next validation experiments in Japanese to `wiki/ja/openui/personalization-case-reference.md` (CR-007, SC-005)
- [X] T033 [US3] Verify the three language versions preserve the same case classifications, evidence labels, recommendations, glossary terms, and open questions before any active-status decision in `specs/027-openui-https-www/review-gates.md` (SC-005)

## Phase 6: Polish and Cross-Cutting Concerns

**Purpose**: Update navigation, log, notification behavior, and review evidence without marking the article active before human review.

- [X] T034 [P] Update OpenUI section indexes with the new article link in `wiki/ko/openui/index.md`, `wiki/en/openui/index.md`, and `wiki/ja/openui/index.md` (CR-001)
- [X] T035 [P] Update GitBook locale navigation with the new article link in `wiki/ko/SUMMARY.md`, `wiki/en/SUMMARY.md`, and `wiki/ja/SUMMARY.md` (CR-001)
- [X] T036 Update the top-level catalog with localized article entries in `wiki/index.md` (CR-001)
- [X] T037 Append one timestamped update entry to `wiki/log.md` using `## [YYYY-MM-DD HH:MM] update | OpenUI Personalization Case Reference` and summarize created/updated pages and source verification status (CR-001)
- [X] T038 If `SLACK_WEBHOOK_URL` is set, send the update notification with `.wiki/scripts/notify-slack.ts`; if absent, skip sending and record the skip in `specs/027-openui-https-www/review-gates.md` (CR-001)
- [X] T039 Record Principle XII review gate results for readability, factual accuracy, source integrity, multilingual consistency, Markdown portability, terminology consistency, navigation, copying/plagiarism risk, template compliance, and learning goal in `specs/027-openui-https-www/review-gates.md` (CR-001, SC-001, SC-005)
- [X] T040 Verify portable Markdown syntax, relative internal links, no GitBook-only callouts, and no Obsidian wikilinks in article bodies for `wiki/ko/openui/personalization-case-reference.md`, `wiki/en/openui/personalization-case-reference.md`, and `wiki/ja/openui/personalization-case-reference.md` (CR-001)
- [X] T041 Verify `raw/` has no modifications and document the check in `specs/027-openui-https-www/review-gates.md` (SR-006)
- [X] T042 Ensure all three article files remain `status: draft` until multilingual parity, all quality gates, and human review pass (SC-005)

## Dependencies and Execution Order

### Phase Dependencies

- **Phase 1 (Setup)**: No dependencies.
- **Phase 2 (Foundational Source and Terminology Work)**: Depends on Phase 1 and blocks all article drafting.
- **Phase 3 (US1 Feasibility Screening)**: Depends on Phase 2.
- **Phase 4 (US2 Case Discovery)**: Depends on Phase 2 and may run after the US1 article skeleton exists.
- **Phase 5 (US3 Stakeholder Summary)**: Depends on the evidence classifications from Phase 2 and is strongest after US1 and US2 content exists.
- **Phase 6 (Polish and Cross-Cutting Concerns)**: Depends on all user story phases.

### User Story Dependencies

- **US1**: MVP and first priority. Provides the feasibility framing required for the article.
- **US2**: Adds the evidence matrix requested by the user. Can be reviewed independently once source research is complete.
- **US3**: Adds the decision-ready stakeholder summary and recommendation after evidence is classified.

## Parallel Execution Examples

### US1

- `T019` and `T020` can run in parallel after the Korean feasibility structure is stable.
- `T021` should run after all three language files exist.

### US2

- `T025` and `T026` can run in parallel after the Korean case matrix and evidence labels are complete.
- Source integrity verification in `T028` should run after all case matrices are present.

### US3

- `T031` and `T032` can run in parallel after the Korean decision summary is complete.
- `T033` should run after all three stakeholder summaries exist.

### Polish

- `T034` and `T035` can run in parallel because they update separate navigation surfaces.
- `T039`, `T040`, and `T041` can run in parallel after content and navigation updates are complete.

## Implementation Strategy

### MVP First

Complete Phases 1-3 first. This yields the Korean-first feasibility article structure plus English/Japanese parity shells, satisfying the highest-priority feasibility screening goal before the full case matrix is finalized.

### Incremental Delivery

1. Finish source verification and terminology decisions.
2. Deliver US1 feasibility framing in all three languages.
3. Add US2 case matrix and evidence labels in all three languages.
4. Add US3 stakeholder recommendation and follow-up validation questions.
5. Complete navigation, log append, Slack behavior, review gates, and final QA.

## Task Summary

- **Total tasks**: 42
- **US1 tasks**: 8
- **US2 tasks**: 7
- **US3 tasks**: 5
- **Setup/foundation/polish tasks**: 22
- **Parallel opportunities**: 8 tasks marked `[P]`
- **Suggested MVP scope**: Phase 1, Phase 2, and Phase 3 only

## Format Validation

All task lines use the required checklist format:

`- [X] T### [P?] [US?] Description with file path`

Setup, foundational, and polish tasks omit story labels. User story phase tasks include `[US1]`, `[US2]`, or `[US3]`. Requirement IDs from `spec.md` are included in task descriptions.
