---

description: "Task list template for wiki content creation and publication"
---

# Tasks: [FEATURE NAME]

**Input**: Design documents from `/specs/[###-feature-name]/`

**Prerequisites**: plan.md (required), spec.md (required for reader scenarios), research.md

**Organization**: Tasks follow the wiki editorial workflow — Research → Draft (ko) → Draft (en/ja) →
Review → QA → Publish. Each phase produces an independently reviewable artifact.

## Format: `[ID] [P?] [RS?] Description — output path`

- **[P]**: Can run in parallel (no shared output file)
- **[RS]**: Which reader scenario this task satisfies (e.g., RS1, RS2)
- Include exact file paths in descriptions

## Path Conventions

- Korean article: `wiki/ko/<category>/<article-slug>.md`
- English article: `wiki/en/<category>/<article-slug>.md`
- Japanese article: `wiki/ja/<category>/<article-slug>.md`
- Glossary entries: `wiki/glossary/<term-slug>.md`
- Source summary: `wiki/ko/<category>/<article-slug>-source.md` (and en/ja equivalents)

<!--
  ============================================================================
  IMPORTANT: The tasks below are SAMPLE TASKS for illustration purposes only.

  The /speckit-tasks command MUST replace these with actual tasks based on:
  - Reader scenarios from spec.md (with their priorities P1, P2, P3...)
  - Content requirements from plan.md
  - Research sources from research.md

  Tasks MUST be organized by editorial phase so each phase can be:
  - Completed independently
  - Reviewed independently
  - Committed as an MVP increment (e.g., Korean draft before translation)

  DO NOT keep these sample tasks in the generated tasks.md file.
  ============================================================================
-->

---

## Phase 1: Research and Terminology

**Purpose**: Gather sources, verify facts, and resolve terminology before any drafting begins.

**⚠️ CRITICAL**: No drafting can begin until this phase is complete and reviewed.

- [ ] T001 Gather and verify primary sources for all factual claims — `specs/[###]/research.md`
- [ ] T002 [P] Identify and document key claims that require citation (Principle II)
- [ ] T003 [P] Check glossary for existing terms: `wiki/glossary/`
- [ ] T004 Add new terms to multilingual glossary (if any) — `wiki/glossary/<term>.md`
- [ ] T005 Confirm translation decisions for untranslatable terms (Principle IV)

**Checkpoint**: Sources verified, terminology locked — drafting can begin.

---

## Phase 2: Korean Draft (Primary Language)

**Purpose**: Write the Korean version as the primary editorial draft (Principle IV).

**Reader scenario**: [RS1 — primary learning goal]

- [ ] T010 [RS1] Write article structure outline (13 sections per Principle VIII) — draft notes
- [ ] T011 [RS1] Draft sections 1–5 (Summary → Plain-language explanation) — `wiki/ko/[category]/[slug].md`
- [ ] T012 [RS1] Draft sections 6–9 (Key concepts → Common misconceptions) — `wiki/ko/[category]/[slug].md`
- [ ] T013 [RS1] Draft sections 10–13 (Related terms → Advanced notes) — `wiki/ko/[category]/[slug].md`
- [ ] T014 [RS1] Add at least one analogy or real-world example (Principle X)
- [ ] T015 [RS1] Add frontmatter (title, tags, category, language, date_created, date_modified, source_count, status, review_cycle)
- [ ] T016 Add internal links to prerequisite and related articles (Principle VII)

**Checkpoint**: Korean draft complete and self-consistent — translation can begin in parallel.

---

## Phase 3: English and Japanese Translation

**Purpose**: Produce natural, idiomatic translations from the approved Korean draft (Principle IV).

- [ ] T020 [P] [RS1] Translate article to English — `wiki/en/[category]/[slug].md`
- [ ] T021 [P] [RS1] Translate article to Japanese — `wiki/ja/[category]/[slug].md`
- [ ] T022 [P] Update English frontmatter (language: en, date fields)
- [ ] T023 [P] Update Japanese frontmatter (language: ja, date fields)
- [ ] T024 [P] Verify translation naturalness: English idioms and analogies localized
- [ ] T025 [P] Verify translation naturalness: Japanese idioms and analogies localized
- [ ] T026 Add translation notes for any term that required localization (Principle IV, XII)

**Checkpoint**: All three language versions present — quality review can begin.

---

## Phase 4: Quality Gate Review

**Purpose**: Verify all 10 quality gates from Constitution Principle XII before publication.

- [ ] T030 Readability check: non-developer reads article without external help
- [ ] T031 [P] Factual accuracy check: all major claims verified against sources in research.md
- [ ] T032 [P] Source integrity check: no copied paragraphs; all synthesis is original
- [ ] T033 [P] Multilingual consistency check: ko/en/ja convey same meaning and structure
- [ ] T034 [P] Markdown portability check: renders correctly in GitBook, GitHub, Obsidian
- [ ] T035 [P] Terminology consistency check: all terms match glossary
- [ ] T036 [P] Navigation check: all internal links resolve; prerequisites declared
- [ ] T037 [P] Copying/plagiarism risk check: no paragraph-length reproduction of source
- [ ] T038 [P] Template compliance check: all 13 sections present or exception documented
- [ ] T039 [P] Learning goal check: article achieves stated goal without advanced section

**Checkpoint**: All 10 gates documented as passed — human review requested.

---

## Phase 5: Human Editorial Review

**Purpose**: Human reviewer reads and approves the article (Constitution Principle XV — NON-NEGOTIABLE).

- [ ] T040 Human reviewer reads Korean version and confirms educational quality
- [ ] T041 [P] Human reviewer confirms factual claims are credible and well-cited
- [ ] T042 Apply reviewer corrections to all three language versions
- [ ] T043 Record review: reviewer name, date, gates confirmed, corrections made

**Checkpoint**: Human approval documented — ready to publish.

---

## Phase 6: Publication

**Purpose**: Merge article and update wiki navigation.

- [ ] T050 Update `wiki/index.md` to include new article entry
- [ ] T051 [P] Update `wiki/log.md` with operation record (format: `## [YYYY-MM-DD HH:MM] ingest | [title]`)
- [ ] T052 [P] Verify SUMMARY.md updated for GitBook navigation (ko/en/ja)
- [ ] T053 Send Slack notification per CLAUDE.md instructions

---

## Dependencies & Execution Order

### Phase Dependencies

- **Phase 1 (Research)**: No dependencies — start immediately. BLOCKS all drafting.
- **Phase 2 (Korean Draft)**: Depends on Phase 1 completion.
- **Phase 3 (Translations)**: Depends on Phase 2 completion. en and ja MUST run in parallel.
- **Phase 4 (QA)**: Depends on Phase 3 completion. All gate checks MUST run in parallel.
- **Phase 5 (Human Review)**: Depends on Phase 4 — ALL gates must pass first.
- **Phase 6 (Publication)**: Depends on Phase 5 — human approval required.

### Parallel Opportunities

- All Phase 1 source-gathering tasks marked [P] can run in parallel.
- Phase 3 English and Japanese translation can run fully in parallel.
- All Phase 4 quality gate checks marked [P] can run in parallel.
- Phase 6 index/log updates marked [P] can run in parallel.

---

## Definition of Done

A task is complete when:
1. It maps to a reader scenario or a required quality gate.
2. The output file exists at the specified path with correct frontmatter.
3. Internal links are verified as resolving.
4. For translation tasks: naturalness has been reviewed, not just literal accuracy.
5. For review tasks: the gate result is documented (pass/fail/correction needed).
6. A human has reviewed and approved Phase 5 tasks before the article is marked done.

---

## Notes

- [P] tasks = independent output paths, no shared file dependency
- [RS] label maps task to the reader scenario it satisfies
- Always commit after each phase checkpoint, not after individual tasks
- Never mark an article `[X]` complete until Phase 5 (human review) is finished
- Avoid: drafting before research is verified; translating before the Korean draft is stable
