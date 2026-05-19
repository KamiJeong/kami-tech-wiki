---
description: "Task list for Spec-Driven Development multilingual wiki article set"
---

# Tasks: Spec-Driven Development Multilingual Wiki

**Input**: Design documents from `/specs/019-create-replace-multilingual/`

**Prerequisites**: spec.md (complete)

**Organization**: Tasks follow the wiki editorial workflow — Research → Draft (ko) →
Translations (en/ja in parallel) → Quality Gates → Human Review → Publish.
Each phase produces an independently reviewable artifact.

## Format: `[ID] [P?] [RS?] Description — output path`

- **[P]**: Can run in parallel (no shared output file)
- **[RS]**: Which reader scenario this task satisfies (RS1, RS2, RS3)
- **Linked spec requirements**: CR-000–CR-006, TR-001–TR-003, SR-001–SR-003

## Path Conventions

- Korean article: `wiki/ko/sdd/index.md`
- English article: `wiki/en/sdd/index.md`
- Japanese article: `wiki/ja/sdd/index.md`
- Glossary entries: `wiki/glossary/<term-slug>.md`

---

## Phase 1: Research and Terminology

**Purpose**: Verify factual sources, lock terminology, and confirm word-count strategy
before any drafting begins. No drafting can begin until this phase is complete.

**Linked requirements**: SR-001, SR-002, SR-003, TR-001, TR-002, TR-003

- [X] T001 Identify and record at least 2 verifiable sources for TDD and BDD definitions, noting publication date and URL — `specs/019-create-replace-multilingual/research.md`
- [X] T002 [P] Identify and record at least 1 verifiable source for AI coding agent capability claims, noting knowledge cutoff or publication date — `specs/019-create-replace-multilingual/research.md`
- [X] T003 [P] Check `wiki/glossary/` for existing entries covering: Spec-Driven Development, specification, constitution, vibe coding, AI coding agent, pipeline, TDD, BDD
- [X] T004 Draft glossary stub entries for new terms not yet present (TR-001): Spec-Driven Development, specification (SDD context), constitution (SDD context), vibe coding, AI coding agent, pipeline — `wiki/glossary/`
- [X] T005 Record locked translation decisions in research notes: "vibe coding" → 바이브 코딩 / バイブコーディング; "specification" → 명세서 / 仕様書; "constitution" (SDD context) → 원칙 문서 / 原則文書 — `specs/019-create-replace-multilingual/research.md`
- [X] T006 Draft the 22-section article outline in neutral language (no prose) to estimate per-language word count and determine single-page vs. split-page strategy per CR-004 — `specs/019-create-replace-multilingual/research.md`

**Checkpoint**: Sources verified, terminology locked, page strategy decided — Korean drafting can begin.

---

## Phase 2: Korean Draft (Primary Language)

**Purpose**: Write the Korean article as the primary editorial draft (Constitution Principle IV).
Overwrite any existing file at the target path per CR-000. Do not create backups.

**Reader scenarios**: RS1 (primary), RS2, RS3

**Linked requirements**: CR-000, CR-001, CR-002, CR-003, CR-004, CR-005

- [X] T010 [RS1] Write frontmatter block (title, tags, category: concept, language: ko, date_created, date_modified, source_count, status: draft, review_cycle: periodic) — `wiki/ko/sdd/index.md`
- [X] T011 [RS1] Draft sections 1–4: Title, Summary (one-sentence definition), Target Reader, Prerequisites (with TBD inline links, no stub creation) — `wiki/ko/sdd/index.md`
- [X] T012 [RS1] Draft section 5: Plain-language analogy for non-developers (minimum 1 analogy, e.g., architecture blueprint) satisfying CR-002 — `wiki/ko/sdd/index.md`
- [X] T013 [RS1] Draft section 6: What is Spec-Driven Development? — define SDD, introduce "명세서" and "원칙 문서" on first use with inline Korean explanation — `wiki/ko/sdd/index.md`
- [X] T014 [RS1] Draft section 7: Why SDD matters in the AI era — define "AI 코딩 에이전트" briefly on first use; include dated capability claims per SR-002 — `wiki/ko/sdd/index.md`
- [X] T015 [RS2] Draft section 8: SDD workflow — describe all 6 stages in order (Constitution → Specify → Plan → Tasks → Implement → Review), one sentence each; satisfies RS2 completion check — `wiki/ko/sdd/index.md`
- [X] T016 [RS3] Draft section 9: SDD vs. TDD, BDD, and 바이브 코딩 — include a comparison table; place SDD relative to TDD/BDD; address defensiveness about vibe coding directly but respectfully; satisfies RS3 completion check — `wiki/ko/sdd/index.md`
- [X] T017 [RS1] Draft section 10: When to use SDD / When not to use SDD — enable RS1 and RS2 readers to make an informed adoption decision — `wiki/ko/sdd/index.md`
- [X] T018 [RS1] Draft section 11: Practical example — concrete, realistic scenario — `wiki/ko/sdd/index.md`
- [X] T019 [RS1] Draft section 12: Common misconceptions (CR-003) — at least 3 misconceptions — `wiki/ko/sdd/index.md`
- [X] T020 [RS1] Draft sections 13–22: Risks and limitations, Best practices, Glossary of SDD terms (TR-001), Related articles (inline hyperlinks per CR-005a), FAQ, Summary, References, Last reviewed date — `wiki/ko/sdd/index.md`
- [X] T021 Verify article word count: if single-page draft exceeds 3,000 words, split into up to 7 linked sub-pages per CR-004 sub-page structure; update all internal links accordingly — `wiki/ko/sdd/`
- [X] T022 Verify all 22 required sections are present per CR-001, and no article prose appears in spec.md or plan.md per CR-006

**Checkpoint**: Korean draft complete and self-consistent — parallel English/Japanese translation can begin.

---

## Phase 3: English and Japanese Translations

**Purpose**: Produce natural, idiomatic translations from the approved Korean draft.
Both translations MUST run in parallel. Overwrite any existing file per CR-000.

**Reader scenarios**: RS1, RS2, RS3 (all, in all languages)

**Linked requirements**: CR-000, CR-005, TR-003

- [X] T030 [P] [RS1] Translate full article to English, using natural English phrasing — write to `wiki/en/sdd/index.md` (overwrite in place)
- [X] T031 [P] [RS1] Translate full article to Japanese, using natural Japanese phrasing — write to `wiki/ja/sdd/index.md` (overwrite in place)
- [X] T032 [P] Update English frontmatter: language: en, date_modified to today, source_count matching research.md — `wiki/en/sdd/index.md`
- [X] T033 [P] Update Japanese frontmatter: language: ja, date_modified to today, source_count matching research.md — `wiki/ja/sdd/index.md`
- [X] T034 [P] [RS3] Verify English translation: "vibe coding" used as-is with brief inline definition on first use; "specification" and "constitution" in SDD context defined inline — `wiki/en/sdd/index.md`
- [X] T035 [P] [RS3] Verify Japanese translation: "バイブコーディング" used with brief inline definition on first use; "仕様書" and "原則文書" used consistently per TR-003 — `wiki/ja/sdd/index.md`
- [X] T036 [P] Verify section order and structure is identical across ko/en/ja per CR-005 — all three files
- [X] T037 [P] Verify all inline cross-reference hyperlinks render correctly in English and Japanese versions per CR-005a — `wiki/en/sdd/`, `wiki/ja/sdd/`

**Checkpoint**: All three language versions present with correct frontmatter and locked terminology — quality review can begin.

---

## Phase 4: Quality Gate Review

**Purpose**: Verify all quality gates before human review. All gate checks run in parallel.

**Linked requirements**: SR-001, SR-002, SR-003, CR-001–CR-006, TR-001–TR-003, Constitution Principle XII

- [X] T040 [P] [RS1] Readability check: confirm a non-developer reader can understand the article without external help — verify plain-language analogy (CR-002) and first-use definitions are present in all three versions
- [X] T041 [P] Factual accuracy check: verify all TDD/BDD claims cite sources from research.md (SR-001), and AI capability claims include a date (SR-002) — all three versions
- [X] T042 [P] Original synthesis check: confirm no paragraph is a verbatim copy of any source (SR-003) — all three versions
- [X] T043 [P] Multilingual consistency check: confirm ko/en/ja have identical section count, equivalent learning outcomes, and equivalent terminology decisions per CR-005 — all three versions
- [X] T044 [P] Markdown portability check: confirm article renders correctly in GitBook, GitHub, and plain Markdown viewers (no platform-specific syntax) — all three versions
- [X] T045 [P] Terminology consistency check: confirm all new SDD terms (TR-001) and existing terms (TR-002) match glossary entries; confirm translation locks from TR-003 applied correctly
- [X] T046 [P] Navigation check: confirm all inline cross-references use hyperlinks not a "See Also" block (CR-005a); confirm prerequisite links marked TBD without stub files created
- [X] T047 [P] Section completeness check: confirm all 22 required sections are present or exceptions documented per CR-001 — all three versions
- [X] T048 [P] [RS2] Workflow coverage check: confirm the six SDD stages (Constitution → Specify → Plan → Tasks → Implement → Review) are named and described in the workflow section — all three versions
- [X] T049 [P] [RS1] Learning goal check: confirm reader can explain SDD in one sentence, name two benefits, and identify one situation where it would and would not be appropriate after reading — check against RS1 completion criteria

**Checkpoint**: All 10 gates documented as passed — human review requested.

---

## Phase 5: Human Editorial Review

**Purpose**: Human reviewer reads and approves the article (Constitution Principle XV — NON-NEGOTIABLE).

- [ ] T050 Human reviewer reads Korean version and confirms educational quality for non-developer audience (RS1 completion check)
- [ ] T051 [P] Human reviewer confirms factual claims are credible, cited, and dated (SR-001, SR-002)
- [ ] T052 Apply reviewer corrections to all three language versions maintaining multilingual parity (CR-005)
- [ ] T053 Record review result: reviewer name, date, gates confirmed, corrections applied — `specs/019-create-replace-multilingual/review-record.md`
- [ ] T054 Update `status: draft` → `status: active` in frontmatter of all three articles once review is approved — `wiki/ko/sdd/index.md`, `wiki/en/sdd/index.md`, `wiki/ja/sdd/index.md`

**Checkpoint**: Human approval documented — ready to publish.

---

## Phase 6: Publication

**Purpose**: Merge article, update wiki navigation, and notify team.

- [X] T060 Update `wiki/index.md` to add entry for Spec-Driven Development article in ko, en, ja
- [X] T061 [P] Update `wiki/log.md` with operation record — format: `## [YYYY-MM-DD HH:MM] ingest | Spec-Driven Development (ko/en/ja)`
- [X] T062 [P] Verify `wiki/ko/SUMMARY.md`, `wiki/en/SUMMARY.md`, `wiki/ja/SUMMARY.md` include the new article in the correct navigation position under AI Development Practices
- [ ] T063 Send Slack notification per CLAUDE.md instructions: operation: ingest, pages: "Spec-Driven Development (ko), Spec-Driven Development (en), Spec-Driven Development (ja)", summary: multilingual SDD article created/updated

---

## Dependencies & Execution Order

### Phase Dependencies

| Phase | Depends On | Can Parallelize |
|-------|-----------|-----------------|
| Phase 1 — Research | None — start immediately | T001, T002, T003 in parallel |
| Phase 2 — Korean Draft | Phase 1 complete | T010–T020 sequential; T021–T022 after T020 |
| Phase 3 — Translations | Phase 2 complete | T030/T031 fully parallel; T032–T037 fully parallel |
| Phase 4 — QA | Phase 3 complete | All T040–T049 fully parallel |
| Phase 5 — Human Review | Phase 4 all gates passed | T050/T051 parallel; T052–T054 sequential |
| Phase 6 — Publication | Phase 5 approved | T060 first; T061/T062/T063 parallel |

### Reader Scenario Coverage

| Reader Scenario | Priority | Key Tasks |
|----------------|---------|-----------|
| RS1 — PM Learns SDD | P1 | T011, T012, T013, T014, T017, T019, T040, T049 |
| RS2 — Beginner Dev Understands Workflow | P2 | T015, T017, T048 |
| RS3 — Vibe Coder Understands Difference | P3 | T016, T034, T035 |

### Parallel Opportunities

- **Phase 1**: T001, T002, T003 can all start immediately in parallel
- **Phase 3**: T030 (en) and T031 (ja) must run in parallel; all T032–T037 in parallel
- **Phase 4**: All 10 gate checks (T040–T049) run in parallel
- **Phase 6**: T061, T062, T063 run in parallel after T060

---

## Definition of Done

A task is complete when:
1. It maps to a named reader scenario (RS1/RS2/RS3) or a named spec requirement (CR/TR/SR).
2. The output file exists at the specified path with correct, complete frontmatter.
3. All internal hyperlinks resolve to real files (no broken links, no stub files for TBD articles).
4. For translation tasks: naturalness has been confirmed, not just literal accuracy; TR-003 locks applied.
5. For quality gate tasks: the result is documented as pass or fail with correction noted if needed.
6. Phase 5 (human review) is approved and recorded before any article is marked `status: active`.
7. Overwrite-in-place was used for any pre-existing article (no backup or parallel file created, per CR-000).

---

## Notes

- `[P]` = independent output file, no shared write dependency — safe to run in parallel
- `[RS#]` label maps directly to reader scenarios in spec.md
- Commit after each phase checkpoint, not after individual tasks
- Never set `status: active` until Phase 5 human review is complete and T053 is recorded
- If Phase 2 (T021) confirms single-page draft is under 3,000 words, skip the split-page sub-task — single-page is the default per CR-004
- Do not create prerequisite article stubs for "What is AI?" or "What is a coding agent?" — mark TBD with inline note only, per spec clarification 2026-05-19
