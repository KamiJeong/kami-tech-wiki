# Contract: OpenUI Personalization Case Reference Wiki Article

## Required Outputs

Implementation must create or update these reader-facing files:

```text
wiki/ko/openui/personalization-case-reference.md
wiki/en/openui/personalization-case-reference.md
wiki/ja/openui/personalization-case-reference.md
```

Implementation must update these maintenance files:

```text
wiki/ko/openui/index.md
wiki/en/openui/index.md
wiki/ja/openui/index.md
wiki/ko/SUMMARY.md
wiki/en/SUMMARY.md
wiki/ja/SUMMARY.md
wiki/index.md
wiki/log.md
```

Implementation must create this review artifact:

```text
specs/027-openui-https-www/review-gates.md
```

## Frontmatter Contract

Each article file must include:

```yaml
---
title: ""
tags: [openui, generative-ui, personalization]
category: tool
language: ko
date_created: 2026-05-28
date_modified: 2026-05-28
source_count: 0
status: draft
review_cycle: fast-changing
---
```

Rules:
- `language` must match the containing locale: `ko`, `en`, or `ja`.
- `title` must be localized.
- `source_count` must remain `0` unless implementation uses files from `raw/`.
- `status` must remain `draft` until multilingual parity, all quality gates, and human review pass.

## Section Contract

Each article must preserve the same structure and meaning across languages:

1. Title
2. One-sentence summary
3. Who this page is for
4. Why this matters
5. Plain-language explanation
6. Key concepts
7. Example or analogy
8. Practical applications, adapted to include the case matrix, feasibility findings, and recommendation
9. Common misconceptions
10. Related terms
11. Further reading
12. Language notes
13. Advanced notes, optional

The case matrix must be a portable Markdown table.

## Case Matrix Contract

Each included case row must contain:

| Field | Required | Notes |
|-------|----------|-------|
| Site/service name | Yes | Localize only when there is a conventional localized name |
| URL | Yes | External link |
| Short description | Yes | Original wording |
| Personalization/adaptive UI pattern | Yes | Preserve same underlying classification across languages |
| OpenUI evidence status | Yes | Use the taxonomy from `research.md` |
| Source link | Yes | At least one source per row |
| Access date | Yes | Required because behavior and claims are fast-changing |
| Practical takeaway | Yes | Stakeholder-oriented |

## Evidence Contract

Allowed OpenUI evidence statuses:

- `Verified OpenUI`
- `Partially supported`
- `Unclear`
- `Not verified as OpenUI, comparable`

Rules:
- Only `Verified OpenUI` may be phrased as "uses OpenUI" or equivalent.
- `Partially supported` must state the supported claim and the missing proof.
- `Unclear` must not imply adoption.
- `Not verified as OpenUI, comparable` must be explicitly labeled in every language version.
- If fewer than 10 verified OpenUI examples are available, the article must explain the shortfall and may include comparable examples.

## Source Contract

The article set must include at least 12 verifiable sources total:

- Official OpenUI source or documentation.
- At least one source for each selected case row.
- At least one source explaining comparable personalization examples when not verified as OpenUI.

Rules:
- Verify sources live during implementation.
- Record publication date when available.
- Record access date for every source-backed current claim.
- Summarize in original wording.
- Do not copy paragraph-length source text.

## Navigation Contract

Navigation updates must use relative links for internal files.

Required updates:
- Add the article to each locale's OpenUI section index.
- Add the article to each locale's `SUMMARY.md` under OpenUI.
- Add the article to `wiki/index.md` under the OpenUI section for each locale.

## Log Contract

Append one entry to `wiki/log.md`:

```markdown
## [YYYY-MM-DD HH:MM] update | OpenUI Personalization Case Reference
```

The entry must summarize created/updated pages and source verification status.

## Slack Contract

After wiki updates, send notification only when `SLACK_WEBHOOK_URL` exists:

```bash
SLACK_WEBHOOK_URL="..." bun run .wiki/scripts/notify-slack.ts \
  --operation update \
  --pages "wiki/ko/openui/personalization-case-reference.md, wiki/en/openui/personalization-case-reference.md, wiki/ja/openui/personalization-case-reference.md" \
  --summary "OpenUI real-time personalization case-reference article updated"
```

Rules:
- Never hardcode the webhook URL.
- If the variable is absent, skip sending and record that it was skipped.

## Review Gate Contract

`review-gates.md` must record all Principle XII gates:

- Readability
- Factual accuracy
- Source integrity
- Multilingual consistency
- Markdown portability
- Terminology consistency
- Navigation
- Copying/plagiarism risk
- Template compliance
- Learning goal

Each gate entry must include status, evidence, date, and reviewer/human-review status where applicable.
