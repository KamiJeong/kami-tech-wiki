# Data Model: Codex CLI Wiki Documentation

**Date**: 2026-05-15
**Feature**: specs/007-codex-cli-docs

---

## Entities

### WikiPage

A structured markdown document conforming to the `tool-page` template.

| Field | Type | Constraint |
|---|---|---|
| `title` | string | Required; non-empty |
| `tags` | string[] | Required; ≥1 tag; includes "codex-cli" and "openai" |
| `category` | enum | Required; must be `"tool"` for Codex CLI |
| `language` | enum | Required; one of `ko`, `en`, `ja` |
| `date_created` | string (YYYY-MM-DD) | Required |
| `date_modified` | string (YYYY-MM-DD) | Required; updated on every content change |
| `source_count` | integer | Required; `0` (no raw/ files for this ingest) |
| `status` | enum | Required; `"active"` on completion |

**File path pattern**: `wiki/<language>/codex-cli/index.md`

**Required content sections** (in order):
1. Overview
2. Key Features
3. Requirements / Prerequisites
4. Installation
5. Basic Usage
6. Use Cases
7. Limitations
8. References

### LanguageVariant

Each `WikiPage` belongs to exactly one `LanguageVariant`.

| Language | Code | Directory |
|---|---|---|
| Korean | `ko` | `wiki/ko/codex-cli/` |
| English | `en` | `wiki/en/codex-cli/` |
| Japanese | `ja` | `wiki/ja/codex-cli/` |

Invariant: All three variants must have equivalent sections. No variant may be a subset or summary of another.

### IndexEntry

An entry in `wiki/index.md` pointing to a WikiPage.

| Field | Notes |
|---|---|
| Title | Must match the page's `title` frontmatter field |
| Path | Relative path from repo root (e.g., `wiki/ko/codex-cli/index.md`) |
| Language | One of ko / en / ja |
| Description | 1–2 sentence summary of the tool |

### LogEntry

An append-only record in `wiki/log.md`.

| Field | Format | Notes |
|---|---|---|
| Timestamp | `YYYY-MM-DD HH:MM` | UTC |
| Operation | `ingest` | Fixed for this feature |
| Title | `Codex CLI` | Tool name |

**Format**: `## [YYYY-MM-DD HH:MM] ingest | Codex CLI`

---

## State Transitions

WikiPage status lifecycle for this feature:

```
(created) → draft → active
```

All pages begin as `draft` during authoring and transition to `active` upon completion validation.

---

## Validation Rules

1. `source_count` MUST equal the number of files actually read from `raw/` — 0 for this feature.
2. `date_modified` MUST be updated whenever page content changes.
3. All 8 content sections MUST be present with substantive content (no placeholder text).
4. Each `IndexEntry` path MUST resolve to an existing file.
5. `LogEntry` MUST be appended (never prepended or inserted) to preserve append-only invariant.
