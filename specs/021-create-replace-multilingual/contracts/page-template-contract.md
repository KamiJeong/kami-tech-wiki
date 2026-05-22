# Page Template Contract: Multilingual Wiki Series

**Date**: 2026-05-19
**Branch**: `021-create-replace-multilingual`

This contract defines the exact structure every wiki page in this series must follow. It is the implementation target for `/speckit-tasks` and `/speckit-implement`.

---

## Standard Series Page Contract

### Frontmatter (GFM YAML block)

```yaml
---
title: "[Page Title]"
aliases: ["[Alias 1]", "[Alias 2]"]
tags: [kiro, tool, concept, beginner]    # ≥ 2 tags; always include tool name
category: tool                            # or: concept, reference, process
tool: "Kiro"                             # or "Spec-Kit"; omit for comparison page
language: en                             # ko | en | ja
date_created: YYYY-MM-DD
date_modified: YYYY-MM-DD
source_count: N                          # integer; matches number of cited sources
related: ["[Related Page Title]"]
status: draft                            # start draft; set active after review
review_cycle: fast-changing
freshness_date: YYYY-MM-DD              # date of last factual verification
---
```

### Body sections (in order)

```markdown
# [Page Title]

> [One-sentence summary — ≤ 30 words, plain language, no jargon]

## Who this page is for

[1-2 sentences naming the specific reader. E.g., "This page is for product managers and
non-developers who want to understand what Kiro is and whether it is relevant to their work.
No technical background required."]

## Why this matters

[1-3 paragraphs explaining practical relevance without hype. Explain the problem this
topic helps solve. Do not use superlatives or unverified claims.]

## Plain-language explanation

[Main educational content. Introduce each new term before using it. No unexplained jargon.
Write as if explaining to a smart friend who doesn't code.]

## Key concepts

[Cover ≤ 5 core concepts. Use sub-sections (###) or a definition list. Each concept:
name, plain definition, why it matters, one concrete example.]

### [Concept Name]

[Definition in plain language]

**Why it matters**: [...]

**Example**: [...]

## Example or analogy

> [A real-world analogy that makes the concept tangible for a non-developer. Use an
> everyday scenario (cooking, construction, project management) as the comparison.]

[Follow up the analogy with a 1-2 sentence connection back to the tech concept.]

## Practical applications

[How to actually use this in practice. For overview pages: 2-3 scenarios.
For tutorial pages: full numbered step-by-step guide with expected outputs at each step,
a troubleshooting checklist at the end, and a "what's next" suggestion.]

## Common misconceptions

1. **[Misconception 1]** — [Correction in plain language]
2. **[Misconception 2]** — [Correction in plain language]
[Minimum 2 misconceptions. Maximum 5.]

## Related terms

- [Term 1](../path/to/page.md) — [One-line description]
- [Term 2](../path/to/page.md) — [One-line description]

## Further reading

- [Source title](URL) — [One-line description, dated: YYYY-MM-DD]
[Minimum 1 source. Prefer official documentation. All URLs must be accessible.]

## Language notes

[Only include if this page introduces terms with non-obvious translations. Format:]

| English term | Korean | Japanese | Translation note |
|---|---|---|---|
| steering | 스티어링 (steering) | ステアリング | "AI에게 주는 지속적 가이드라인" — persistent guidance given to AI |

[Omit this section entirely if no translation decisions are needed.]

## Advanced notes

> **For advanced readers only** — you do not need to read this section to understand [topic].

[Optional. Use only for content that would confuse or overwhelm the primary audience.
Keep under 200 words. Link to deeper resources rather than expanding inline.]
```

---

## Glossary Page Contract (exception to standard template)

Applies to: Kiro p10, Spec Kit p09.

```markdown
---
title: "[Tool] Glossary"
aliases: ["[Tool] terms", "[Tool] terminology"]
tags: [kiro, glossary, reference]
category: reference
tool: "Kiro"
language: en
date_created: YYYY-MM-DD
date_modified: YYYY-MM-DD
source_count: 0
related: ["[Tool] Overview"]
status: draft
review_cycle: fast-changing
freshness_date: YYYY-MM-DD
---

# [Tool] Glossary

> Quick reference for terms used across the [Tool] article series.

## How to use this glossary

[1-2 sentences explaining this is a reference, not reading material. Each term links back
to the article where it is introduced in context.]

---

## [Term A]

**Definition**: [Plain-language definition in ≤ 2 sentences]

**Also known as**: [Alternatives, if any]

**Used in**: [Link to the article that introduces this term in context]

**Korean**: [Korean equivalent or transliteration]
**Japanese**: [Japanese equivalent or transliteration]

---

## [Term B]

[Same structure]
```

---

## Landing Page Contract (index.md)

Applies to: `wiki/{lang}/kiro/index.md`, `wiki/{lang}/spec-kit/index.md`.

```markdown
---
title: "[Tool] — Article Series"
aliases: ["[Tool] wiki", "[Tool] documentation"]
tags: [kiro, series, index]
category: reference
tool: "Kiro"
language: en
date_created: YYYY-MM-DD
date_modified: YYYY-MM-DD
source_count: 0
related: ["Kiro vs Spec-Kit", "Spec-Driven Development (SDD)"]
status: draft
review_cycle: fast-changing
freshness_date: YYYY-MM-DD
---

# [Tool] — Article Series

> [1-sentence description of the series and its audience.]

## Articles in this series

| # | Article | What you'll learn |
|---|---------|------------------|
| 01 | [What Is Kiro?](01-what-is-kiro.md) | [brief learning goal] |
| 02 | [Why Kiro Matters](02-why-kiro-matters.md) | [brief learning goal] |
...

## Prerequisites

Before reading this series, it helps to know:
- [Prerequisite concept] — [link]

## Start here

→ **[01. What Is Kiro?](01-what-is-kiro.md)** — Start with this article if you're new to Kiro.

## Related series

- [Spec-Driven Development (SDD)](../sdd/index.md)
- [Kiro vs GitHub Spec Kit](../kiro-vs-spec-kit.md)
```

---

## Comparison Page Contract (kiro-vs-spec-kit.md)

```markdown
---
title: "Kiro vs GitHub Spec Kit: What Is the Difference?"
aliases: ["Kiro vs Spec Kit", "Kiro or Spec Kit"]
tags: [kiro, spec-kit, comparison, tool]
category: concept
language: en
date_created: YYYY-MM-DD
date_modified: YYYY-MM-DD
source_count: N
related: ["Kiro", "Spec-Kit", "Spec-Driven Development (SDD)"]
status: draft
review_cycle: fast-changing
freshness_date: YYYY-MM-DD
---

# Kiro vs GitHub Spec Kit: What Is the Difference?

> [One-sentence summary]

## Who this page is for

[...]

## Why this comparison matters

[...]

## Quick comparison

| Dimension | Kiro | GitHub Spec Kit |
|---|---|---|
| Main purpose | [...] | [...] |
| Target user | [...] | [...] |
| Interface | [...] | [...] |
| Workflow style | [...] | [...] |
| Specification support | [...] | [...] |
| AI agent integration | [...] | [...] |
| Hands-on difficulty | [...] | [...] |
| Best use case | [...] | [...] |
| Limitations | [...] | [...] |

## Detailed comparison

### Purpose
[...]

### Interface
[...]

### Workflow
[...]

### AI integration
[...]

## Can you use both?

[...]

## Common misconceptions

1. [...]
2. [...]

## Related terms

[...]

## Further reading

[...]
```

---

## Validation rules

A page PASSES the contract if:
1. All required frontmatter fields are present and use allowed values
2. All 13 sections appear in the correct order (or documented exception applies)
3. One-sentence summary is ≤ 30 words
4. Key concepts section covers ≤ 5 concepts
5. Common misconceptions has ≥ 2 entries
6. Further reading has ≥ 1 cited source with URL
7. No GFM-incompatible syntax (no admonitions, no custom callouts)
8. `source_count` in frontmatter matches the number of items in Further reading

A page FAILS if any required section is missing, any section is empty, or implementation details (frameworks, code, algorithms) appear in sections 1-8.
