---
description: "Task list for SDD Wiki — Spec-Driven Development, Kiro, and Spec-Kit"
---

# Tasks: SDD Wiki — Spec-Driven Development, Kiro, and Spec-Kit

**Input**: Design documents from `specs/009-sdd-wiki-spec-kit/`

**Prerequisites**: spec.md, plan.md, research.md, data-model.md, contracts/front-matter-schema.md, contracts/article-content-contract.md

**Tests**: Not requested — verification is performed via acceptance scenarios in spec.md and `speckit-verify-run` post-implementation gate.

**Organization**: Tasks are grouped by user story in priority order. US1 (Korean SDD) is the MVP increment.

## Format: `[ID] [P?] [Story] Description`

- **[P]**: Can run in parallel (different files, no dependencies on incomplete tasks)
- **[Story]**: Which user story this task belongs to (US1–US5)
- Exact file paths are included in every task description

---

## Phase 1: Setup (Directory Structure)

**Purpose**: Create all required directories before any article files are written. No article content here — pure structure initialization.

- [X] T001 Create directory `wiki/ko/sdd/`
- [X] T002 [P] Create directory `wiki/ko/kiro/`
- [X] T003 [P] Create directory `wiki/ko/spec-kit/`
- [X] T004 [P] Create directory `wiki/en/sdd/`
- [X] T005 [P] Create directory `wiki/en/kiro/`
- [X] T006 [P] Create directory `wiki/en/spec-kit/`
- [X] T007 [P] Create directory `wiki/ja/sdd/`
- [X] T008 [P] Create directory `wiki/ja/kiro/`
- [X] T009 [P] Create directory `wiki/ja/spec-kit/`

**Checkpoint**: All 9 topic directories exist — article creation can begin.

---

## Phase 2: Foundational (Shared Template Review)

**Purpose**: Confirm the templates to be used before writing any article. This prevents structural rework across 18 files.

**⚠️ CRITICAL**: Templates must be read before any article is authored.

- [X] T010 Read `.wiki/templates/concept-page.md` and note all required section headings and front-matter fields
- [X] T011 Read `.wiki/templates/tool-page.md` and note all required section headings and front-matter fields (including mandatory `tool:` field)
- [X] T012 Read `specs/009-sdd-wiki-spec-kit/contracts/front-matter-schema.md` and confirm per-article `source_count`, `tags`, and `status` values
- [X] T013 Read `specs/009-sdd-wiki-spec-kit/contracts/article-content-contract.md` and note all content rules (SDD-1 through SDD-7, KIRO-1 through KIRO-12, SK-1 through SK-8)

**Checkpoint**: Template structure confirmed — article authoring can now begin.

---

## Phase 3: User Story 1 — Korean SDD Concept (Priority: P1) — MVP

**Goal**: A Korean-speaking reader can navigate to `wiki/ko/sdd/index.md` and fully understand Spec-Driven Development, its principles, and how it relates to Kiro and Spec-Kit — without leaving the page.

**Independent Test**: A reader unfamiliar with SDD reads the Korean concept page and can correctly answer: (1) what SDD is, (2) how it differs from TDD, and (3) name two tools that implement it.

**Spec Requirements**: FR-001, FR-003, SC-001, SC-002, SC-003, SC-006

### Implementation for User Story 1

- [X] T014 [US1] Create `wiki/ko/sdd/README.md` — Korean SDD category landing page; include front-matter with `category: concept`, `language: ko`, `status: active`, `source_count: 0`, `tags: [sdd, spec-driven-development, concept, methodology]`; brief description of SDD and links to `index.md`
- [X] T015 [US1] Create `wiki/ko/sdd/index.md` — Korean SDD concept article using `concept-page.md` template; mandatory content per content contract SDD-1 through SDD-7:
  - Full name "Spec-Driven Development (SDD)" on first use; "SDD" consistently thereafter (SDD-1)
  - Overview section: definition of SDD and why it exists (SDD-2)
  - Core Principles section: spec-first, living specifications, iterative refinement — at minimum 3 principles (SDD-3)
  - Comparison table with exactly 4 data rows: SDD vs BDD, SDD vs TDD, SDD vs ad-hoc (SDD-4 / SC-006)
  - At least one real-world application example or scenario (SDD-7)
  - Wikilinks `[[Kiro]]` and `[[Spec-Kit]]` in Connected Tools section (SDD-5, SDD-6)
  - Minimum 400 words (SC-001)
  - Front-matter: `category: concept`, `language: ko`, `source_count: 0`, `status: active`

**Checkpoint**: `wiki/ko/sdd/index.md` exists, passes front-matter validation, and contains all required sections with ≥ 400 words. User Story 1 is independently verifiable.

---

## Phase 4: User Story 2 — Kiro Tool Pages (Priority: P2)

**Goal**: A developer evaluating AI-powered IDEs reads the Korean Kiro page and decides within 5 minutes whether Kiro fits their workflow. English and Japanese equivalents exist for non-Korean readers.

**Independent Test**: The Korean Kiro page contains: staleness callout, all 4 core feature sections (steering files, spec docs, agent tasks, autopilot), a quick start example, limitations, and an explicit SDD relationship paragraph.

**Spec Requirements**: FR-004, FR-005, FR-006, SC-001, SC-002, SC-007

### Implementation for User Story 2

- [X] T016 [US2] Create `wiki/ko/kiro/README.md` — Korean Kiro category landing page; front-matter with `category: tool`, `tool: "Kiro"`, `language: ko`, `status: active`, `source_count: 0`, `tags: [kiro, aws, ai-ide, tool]`; brief description and link to `index.md`
- [X] T017 [US2] Create `wiki/ko/kiro/index.md` — Korean Kiro tool article using `tool-page.md` template; mandatory content per KIRO-1 through KIRO-12:
  - Staleness callout blockquote at top (before any section heading): states information date 2026-05-18, notes Kiro is under active development, links to https://kiro.dev (KIRO-1, KIRO-2)
  - Core Concepts section: steering files (KIRO-4), spec documents — requirements.md / design.md / tasks.md (KIRO-5), agent tasks (KIRO-6), autopilot mode (KIRO-7)
  - What Kiro is section: AWS AI-powered IDE, VS Code-based (KIRO-3)
  - Quick Start example with step-by-step or code block (KIRO-8 / SC-007)
  - SDD relationship paragraph explaining how Kiro embodies spec-first approach (KIRO-9)
  - Wikilink `[[SDD]]` or `[[Spec-Driven Development (SDD)]]` (KIRO-10)
  - Limitations section with ≥ 2 known limitations (KIRO-11)
  - Reference link to https://kiro.dev (KIRO-12)
  - Minimum 400 words (SC-001)
- [X] T018 [P] [US2] Create `wiki/en/kiro/README.md` — English Kiro category landing page; same structure as T016 with `language: en`
- [X] T019 [P] [US2] Create `wiki/en/kiro/index.md` — English Kiro tool article; same mandatory content as T017, all content in English, front-matter `language: en`; staleness callout in English
- [X] T020 [P] [US2] Create `wiki/ja/kiro/README.md` — Japanese Kiro category landing page; same structure as T016 with `language: ja`
- [X] T021 [P] [US2] Create `wiki/ja/kiro/index.md` — Japanese Kiro tool article; same mandatory content as T017, all content in Japanese, front-matter `language: ja`; staleness callout in Japanese

**Checkpoint**: 6 Kiro files exist (3 README.md + 3 index.md), all pass front-matter validation, all contain the staleness callout and ≥ 400 words each.

---

## Phase 5: User Story 3 — Spec-Kit Tool Pages (Priority: P3)

**Goal**: A new project contributor reads the Korean Spec-Kit page and can run their first `/speckit-specify` command without additional guidance.

**Independent Test**: The Korean Spec-Kit page names all 6 pipeline stages, lists the 5 key commands, contains a `/speckit-specify` quick start code block, describes the extension hooks system, and links to the SDD concept page.

**Spec Requirements**: FR-007, FR-008, FR-009, SC-001, SC-002, SC-007

### Implementation for User Story 3

- [X] T022 [US3] Create `wiki/ko/spec-kit/README.md` — Korean Spec-Kit category landing page; front-matter with `category: tool`, `tool: "Spec-Kit"`, `language: ko`, `status: active`, `source_count: 8`, `tags: [spec-kit, claude-code, sdd, workflow, tool]`; brief description and link to `index.md`
- [X] T023 [US3] Create `wiki/ko/spec-kit/index.md` — Korean Spec-Kit tool article using `tool-page.md` template; mandatory content per SK-1 through SK-8:
  - Pipeline stages section: `specify → clarify → plan → tasks → implement → verify` — all 6 named and explained (SK-1)
  - Key commands listed: `/speckit-specify`, `/speckit-clarify`, `/speckit-plan`, `/speckit-tasks`, `/speckit-implement` (SK-2)
  - Quick Start section with `/speckit-specify` command invocation in a code block (SK-3 / SC-007)
  - Extension hooks system section (SK-4)
  - Paragraph describing Spec-Kit as an implementation of SDD within Claude Code (SK-5)
  - Wikilink `[[SDD]]` or `[[Spec-Driven Development (SDD)]]` (SK-6)
  - Limitations section with ≥ 2 known limitations (SK-7)
  - Front-matter `source_count: 8` (SK-8)
  - Minimum 400 words (SC-001)
- [X] T024 [P] [US3] Create `wiki/en/spec-kit/README.md` — English Spec-Kit category landing page; same structure as T022 with `language: en`
- [X] T025 [P] [US3] Create `wiki/en/spec-kit/index.md` — English Spec-Kit tool article; same mandatory content as T023, all content in English, front-matter `language: en`, `source_count: 8`
- [X] T026 [P] [US3] Create `wiki/ja/spec-kit/README.md` — Japanese Spec-Kit category landing page; same structure as T022 with `language: ja`
- [X] T027 [P] [US3] Create `wiki/ja/spec-kit/index.md` — Japanese Spec-Kit tool article; same mandatory content as T023, all content in Japanese, front-matter `language: ja`, `source_count: 8`

**Checkpoint**: 6 Spec-Kit files exist (3 README.md + 3 index.md), all contain `source_count: 8`, all 6 pipeline stages are named in each article.

---

## Phase 6: User Story 4 — Trilingual SDD Concept Pages (Priority: P4)

**Goal**: English and Japanese readers can access the SDD concept in their language, with content depth equivalent to the Korean page authored in US1.

**Independent Test**: `wiki/en/sdd/index.md` and `wiki/ja/sdd/index.md` both exist, contain the 4-row comparison table, front-matter language values match their directories, and each has ≥ 400 words.

**Spec Requirements**: FR-002, FR-003, SC-001, SC-002

**Note**: Kiro and Spec-Kit trilingual pages were already created in US2 and US3 (T018–T021, T024–T027). This phase completes trilingual coverage for SDD.

### Implementation for User Story 4

- [X] T028 [P] [US4] Create `wiki/en/sdd/README.md` — English SDD category landing page; same structure as T014 with `language: en`
- [X] T029 [P] [US4] Create `wiki/en/sdd/index.md` — English SDD concept article; all mandatory content from content contract SDD-1 through SDD-7 in English; 4-row comparison table; wikilinks to `[[Kiro]]` and `[[Spec-Kit]]`; front-matter `language: en`, `source_count: 0`, `status: active`; ≥ 400 words
- [X] T030 [P] [US4] Create `wiki/ja/sdd/README.md` — Japanese SDD category landing page; same structure as T014 with `language: ja`
- [X] T031 [P] [US4] Create `wiki/ja/sdd/index.md` — Japanese SDD concept article; all mandatory content from content contract SDD-1 through SDD-7 in Japanese; 4-row comparison table; wikilinks to `[[Kiro]]` and `[[Spec-Kit]]`; front-matter `language: ja`, `source_count: 0`, `status: active`; ≥ 400 words

**Checkpoint**: All 9 topic index.md files now exist across all 3 languages. Trilingual coverage is complete.

---

## Phase 7: User Story 5 — Wiki Index, Log, and SUMMARY.md Updates (Priority: P5)

**Goal**: After article creation, the wiki catalog, operation log, and GitBook navigation reflect all 9 new pages so readers can discover the new content.

**Independent Test**: `wiki/index.md` lists all 9 new pages; `wiki/log.md` has one new timestamped entry; each SUMMARY.md has 3 new sections.

**Spec Requirements**: FR-011, FR-012, FR-015, SC-004, SC-005, IDX-1, IDX-2, LOG-1, LOG-2, SUM-1 through SUM-4

### Implementation for User Story 5

- [X] T032 [US5] Update `wiki/index.md` — add 9 new index entries following the `[[Title]] — summary (updated: YYYY-MM-DD, sources: N)` pattern (IDX-1, IDX-2):
  - `[[Spec-Driven Development (SDD)]] — ko` (sources: 0)
  - `[[Spec-Driven Development (SDD)]] — en` (sources: 0)
  - `[[Spec-Driven Development (SDD)]] — ja` (sources: 0)
  - `[[Kiro]] — ko` (sources: 0)
  - `[[Kiro]] — en` (sources: 0)
  - `[[Kiro]] — ja` (sources: 0)
  - `[[Spec-Kit]] — ko` (sources: 8)
  - `[[Spec-Kit]] — en` (sources: 8)
  - `[[Spec-Kit]] — ja` (sources: 8)
- [X] T033 [US5] Append `wiki/log.md` — add exactly one new timestamped entry in the format: `## [2026-05-18 HH:MM] ingest | SDD Wiki — Spec-Driven Development, Kiro, and Spec-Kit` (LOG-1, LOG-2); do not remove or modify existing entries
- [X] T034 [P] [US5] Update `wiki/ko/SUMMARY.md` — append 3 new sections after the existing Codex CLI section (SUM-1):
  ```
  ## SDD (Spec-Driven Development)

  * [SDD 개요](sdd/README.md)
  * [Spec-Driven Development](sdd/index.md)

  ## Kiro

  * [Kiro 개요](kiro/README.md)
  * [Kiro](kiro/index.md)

  ## Spec-Kit

  * [Spec-Kit 개요](spec-kit/README.md)
  * [Spec-Kit](spec-kit/index.md)
  ```
- [X] T035 [P] [US5] Update `wiki/en/SUMMARY.md` — append 3 new sections after the existing Codex CLI section (SUM-2):
  ```
  ## SDD (Spec-Driven Development)

  * [SDD Overview](sdd/README.md)
  * [Spec-Driven Development](sdd/index.md)

  ## Kiro

  * [Kiro Overview](kiro/README.md)
  * [Kiro](kiro/index.md)

  ## Spec-Kit

  * [Spec-Kit Overview](spec-kit/README.md)
  * [Spec-Kit](spec-kit/index.md)
  ```
- [X] T036 [P] [US5] Update `wiki/ja/SUMMARY.md` — append 3 new sections after the existing Codex CLI section (SUM-3):
  ```
  ## SDD (Spec-Driven Development)

  * [SDD 概要](sdd/README.md)
  * [Spec-Driven Development](sdd/index.md)

  ## Kiro

  * [Kiro 概要](kiro/README.md)
  * [Kiro](kiro/index.md)

  ## Spec-Kit

  * [Spec-Kit 概要](spec-kit/README.md)
  * [Spec-Kit](spec-kit/index.md)
  ```

**Checkpoint**: `wiki/index.md` has 9 new entries; `wiki/log.md` has one new entry; all 3 SUMMARY.md files have 3 new sections with correct relative paths.

---

## Phase 8: Polish & Cross-Cutting Concerns

**Purpose**: Final validation sweep across all created files.

- [X] T037 [P] Verify all 9 `index.md` files exist: `wiki/ko/sdd/`, `wiki/en/sdd/`, `wiki/ja/sdd/`, `wiki/ko/kiro/`, `wiki/en/kiro/`, `wiki/ja/kiro/`, `wiki/ko/spec-kit/`, `wiki/en/spec-kit/`, `wiki/ja/spec-kit/`
- [X] T038 [P] Verify all 9 `README.md` files exist (same directory set)
- [X] T039 Verify front-matter on all 9 `index.md` files: all mandatory fields present, `language` matches directory, `status: active`, `source_count` matches contract values (0 for SDD and Kiro; 8 for Spec-Kit)
- [X] T040 Verify content contracts: SDD pages have 4-row comparison table; Kiro pages have staleness callout within first 10 lines after front-matter; Spec-Kit pages list all 6 pipeline stages and 5 commands
- [X] T041 Verify `wiki/index.md` contains all 9 new entries and `wiki/log.md` has exactly one new timestamped entry
- [X] T042 Verify all 18 SUMMARY.md links (3 locales × 3 topics × 2 files) point to paths that now exist (SUM-4)

---

## Dependencies & Execution Order

### Phase Dependencies

- **Setup (Phase 1)**: No dependencies — start immediately; all T001–T009 are parallelizable
- **Foundational (Phase 2)**: Depends on Phase 1 completion; T010–T013 should run before any article writing
- **US1 / Phase 3**: Depends on Phase 2; Korean SDD articles — must complete before Polish phase
- **US2 / Phase 4**: Depends on Phase 2; Kiro trilingual articles — can run in parallel with US1 and US3
- **US3 / Phase 5**: Depends on Phase 2; Spec-Kit trilingual articles — can run in parallel with US1 and US2
- **US4 / Phase 6**: Depends on Phase 2; English and Japanese SDD articles — can run in parallel with US2 and US3; English/Japanese Kiro and Spec-Kit (T018–T021, T024–T027) are already in US2/US3
- **US5 / Phase 7**: Depends on ALL article phases (US1–US4) being complete before index/log/SUMMARY updates
- **Polish (Phase 8)**: Depends on US5 completion

### User Story Dependencies

- **US1 (P1)**: Independent — no cross-story dependencies
- **US2 (P2)**: Independent — no cross-story dependencies; Kiro wikilinks reference SDD page (T015 creates the target)
- **US3 (P3)**: Independent — no cross-story dependencies; Spec-Kit wikilinks reference SDD page (T015 creates the target)
- **US4 (P4)**: Independent — English/Japanese SDD articles; wikilinks reference Kiro and Spec-Kit pages created in US2/US3
- **US5 (P5)**: Depends on US1–US4 all being complete (all 9 articles must exist before catalog updates)

### Parallel Opportunities

- T001–T009: All directory creation tasks run in parallel
- T010–T013: Can run in parallel (reading different files)
- T014–T015 (US1 Korean SDD) vs T016–T021 (US2 Kiro) vs T022–T027 (US3 Spec-Kit): all three story groups can run in parallel after Phase 2
- T028–T031 (US4 English/Japanese SDD): can run in parallel with US2 and US3 work
- Within US2: T018+T019 (en/kiro) and T020+T021 (ja/kiro) are parallelizable with each other
- Within US3: T024+T025 (en/spec-kit) and T026+T027 (ja/spec-kit) are parallelizable with each other
- Within US4: T028+T029 (en/sdd) and T030+T031 (ja/sdd) are parallelizable with each other
- T034, T035, T036 (SUMMARY.md updates): parallelizable with each other after articles complete
- T037–T042 (Polish): T037, T038, T039, T040 can run in parallel

---

## Parallel Example: Article Creation (Phases 3–6)

```
# After Phase 2 completes, all article groups can run in parallel:

Group A — US1 (Korean SDD):
  T014: wiki/ko/sdd/README.md
  T015: wiki/ko/sdd/index.md

Group B — US2 (Kiro trilingual):
  T016: wiki/ko/kiro/README.md
  T017: wiki/ko/kiro/index.md
  T018: wiki/en/kiro/README.md  [P]
  T019: wiki/en/kiro/index.md   [P]
  T020: wiki/ja/kiro/README.md  [P]
  T021: wiki/ja/kiro/index.md   [P]

Group C — US3 (Spec-Kit trilingual):
  T022: wiki/ko/spec-kit/README.md
  T023: wiki/ko/spec-kit/index.md
  T024: wiki/en/spec-kit/README.md  [P]
  T025: wiki/en/spec-kit/index.md   [P]
  T026: wiki/ja/spec-kit/README.md  [P]
  T027: wiki/ja/spec-kit/index.md   [P]

Group D — US4 (English/Japanese SDD):
  T028: wiki/en/sdd/README.md  [P]
  T029: wiki/en/sdd/index.md   [P]
  T030: wiki/ja/sdd/README.md  [P]
  T031: wiki/ja/sdd/index.md   [P]
```

---

## Implementation Strategy

### MVP First (User Story 1 Only)

1. Complete Phase 1: Directory Setup (T001–T009)
2. Complete Phase 2: Template Review (T010–T013)
3. Complete Phase 3: Korean SDD concept article (T014–T015)
4. **STOP and VALIDATE**: Korean SDD page has 400+ words, 4-row comparison table, wikilinks to Kiro and Spec-Kit
5. Proceed to US2 (Kiro) once US1 is validated

### Incremental Delivery

1. Setup + Foundational → directories and template knowledge ready
2. US1 (Korean SDD) → validate concept page independently → confirm comparison table and principles
3. US2 (Kiro trilingual) → validate all 3 Kiro pages including staleness callout
4. US3 (Spec-Kit trilingual) → validate all 3 Spec-Kit pages including pipeline stages and source_count: 8
5. US4 (English/Japanese SDD) → validate remaining SDD language variants
6. US5 (Index/Log/SUMMARY) → validate catalog and navigation completeness
7. Polish → final cross-cutting validation sweep

---

## Spec Requirement Traceability

| Requirement | Task(s) |
|-------------|---------|
| FR-001 (ko SDD concept page) | T014, T015 |
| FR-002 (en/ja SDD concept pages) | T028–T031 |
| FR-003 (SDD content rules) | T015, T029, T031 |
| FR-004 (ko Kiro tool page) | T016, T017 |
| FR-005 (en/ja Kiro tool pages) | T018–T021 |
| FR-006 (Kiro content rules + staleness callout) | T017, T019, T021 |
| FR-007 (ko Spec-Kit tool page) | T022, T023 |
| FR-008 (en/ja Spec-Kit tool pages) | T024–T027 |
| FR-009 (Spec-Kit content rules) | T023, T025, T027 |
| FR-010 (all front-matter fields) | T014–T031, T039 |
| FR-011 (wiki/index.md update) | T032 |
| FR-012 (wiki/log.md append) | T033 |
| FR-013 (no verbatim raw/ copying) | All article tasks |
| FR-014 (raw/ not modified) | All article tasks |
| FR-015 (SUMMARY.md updates) | T034, T035, T036 |
| SC-001 (400 words min) | T015, T017, T019, T021, T023, T025, T027, T029, T031 |
| SC-002 (100% front-matter compliance) | T039 |
| SC-006 (4-row comparison table) | T015, T029, T031 |
| SC-007 (quick start example) | T017, T019, T021, T023, T025, T027 |

---

## Notes

- [P] tasks write to different files — no risk of conflict when run in parallel
- [Story] labels map each task to a user story for traceability to spec.md
- Each user story (US1–US4) is independently completable and independently testable
- US5 is the only story that depends on all others completing first
- `raw/` directory must not be modified at any point (FR-014)
- `source_count` for Spec-Kit pages is exactly 8 — do not approximate
- Kiro staleness callout must appear before the first section heading (KIRO-1)
- All delivered articles must have `status: active` (not `draft`)
