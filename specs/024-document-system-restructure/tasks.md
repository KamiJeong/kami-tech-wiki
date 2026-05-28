# Tasks: Documentation System Restructure and Exposure Governance

**Input**: Design documents from `specs/024-document-system-restructure/`

**Prerequisites**: [plan.md](plan.md), [spec.md](spec.md), [research.md](research.md), [data-model.md](data-model.md), [contracts/documentation-audit-contract.md](contracts/documentation-audit-contract.md), [quickstart.md](quickstart.md)

**Organization**: Tasks are grouped by reader scenario so each scenario can be implemented and validated independently. Full audit outputs stay under `specs/024-document-system-restructure/`; docs/wiki edits are limited to low-risk additive navigation changes.

## Phase 1: Setup

**Purpose**: Establish current repository evidence and empty canonical audit outputs.

- [X] T001 Confirm active feature path and branch in `specs/024-document-system-restructure/tasks.md`
- [X] T002 Create audit artifact skeleton with required sections in `specs/024-document-system-restructure/document-inventory.md`
- [X] T003 Create navigation audit skeleton with required sections in `specs/024-document-system-restructure/navigation-audit.md`
- [X] T004 Create lifecycle governance skeleton with required sections in `specs/024-document-system-restructure/lifecycle-governance.md`
- [X] T005 Create validation report skeleton with required checks in `specs/024-document-system-restructure/validation-report.md`
- [X] T006 Record DocGuard and Version Guard pre-task hook context in `specs/024-document-system-restructure/validation-report.md`

---

## Phase 2: Foundational

**Purpose**: Capture shared taxonomy, source surfaces, and validation rules before classifying documents.

**Critical**: No user story task should begin until the taxonomy and source-surface rules are recorded.

- [X] T007 Define documentation surfaces (`docs-root`, `wiki-ko`, `wiki-en`, `wiki-ja`, `specs-internal`, `project-root`) in `specs/024-document-system-restructure/document-inventory.md`
- [X] T008 Define status, treatment, access-method, exposure, and priority enums in `specs/024-document-system-restructure/document-inventory.md`
- [X] T009 Define the low-risk navigation change rule in `specs/024-document-system-restructure/navigation-audit.md`
- [X] T010 Define the Spec Kit/general-document boundary rule in `specs/024-document-system-restructure/lifecycle-governance.md`
- [X] T011 Define latestness and maintenance checklist categories in `specs/024-document-system-restructure/lifecycle-governance.md`
- [X] T012 Record the validation contract mapping from `contracts/documentation-audit-contract.md` in `specs/024-document-system-restructure/validation-report.md`

---

## Phase 3: User Story 1 - Audit Every Document (Priority: P1)

**Goal**: Every current document is represented directly or by an explicit grouping rule, with purpose, status, treatment, domain, Spec Kit relevance, and keep/drop rationale.

**Independent Test**: A reviewer can pick any file under `docs/**/*.md`, `wiki/**/*.md`, or `specs/**/*.md` and find either an exact inventory entry or an explicit grouped entry with treatment and exposure fields.

- [X] T013 [US1] Generate current `docs/**/*.md` file inventory entries in `specs/024-document-system-restructure/document-inventory.md`
- [X] T014 [US1] Generate current `wiki/**/*.md` file inventory entries in `specs/024-document-system-restructure/document-inventory.md`
- [X] T015 [US1] Generate grouped `specs/**/*.md` entries by feature and artifact type in `specs/024-document-system-restructure/document-inventory.md`
- [X] T016 [P] [US1] Record `SUMMARY.md` files as navigation metadata rather than menu-target documents in `specs/024-document-system-restructure/document-inventory.md`
- [X] T017 [P] [US1] Record `README.md` dual roles as landing pages and menu entries where applicable in `specs/024-document-system-restructure/document-inventory.md`
- [X] T018 [US1] Assign purpose, domain, current status, treatment, direct Spec Kit relevance, keep-needed value, and rationale to every inventory entry in `specs/024-document-system-restructure/document-inventory.md`
- [X] T019 [P] [US1] Classify multilingual parity gaps for Korean-only, English-only, and Japanese-only user-facing topics in `specs/024-document-system-restructure/document-inventory.md`
- [X] T020 [US1] Validate complete file coverage for `docs/**/*.md`, `wiki/**/*.md`, and grouped `specs/**/*.md` in `specs/024-document-system-restructure/validation-report.md`

---

## Phase 4: User Story 2 - Improve GitBook and Navigation Exposure (Priority: P2)

**Goal**: Important documents are discoverable through the correct menu or link path without making menus noisy.

**Independent Test**: A reviewer can pick any link-only, direct-only, or unclear-access document and find a target exposure decision plus a rationale; any applied navigation change satisfies the low-risk rule.

- [X] T021 [US2] Audit current `docs/SUMMARY.md` coverage against inventory entries in `specs/024-document-system-restructure/navigation-audit.md`
- [X] T022 [P] [US2] Audit current `wiki/ko/SUMMARY.md` coverage against inventory entries in `specs/024-document-system-restructure/navigation-audit.md`
- [X] T023 [P] [US2] Audit current `wiki/en/SUMMARY.md` coverage against inventory entries in `specs/024-document-system-restructure/navigation-audit.md`
- [X] T024 [P] [US2] Audit current `wiki/ja/SUMMARY.md` coverage against inventory entries in `specs/024-document-system-restructure/navigation-audit.md`
- [X] T025 [US2] Assign current access method and target exposure to every inventory entry in `specs/024-document-system-restructure/navigation-audit.md`
- [X] T026 [US2] Propose root docs menu sections using only categories that fit the project in `specs/024-document-system-restructure/navigation-audit.md`
- [X] T027 [P] [US2] Propose Korean wiki menu adjustments in `specs/024-document-system-restructure/navigation-audit.md`
- [X] T028 [P] [US2] Propose English wiki menu adjustments in `specs/024-document-system-restructure/navigation-audit.md`
- [X] T029 [P] [US2] Propose Japanese wiki menu adjustments in `specs/024-document-system-restructure/navigation-audit.md`
- [X] T030 [US2] Identify link-only documents and record add-to-menu, keep-link-only, internal-reference, merge, archive, or delete decisions in `specs/024-document-system-restructure/navigation-audit.md`
- [X] T031 [US2] List allowed low-risk additive menu/link/label/landing updates with risk checks in `specs/024-document-system-restructure/navigation-audit.md`
- [X] T032 [US2] Apply justified additive docs navigation updates only when listed as low-risk in `docs/SUMMARY.md`
- [X] T033 [P] [US2] Apply justified additive Korean wiki navigation updates only when listed as low-risk in `wiki/ko/SUMMARY.md`
- [X] T034 [P] [US2] Apply justified additive English wiki navigation updates only when listed as low-risk in `wiki/en/SUMMARY.md`
- [X] T035 [P] [US2] Apply justified additive Japanese wiki navigation updates only when listed as low-risk in `wiki/ja/SUMMARY.md`
- [X] T036 [US2] Validate that no applied navigation update removes visibility, renames files, moves files, archives files, deletes files, or changes meaning in `specs/024-document-system-restructure/validation-report.md`

---

## Phase 5: User Story 3 - Separate Spec Kit Docs from General Project Docs (Priority: P3)

**Goal**: Maintainers can distinguish Spec Kit workflow documentation from general project, feature, operations, API, and wiki documentation.

**Independent Test**: A reviewer can inspect any `specs/` group or project/wiki document and see whether it is Spec Kit related based on purpose, not provenance.

- [X] T037 [US3] Apply the Spec Kit boundary rule to grouped `specs/**/*.md` entries in `specs/024-document-system-restructure/lifecycle-governance.md`
- [X] T038 [P] [US3] Apply the Spec Kit boundary rule to `wiki/**/spec-kit/**/*.md` and related wiki topic entries in `specs/024-document-system-restructure/lifecycle-governance.md`
- [X] T039 [P] [US3] Apply the general-project classification rule to OpenUI, Codex, Rovo, Kiro, learner, operations, and API/interface document groups in `specs/024-document-system-restructure/lifecycle-governance.md`
- [X] T040 [US3] Record examples where Spec Kit-generated artifacts remain internal by default in `specs/024-document-system-restructure/lifecycle-governance.md`
- [X] T041 [US3] Validate that no document is classified as Spec Kit related solely due to repository usage of Spec Kit or generated provenance in `specs/024-document-system-restructure/validation-report.md`

---

## Phase 6: User Story 4 - Handle Missing, Stale, Duplicate, and Low-Value Docs (Priority: P4)

**Goal**: Maintainers have a repeatable policy for missing, stale, duplicate, delete/archive/hold, and future-update documents.

**Independent Test**: A reviewer can inspect every missing-document, delete/archive/hold, stale, or duplicate candidate and find a classification, reason, expected path or replacement handling, priority, and follow-up impact.

- [X] T042 [US4] Create missing-document candidate table with expected path, classification, priority, reason, scope, related docs, and omission impact in `specs/024-document-system-restructure/lifecycle-governance.md`
- [X] T043 [P] [US4] Mark which missing-document candidates allow only lightweight placeholder or landing pages for navigation clarity in `specs/024-document-system-restructure/lifecycle-governance.md`
- [X] T044 [US4] Create stale-content candidate table using latestness checks for code alignment, commands, paths, settings, environment variables, removed features, links, duplication, and reader value in `specs/024-document-system-restructure/lifecycle-governance.md`
- [X] T045 [US4] Create duplicate and merge-candidate table with canonical document and replacement-path handling in `specs/024-document-system-restructure/lifecycle-governance.md`
- [X] T046 [US4] Create delete/archive/hold candidate table with reason, replacement path or `no replacement`, visibility risk, reviewer, and link-update requirement in `specs/024-document-system-restructure/lifecycle-governance.md`
- [X] T047 [P] [US4] Record DocGuard-reported project-wide documentation gaps as audit inputs rather than automatic generated docs in `specs/024-document-system-restructure/lifecycle-governance.md`
- [X] T048 [US4] Write future maintenance rules for menu updates, link checks, stale-content review, multilingual parity review, and decision traceability in `specs/024-document-system-restructure/lifecycle-governance.md`
- [X] T049 [US4] Validate every missing, stale, duplicate, delete/archive/hold, and future-update candidate against required fields in `specs/024-document-system-restructure/validation-report.md`

---

## Phase 7: Polish & Cross-Cutting Concerns

**Purpose**: Confirm contract compliance, preserve traceability, and record follow-up risk without expanding scope.

- [X] T050 Validate all inventory rows against `contracts/documentation-audit-contract.md` and record results in `specs/024-document-system-restructure/validation-report.md`
- [X] T051 Validate all exposure decisions against `contracts/documentation-audit-contract.md` and record results in `specs/024-document-system-restructure/validation-report.md`
- [X] T052 Validate all grouped Spec Kit artifact entries against `contracts/documentation-audit-contract.md` and record results in `specs/024-document-system-restructure/validation-report.md`
- [X] T053 Validate all low-risk navigation changes against `contracts/documentation-audit-contract.md` and record results in `specs/024-document-system-restructure/validation-report.md`
- [X] T054 Run or document a broken relative-link scan for `docs/**/*.md` and `wiki/**/*.md` in `specs/024-document-system-restructure/validation-report.md`
- [X] T055 Create final audit summary with unresolved risks and follow-up batches in `specs/024-document-system-restructure/analysis.md`
- [X] T056 Append work-log entry for any wiki navigation or wiki content changes in `wiki/log.md`
- [X] T057 Attempt Slack notification only if wiki content/navigation changed and `SLACK_WEBHOOK_URL` is present, recording the result in `specs/024-document-system-restructure/validation-report.md`
- [X] T058 Confirm no `raw/` files, file renames, file moves, destructive archives, destructive deletes, visibility removals, or broad article rewrites occurred in `specs/024-document-system-restructure/validation-report.md`

---

## Dependencies & Execution Order

### Phase Dependencies

- **Phase 1 (Setup)**: No dependencies.
- **Phase 2 (Foundational)**: Depends on Phase 1.
- **Phase 3 (US1)**: Depends on Phase 2 and blocks complete US2-US4 validation.
- **Phase 4 (US2)**: Depends on US1 inventory; can proceed before US3/US4 once inventory entries exist.
- **Phase 5 (US3)**: Depends on US1 inventory; can run in parallel with US2 and US4 after US1.
- **Phase 6 (US4)**: Depends on US1 inventory; can run in parallel with US2 and US3 after US1.
- **Phase 7 (Polish)**: Depends on all user story phases.

### User Story Dependencies

- **US1** is the MVP and prerequisite for all other stories.
- **US2** depends on inventory entries from US1.
- **US3** depends on inventory entries from US1.
- **US4** depends on inventory entries from US1.

### Parallel Opportunities

- T016, T017, and T019 can run in parallel after T013-T015 create base inventory coverage.
- T022, T023, and T024 can run in parallel across locale menus.
- T027, T028, and T029 can run in parallel across locale menu proposals.
- T033, T034, and T035 can run in parallel if each locale update is listed as low-risk.
- T038 and T039 can run in parallel after T037 defines the boundary application pattern.
- T043 and T047 can run in parallel with other US4 tables after T042 starts the candidate structure.

## Parallel Execution Examples

### US1

```text
Task: T016 Record SUMMARY.md metadata treatment in document-inventory.md
Task: T017 Record README.md dual roles in document-inventory.md
Task: T019 Classify multilingual parity gaps in document-inventory.md
```

### US2

```text
Task: T022 Audit wiki/ko/SUMMARY.md coverage in navigation-audit.md
Task: T023 Audit wiki/en/SUMMARY.md coverage in navigation-audit.md
Task: T024 Audit wiki/ja/SUMMARY.md coverage in navigation-audit.md
```

### US3

```text
Task: T038 Apply Spec Kit boundary to wiki spec-kit topics in lifecycle-governance.md
Task: T039 Apply general-project classification to tool/topic groups in lifecycle-governance.md
```

### US4

```text
Task: T043 Mark placeholder-allowed missing-document candidates in lifecycle-governance.md
Task: T047 Record DocGuard gaps as audit inputs in lifecycle-governance.md
```

## Implementation Strategy

### MVP First

Complete Phase 1, Phase 2, and US1. This delivers the minimum useful result: a complete, traceable inventory covering `docs/`, `wiki/`, and grouped `specs/` artifacts.

### Incremental Delivery

1. Add US2 to make discoverability decisions and apply only low-risk navigation improvements.
2. Add US3 to prevent Spec Kit/general documentation misclassification.
3. Add US4 to complete missing/stale/delete/archive/maintenance governance.
4. Run Polish tasks to validate contract compliance and record follow-up work.

### Scope Control

Do not mark tasks complete if completion required deleting files, archiving files, moving files, renaming files, removing menu visibility, changing document meaning, modifying `raw/`, or broadly rewriting article content.

## Format Validation

All executable tasks use the required checklist format:

```text
CHECKBOX T### [P?] [US?] Description with file path
```

Setup, foundational, and polish tasks omit story labels. User story phase tasks include `[US1]`, `[US2]`, `[US3]`, or `[US4]`.
