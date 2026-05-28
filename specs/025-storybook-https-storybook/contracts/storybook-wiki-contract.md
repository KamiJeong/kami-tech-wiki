# Storybook Wiki Contract

## Required Files

| File | Requirement |
|------|-------------|
| `wiki/ko/storybook/README.md` | Section landing page with frontmatter and link to the overview |
| `wiki/ko/storybook/index.md` | Main Korean Storybook overview article |
| `wiki/index.md` | Add Korean Storybook catalog entry |
| `wiki/ko/SUMMARY.md` | Add Storybook navigation section |
| `wiki/log.md` | Append a dated update entry |

## Frontmatter Requirements

Each new wiki page MUST include:

```yaml
---
title: ""
tags: []
category: tool
language: ko
date_created: 2026-05-28
date_modified: 2026-05-28
source_count: 0
status: draft
---
```

Additional allowed fields:

- `aliases`
- `tool`
- `related`
- `review_cycle`
- `freshness_date`

`source_count` MUST equal the number of cited external source links used for product claims in that page.

## Main Article Section Requirements

`wiki/ko/storybook/index.md` MUST include sections that satisfy:

1. What Storybook is.
2. Who the page is for.
3. Why Storybook matters.
4. Plain-language explanation and analogy.
5. Storybook and design systems.
6. Major Storybook capabilities.
7. Storybook MCP explanation and toolsets.
8. Three-case AI Native Development comparison.
9. Claude Code/Codex CLI reasoning process comparison.
10. Heuristic token-consumption comparison.
11. Adoption cases and non-adoption cases.
12. Common misconceptions.
13. Related terms.
14. Further reading / source links.

## Source Rules

- Storybook claims MUST cite official Storybook docs or blog pages.
- Figma claims MUST cite official Figma pages or help docs.
- Claude Code claims MUST cite Anthropic docs.
- Codex CLI claims MUST cite OpenAI Help or OpenAI GitHub sources.
- Do not rely on community commentary for product facts.
- Avoid long verbatim source quotations; synthesize in Korean.

## Token Estimate Rules

Token estimates MUST:

- Be labeled as heuristic estimates.
- Include assumptions.
- Use ranges or relative bands.
- Avoid stating that a given tool will always use a fixed number of tokens.

## Navigation Rules

- Add a `## Storybook` section to `wiki/ko/SUMMARY.md` unless one already exists.
- Add Storybook to the Korean section of `wiki/index.md`.
- Use existing GitBook summary bullet style.

## Validation Rules

Run or manually verify:

- New Markdown files have required frontmatter.
- Internal links resolve.
- `wiki/ko/SUMMARY.md` references existing files.
- `wiki/index.md` includes the Storybook entry.
- `wiki/log.md` has a new append-only entry.
- No file under `raw/` was modified.

## Notification Rules

After wiki update completion, run:

```bash
SLACK_WEBHOOK_URL="$SLACK_WEBHOOK_URL" bun run .wiki/scripts/notify-slack.ts \
  --operation ingest \
  --pages "Storybook 개요" \
  --summary "Storybook, 디자인 시스템, Storybook MCP, Figma 기반 AI 개발 워크플로우 비교 문서를 추가했습니다."
```

If `SLACK_WEBHOOK_URL` is missing, record that the notification could not be sent.
