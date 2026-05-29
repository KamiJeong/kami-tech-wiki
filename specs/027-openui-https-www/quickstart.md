# Quickstart: OpenUI Personalization Case Reference

## Prerequisites

- Read [spec.md](spec.md), [plan.md](plan.md), [research.md](research.md), [data-model.md](data-model.md), and [contracts/openui-personalization-wiki-contract.md](contracts/openui-personalization-wiki-contract.md).
- Keep `raw/` read-only.
- Use live web verification before drafting current claims.

## Implementation Workflow

1. Inspect existing OpenUI wiki pages under `wiki/{ko,en,ja}/openui/` to avoid duplicating background content.
2. Verify current official OpenUI sources live and record source owner, URL, publication date when available, and access date.
3. Research candidate personalization or adaptive UI examples and classify each one with the evidence taxonomy in [research.md](research.md).
4. Select up to 10 useful examples, preferring verified OpenUI evidence when available and clearly labeling comparable non-OpenUI examples.
5. Confirm the article fits the scannability threshold. If not, create companion case-list pages in all three languages and link them from the main article.
6. Draft `wiki/ko/openui/personalization-case-reference.md` first using the contract structure and original synthesis.
7. Create English and Japanese versions with the same case classifications, recommendation, source coverage, and section structure.
8. Update OpenUI section indexes, locale `SUMMARY.md` files, and `wiki/index.md`.
9. Append `wiki/log.md` using the required timestamp format.
10. If `SLACK_WEBHOOK_URL` is set, run the existing notification script with operation, pages, and summary.
11. Create `specs/027-openui-https-www/review-gates.md` and record all ten Principle XII gate results.

## Verification Checklist

- `raw/` has no modifications.
- All three article files exist and have complete frontmatter.
- `source_count` is `0` unless a `raw/` source is actually used.
- Every case row has description, pattern, evidence status, source link, access date, and takeaway.
- No site is claimed to use OpenUI without direct reliable-source support.
- Comparable examples are labeled as not verified as OpenUI in Korean, English, and Japanese.
- Fast-changing claims are dated.
- New or reused terms are consistent across languages.
- Markdown uses portable syntax and relative internal links.
- Navigation files include the new article.
- `wiki/log.md` is appended.
- Slack notification behavior is recorded.
- Human review remains required before marking the article `active`.

## Suggested Commands

```bash
git status --short
find wiki/ko/openui wiki/en/openui wiki/ja/openui -maxdepth 1 -type f | sort
bun test
```

Use `bun test` as a repository smoke test if implementation touches scripts or notification behavior. For content-only changes, document manual checks in `review-gates.md`.
