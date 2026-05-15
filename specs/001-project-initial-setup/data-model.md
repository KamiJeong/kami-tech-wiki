# Data Model: Personal Tech Wiki

**Phase**: 1 — Design
**Date**: 2026-05-15

---

## Entities

### WikiPage

A LLM-maintained markdown file representing knowledge about one AI tool, concept, or topic.

| Field | Type | Required | Description |
|-------|------|----------|-------------|
| `title` | string | ✅ | Display name of the tool or topic |
| `aliases` | string[] | — | Alternative names for search |
| `tags` | string[] | ✅ | Classification tags (e.g., `ai-tool`, `llm`) |
| `category` | enum | ✅ | `tool` \| `concept` \| `process` \| `reference` |
| `tool` | string | — | Tool name if category=tool (e.g., `Claude`) |
| `language` | enum | ✅ | `ko` \| `en` \| `ja` |
| `date_created` | date | ✅ | ISO 8601 date of first creation |
| `date_modified` | date | ✅ | ISO 8601 date of last update |
| `source_count` | integer | ✅ | Number of raw sources backing this page (≥0) |
| `related` | string[] | — | Wikilinks to related pages |
| `status` | enum | ✅ | `draft` \| `active` \| `deprecated` |

**Path convention**: `wiki/<language>/<tool-slug>/<page-slug>.md`

**Uniqueness rule**: No two pages may have the same `(language, tool, title)` combination.

**State transitions**:
```
draft → active (when source_count ≥ 1 and content reviewed)
active → deprecated (when tool/concept is no longer relevant)
deprecated → active (if tool is revived)
```

---

### RawSource

An immutable input document provided by the user. The LLM reads it but never modifies it.

| Field | Type | Required | Description |
|-------|------|----------|-------------|
| `filename` | string | ✅ | Original filename (slug-safe) |
| `type` | enum | ✅ | `article` \| `paper` \| `note` \| `transcript` |
| `language` | enum | — | Source language if known |
| `date_added` | date | ✅ | When added to `raw/` |

**Path convention**: `raw/<type>/<filename>`

**Immutability rule**: LLM MUST NOT modify files under `raw/`. If a correction is needed, the user replaces the file and re-ingests.

---

### ToolFolder

A named subdirectory within a language folder representing one AI tool or service.

| Field | Type | Required | Description |
|-------|------|----------|-------------|
| `slug` | string | ✅ | URL-safe folder name (e.g., `chatgpt`, `claude`) |
| `display_name` | string | ✅ | Human-readable name (documented in `wiki/index.md`) |
| `languages` | enum[] | ✅ | Languages where this folder exists |

**Mirror rule**: If a ToolFolder exists in `wiki/ko/`, it MUST be created (even if empty) in `wiki/en/` and `wiki/ja/` when translation is requested.

---

### WikiIndex

The content catalog at `wiki/index.md`. Updated on every ingest.

**Structure**:
```markdown
## {Language}

### {Tool}
- [[Page Title]] — one-line summary (updated: YYYY-MM-DD, sources: N)
```

---

### WikiLog

Append-only chronological log at `wiki/log.md`.

**Entry format** (grep-parseable):
```markdown
## [YYYY-MM-DD HH:MM] {operation} | {title}
```

**Operations**: `ingest`, `update`, `query`, `lint`, `translate`

---

### TokenReport

A baseline metrics file stored under `specs/<feature>/token-reports/`.

| Field | Type | Description |
|-------|------|-------------|
| `phase` | string | Workflow phase (`specify`, `plan`, `tasks`, `implement`) |
| `timestamp` | datetime | When the baseline was captured |
| `total_tokens` | integer | Total tokens consumed in the phase |
| `tool_uses` | integer | Number of tool calls made |
| `duration_ms` | integer | Phase duration in milliseconds |

---

## Relationships

```
RawSource ──(ingest)──▶ WikiPage (many RawSources → one or many WikiPages)
WikiPage ──(cross-link)──▶ WikiPage (many-to-many via [[wikilinks]])
WikiPage ──(belongs-to)──▶ ToolFolder (many WikiPages → one ToolFolder)
ToolFolder ──(mirrors)──▶ ToolFolder (across languages)
WikiIndex ──(references)──▶ WikiPage (one Index → all WikiPages)
WikiLog ──(records)──▶ WikiPage operations (append-only)
```

---

## Validation Rules

- `source_count` MUST equal the number of `raw/` entries that were actually used to write or update the page (tracked in the WikiLog entry).
- `date_modified` MUST be updated whenever the LLM modifies a page's content.
- A page with `status: deprecated` MUST NOT appear in `wiki/index.md` active listings.
- `related` links MUST use wikilink format: `["[[Page Title]]"]`.
- ToolFolder slugs MUST be lowercase, hyphen-separated, no special characters.
