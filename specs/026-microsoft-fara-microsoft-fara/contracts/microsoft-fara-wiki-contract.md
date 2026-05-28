# Contract: Microsoft Fara Korean Wiki Overview

## Required Outputs

Implementation must create or update these content and governance surfaces for the feature:

| Path | Requirement |
|------|-------------|
| `wiki/ko/microsoft-fara/README.md` | Short Korean section page for Microsoft Fara |
| `wiki/ko/microsoft-fara/index.md` | Full Korean overview article |
| `wiki/glossary/microsoft-fara.md` | Multilingual terminology record for Microsoft Fara terms introduced by the article |
| `wiki/index.md` | Add or update catalog entry |
| `wiki/ko/SUMMARY.md` | Add Korean navigation entry |
| `wiki/log.md` | Append a timestamped work log entry |
| `specs/026-microsoft-fara-microsoft-fara/review-gates.md` | Evidence record for every Constitution Principle XII quality gate |

Optional local visuals may be added only under `wiki/ko/microsoft-fara/assets/`.

## Frontmatter Contract

Both wiki pages must include repository-required frontmatter:

```yaml
---
title: ""
tags: []
category: tool
language: ko
date_created: YYYY-MM-DD
date_modified: YYYY-MM-DD
source_count: 0
status: draft
review_cycle: fast-changing
---
```

`status` may become `active` only if the implementation and review state supports it. `source_count` must remain `0` because this feature uses official web sources and no `raw/` files.

Because this issue is Korean-only under a documented Principle IV override, the article pages must remain `draft` unless a human reviewer records approval of the override or English/Japanese parity has been implemented.

## Source Contract

Every major factual claim must map to an official source reference with:

| Field | Required |
|-------|----------|
| Source title | Yes |
| Owner | Yes |
| URL | Yes |
| Publication date, release date, or access date | Yes |
| Claim role | Yes |

Implementation must prioritize official Microsoft, Microsoft Research, GitHub, arXiv, Microsoft Foundry, and Hugging Face model-card sources. Secondary sources cannot replace official-source verification.

## Terminology And Glossary Contract

Implementation must inspect existing wiki terminology surfaces before drafting final wording. Missing Microsoft Fara terms must be added to `wiki/glossary/microsoft-fara.md` with:

| Field | Required |
|-------|----------|
| Preferred term | Yes |
| Alternatives or abbreviations | Yes |
| Korean rendering | Yes |
| English term | Yes |
| Japanese equivalent or pending marker | Yes |
| Plain-language definition | Yes |
| Usage note | Yes |
| Related article link | Yes when available |

The article must use the glossary's preferred Korean renderings for computer-use agent, trajectory, verifier, critical point, and research preview.

## Visual Contract

At least two visuals or linked visual references are required. Each must include:

| Field | Required |
|-------|----------|
| Alt text | Yes |
| Caption | Yes |
| Source owner | Yes |
| URL or local path | Yes |
| Access date or created date | Yes |
| Rights or reuse decision | Yes |

Copied binary images are forbidden unless the source license or owner terms make reuse defensible. Safer alternatives are remote official references, text links to source visuals, local captured screenshots with provenance, or original diagrams.

## Content Boundary Contract

Implementation must:
- Explain Microsoft Fara as computer-use-agent research, not as a generic chatbot or ordinary Copilot feature.
- Explain Fara-7B and Fara1.5 relationship based on current official sources.
- Cover screenshots or visual perception, coordinate actions, multi-step trajectories, and browser or software interaction.
- Include practical pilot guidance and high-risk caution areas.
- Include common misconceptions.
- Avoid unsupported production-readiness claims.
- Keep the Korean-only scope exception visible in review evidence and avoid claiming full multilingual parity.

Implementation must not:
- Modify `raw/`.
- Count web sources in `source_count`.
- Hardcode `SLACK_WEBHOOK_URL`.
- Copy article prose from source materials.
- Commit unclear-rights binary images.

## Navigation Contract

`wiki/index.md` and `wiki/ko/SUMMARY.md` updates must use relative links and point to existing files after implementation. The entry placement should match the Korean AI tools area and existing wiki organization.

## Log Contract

`wiki/log.md` must be appended with the project format:

```markdown
## [YYYY-MM-DD HH:MM] {operation} | {title}
```

The entry should summarize the Microsoft Fara wiki update and list the affected pages. Existing log entries must not be rewritten.

## Slack Contract

After wiki updates:

1. If `SLACK_WEBHOOK_URL` is present, run `.wiki/scripts/notify-slack.ts` through the project command style with operation, pages, and summary.
2. If `SLACK_WEBHOOK_URL` is absent, skip Slack notification without failing the implementation.
3. Never store or print the webhook value.

## Review Gate Contract

Implementation or review must create `specs/026-microsoft-fara-microsoft-fara/review-gates.md` before final review readiness. The file must list each Constitution Principle XII gate with status, evidence, and notes:

1. Readability
2. Factual accuracy
3. Source integrity
4. Multilingual consistency or documented Principle IV override
5. Markdown portability
6. Terminology consistency
7. Navigation
8. Copying/plagiarism risk
9. Template compliance
10. Learning goal

The record must also state that AI has not self-approved the human review gate.

## Human Review Contract

If any Microsoft Fara page changes from `draft` to `active`, or if a PR asks to treat the topic as publication-ready, `specs/026-microsoft-fara-microsoft-fara/review-report.md` or `review-gates.md` must record the human reviewer name, review date, and decision. AI agents must not fill the human reviewer field with themselves.

## Validation Contract

The implementation is not ready for review until these checks pass:

- `wiki/ko/microsoft-fara/README.md` exists.
- `wiki/ko/microsoft-fara/index.md` exists.
- Both pages have complete frontmatter and `source_count: 0`.
- Each major claim has an official source reference.
- Fast-changing claims are dated.
- At least two visual references satisfy the Visual Contract.
- `wiki/glossary/microsoft-fara.md` includes the new terms and cross-language equivalents or explicit pending markers.
- `wiki/index.md` and `wiki/ko/SUMMARY.md` link to the new topic.
- `wiki/log.md` has one appended entry for this work.
- `raw/` has no modifications.
- Slack behavior follows the environment-variable rule.
- `review-gates.md` records all ten Constitution Principle XII gates with evidence.
- A human editorial review remains required before final publication.
