# Tasks: Slack Webhook Notification on Main Branch Merge

**Input**: Design documents from `specs/003-slack-webhook-github-actions/`

**Prerequisites**: plan.md ✅, spec.md ✅, research.md ✅, data-model.md ✅, contracts/ ✅

**Branch**: `003-slack-webhook-github-actions`

## Format: `[ID] [P?] [Story] Description`

- **[P]**: Can run in parallel (different files, no dependencies)
- **[Story]**: Which user story this task belongs to ([US1], [US2], [US3])
- All paths are relative to repository root

---

## Phase 1: Setup (Shared Infrastructure)

**Purpose**: Create the two new source files and the workflow directory.

- [x] T001 Create `.github/workflows/` directory and scaffold `.github/workflows/notify-slack.yml` with trigger, environment, and job skeleton (trigger: `push` to `main`; environment: `PROD_ENV`; steps: checkout, setup-bun, compute-diff, run-script)
- [x] T002 [P] Create `.wiki/scripts/notify-slack-ci.ts` with TypeScript interfaces: `MergeEvent`, `ChangeSummary`, `SlackWebhookPayload`, `SlackBlock` (header + section), `SlackField` — per `contracts/slack-webhook-payload.md` and `data-model.md`

**Checkpoint**: Two new files exist with correct TypeScript skeleton; workflow YAML is valid and parseable.

---

## Phase 2: Foundational (Blocking Prerequisites)

**Purpose**: Core data-transformation functions that both US1 and US2 depend on. No user story phase can begin until this is complete.

**⚠️ CRITICAL**: `buildChangeSummary()` and `buildPayload()` are called by `notify()`. These must be complete before US1 implementation.

- [x] T003 Implement `buildChangeSummary(env: NodeJS.ProcessEnv): ChangeSummary` in `.wiki/scripts/notify-slack-ci.ts` — parses `FILES_CREATED`, `FILES_MODIFIED`, `FILES_DELETED` env vars (comma-separated) into `ChangeSummary`; empty strings → empty arrays
- [x] T004 Implement `buildPayload(event: MergeEvent, summary: ChangeSummary): SlackWebhookPayload` in `.wiki/scripts/notify-slack-ci.ts` — constructs Block Kit payload per `contracts/slack-webhook-payload.md`: header block (`🔔 Kami Tech — Main Branch Updated`) + section block with four `mrkdwn` fields (Status, Time, System, Details)

**Checkpoint**: Both functions are implemented and type-safe. `buildPayload()` returns a valid `SlackWebhookPayload` with exactly 2 blocks and 4 fields.

---

## Phase 3: User Story 1 — Receive Slack Notification on Merge (Priority: P1) 🎯 MVP

**Goal**: Every push to `main` triggers a GitHub Actions workflow that runs the Bun script and POSTs a Slack notification.

**Independent Test**: Push any commit to `main` (or merge a PR). Within 60 seconds, a Slack message appears in the configured channel. The workflow step is green in the GitHub Actions UI.

### Implementation for User Story 1

- [x] T005 [US1] Implement `notify(payload: SlackWebhookPayload): Promise<void>` in `.wiki/scripts/notify-slack-ci.ts` — reads `SLACK_WEBHOOK_URL` from `process.env` (exits 1 if unset), POSTs payload, retries once after 5-second delay on non-2xx, exits 1 on second failure (per FR-009 and research Decision 6)
- [x] T006 [US1] Implement `main()` entry point in `.wiki/scripts/notify-slack-ci.ts` — reads all `MergeEvent` env vars (`COMMIT_SHA`, `COMMIT_SHORT`, `AUTHOR`, `COMMIT_MSG`, `REPOSITORY`, `BRANCH`, `TIMESTAMP`), calls `buildChangeSummary()`, `buildPayload()`, and `notify()`; call `main()` at bottom of file
- [x] T007 [US1] Complete `.github/workflows/notify-slack.yml` — add steps after checkout and setup-bun: (a) compute git diff for A/M/D files using `git diff --name-only --diff-filter=A ${{ github.event.before }} ${{ github.sha }}` etc. with `fetch-depth: 2`; (b) export `FILES_CREATED`, `FILES_MODIFIED`, `FILES_DELETED`, `COMMIT_SHA`, `COMMIT_SHORT`, `AUTHOR`, `COMMIT_MSG`, `REPOSITORY`, `BRANCH`, `TIMESTAMP` as env vars; (c) run `bun run .wiki/scripts/notify-slack-ci.ts`

**Checkpoint**: `bun run .wiki/scripts/notify-slack-ci.ts` (with env vars set locally) sends a Slack message. Workflow YAML passes `act` or GitHub Actions lint check.

---

## Phase 4: User Story 2 — Structured Slack Message with Change Details (Priority: P1)

**Goal**: The Details field correctly summarizes created/modified/deleted files; empty categories are omitted; large diffs are truncated to 10 files with a "…and N more" suffix.

**Independent Test**: Set `FILES_CREATED=a.md,b.md`, `FILES_MODIFIED=x.md`, `FILES_DELETED=` and run the script locally. Verify the Slack message Details field shows `Created: a.md, b.md\nModified: x.md` with no Deleted line. Then set 12 files in one category and verify truncation to 10 + suffix.

### Implementation for User Story 2

- [x] T008 [US2] Add `formatDetails(summary: ChangeSummary): string` helper in `.wiki/scripts/notify-slack-ci.ts` — builds the Details field text: one line per non-empty category (`Created: …`, `Modified: …`, `Deleted: …`); truncates each list at 10 with `…and N more`; returns `No file changes detected` when all lists are empty (per FR-010 and research Decision 4); update `buildPayload()` to call this helper for the Details field
- [x] T009 [US2] Handle first-push edge case in `.github/workflows/notify-slack.yml` — when `github.event.before` is all zeros (`0000000000000000000000000000000000000000`), fall back to `git diff-tree --no-commit-id --name-only -r HEAD` to list all files in the initial commit (per quickstart.md troubleshooting and research Decision 1)
- [x] T010 [P] [US2] Create `.wiki/scripts/notify-slack-ci.test.ts` with unit tests for `buildChangeSummary()` and `formatDetails()`:
  - `buildChangeSummary`: parses comma-separated env vars into arrays; handles empty strings
  - `formatDetails`: omits empty categories; truncates at 10 with suffix; returns fallback text when all lists empty
  - `buildPayload`: Details field matches `formatDetails()` output; Status/System fields have correct constant values; payload has exactly 2 blocks

**Checkpoint**: `bun test .wiki/scripts/notify-slack-ci.test.ts` passes. All three scenarios (normal, empty categories, truncation) are covered.

---

## Phase 5: User Story 3 — Secure Credential Management (Priority: P2)

**Goal**: The Slack webhook URL never appears in source files, logs, or workflow output.

**Independent Test**: `grep -r "hooks.slack.com" .` finds zero matches in any versioned file. Searching workflow YAML shows only `${{ secrets.SLACK_WEBHOOK_URL }}` references, never a literal URL.

### Implementation for User Story 3

- [x] T011 [US3] Add unit test to `.wiki/scripts/notify-slack-ci.test.ts` asserting that `notify()` calls `process.exit(1)` when `SLACK_WEBHOOK_URL` is not set in env — verifies FR-007 at the code level
- [x] T012 [US3] Audit `.github/workflows/notify-slack.yml` — confirm `SLACK_WEBHOOK_URL` is referenced only as `${{ secrets.SLACK_WEBHOOK_URL }}` and is never echoed, printed, or set as a plain env var visible in logs; add `echo "::add-mask::$SLACK_WEBHOOK_URL"` step if the value is exported to the shell environment

**Checkpoint**: `grep -r "hooks.slack.com" .github/ .wiki/` returns no results. `bun test` still passes.

---

## Phase 6: Polish & Cross-Cutting Concerns

**Purpose**: Final validation and documentation.

- [x] T013 [P] Run `bun test` from repo root and confirm all tests in `.wiki/scripts/notify-slack-ci.test.ts` pass with zero failures
- [x] T014 [P] Validate against `specs/003-slack-webhook-github-actions/quickstart.md` — execute the local test scenario with a real (or test) webhook URL and confirm a correctly formatted Slack message is received

**Checkpoint**: All tests green. Quickstart local test produces a Slack message matching the template in `contracts/slack-webhook-payload.md`.

---

## Dependencies & Execution Order

### Phase Dependencies

- **Setup (Phase 1)**: No dependencies — can start immediately
- **Foundational (Phase 2)**: Depends on Phase 1 (T002 must exist before T003/T004)
- **US1 (Phase 3)**: Depends on Phase 2 completion — T005 calls T003/T004 output
- **US2 (Phase 4)**: Depends on Phase 2 completion — T008 extends T004; T010 tests T003/T004/T008
- **US3 (Phase 5)**: Depends on US1 and US2 completion — tests and audits existing code
- **Polish (Phase 6)**: Depends on all preceding phases

### User Story Dependencies

- **US1 (P1)**: Depends on Foundational (Phase 2). Core delivery — must ship first.
- **US2 (P1)**: Depends on Foundational (Phase 2). Extends `buildPayload()` from US1 phase; can be developed alongside US1 since it touches the same file at different points.
- **US3 (P2)**: Depends on US1 + US2. Verification layer — no new production code, only tests and audit.

### Within-Phase Parallelism

- T001 and T002 can run in parallel (different files)
- T003 and T004 must run sequentially after T002 (same file, T004 depends on T003's type)
- T005 and T006 are sequential (T006 calls T005)
- T008 and T009 can run in parallel (different files)
- T013 and T014 can run in parallel

---

## Parallel Example: Phase 1

```bash
# T001 and T002 can be launched together (different files):
Task: "Create .github/workflows/notify-slack.yml skeleton"
Task: "Create .wiki/scripts/notify-slack-ci.ts interfaces"
```

## Parallel Example: Phase 4

```bash
# T008 (.wiki/scripts/notify-slack-ci.ts) and T009 (.github/workflows/notify-slack.yml) — different files:
Task: "Add formatDetails() helper and update buildPayload()"
Task: "Handle first-push edge case in workflow YAML"
# Then T010 (.wiki/scripts/notify-slack-ci.test.ts) after both complete
```

---

## Implementation Strategy

### MVP First (User Story 1 Only)

1. Complete Phase 1: Setup (T001, T002)
2. Complete Phase 2: Foundational (T003, T004)
3. Complete Phase 3: US1 (T005, T006, T007)
4. **STOP and VALIDATE**: Push to `main` and confirm Slack message arrives within 60 seconds
5. Merge if validated

### Incremental Delivery

1. Setup + Foundational → Core types and builders ready
2. US1 → Notification fires on every push ✅ MVP shipped
3. US2 → Details field shows structured file changes ✅ Richer notifications
4. US3 → Security audit passes ✅ Production-ready
5. Polish → All tests green, quickstart validated

---

## Task Summary

| Phase | Tasks | User Story | Key Deliverable |
|-------|-------|------------|-----------------|
| 1: Setup | T001–T002 | — | File skeletons |
| 2: Foundational | T003–T004 | — | Core data builders |
| 3: US1 | T005–T007 | US1 (P1) | Working workflow + script |
| 4: US2 | T008–T010 | US2 (P1) | Structured details + tests |
| 5: US3 | T011–T012 | US3 (P2) | Security verification |
| 6: Polish | T013–T014 | — | Validation |

**Total**: 14 tasks | **Parallel opportunities**: T001‖T002, T008‖T009, T013‖T014
