# Implementation Plan: Spec-Driven Development Multilingual Wiki

**Branch**: `019-create-replace-multilingual` | **Date**: 2026-05-19 | **Spec**: [spec.md](spec.md)

**Input**: Feature specification from `specs/019-create-replace-multilingual/spec.md`

## Summary

Create or replace three language versions (Korean, English, Japanese) of a comprehensive conceptual article on Spec-Driven Development (SDD). Existing articles at `wiki/ko/sdd/index.md`, `wiki/en/sdd/index.md`, and `wiki/ja/sdd/index.md` will be overwritten in place. Each article must satisfy all 22 required sections, include a plain-language analogy, a "Common misconceptions" section, and a structured SDD vs TDD/BDD/vibe coding comparison table. The primary audience is non-developers and beginner developers. All three language versions must achieve multilingual parity in structure, section order, terminology, and learning goals.

---

## Technical Context

**Language/Version**: Markdown (plain portable Markdown per Constitution Principle V)

**Primary Dependencies**: None — content-only deliverable; no external libraries or toolchains required

**Storage**: File system only — `wiki/ko/sdd/index.md`, `wiki/en/sdd/index.md`, `wiki/ja/sdd/index.md`

**Testing**: Manual review against the 22-section checklist, word count check (split threshold at 3,000 words per language), and multilingual parity spot-check

**Target Platform**: GitBook (rendered Markdown); must avoid platform-specific extensions

**Project Type**: Knowledge wiki article set (content creation)

**Performance Goals**: N/A — static content

**Constraints**:
- Single-page default; split into up to 7 sub-pages only if draft exceeds 3,000 words per language
- No article prose in this plan (Constitution Principle XIV)
- No backup files; overwrite existing articles in place (CR-000)

**Scale/Scope**: 3 language files; target 1,500–2,800 words per language on first draft

---

## Constitution Check

*GATE: All gates must pass before implementation proceeds.*

| Principle | Gate question | Pass? |
|-----------|---------------|-------|
| I. Audience-First | Target reader is explicitly non-developer (PM, startup founder, beginner dev) — defined in spec §Content Overview and all three Reader Scenarios | ✅ |
| II. Accuracy | SR-001 requires ≥2 verifiable sources for TDD/BDD claims; SR-002 requires knowledge-cutoff dating for AI agent capability claims | ✅ |
| III. Original Synthesis | Spec contains no article prose; all article content will be original synthesis, not copied from sources (SR-003) | ✅ |
| IV. Multilingual Parity | All three languages (ko, en, ja) are in scope; CR-005 mandates equivalent structure, section order, terminology decisions, and learning goals | ✅ |
| V. Portable Markdown | Articles will use standard Markdown only — no platform-specific extensions | ✅ |
| VI. Progressive Depth | Spec requires beginner-accessible main content plus a technical comparison table for developers familiar with TDD/BDD (Reader Scenarios 1–3) | ✅ |
| VII. IA & Navigation | Prerequisites identified (TBD, no stubs); related articles identified with paths; parent section declared (AI Development Practices) | ✅ |
| VIII. Article Template | All 22 required sections enumerated in this plan; standard frontmatter fields defined | ✅ |
| IX. Terminology | TR-001 new terms listed; TR-002 existing glossary terms listed; TR-003 translation decisions locked for all three target languages | ✅ |
| XII. Quality Gates | Review tasks included in implementation phases below | ✅ |
| XIII. Maintenance | `review_cycle: periodic` (every 6 months) declared in spec §Content Overview | ✅ |
| XIV. Separation | This plan contains no article prose | ✅ |
| XV. Human Review | Human review task included as a final gate before merge | ✅ |

---

## 22 Required Article Sections

The following 22 sections must appear in every language version, in this order:

1. Frontmatter (YAML)
2. Title (H1)
3. Lead summary / one-sentence definition (blockquote)
4. Overview
5. Plain-language analogy for non-developers
6. What is an AI coding agent? (inline definition — edge case coverage)
7. The SDD workflow — six stages (Constitution → Specify → Plan → Tasks → Implement → Review)
8. What is a specification? (명세서 / 仕様書 inline definition)
9. What is a constitution in SDD? (원칙 문서 / 原則文書 inline definition)
10. Comparison table: SDD vs TDD vs BDD vs Vibe Coding
11. When to use SDD
12. When not to use SDD
13. Common misconceptions
14. Plain-language practical example (non-developer-friendly scenario)
15. What is vibe coding? (바이브 코딩 / バイブコーディング inline definition + contrast)
16. Benefits of SDD
17. Risks and limitations
18. Glossary of key terms
19. Related articles (inline hyperlinks in prose, per CR-005a)
20. Sources / references (with dates per SR-002)
21. Frontmatter field: `review_cycle: periodic`
22. Last reviewed date (in frontmatter `date_modified`)

---

## Project Structure

### Documentation (this feature)

```text
specs/019-create-replace-multilingual/
├── plan.md                  # This file
├── spec.md                  # Feature specification
├── version-guard-report.md  # Pre-existing; no action needed
├── checklists/
│   └── requirements.md      # Pre-existing quality checklist
└── tasks.md                 # Phase 2 output (/speckit-tasks — NOT created by /speckit-plan)
```

### Output Files (wiki articles — overwrite in place)

```text
wiki/
├── ko/
│   └── sdd/
│       └── index.md         # Korean SDD article — OVERWRITE existing file
├── en/
│   └── sdd/
│       └── index.md         # English SDD article — OVERWRITE existing file
└── ja/
    └── sdd/
        └── index.md         # Japanese SDD article — OVERWRITE existing file
```

No new directories are needed. No backup files will be created (CR-000).

---

## Implementation Strategy

### Phase 0 — Research (non-destructive; no file modifications)

**Goal**: Gather verifiable sources for TDD/BDD definitions and AI coding agent capability claims before writing begins.

**Sources to locate and record**:

1. TDD definition — Kent Beck, *Test-Driven Development: By Example* (Addison-Wesley, 2002); also testable via Wikipedia citation or Martin Fowler's bliki (martinfowler.com/bliki/TestDrivenDevelopment.html)
2. BDD definition — Dan North's original BDD article (dannorth.net); also JBehave documentation or Cucumber documentation (cucumber.io/docs/bdd/)
3. AI coding agent capabilities — Anthropic Claude Code documentation (docs.anthropic.com/claude-code); GitHub Copilot documentation; both dated with knowledge cutoff 2025-08

Source format to embed in articles (SR-002 compliance):
- Pattern: `[Source Title](URL) — description (YYYY-MM-DD or "as of YYYY-MM")`

**Deliverable**: Source list recorded in tasks.md for reference during writing; no separate research.md file required for a content-only feature.

**Verification**: ≥2 verifiable TDD/BDD sources confirmed before writing the comparison section.

---

### Phase 1 — English Article (canonical language; written first)

**Goal**: Draft `wiki/en/sdd/index.md` covering all 22 sections, targeting 1,500–2,800 words.

**Approach**:
- Write English first as the canonical version; Korean and Japanese will adapt from it with natural translation (not literal).
- Overwrite the existing file in place. The existing article has 4 sections; the replacement will expand to all 22 required sections.
- Frontmatter: update `date_modified` to 2026-05-19; set `source_count` to the actual number of `raw/` files referenced (expected: 0, since sources are external URLs); set `status: active`.

**Word count check**: After draft, count words. If >3,000, apply CR-004 split into up to 7 sub-pages. Sub-page structure if needed:
- `01-what-is-sdd.md`
- `02-why-sdd-matters.md`
- `03-sdd-workflow.md`
- `04-sdd-vs-tdd-bdd-vibe-coding.md`
- `05-practical-example.md`
- `06-risks-limitations-best-practices.md`
- `07-glossary.md`

**Verification**: Section count = 22; word count checked; no prose from sources copied verbatim.

---

### Phase 2 — Korean Article

**Goal**: Draft `wiki/ko/sdd/index.md` — natural Korean adaptation of the English canonical article.

**Translation decisions (locked per TR-003)**:
- "vibe coding" → 바이브 코딩 (first use: inline definition required)
- "specification" → 명세서 (use consistently; never 명세 alone)
- "constitution" (SDD context) → 원칙 문서 (use consistently)
- SDD stage names: use English stage names as-is in parentheses following the Korean label, e.g., "명세 작성 (Specify)"

**Parity check**: Same 22 sections in the same order; same number of analogies; same comparison table columns; same TDD/BDD source citations.

**Verification**: Section-by-section parity table against English version confirmed; locked terminology applied consistently.

---

### Phase 3 — Japanese Article

**Goal**: Draft `wiki/ja/sdd/index.md` — natural Japanese adaptation of the English canonical article.

**Translation decisions (locked per TR-003)**:
- "vibe coding" → バイブコーディング (first use: inline definition required)
- "specification" → 仕様書 (use consistently; never 仕様 alone)
- "constitution" (SDD context) → 原則文書 (use consistently)
- SDD stage names: use English stage names as-is in parentheses following the Japanese label

**Parity check**: Same 22 sections in the same order; same number of analogies; same comparison table columns; same TDD/BDD source citations.

**Verification**: Section-by-section parity table against English version confirmed; locked terminology applied consistently.

---

### Phase 4 — Quality Gate Review

**Goal**: Verify all three articles meet acceptance criteria before marking complete.

**Review checklist (to be run per article)**:

- [ ] All 22 sections present and in spec-mandated order
- [ ] Plain-language analogy present and not developer-centric (CR-002)
- [ ] "Common misconceptions" section present with ≥2 misconceptions (CR-003)
- [ ] Six SDD stages listed with one-sentence descriptions each (Reader Scenario 2)
- [ ] "When to use" and "When not to use" sections present as distinct content blocks (Reader Scenario 2 Acceptance 2)
- [ ] Vibe coding defined inline on first use (TR-003)
- [ ] Specification / 명세서 / 仕様書 defined inline on first use (TR-003)
- [ ] Constitution (SDD) / 원칙 문서 / 原則文書 defined inline on first use (TR-003)
- [ ] ≥2 verifiable TDD/BDD sources cited with dates (SR-001, SR-002)
- [ ] AI coding agent capabilities claim dated with knowledge cutoff (SR-002)
- [ ] AI coding agent defined in plain language for non-developer readers (Edge Case 1)
- [ ] TDD full name given on first use in each language (CHK035)
- [ ] BDD full name given on first use in each language (CHK035)
- [ ] Cross-references to related articles rendered as inline hyperlinks, not a separate "See Also" block (CR-005a)
- [ ] TBD prerequisite articles marked TBD; no stubs created
- [ ] Frontmatter complete: all required fields present, `status: active`, `review_cycle: periodic`, `date_modified: 2026-05-19`
- [ ] Word count ≤3,000 (single-page) OR split applied with ≤7 sub-pages (CR-004)
- [ ] No article prose copied verbatim from sources (SR-003)
- [ ] No backup files created (CR-000)
- [ ] All three language versions have parity in section count, section order, example count, and analogy type (CR-005)

**Human review gate**: A human reviewer must approve all three articles before the branch is merged to main (Constitution Principle XV).

---

## Frontmatter Template (all three versions)

```yaml
---
title: "Spec-Driven Development (SDD)"
aliases: [language-specific aliases]
tags: [sdd, spec-driven-development, concept, methodology, ai-development]
category: concept
language: ko | en | ja
date_created: 2026-05-18
date_modified: 2026-05-19
source_count: 0
review_cycle: periodic
related: ["Kiro", "Spec-Kit", "Claude Code"]
status: active
---
```

`source_count` = 0 because all sources are external URLs, not files in `raw/`. If any `raw/` files are referenced during drafting, update accordingly.

---

## Terminology Reference (locked)

| Term | English | Korean (ko) | Japanese (ja) |
|------|---------|-------------|---------------|
| Spec-Driven Development | Spec-Driven Development (SDD) | Spec-Driven Development (SDD) | Spec-Driven Development (SDD) |
| specification | specification | 명세서 | 仕様書 |
| constitution (SDD context) | constitution | 원칙 문서 | 原則文書 |
| vibe coding | vibe coding | 바이브 코딩 | バイブコーディング |
| AI coding agent | AI coding agent | AI 코딩 에이전트 | AIコーディングエージェント |
| pipeline | pipeline | 파이프라인 | パイプライン |
| Test-Driven Development | TDD (Test-Driven Development) | TDD (테스트 주도 개발, Test-Driven Development) | TDD (テスト駆動開発, Test-Driven Development) |
| Behavior-Driven Development | BDD (Behavior-Driven Development) | BDD (행동 주도 개발, Behavior-Driven Development) | BDD (振る舞い駆動開発, Behavior-Driven Development) |

---

## Complexity Tracking

No constitution violations. All decisions are within standard wiki article scope.

| Decision | Rationale |
|----------|-----------|
| English written first as canonical | Reduces translation error; ensures consistent structure before localization |
| Single-page default until word count confirmed | CR-004 requires drafting first, splitting only if threshold exceeded |
| No separate research.md created | Content-only feature with external URLs; no raw data file to preserve |
| No glossary file update in this feature | TR-001 terms will be defined inline in each article; a separate glossary-file update task is out of scope for this feature and should be tracked separately |
