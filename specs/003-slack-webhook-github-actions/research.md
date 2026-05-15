# Research: Slack Webhook Notification via GitHub Actions

## Decision 1: Changed Files Detection Method

**Decision**: Use `git diff --name-only --diff-filter={filter} ${{ github.event.before }} ${{ github.sha }}` with `fetch-depth: 2` in `actions/checkout@v4`.

**Rationale**: Covers all commits in a push (including multi-commit merges), allows filtering by status (A=Added, M=Modified, D=Deleted) in a single checkout step. No third-party action needed — keeps the supply chain minimal.

**Alternatives considered**:
- `git diff-tree --no-commit-id --name-only -r <sha>`: Only covers the single HEAD commit, misses multi-commit pushes.
- `tj-actions/changed-files`: Third-party action; adds supply chain dependency; no advantage for this use case.

## Decision 2: Script Location

**Decision**: Create `.wiki/scripts/notify-slack-ci.ts` as a new file separate from the existing `notify-slack.ts`.

**Rationale**: The existing script handles LLM wiki operations (ingest/update/lint) with a different interface and message format. The CI notification has a different contract (commit SHA, git diff, GitHub context) and separate test surface. Keeping them separate respects Single Source of Truth (Constitution II) — each script has one responsibility.

**Alternatives considered**:
- Extend `notify-slack.ts` with a new mode: would mix two unrelated contracts in one file, violating SRP.

## Decision 3: Bun Availability in GitHub Actions

**Decision**: Use `oven-sh/setup-bun@v2` action to install Bun before running the script.

**Rationale**: Bun is not pre-installed on `ubuntu-latest` GitHub Actions runners. `setup-bun` is the official action from Oven (Bun's creator) and is the idiomatic install path.

**Alternatives considered**:
- Use Node.js with `npx tsx`: would require Node setup and an extra dependency; inconsistent with project's Bun toolchain.
- `curl` install script: fragile, not pinned to a version.

## Decision 4: Slack Message "Details" Field Content

**Decision**: The Details field shows up to 10 changed files grouped by category (Created / Modified / Deleted). When total files exceed 10, show the first 10 with a count suffix (e.g., "…and 3 more").

**Rationale**: Spec FR-010 requires graceful truncation for large diffs. Block Kit field text is limited to 2000 characters; 10 files with typical paths fits comfortably within that limit while remaining readable.

**Alternatives considered**:
- Show all files: risk hitting Block Kit character limits silently (2000 char max per field).
- Show only counts (e.g., "3 created, 5 modified"): too little information; spec requires file-level detail.

## Decision 5: GitHub Actions Environment

**Decision**: Declare `environment: PROD_ENV` at the workflow `jobs` level so `SLACK_WEBHOOK_URL` secret is injected from the `PROD_ENV` environment.

**Rationale**: User confirmed the secret is configured under `PROD_ENV` environment in GitHub Actions settings. Environment-scoped secrets are more secure than repository-wide secrets.

## Decision 6: Fallback when Slack is Unavailable

**Decision**: Retry the webhook call once after a 5-second delay. On second failure, exit with a non-zero code so GitHub Actions marks the step as failed (visible in UI).

**Rationale**: Spec FR-009 requires visible failure — silent success is forbidden. One retry avoids flapping from transient network issues.
