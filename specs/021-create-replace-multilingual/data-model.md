# Data Model: Wiki Page Schema

**Date**: 2026-05-19
**Branch**: `021-create-replace-multilingual`

---

## Entity: WikiPage

Every output file in this feature is an instance of the `WikiPage` entity.

### Frontmatter fields

| Field | Type | Allowed values | Required | Notes |
|-------|------|---------------|----------|-------|
| `title` | string | Any | ✅ | Human-readable page title |
| `aliases` | string[] | Any | ✅ | Alternative names for search/linking |
| `tags` | string[] | kebab-case tags | ✅ | At least 2 tags |
| `category` | enum | `tool`, `concept`, `process`, `reference` | ✅ | |
| `tool` | string | `"Kiro"`, `"Spec-Kit"` | ✅ for series pages | Omit for comparison page |
| `language` | enum | `ko`, `en`, `ja` | ✅ | |
| `date_created` | string | ISO 8601 `YYYY-MM-DD` | ✅ | Set at creation time |
| `date_modified` | string | ISO 8601 `YYYY-MM-DD` | ✅ | Update on every edit |
| `source_count` | integer | ≥ 0 | ✅ | Number of verifiable sources cited |
| `related` | string[] | Page titles | ✅ | At least 1 related page |
| `status` | enum | `draft`, `active`, `deprecated` | ✅ | Start as `draft`; set to `active` after review |
| `review_cycle` | enum | `stable`, `periodic`, `fast-changing` | ✅ | Both series: `fast-changing` |
| `freshness_date` | string | ISO 8601 `YYYY-MM-DD` | ✅ for fast-changing | Date of last factual verification |

### Body sections (standard 13-section template)

| # | Section heading | Format | Required | Notes |
|---|----------------|--------|----------|-------|
| 1 | (title as H1) | `# Title` | ✅ | Matches frontmatter title |
| 2 | One-sentence summary | Blockquote `> text` | ✅ | Plain language, ≤ 30 words |
| 3 | Who this page is for | Paragraph | ✅ | Name the specific reader type |
| 4 | Why this matters | Paragraph | ✅ | Non-hype framing; explain practical relevance |
| 5 | Plain-language explanation | Paragraphs | ✅ | No jargon; introduce terms before using them |
| 6 | Key concepts | Definition list or sub-sections | ✅ | ≤ 5 concepts per page (Principle XI) |
| 7 | Example or analogy | Blockquote or callout | ✅ | Real-world scenario, non-developer relatable |
| 8 | Practical applications | Paragraphs or list | ✅ | Tutorial pages: full step-by-step guide here |
| 9 | Common misconceptions | Numbered or bulleted list | ✅ | ≥ 2 misconceptions per page |
| 10 | Related terms | Linked list | ✅ | Links to other wiki pages |
| 11 | Further reading | Cited sources list | ✅ | ≥ 1 verifiable source with URL and date |
| 12 | Language notes | Only when translation decision applies | Conditional | See TR-004; use ISO 8601 date for freshness |
| 13 | Advanced notes | Clearly marked optional section | Optional | Do not mix with beginner content above |

### Exception: Glossary pages

Kiro p10 and Spec Kit p09 use a glossary format instead of the 13-section template:

```markdown
---
[frontmatter as above, category: reference]
---

# [Tool] Glossary

## [Term A]
**Definition**: [Plain-language definition]
**Also known as**: [Alternatives]
**Used in**: [Links to pages where term appears]
**Language notes**: [ko/ja equivalents if applicable]

## [Term B]
...
```

Exception documented in spec (CR-004 extension).

### Exception: Landing pages (index.md)

Each tool directory has an `index.md` that acts as a series navigation page:

```markdown
---
[frontmatter, category: reference]
---

# [Tool] — Article Series

> [One-sentence description of the series]

## Articles in this series

| # | Article | What you'll learn |
|---|---------|------------------|
| 01 | [link] | [brief] |
...

## Prerequisites

...

## Start here

→ [Link to first article]
```

---

## Entity: TranslationParity

Represents the parity constraint between three language versions of the same page.

| Field | Rule |
|-------|------|
| Page identity | Korean, English, Japanese versions of the same page share the same filename (e.g., `03-core-concepts.md`) |
| Section count | All three versions must have the same number of sections |
| Concept count | All three versions must cover the same key concepts in the same order |
| Example equivalence | Examples may be localized (different scenario) if the original doesn't resonate cross-culturally, but must teach the same concept |
| Terminology | Foreign terms retain English in parentheses on first use; local transliteration follows |
| Source parity | Source count may differ if locale-specific sources are added, but English sources are acceptable in all versions |

---

## Entity: SeriesNavigation

Each series has an ordered sequence of pages with defined navigation links.

### Kiro series (wiki/{lang}/kiro/)

```
index.md → 01-what-is-kiro.md → 02-why-kiro-matters.md → 03-core-concepts.md
→ 04-specs-workflow.md → 05-steering.md → 06-hooks.md → 07-mcp.md
→ 08-tutorial.md → 09-best-practices.md → 10-glossary.md
```

Each page links to: previous page | next page | series index | comparison page

### Spec Kit series (wiki/{lang}/spec-kit/)

```
index.md → 01-what-is-spec-kit.md → 02-why-spec-kit-matters.md
→ 03-core-concepts.md → 04-workflow.md → 05-command-guide.md
→ 06-tutorial.md → 07-best-practices.md → 08-risks.md → 09-glossary.md
```

Each page links to: previous page | next page | series index | comparison page

### Cross-series links

The comparison page (`kiro-vs-spec-kit.md`) is linked from the last section of both series' index pages and from each tool's p01 (overview) page.

---

## File naming conventions

| Pattern | Example | Rule |
|---------|---------|------|
| Series pages | `01-what-is-kiro.md` | Two-digit prefix, kebab-case title |
| Index/landing | `index.md` | Always `index.md` |
| Comparison | `kiro-vs-spec-kit.md` | Placed at `wiki/{lang}/kiro-vs-spec-kit.md` |
| Language dirs | `wiki/ko/`, `wiki/en/`, `wiki/ja/` | ISO 639-1 codes |
| Tool dirs | `wiki/{lang}/kiro/`, `wiki/{lang}/spec-kit/` | kebab-case tool name |

All filenames: lowercase, hyphens only, `.md` extension, no spaces.
