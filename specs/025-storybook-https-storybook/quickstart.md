# Quickstart: Review Storybook Wiki Feature

## 1. Inspect Generated Wiki Pages

```bash
sed -n '1,220p' wiki/ko/storybook/README.md
sed -n '1,260p' wiki/ko/storybook/index.md
```

Check:

- Required frontmatter exists.
- The article answers all six user-requested topic groups.
- Storybook MCP limitations are dated.
- Token estimates are labeled as heuristic estimates.

## 2. Inspect Navigation

```bash
grep -n "Storybook" wiki/index.md wiki/ko/SUMMARY.md
```

Check:

- `wiki/index.md` has a Korean Storybook entry.
- `wiki/ko/SUMMARY.md` has a Storybook section and links to existing files.

## 3. Inspect Log

```bash
tail -40 wiki/log.md
```

Check:

- A new `create | Storybook 개요` or equivalent entry exists.
- The entry lists files created and navigation updates.

## 4. Run Validation

```bash
bun test
bash .wiki/scripts/validate-summary-links.sh
bash .wiki/scripts/validate-wiki.sh
```

If a script is not available or fails for existing unrelated project issues, record the exact result in the review report.

## 5. Verify Sources

Open the source links in the article and verify they are official Storybook, Figma, Anthropic, or OpenAI/OpenAI GitHub sources.

## 6. Verify Slack Notification

If `SLACK_WEBHOOK_URL` is set:

```bash
bun run .wiki/scripts/notify-slack.ts \
  --operation ingest \
  --pages "Storybook 개요" \
  --summary "Storybook, 디자인 시스템, Storybook MCP, Figma 기반 AI 개발 워크플로우 비교 문서를 추가했습니다."
```

If the environment variable is missing, do not hardcode it; document that Slack notification was skipped.
