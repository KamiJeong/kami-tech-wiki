# Data Model: SDD Wiki — Spec-Driven Development, Kiro, and Spec-Kit

**Feature**: `009-sdd-wiki-spec-kit`
**Phase**: 1 — Design
**Date**: 2026-05-18

---

## Entity: Wiki Article

A wiki article is the primary deliverable of this feature. Each article is a markdown file under `wiki/<language>/<topic>/index.md`.

### Fields

| Field | Type | Required | Valid Values | Notes |
|-------|------|----------|-------------|-------|
| `title` | string | YES | Non-empty | Display name of the article |
| `aliases` | string[] | YES | Any | Alternative names; may be empty array |
| `tags` | string[] | YES | Non-empty | At minimum one tag identifying the topic |
| `category` | enum | YES | `concept`, `tool` | `concept` for SDD; `tool` for Kiro and Spec-Kit |
| `tool` | string | conditional | Non-empty | Required when `category: tool`; omit for `concept` |
| `language` | enum | YES | `ko`, `en`, `ja` | Must match the `wiki/<language>/` directory |
| `date_created` | date | YES | `YYYY-MM-DD` | Creation date; never change after first write |
| `date_modified` | date | YES | `YYYY-MM-DD` | Update on every content change |
| `source_count` | integer | YES | `>= 0` | Count of internal files consulted; 0 if only public sources |
| `related` | string[] | YES | Any | Wikilinks to related pages; may be empty array |
| `status` | enum | YES | `draft`, `active`, `deprecated` | All new pages start as `active` at delivery |

### Validation Rules

- `category: concept` pages MUST use the `concept-page.md` template structure.
- `category: tool` pages MUST use the `tool-page.md` template structure AND include the `tool:` field.
- `language` value MUST match the directory the file lives in: `wiki/ko/` → `ko`, `wiki/en/` → `en`, `wiki/ja/` → `ja`.
- `date_created` is immutable after first write.
- `date_modified` MUST be updated whenever body content changes.
- `source_count` MUST equal the actual count of consulted internal files (not raw/ files, which are not accessed for these topics).
- `status` MUST be `active` (not `draft`) for all articles delivered in this feature.

---

## Entity: Topic

A topic groups one article per language. Three topics are created in this feature.

| Topic ID | slug | category | source_count | Description |
|----------|------|----------|-------------|-------------|
| T-001 | `sdd` | `concept` | 0 | Spec-Driven Development methodology |
| T-002 | `kiro` | `tool` | 0 | AWS Kiro AI-powered IDE |
| T-003 | `spec-kit` | `tool` | 8 | Spec-Kit workflow toolchain for Claude Code |

---

## Entity: Language Variant

Each topic produces three language variants. Total: 9 Wiki Article instances.

| Topic | ko path | en path | ja path |
|-------|---------|---------|---------|
| SDD | `wiki/ko/sdd/index.md` | `wiki/en/sdd/index.md` | `wiki/ja/sdd/index.md` |
| Kiro | `wiki/ko/kiro/index.md` | `wiki/en/kiro/index.md` | `wiki/ja/kiro/index.md` |
| Spec-Kit | `wiki/ko/spec-kit/index.md` | `wiki/en/spec-kit/index.md` | `wiki/ja/spec-kit/index.md` |

Plus 9 README.md category landing pages (one per language × topic combination):

| Topic | ko README | en README | ja README |
|-------|-----------|-----------|-----------|
| SDD | `wiki/ko/sdd/README.md` | `wiki/en/sdd/README.md` | `wiki/ja/sdd/README.md` |
| Kiro | `wiki/ko/kiro/README.md` | `wiki/en/kiro/README.md` | `wiki/ja/kiro/README.md` |
| Spec-Kit | `wiki/ko/spec-kit/README.md` | `wiki/en/spec-kit/README.md` | `wiki/ja/spec-kit/README.md` |

---

## Entity: Index Entry

An entry in `wiki/index.md` that registers a new article in the catalog.

### Fields

| Field | Format | Example |
|-------|--------|---------|
| wikilink | `[[Page Title]]` | `[[Spec-Driven Development (SDD)]]` |
| summary | one-line string | `AI 시대의 명세 중심 개발 방법론` |
| updated | `YYYY-MM-DD` | `2026-05-18` |
| sources | integer | `0` |

### Pattern (from index-entry.md template)

```
- [[{{Page Title}}]] — {{summary}} (updated: {{YYYY-MM-DD}}, sources: {{N}})
```

---

## Entity: SUMMARY.md Entry

A GitBook navigation entry in `wiki/<language>/SUMMARY.md`.

### Fields

| Field | Format | Example |
|-------|--------|---------|
| section header | `## Topic Name` | `## SDD (Spec-Driven Development)` |
| README link | `* [label](topic/README.md)` | `* [SDD 개요](sdd/README.md)` |
| index link | `* [label](topic/index.md)` | `* [Spec-Driven Development](sdd/index.md)` |

---

## Entity: Log Entry

A timestamped entry in `wiki/log.md`.

### Format

```
## [YYYY-MM-DD HH:MM] ingest | {title}
```

### State Transition

`log.md` is append-only. Entries are never removed or modified.

---

## Content Structure: SDD Concept Page

Required sections per concept-page.md template + FR-003:

1. Front-matter (all mandatory fields)
2. Lead paragraph — full name "Spec-Driven Development (SDD)" on first use
3. 개요 / Overview / 概要 — background, why SDD exists
4. 핵심 원리 / Core Principles / コア原則 — spec-first, living specifications, iterative refinement
5. 실제 적용 예시 / Example Application / 実際の適用例
6. 관련 개념 비교 / Methodology Comparison — 4-row table: SDD vs BDD, TDD, ad-hoc
7. 연결된 도구 / Connected Tools — wikilinks to Kiro and Spec-Kit pages
8. 참고 링크 / References

---

## Content Structure: Kiro Tool Page

Required sections per tool-page.md template + FR-006:

1. Front-matter (all mandatory fields including `tool: "Kiro"`)
2. Staleness callout blockquote at the very top (before any other content)
3. 핵심 개념 / Core Concepts / コアコンセプト — steering files, spec documents, agent tasks, autopilot
4. 사용 시나리오 / Use Cases — when to use / when not to use table
5. 빠른 시작 / Quick Start — at least one concrete usage example (SC-007)
6. 통합 & 연결 / Integration — SDD relationship, wikilink to SDD page
7. 주의사항 & 한계 / Limitations — known constraints, version caveat
8. 참고 링크 / References

---

## Content Structure: Spec-Kit Tool Page

Required sections per tool-page.md template + FR-009:

1. Front-matter (all mandatory fields including `tool: "Spec-Kit"`, `source_count: 8`)
2. 핵심 개념 / Core Concepts — pipeline stages overview
3. 사용 시나리오 / Use Cases — when to use / when not to use table
4. 빠른 시작 / Quick Start — `/speckit-specify` command demonstration (SC-007)
5. Pipeline stage detail — `specify → clarify → plan → tasks → implement → verify`
6. Extension hooks system overview
7. 통합 & 연결 / Integration — SDD relationship, wikilink to SDD page
8. 주의사항 & 한계 / Limitations
9. 참고 링크 / References
