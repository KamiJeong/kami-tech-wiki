# Feature Specification: Slack Webhook Notification on Main Branch Merge

**Feature Branch**: `003-slack-webhook-github-actions`

**Created**: 2026-05-15

**Status**: Draft

**Input**: User description: "Add slack webhook and merge to main branch via GitHub Actions with structured message template showing what was made, changed, or deleted."

## User Scenarios & Testing *(mandatory)*

### User Story 1 - Receive Slack Notification on Merge to Main (Priority: P1)

When a pull request is merged into the main branch, a Slack message is automatically sent to notify the team of the change. The message includes a structured summary of what was created, modified, or deleted in that merge.

**Why this priority**: This is the core deliverable — the team needs immediate awareness of what changed on main without checking GitHub manually.

**Independent Test**: Can be tested by merging any branch into main and verifying a Slack message arrives with the correct header, timestamp, and change summary.

**Acceptance Scenarios**:

1. **Given** a pull request is merged into the main branch, **When** the merge completes, **Then** a Slack message is sent within 1 minute containing the merge title, timestamp, and a summary of changed files.
2. **Given** the merge introduced new files, **When** the Slack message arrives, **Then** the Details field lists the newly created files with a short description.
3. **Given** the merge modified existing files, **When** the Slack message arrives, **Then** the Details field lists changed files and what changed in each.
4. **Given** the merge deleted files, **When** the Slack message arrives, **Then** the Details field lists deleted files.
5. **Given** the Slack webhook URL is not configured, **When** the automation runs, **Then** the pipeline reports a clear failure without silently dropping the notification.

---

### User Story 2 - Structured Slack Message with Change Details (Priority: P1)

The Slack message follows a consistent structured format — header block, status/time/system fields, and a Details section — so recipients can immediately understand the scope of the change at a glance.

**Why this priority**: A well-structured message reduces time-to-understanding and prevents notification fatigue from unformatted alerts.

**Independent Test**: Can be tested independently by verifying a sample merge generates a Slack message matching the required template structure.

**Acceptance Scenarios**:

1. **Given** a merge notification is triggered, **When** the Slack message is received, **Then** it contains: a header with an alert title, Status field, Time field (UTC), System field ("Kami Tech"), and a Details field.
2. **Given** a merge that creates 2 files and modifies 3 files, **When** the Slack message arrives, **Then** the Details field concisely summarizes: "Created: file-a.md, file-b.md | Modified: x.md, y.md, z.md".
3. **Given** a merge with no deletions, **When** the Slack message arrives, **Then** the Details field omits the "Deleted" section rather than showing an empty entry.

---

### User Story 3 - Secure Credential Management (Priority: P2)

The Slack webhook URL is stored securely as a secret and injected at runtime, never exposed in source code or workflow logs.

**Why this priority**: Exposing the webhook URL in code or logs would allow unauthorized parties to send messages to the Slack channel.

**Independent Test**: Can be tested by reviewing the workflow definition and confirming no literal webhook URL appears anywhere in versioned files or run logs.

**Acceptance Scenarios**:

1. **Given** the webhook URL is configured as a GitHub Actions secret named `SLACK_WEBHOOK_URL` under environment `PROD_ENV`, **When** the workflow runs, **Then** the URL is accessed via the secret reference and never printed to logs.
2. **Given** a developer inspects the repository source, **When** they search for the webhook URL pattern, **Then** no literal URL is found in any versioned file.

---

### Edge Cases

- What happens when the Slack API is temporarily unavailable? → Notification is retried once; on second failure, the workflow reports a warning but does not block the merge pipeline.
- What happens when the merge diff is very large (hundreds of files)? → The Details field shows a truncated summary (e.g., top 10 files by change size) with a count of remaining files.
- What happens when a direct push to main bypasses a PR? → The trigger fires on any push to main, not only PR merges, so direct pushes also generate notifications.

## Requirements *(mandatory)*

### Functional Requirements

- **FR-001**: The system MUST automatically send a Slack message whenever a commit is pushed or merged to the main branch.
- **FR-002**: The Slack message MUST follow the structured block format: a header block and a section block with four fields (Status, Time, System, Details).
- **FR-003**: The Details field MUST list files that were created, modified, and deleted in the triggering commit/merge, each with a short description of the change.
- **FR-004**: The Time field MUST display the timestamp of the merge event in a human-readable format.
- **FR-005**: The System field MUST display "Kami Tech" as the system identifier.
- **FR-006**: The Status field MUST reflect the outcome of the workflow (e.g., "Success" on normal merge, "Error" if notification dispatch fails).
- **FR-007**: The Slack webhook URL MUST be read exclusively from the `SLACK_WEBHOOK_URL` secret configured under the `PROD_ENV` GitHub Actions environment; it MUST NOT appear in any source file.
- **FR-008**: The automation MUST trigger on every push to the main branch, including direct pushes and PR merges.
- **FR-009**: If the Slack webhook call fails, the workflow MUST surface a visible failure status in GitHub Actions; it MUST NOT silently succeed.
- **FR-010**: When the diff is excessively large, the Details field MUST truncate gracefully, showing a representative subset with a total count.

### Key Entities

- **Merge Event**: A push or PR merge to the main branch; carries commit SHA, author, timestamp, and diff metadata.
- **Change Summary**: Derived from the merge diff; categorized into created, modified, and deleted file lists with brief per-file descriptions.
- **Slack Notification**: A structured message dispatched to a Slack channel via the configured webhook; contains header, status, time, system, and change summary.
- **Webhook Secret**: The Slack incoming webhook URL stored as a GitHub Actions environment secret; accessed only at runtime.

## Success Criteria *(mandatory)*

### Measurable Outcomes

- **SC-001**: A Slack message is delivered within 60 seconds of every merge or push to the main branch.
- **SC-002**: 100% of merges to main produce a Slack notification with no silent failures.
- **SC-003**: The Slack message includes a Details section that accurately reflects the file-level changes from the triggering commit (created / modified / deleted), verified against the actual git diff.
- **SC-004**: The webhook URL is absent from all versioned source files and workflow run logs (zero occurrences confirmed by search).
- **SC-005**: When tested with a merge containing new files, modified files, and deleted files, all three categories appear correctly in the Slack message Details field.

## Assumptions

- The GitHub repository already has the `SLACK_WEBHOOK_URL` secret configured under the `PROD_ENV` environment in GitHub Actions settings (confirmed by user).
- The Slack channel and workspace are already configured to accept incoming webhook messages.
- The main branch is the single integration branch; feature work flows through pull requests and is not committed directly in normal workflow (though direct pushes are also handled per FR-008).
- Notification delivery latency depends on GitHub Actions runner availability; the 60-second target (SC-001) assumes no runner queue delay.
- The change summary in the Details field is derived from the git diff of the merge commit, not from PR description or commit messages.
- Multi-language wiki content (ko/en/ja) is treated as regular files for the purpose of the change summary — no special categorization by language.
