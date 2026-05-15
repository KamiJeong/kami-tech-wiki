# Implementation Plan: Slack Webhook Notification on Main Branch Merge

**Branch**: `003-slack-webhook-github-actions` | **Date**: 2026-05-15 | **Spec**: [spec.md](./spec.md)

**Input**: Feature specification from `specs/003-slack-webhook-github-actions/spec.md`

## Summary

Whenever a commit is pushed or merged into the `main` branch, a GitHub Actions workflow runs a Bun TypeScript script that computes a git diff summary (created/modified/deleted files) and POSTs a structured Slack Block Kit message to the configured incoming webhook. The webhook URL is injected from the `PROD_ENV` GitHub Actions environment secret and never appears in source code.

## Technical Context

**Language/Version**: TypeScript 6.0.3 / Bun (via @types/bun 1.3.14)

**Primary Dependencies**: Bun native `fetch`, `oven-sh/setup-bun@v2`, `actions/checkout@v4`

**Storage**: N/A — stateless; no persistence required

**Testing**: `bun test` — unit tests for payload builder and change summary formatter

**Target Platform**: GitHub Actions `ubuntu-latest` runner

**Project Type**: CI automation — GitHub Actions workflow + Bun script

**Performance Goals**: Slack notification delivered within 60 seconds of push to main (per SC-001)

**Constraints**: `SLACK_WEBHOOK_URL` sourced exclusively from `PROD_ENV` GitHub Actions environment secret; never hardcoded or logged

**Scale/Scope**: Single repository, every push to `main`

## Constitution Check

*GATE: Pre-Phase 0. Re-checked after Phase 1.*

| Principle | Status | Notes |
|-----------|--------|-------|
| I. Spec Before Code | ✅ Pass | `spec.md` approved at `specs/003-slack-webhook-github-actions/spec.md` |
| II. Single Source of Truth | ✅ Pass | Message format defined once in `notify-slack-ci.ts`; workflow only calls the script |
| IV. Version-Pinned Stack | ✅ Pass | `@types/bun@1.3.14`, `typescript@6.0.3` — all current per version-guard-report.md |
| V. Type Safety | ✅ Pass | Script uses typed interfaces for `MergeEvent`, `ChangeSummary`, `SlackWebhookPayload` |
| VII. Testing Standards | ✅ Pass | Unit tests cover `buildChangeSummary` and `buildPayload`; no mocking of actual webhook (boundary concern) |
| XII. Security & Privacy | ✅ Pass | `SLACK_WEBHOOK_URL` from env only; no PII in payload; git diff shows filenames only |
| XIV. Local-First | ✅ Pass | Script runs locally with `bun run`; tests run with `bun test` |
| XV. AI Agent Governance | ✅ Pass | This plan traces to numbered spec requirements |

**Post-Phase 1 re-check**: No violations introduced. Module boundaries respected (new `notify-slack-ci.ts` is a standalone script).

## Project Structure

### Documentation (this feature)

```text
specs/003-slack-webhook-github-actions/
├── plan.md               # This file
├── research.md           # Phase 0 output
├── data-model.md         # Phase 1 output
├── quickstart.md         # Phase 1 output
├── contracts/
│   └── slack-webhook-payload.md
├── version-guard-report.md
└── tasks.md              # Phase 2 output (/speckit-tasks — not created here)
```

### Source Code

```text
.github/
└── workflows/
    └── notify-slack.yml              # NEW: GitHub Actions workflow

.wiki/scripts/
├── notify-slack.ts                   # Existing (unchanged): LLM wiki operations
├── notify-slack.test.ts              # Existing (unchanged): tests for above
├── notify-slack-ci.ts                # NEW: CI/CD merge notification script
└── notify-slack-ci.test.ts           # NEW: unit tests for CI script
```

**Structure Decision**: Flat script layout under `.wiki/scripts/`. The CI script (`notify-slack-ci.ts`) is kept separate from the LLM wiki script (`notify-slack.ts`) because they have different interfaces, different callers, and different test surfaces. No `src/` restructuring is needed.

## Implementation Notes

### Workflow (`notify-slack.yml`)

- Trigger: `push` to `main` branch
- Environment: `PROD_ENV` (to access `SLACK_WEBHOOK_URL` secret)
- Steps:
  1. `actions/checkout@v4` with `fetch-depth: 2` (required for `git diff`)
  2. `oven-sh/setup-bun@v2`
  3. Compute changed files via `git diff --name-only --diff-filter=A/M/D`
  4. Export file lists as env vars
  5. `bun run .wiki/scripts/notify-slack-ci.ts`

### Script (`notify-slack-ci.ts`)

- Reads env vars: `COMMIT_SHA`, `COMMIT_SHORT`, `AUTHOR`, `COMMIT_MSG`, `REPOSITORY`, `BRANCH`, `TIMESTAMP`, `FILES_CREATED`, `FILES_MODIFIED`, `FILES_DELETED`
- Parses comma-separated file lists into `ChangeSummary`
- Builds `SlackWebhookPayload` per the contract in `contracts/slack-webhook-payload.md`
- Truncates each category at 10 files with "…and N more" suffix (FR-010)
- Omits empty categories from Details field
- Retries once on failure; exits non-zero on second failure (FR-009)

### First-Push Edge Case

When `github.event.before` is all zeros (repository's first push), `git diff` has no base. In this case, the script falls back to `git diff-tree --no-commit-id --name-only -r HEAD` to list all files in the initial commit.

## Performance Budget

- Workflow total runtime target: under 60 seconds (SC-001)
- Script execution: under 5 seconds (dominated by HTTP to Slack)
- No bundle size concern (server-side script)
