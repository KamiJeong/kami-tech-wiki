# Quickstart: Slack Webhook Notification on Main Branch Merge

## Prerequisites

- GitHub repository with `SLACK_WEBHOOK_URL` secret configured under `PROD_ENV` environment
- Bun installed locally for testing (`curl -fsSL https://bun.sh/install | bash`)

## Local Test (Script Only)

Test the CI notification script without triggering GitHub Actions:

```bash
# Set the webhook URL locally
export SLACK_WEBHOOK_URL="https://hooks.slack.com/services/..."

# Simulate a merge notification
COMMIT_SHA=abc1234 \
COMMIT_SHORT=abc1234 \
AUTHOR="JH Jeong" \
COMMIT_MSG="feat: add wiki page for Claude" \
REPOSITORY="KamiJeong/kami-tech-wiki" \
BRANCH=main \
TIMESTAMP="2026-05-15T10:28:00Z" \
FILES_CREATED="wiki/ko/claude/overview.md" \
FILES_MODIFIED="wiki/index.md,wiki/log.md" \
FILES_DELETED="" \
bun run .wiki/scripts/notify-slack-ci.ts
```

## Run Unit Tests

```bash
bun test .wiki/scripts/notify-slack-ci.test.ts
```

## Trigger via GitHub Actions

Push or merge any branch into `main`:

```bash
git checkout main
git merge feature-branch
git push origin main
```

The `notify-slack.yml` workflow fires automatically. Check the **Actions** tab in GitHub for run status.

## Verify Slack Message

After a push to main, the Slack channel should receive a message like:

```
🔔 Kami Tech — Main Branch Updated

Status:    Success          Time: 2026-05-15 10:28 UTC
System:    Kami Tech        Details: Created: wiki/ko/claude/overview.md
                                     Modified: wiki/index.md, wiki/log.md
```

## Troubleshooting

| Symptom | Cause | Fix |
|---------|-------|-----|
| Workflow step fails with "SLACK_WEBHOOK_URL not set" | Secret not configured in PROD_ENV | Add secret in GitHub → Settings → Environments → PROD_ENV |
| Slack returns `no_service` | Webhook URL revoked | Regenerate Incoming Webhook in Slack and update the secret |
| Details shows "No file changes detected" | Push with no file changes (e.g., empty commit) | Expected behavior per spec |
| `git diff` returns empty on first push | `before` SHA is all zeros on first push | Script handles this: falls back to `git diff-tree HEAD` |
