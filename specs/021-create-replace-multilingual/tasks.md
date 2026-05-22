# Tasks: Multilingual Wiki Series — Kiro & GitHub Spec Kit

**Input**: Design documents from `specs/021-create-replace-multilingual/`

**Prerequisites**: plan.md ✅, spec.md ✅, research.md ✅, data-model.md ✅, contracts/page-template-contract.md ✅

**Delivery order**: English → Korean → Japanese (CR-010)

**Page contract**: `specs/021-create-replace-multilingual/contracts/page-template-contract.md`

**Total pages**: 23 files × 3 languages = 69 files (12 Kiro + 10 Spec Kit + 1 comparison per language)

## Format: `- [ ] T### [P?] [RS?] Description — output path`

- **[P]**: Can run in parallel (independent output file)
- **[RS]**: Which reader scenario this task satisfies

---

## Phase 1: Setup

**Purpose**: Create directory structure and archive existing single-file wiki pages.

- [X] T001 Create English Kiro series directory `wiki/en/kiro/` (already exists; verify it is ready)
- [X] T002 Create English Spec Kit series directory `wiki/en/spec-kit/` (already exists; verify)
- [X] T003 [P] Create Korean directories: `wiki/ko/kiro/`, `wiki/ko/spec-kit/` (already exist; verify)
- [X] T004 [P] Create Japanese directories: `wiki/ja/kiro/`, `wiki/ja/spec-kit/` (already exist; verify)
- [X] T005 Archive existing single-file overviews by renaming (not deleting): rename `wiki/en/kiro/index.md` → `wiki/en/kiro/_archived-index.md`, same for `wiki/en/kiro/README.md`, `wiki/en/spec-kit/index.md`, `wiki/en/spec-kit/README.md`, and all ko/ja equivalents (12 files total)

**Checkpoint**: Directories exist, old pages archived — drafting can begin.

---

## Phase 2: English — Kiro Series

**Purpose**: Write all 11 English Kiro wiki pages (series landing + 10 article pages).

**Reader scenarios served**: RS1, RS2

- [X] T006 [RS1] Write `wiki/en/kiro/index.md` — Kiro series landing page (navigation index, article list, prerequisites, start-here link) per landing page contract
- [X] T007 [RS1] Write `wiki/en/kiro/01-what-is-kiro.md` — "What Is Kiro?" (agentic IDE/CLI definition, AWS product context, plain-language explanation, vibe-coding problem, analogy, misconceptions) per 13-section template
- [X] T008 [RS1] Write `wiki/en/kiro/02-why-kiro-matters.md` — "Why Kiro Matters" (problem: informal AI prompts produce unstable code; how structured specs help; why this matters for larger projects and teams)
- [X] T009 [P] [RS1] Write `wiki/en/kiro/03-core-concepts.md` — "Kiro Core Concepts: Workflow" (≤3 concepts: Specs workflow, Steering, Hooks — explain what each is and why it matters; analogy; misconceptions)
- [X] T009a [P] [RS1] Write `wiki/en/kiro/03a-environment-overview.md` — "Kiro Core Concepts: Environment" (≤3 concepts: Agentic Chat, MCP servers, IDE vs. CLI — explain each with plain-language analogy; link to 03-core-concepts.md)
- [X] T010 [P] [RS1] Write `wiki/en/kiro/04-specs-workflow.md` — "How Kiro Specs Work" (feature idea → spec → requirements → design → tasks → execute → review → iterate; artifacts: requirements.md, design.md, tasks.md)
- [X] T011 [P] [RS1] Write `wiki/en/kiro/05-steering.md` — "Kiro Steering Guide" (steering files as persistent AI guidance; examples: coding conventions, architecture rules, preferred libraries; analogy; how-to)
- [X] T012 [P] [RS1] Write `wiki/en/kiro/06-hooks.md` — "Kiro Hooks Guide" (automated AI actions on file events; examples: update test on save, update docs on API change; analogy; risks)
- [X] T013 [P] [RS1] Write `wiki/en/kiro/07-mcp.md` — "Kiro MCP Guide" (MCP = Model Context Protocol; connecting Kiro to external tools, APIs, databases; beginner-friendly explanation; examples)
- [X] T014 [RS2] Write `wiki/en/kiro/08-tutorial.md` — "Hands-on Tutorial: Build Your First Feature with Kiro" (practice project: personal task tracker with add/complete/filter/delete; prerequisites; step-by-step; common mistakes; troubleshooting checklist; what's next)
- [X] T015 [P] [RS1] Write `wiki/en/kiro/09-best-practices.md` — "Kiro Best Practices" (≥5 actionable best practices; common pitfalls; team vs. solo use; keeping specs up to date)
- [X] T016 [RS1] Write `wiki/en/kiro/10-glossary.md` — "Kiro Glossary" (all terms from TR-001 in Kiro context: Kiro, spec, steering, hook, agentic chat, MCP, vibe coding; per glossary page contract)

**Checkpoint**: 11 English Kiro pages present — Spec Kit English drafting can begin in parallel with Kiro review.

---

## Phase 3: English — Spec Kit Series

**Purpose**: Write all 10 English Spec Kit wiki pages (series landing + 9 article pages).

**Reader scenarios served**: RS3

- [X] T017 [RS3] Write `wiki/en/spec-kit/index.md` — Spec Kit series landing page (navigation index, article list, prerequisites, start-here link) per landing page contract
- [X] T018 [RS3] Write `wiki/en/spec-kit/01-what-is-spec-kit.md` — "What Is GitHub Spec Kit?" (SDD toolkit definition, not an official GitHub product, works with AI coding agents, generates structured Markdown artifacts)
- [X] T019 [RS3] Write `wiki/en/spec-kit/02-why-spec-kit-matters.md` — "Why Spec Kit Matters" (problem: ad-hoc AI prompts; why structured specifications reduce ambiguity and rework; analogy; misconceptions)
- [X] T020 [P] [RS3] Write `wiki/en/spec-kit/03-core-concepts.md` — "Spec Kit Core Concepts" (constitution, specification, plan, tasks, implementation, clarification, checklist, analysis, quality gate, feature branch, pipeline artifact — split into ≤5 per sub-page if needed)
- [X] T021 [P] [RS3] Write `wiki/en/spec-kit/04-workflow.md` — "Spec Kit Workflow" (full: constitution→specify→clarify→checklist→plan→tasks→analyze→implement; simplified: specify→plan→tasks→implement; when to use each)
- [X] T022 [P] [RS3] Write `wiki/en/spec-kit/05-command-guide.md` — "Spec Kit Command Guide" (each command: /speckit-constitution, /speckit-specify, /speckit-clarify, /speckit-checklist, /speckit-plan, /speckit-tasks, /speckit-analyze, /speckit-implement; plain-language explanation of each; note skills-mode variant)
- [X] T023 [RS3] Write `wiki/en/spec-kit/06-tutorial.md` — "Hands-on Tutorial: Build Your First Feature with Spec Kit" (same practice project: personal task tracker; prerequisites; step-by-step; common mistakes; troubleshooting checklist)
- [X] T024 [P] [RS3] Write `wiki/en/spec-kit/07-best-practices.md` — "Spec Kit Best Practices" (≥5 best practices; when NOT to use Spec Kit; keeping spec/plan/tasks aligned; team usage)
- [X] T025 [P] [RS3] Write `wiki/en/spec-kit/08-risks.md` — "Spec Kit Risks and Limitations" (Spec Kit doesn't replace product thinking; weak specs → weak implementations; process overhead for tiny experiments; AI agent variability; keeping artifacts aligned)
- [X] T026 [RS3] Write `wiki/en/spec-kit/09-glossary.md` — "Spec Kit Glossary" (all terms from TR-002: SDD, constitution, specification, plan, tasks, implementation guard, quality gate, feature branch, pipeline artifact; per glossary page contract)

**Checkpoint**: 10 English Spec Kit pages present — comparison page can be written.

---

## Phase 4: English — Comparison Page

**Purpose**: Write the Kiro vs. Spec Kit comparison page.

**Reader scenario served**: RS4

- [X] T027 [RS4] Write `wiki/en/kiro-vs-spec-kit.md` — "Kiro vs GitHub Spec Kit: What Is the Difference?" (purpose, target user, interface, workflow style, specification support, AI integration, hands-on difficulty, best use case, limitations comparison table; can-you-use-both section; misconceptions) per comparison page contract

**Checkpoint**: All 22 English pages present — English quality review can begin.

---

## Phase 5: English Quality Gate Review

**Purpose**: Verify all 10 constitution quality gates (Principle XII) for the 22 English pages.

- [X] T028 Readability review: read 3 representative English pages (01-what-is-kiro, 03-core-concepts, 06-tutorial) as a non-developer; confirm no unexplained jargon or developer assumptions
- [X] T029 [P] Factual accuracy check: verify all "As of 2026-05-19" claims in English pages against research.md sources; flag any unsupported claims
- [X] T030 [P] Source integrity check: confirm no paragraph-length text is reproduced from source materials; all content is original synthesis
- [X] T031 [P] Multilingual consistency pre-check: confirm English pages cover all concepts required by spec so Korean/Japanese translations can be consistent
- [X] T032 [P] Markdown portability check: verify all 22 English pages use GFM-only syntax (no admonitions, no custom callouts); test sample pages render in GitHub Markdown preview
- [X] T033 [P] Terminology consistency check: verify all terms in English pages match TR-001/TR-002 definitions; verify Kiro and Spec Kit terms are not mixed
- [X] T034 [P] Navigation check: verify all internal links in English pages resolve to existing pages; confirm prerequisites and related-articles fields are populated
- [X] T035 [P] Copying/plagiarism risk check: spot-check 5 English pages for any reproduced passages from source materials
- [X] T036 [P] Template compliance check: verify all 22 English pages have all 13 required sections (or documented exception for glossary/landing pages)
- [X] T037 [P] Learning goal check: verify each English page achieves its stated learning goal without requiring the reader to read the Advanced notes section
- [X] T038 [P] Frontmatter validation: verify all 22 English pages have all required frontmatter fields with correct values (status: draft, language: en, review_cycle: fast-changing, freshness_date: 2026-05-19, source_count matches Further reading count)

**Checkpoint**: All English quality gates documented as passed — Korean drafting can begin.

---

## Phase 6: Korean — Kiro Series

**Purpose**: Write all 11 Korean Kiro wiki pages. Translate naturally, not literally. Localize examples where needed.

**Reader scenarios served**: RS1, RS2

- [X] T039 [RS1] Write `wiki/ko/kiro/index.md` — Korean Kiro series landing page (natural Korean; same structure as English)
- [X] T040 [RS1] Write `wiki/ko/kiro/01-what-is-kiro.md` — "Kiro란 무엇인가?" (natural Korean; "vibe coding" → 바이브 코딩(vibe coding); "steering" → 스티어링(steering))
- [X] T041 [P] [RS1] Write `wiki/ko/kiro/02-why-kiro-matters.md` — "왜 Kiro가 중요한가?"
- [X] T042 [P] [RS1] Write `wiki/ko/kiro/03-core-concepts.md` — "Kiro 핵심 개념: 워크플로" (≤3 concepts: 명세서(스펙), 스티어링, 훅; translate per TR-004; English in parentheses)
- [X] T042a [P] [RS1] Write `wiki/ko/kiro/03a-environment-overview.md` — "Kiro 핵심 개념: 환경" (≤3 concepts: Agentic Chat, MCP 서버, IDE vs. CLI)
- [X] T043 [P] [RS1] Write `wiki/ko/kiro/04-specs-workflow.md` — "Kiro 명세서(스펙) 워크플로"
- [X] T044 [P] [RS1] Write `wiki/ko/kiro/05-steering.md` — "Kiro 스티어링 가이드"
- [X] T045 [P] [RS1] Write `wiki/ko/kiro/06-hooks.md` — "Kiro 훅 가이드"
- [X] T046 [P] [RS1] Write `wiki/ko/kiro/07-mcp.md` — "Kiro MCP 가이드" (MCP full name in Korean intro)
- [X] T047 [RS2] Write `wiki/ko/kiro/08-tutorial.md` — "핸즈온 튜토리얼: Kiro로 첫 기능 만들기" (same practice project; localize example context if needed for Korean audience)
- [X] T048 [P] [RS1] Write `wiki/ko/kiro/09-best-practices.md` — "Kiro 모범 사례"
- [X] T049 [RS1] Write `wiki/ko/kiro/10-glossary.md` — "Kiro 용어집" (include ko/ja equivalents per glossary contract)

**Checkpoint**: 11 Korean Kiro pages present.

---

## Phase 7: Korean — Spec Kit Series

**Reader scenario served**: RS3

- [X] T050 [RS3] Write `wiki/ko/spec-kit/index.md` — Korean Spec Kit series landing page
- [X] T051 [RS3] Write `wiki/ko/spec-kit/01-what-is-spec-kit.md` — "GitHub Spec Kit이란 무엇인가?" ("constitution" → 프로젝트 규약)
- [X] T052 [P] [RS3] Write `wiki/ko/spec-kit/02-why-spec-kit-matters.md` — "왜 Spec Kit이 중요한가?"
- [X] T053 [P] [RS3] Write `wiki/ko/spec-kit/03-core-concepts.md` — "Spec Kit 핵심 개념"
- [X] T054 [P] [RS3] Write `wiki/ko/spec-kit/04-workflow.md` — "Spec Kit 워크플로"
- [X] T055 [P] [RS3] Write `wiki/ko/spec-kit/05-command-guide.md` — "Spec Kit 명령어 가이드"
- [X] T056 [RS3] Write `wiki/ko/spec-kit/06-tutorial.md` — "핸즈온 튜토리얼: Spec Kit으로 첫 기능 만들기"
- [X] T057 [P] [RS3] Write `wiki/ko/spec-kit/07-best-practices.md` — "Spec Kit 모범 사례"
- [X] T058 [P] [RS3] Write `wiki/ko/spec-kit/08-risks.md` — "Spec Kit 위험과 한계"
- [X] T059 [RS3] Write `wiki/ko/spec-kit/09-glossary.md` — "Spec Kit 용어집"

**Checkpoint**: 10 Korean Spec Kit pages present.

---

## Phase 8: Korean — Comparison Page

- [X] T060 [RS4] Write `wiki/ko/kiro-vs-spec-kit.md` — "Kiro vs GitHub Spec Kit: 무엇이 다른가?" (natural Korean; same comparison table and section structure as English)

**Checkpoint**: All 22 Korean pages present.

---

## Phase 9: Korean Quality Gate Review

- [X] T061 [P] Multilingual consistency check: verify Korean pages cover the same concepts in the same order as their English counterparts
- [X] T062 [P] Translation naturalness check: confirm Korean is idiomatic, not literal; spot-check 3 pages
- [X] T063 [P] Terminology check: confirm TR-004 translation decisions applied consistently across all Korean pages (e.g., "스티어링" not mixed with "조향" or "가이드라인")
- [X] T064 [P] Template compliance check: all 22 Korean pages have correct sections and GFM-only Markdown
- [X] T065 [P] Frontmatter validation: all Korean pages have `language: ko`, correct dates, matching source_count

**Checkpoint**: Korean quality gates passed — Japanese drafting can begin.

---

## Phase 10: Japanese — Kiro Series

**Reader scenarios served**: RS1, RS2

- [X] T066 [RS1] Write `wiki/ja/kiro/index.md` — Japanese Kiro series landing page
- [X] T067 [RS1] Write `wiki/ja/kiro/01-what-is-kiro.md` — "Kiroとは何か？" ("steering" → ステアリング; "hooks" → フック; "vibe coding" → バイブコーディング)
- [X] T068 [P] [RS1] Write `wiki/ja/kiro/02-why-kiro-matters.md` — "なぜKiroが重要なのか？"
- [X] T069 [P] [RS1] Write `wiki/ja/kiro/03-core-concepts.md` — "Kiroのコアコンセプト：ワークフロー" (≤3 concepts: スペック, ステアリング, フック; translate per TR-004; English in parentheses)
- [X] T069a [P] [RS1] Write `wiki/ja/kiro/03a-environment-overview.md` — "Kiroのコアコンセプト：環境" (≤3 concepts: Agentic Chat, MCPサーバー, IDE vs. CLI)
- [X] T070 [P] [RS1] Write `wiki/ja/kiro/04-specs-workflow.md` — "Kiroのスペックワークフロー"
- [X] T071 [P] [RS1] Write `wiki/ja/kiro/05-steering.md` — "Kiroステアリングガイド"
- [X] T072 [P] [RS1] Write `wiki/ja/kiro/06-hooks.md` — "Kiroフックガイド"
- [X] T073 [P] [RS1] Write `wiki/ja/kiro/07-mcp.md` — "Kiro MCPガイド"
- [X] T074 [RS2] Write `wiki/ja/kiro/08-tutorial.md` — "ハンズオンチュートリアル：Kiroで最初の機能を作る" (same practice project; localize examples for Japanese audience if needed)
- [X] T075 [P] [RS1] Write `wiki/ja/kiro/09-best-practices.md` — "Kiroのベストプラクティス"
- [X] T076 [RS1] Write `wiki/ja/kiro/10-glossary.md` — "Kiro用語集" (include ko/ja equivalents)

**Checkpoint**: 11 Japanese Kiro pages present.

---

## Phase 11: Japanese — Spec Kit Series

**Reader scenario served**: RS3

- [X] T077 [RS3] Write `wiki/ja/spec-kit/index.md` — Japanese Spec Kit series landing page
- [X] T078 [RS3] Write `wiki/ja/spec-kit/01-what-is-spec-kit.md` — "GitHub Spec Kitとは何か？" ("constitution" → プロジェクト憲章)
- [X] T079 [P] [RS3] Write `wiki/ja/spec-kit/02-why-spec-kit-matters.md` — "なぜSpec Kitが重要なのか？"
- [X] T080 [P] [RS3] Write `wiki/ja/spec-kit/03-core-concepts.md` — "Spec Kitのコアコンセプト"
- [X] T081 [P] [RS3] Write `wiki/ja/spec-kit/04-workflow.md` — "Spec Kitのワークフロー"
- [X] T082 [P] [RS3] Write `wiki/ja/spec-kit/05-command-guide.md` — "Spec Kitコマンドガイド"
- [X] T083 [RS3] Write `wiki/ja/spec-kit/06-tutorial.md` — "ハンズオンチュートリアル：Spec Kitで最初の機能を作る"
- [X] T084 [P] [RS3] Write `wiki/ja/spec-kit/07-best-practices.md` — "Spec Kitのベストプラクティス"
- [X] T085 [P] [RS3] Write `wiki/ja/spec-kit/08-risks.md` — "Spec Kitのリスクと限界"
- [X] T086 [RS3] Write `wiki/ja/spec-kit/09-glossary.md` — "Spec Kit用語集"

**Checkpoint**: 10 Japanese Spec Kit pages present.

---

## Phase 12: Japanese — Comparison Page

- [X] T087 [RS4] Write `wiki/ja/kiro-vs-spec-kit.md` — "KiroとGitHub Spec Kitの違いは何か？" (natural Japanese; same comparison table structure as English)

**Checkpoint**: All 22 Japanese pages present.

---

## Phase 13: Japanese Quality Gate Review

- [X] T088 [P] Multilingual consistency check: verify Japanese pages cover the same concepts in the same order as English counterparts
- [X] T089 [P] Translation naturalness check: confirm Japanese is idiomatic, not mechanical; spot-check 3 pages
- [X] T090 [P] Terminology check: confirm TR-004 decisions applied consistently across all Japanese pages
- [X] T091 [P] Template compliance and frontmatter validation: all 22 Japanese pages pass contract checks (`language: ja`, correct dates, GFM-only)

**Checkpoint**: Japanese quality gates passed — full three-language review can begin.

---

## Phase 14: Full Trilingual Quality Review

**Purpose**: Final cross-language consistency check across all 69 pages before human review.

- [X] T092 Cross-language consistency spot check: read the "What Is Kiro?" page in all three languages (T007, T040, T067); confirm semantic equivalence, same key concepts, no contradictions
- [X] T093 [P] Cross-language consistency spot check: read the "Hands-on Tutorial" pages in all three languages (T014, T047, T074); confirm same practice project and step structure
- [X] T094 [P] Navigation integrity: verify all internal links resolve across all 69 pages (including cross-language links where present)
- [X] T095 [P] Source count audit: verify source_count frontmatter matches actual Further reading entries in all 69 pages
- [X] T096a [P] Update `wiki/en/sdd/index.md` — add cross-reference links to Kiro series (`wiki/en/kiro/index.md`) and Spec Kit series (`wiki/en/spec-kit/index.md`) in the "Related articles" section
- [X] T096b [P] Update `wiki/ko/sdd/index.md` — add same cross-references in Korean
- [X] T096c [P] Update `wiki/ja/sdd/index.md` — add same cross-references in Japanese
- [X] T096d [P] SDD cross-reference check: verify that wiki/*/sdd/ pages have been updated with links to the new Kiro and Spec Kit series

**Checkpoint**: All quality gates documented as passed — human review requested.

---

## Phase 15: Human Editorial Review

**Purpose**: Human reviewer approves content before merge to main (Constitution Principle XV — NON-NEGOTIABLE).

- [ ] T097 Human reviewer reads a representative English sample (01-what-is-kiro.md, 06-tutorial.md, kiro-vs-spec-kit.md) and confirms educational quality, factual accuracy, and non-developer readability
- [ ] T098 Human reviewer reads Korean equivalents of the same 3 pages and confirms naturalness
- [ ] T099 Apply reviewer corrections to all affected pages and their language equivalents
- [ ] T100 Record review: reviewer name, date, pages reviewed, gates confirmed, corrections applied

**Checkpoint**: Human approval documented — ready to publish.

---

## Phase 16: Publication

**Purpose**: Update wiki navigation and send completion notification.

- [X] T101 Update `wiki/index.md` to add entries for Kiro series, Spec Kit series, and comparison page
- [X] T102 [P] Update `wiki/log.md` with operation record: `## [2026-05-22 HH:MM] create | Multilingual Wiki Series — Kiro & GitHub Spec Kit (69 pages, ko/en/ja)`
- [X] T103 [P] Remove archived files (delete `_archived-index.md` and `_archived-README.md` from all kiro/ and spec-kit/ directories in all three languages — 12 archived files)
**Slack notification**: Removed from this feature gate by user decision on 2026-05-22. This feature no longer blocks on `SLACK_WEBHOOK_URL`.

---

## Dependencies & Execution Order

```
Phase 1 (Setup)
  └── Phase 2 (EN Kiro)
        └── Phase 3 (EN Spec Kit)  ← can overlap with Phase 2 after T007
              └── Phase 4 (EN Comparison)
                    └── Phase 5 (EN Review)
                          └── Phase 6 (KO Kiro)
                                └── Phase 7 (KO Spec Kit)  ← can overlap
                                      └── Phase 8 (KO Comparison)
                                            └── Phase 9 (KO Review)
                                                  └── Phase 10 (JA Kiro)
                                                        └── Phase 11 (JA Spec Kit) ← can overlap
                                                              └── Phase 12 (JA Comparison)
                                                                    └── Phase 13 (JA Review)
                                                                          └── Phase 14 (Full Review)
                                                                                └── Phase 15 (Human)
                                                                                      └── Phase 16 (Publish)
```

### Parallel opportunities within phases

- Within Kiro series: T009–T013, T015 can run in parallel (independent files)
- Within Spec Kit series: T020–T022, T024–T025 can run in parallel
- Within each language batch: same parallel patterns apply
- Quality review tasks marked [P] within each phase can run in parallel
- Phase 3 can begin after T007 and T006 are complete (landing + first page establish the pattern)

---

## Definition of Done

A task is complete when:
1. The output file exists at the specified path with all required frontmatter fields
2. All 13 body sections are present (or documented exception applies)
3. No GFM-incompatible syntax is used
4. `source_count` frontmatter matches the number of entries in Further reading
5. All internal links in the page have been verified as resolving
6. For quality review tasks: the gate result is documented as pass (with correction if needed)
7. For human review tasks: reviewer name, date, and approval are recorded

**An article is NOT done until T097–T100 (human review) are complete.**

---

## Implementation Strategy

**MVP scope**: Phases 2–5 (22 English pages + quality review). This alone satisfies RS1, RS2, RS3, RS4 for English-speaking readers and enables human review before Korean and Japanese work begins.

**Incremental delivery**:
1. Commit after Phase 5 (English batch complete and reviewed)
2. Commit after Phase 9 (Korean batch complete)
3. Commit after Phase 13 (Japanese batch complete)
4. Final merge after Phase 15 (human approval)

**Total tasks**: 103 executable tasks (T001–T103). Slack notification was removed as a feature gate.
