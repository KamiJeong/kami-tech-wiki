# Contract: Wiki Article Front-Matter Schema

**Feature**: `009-sdd-wiki-spec-kit`
**Contract Type**: Content Schema
**Version**: 1.0
**Date**: 2026-05-18

---

## Purpose

This contract defines the mandatory YAML front-matter schema that every wiki article delivered in this feature MUST satisfy. It is the authoritative interface between article authors (human or AI) and the GitBook rendering layer, the wiki catalog (`wiki/index.md`), and any future front-matter validation tooling.

---

## Schema (YAML)

```yaml
---
title: string          # REQUIRED. Non-empty display name.
aliases: string[]      # REQUIRED. May be empty [].
tags: string[]         # REQUIRED. At least one non-empty tag.
category: enum         # REQUIRED. One of: "concept" | "tool"
tool: string           # CONDITIONAL. Required when category == "tool". Omit for "concept".
language: enum         # REQUIRED. One of: "ko" | "en" | "ja"
date_created: date     # REQUIRED. ISO 8601 date (YYYY-MM-DD). Immutable after first write.
date_modified: date    # REQUIRED. ISO 8601 date (YYYY-MM-DD). Update on every content change.
source_count: integer  # REQUIRED. >= 0. Count of internal project files consulted.
related: string[]      # REQUIRED. May be empty []. Wikilink strings to related pages.
status: enum           # REQUIRED. One of: "draft" | "active" | "deprecated"
---
```

---

## Field Contracts

### `title`

- Type: string
- Constraint: non-empty, UTF-8
- Example: `"Spec-Driven Development (SDD)"`
- Violation: empty string, null, or absent

### `category`

- Allowed values: `concept`, `tool`
- Binding rule: determines which template section structure applies
  - `concept` → must follow `concept-page.md` section order
  - `tool` → must follow `tool-page.md` section order AND carry `tool:` field

### `language`

- Allowed values: `ko`, `en`, `ja`
- Directory binding:
  - `ko` → file must be under `wiki/ko/`
  - `en` → file must be under `wiki/en/`
  - `ja` → file must be under `wiki/ja/`
- Violation: language value does not match the enclosing directory

### `source_count`

- Type: non-negative integer
- Semantics: count of internal project files (`.claude/skills/`, `.specify/`, etc.) consulted during authoring
- Does NOT count `raw/` directory files (none exist for these topics)
- Does NOT count external URLs
- Specific values for this feature:
  - SDD pages: `0`
  - Kiro pages: `0`
  - Spec-Kit pages: `8`

### `status`

- All articles delivered in this feature MUST have `status: active`
- `draft` is acceptable only during in-progress authoring; must be changed to `active` before the feature is marked complete

---

## Per-Article Specifications

### SDD Concept Pages (3 pages)

| Field | ko | en | ja |
|-------|----|----|----|
| category | `concept` | `concept` | `concept` |
| language | `ko` | `en` | `ja` |
| source_count | `0` | `0` | `0` |
| tags | `[sdd, spec-driven-development, concept, methodology]` | same | same |
| status | `active` | `active` | `active` |

### Kiro Tool Pages (3 pages)

| Field | ko | en | ja |
|-------|----|----|----|
| category | `tool` | `tool` | `tool` |
| tool | `"Kiro"` | `"Kiro"` | `"Kiro"` |
| language | `ko` | `en` | `ja` |
| source_count | `0` | `0` | `0` |
| tags | `[kiro, aws, ai-ide, tool]` | same | same |
| status | `active` | `active` | `active` |

### Spec-Kit Tool Pages (3 pages)

| Field | ko | en | ja |
|-------|----|----|----|
| category | `tool` | `tool` | `tool` |
| tool | `"Spec-Kit"` | `"Spec-Kit"` | `"Spec-Kit"` |
| language | `ko` | `en` | `ja` |
| source_count | `8` | `8` | `8` |
| tags | `[spec-kit, claude-code, sdd, workflow, tool]` | same | same |
| status | `active` | `active` | `active` |

---

## Verification

The `speckit-verify-run` gate MUST check:

1. All 9 `index.md` files exist
2. All mandatory fields are present and non-empty
3. `language` matches the enclosing directory
4. `category` is one of `concept`, `tool`
5. `source_count` matches the values specified in this contract
6. `status` is `active` for all delivered articles
