# Data Model: Slack Webhook Notification on Main Branch Merge

## Entities

### MergeEvent

Represents the GitHub push/merge event that triggers the workflow. All fields are sourced from the GitHub Actions context — no persistence required.

| Field | Type | Source | Description |
|-------|------|--------|-------------|
| commitSha | string | `${{ github.sha }}` | Full SHA of the HEAD commit |
| shortSha | string | derived (first 7 chars) | Short SHA for display |
| author | string | `${{ github.event.head_commit.author.name }}` | Author display name |
| commitMessage | string | `${{ github.event.head_commit.message }}` | Commit message (first line) |
| repository | string | `${{ github.repository }}` | `owner/repo` format |
| branch | string | `${{ github.ref_name }}` | Branch name (`main`) |
| timestamp | string | `${{ github.event.head_commit.timestamp }}` | ISO 8601 UTC timestamp |
| beforeSha | string | `${{ github.event.before }}` | Previous HEAD SHA (for diff) |

### ChangeSummary

Derived from `git diff` between `beforeSha` and `commitSha`. Computed in the CI script at runtime.

| Field | Type | Validation | Description |
|-------|------|------------|-------------|
| created | string[] | max 10 shown | Files added in this push |
| modified | string[] | max 10 shown | Files changed in this push |
| deleted | string[] | max 10 shown | Files removed in this push |
| totalCount | number | ≥ 0 | Total files changed across all categories |
| truncated | boolean | — | True when totalCount > 10 per category |

**Derivation rules**:
- `created`: `git diff --name-only --diff-filter=A <before> <sha>`
- `modified`: `git diff --name-only --diff-filter=M <before> <sha>`
- `deleted`: `git diff --name-only --diff-filter=D <before> <sha>`
- Categories with zero files are omitted from the Details field text.

### SlackNotification

The Block Kit payload sent to the Slack incoming webhook endpoint.

| Field | Type | Constraint | Description |
|-------|------|------------|-------------|
| text | string | required | Fallback plain-text notification |
| blocks | Block[] | 2 blocks | Header block + Section block |

#### Block: Header

```
type: "header"
text.type: "plain_text"
text.text: "🔔 Kami Tech — Main Branch Updated"
```

#### Block: Section (Fields)

Four `mrkdwn` fields displayed in a 2-column layout:

| Field label | Content |
|-------------|---------|
| **Status** | `Success` (on normal dispatch) / `Error` (if dispatch fails) |
| **Time** | Human-readable UTC timestamp from `MergeEvent.timestamp` |
| **System** | `Kami Tech` (constant) |
| **Details** | Formatted `ChangeSummary` (see format below) |

#### Details Field Format

```
Created: file-a.md, file-b.md
Modified: x.md, y.md, z.md
Deleted: old.md
…and N more files
```

- Each category line is omitted if its list is empty.
- When all categories are empty (e.g., merge with no file changes), Details shows: `No file changes detected`.

## State Transitions

```
Push to main
    │
    ▼
GitHub Actions trigger
    │
    ▼
Checkout (fetch-depth: 2)
    │
    ▼
Compute ChangeSummary (git diff)
    │
    ▼
Build SlackNotification payload
    │
    ▼
POST to SLACK_WEBHOOK_URL
    │
    ├─ 200 OK ──► Log success, exit 0
    │
    └─ Error ───► Retry once (5s delay)
                      │
                      ├─ 200 OK ──► Log success, exit 0
                      │
                      └─ Error ───► Log failure, exit 1 (workflow step fails)
```
