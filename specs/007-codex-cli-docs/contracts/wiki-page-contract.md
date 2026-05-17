# Wiki Page Contract: tool-page

**Contract Type**: Document structure contract (internal wiki)
**Applies to**: All Codex CLI wiki pages (`wiki/*/codex-cli/index.md`)
**Template**: `.wiki/templates/tool-page.md`

---

## Frontmatter Schema

Every wiki page MUST begin with this YAML frontmatter block:

```yaml
---
title: ""           # Non-empty string; human-readable page title
tags: []            # Array of strings; must include "codex-cli" and "openai"
category: tool      # Fixed value for AI tool pages
language: ko|en|ja  # Must match the directory locale
date_created: YYYY-MM-DD
date_modified: YYYY-MM-DD
source_count: 0     # Integer; 0 for this ingest (no raw/ files)
status: active      # "active" upon completion; "draft" during authoring
---
```

**Validation**: A page fails contract if any required field is missing, null, or contains a placeholder value.

---

## Required Section Headings

Sections MUST appear in this order with these exact heading levels:

| # | Heading | Level | Notes |
|---|---------|-------|-------|
| 1 | Overview | H2 | What the tool is; 2–4 sentences |
| 2 | Key Features | H2 | Bullet list; 5–10 items |
| 3 | Requirements | H2 | Table: requirement + value |
| 4 | Installation | H2 | Code block with install commands |
| 5 | Basic Usage | H2 | Code blocks + prose explanation |
| 6 | Use Cases | H2 | Numbered list or subsections |
| 7 | Limitations | H2 | Table or bullet list |
| 8 | References | H2 | External links; 3+ items |

**Validation**: A page fails contract if any section is missing or contains only placeholder/template text.

---

## Language-Specific Requirements

| Language | Code | Natural language standard |
|---|---|---|
| Korean | `ko` | Standard written Korean (존댓말); technical terms may use English in parentheses |
| English | `en` | Standard written English; technical terms as-is |
| Japanese | `ja` | Standard written Japanese (丁寧語); technical terms may use katakana or English |

---

## Cross-Language Invariant

All three language variants MUST:
- Cover the same 8 sections
- Reference the same version of the tool (0.130.0 as of 2026-05-15)
- Have equivalent depth (no variant is a summary of another)
- Be independently navigable (no cross-language links required)
