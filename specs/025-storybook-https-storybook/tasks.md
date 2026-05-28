# Tasks: Storybook Overview for AI Native Frontend Development

**Input**: Design artifacts from `specs/025-storybook-https-storybook/`
**Prerequisites**: `plan.md`, `research.md`, `data-model.md`, `contracts/storybook-wiki-contract.md`

## Phase 1: Setup

- [X] T001 Verify active feature context points to `specs/025-storybook-https-storybook` in `.specify/feature.json`
- [X] T002 [P] Create `wiki/ko/storybook/` directory for the Korean Storybook section

## Phase 2: Source and Structure

- [X] T003 [P] Confirm official source links for Storybook, Figma, Anthropic, and OpenAI/OpenAI GitHub in `specs/025-storybook-https-storybook/research.md`
- [X] T004 Define the final section outline for `wiki/ko/storybook/index.md` from `contracts/storybook-wiki-contract.md`

## Phase 3: Reader Scenario 1 - Understand Storybook and Design Systems (P1)

**Goal**: Reader can explain Storybook, stories, and the design-system relationship.

**Independent Test**: `wiki/ko/storybook/index.md` includes beginner-friendly sections for what Storybook is, who it is for, why it matters, and design-system relationship.

- [X] T005 [US1] Create `wiki/ko/storybook/README.md` with frontmatter, section purpose, and link to `index.md`
- [X] T006 [US1] Draft the introduction, audience, why-it-matters, and analogy sections in `wiki/ko/storybook/index.md`
- [X] T007 [US1] Add Storybook/design-system relationship explanation in `wiki/ko/storybook/index.md`
- [X] T008 [US1] Add core Storybook capability sections for stories, docs, addons, tests, sharing, and CI in `wiki/ko/storybook/index.md`

## Phase 4: Reader Scenario 2 - Evaluate Storybook MCP (P2)

**Goal**: Reader can explain what Storybook MCP exposes to AI agents and where its limits are.

**Independent Test**: `wiki/ko/storybook/index.md` includes Storybook MCP toolsets, setup concept, preview limitations, and official-source citations.

- [X] T009 [US2] Add Storybook MCP explanation, toolset table, and limitations to `wiki/ko/storybook/index.md`
- [X] T010 [US2] Add Figma Dev Mode MCP comparison context to `wiki/ko/storybook/index.md`
- [X] T011 [US2] Add Claude Code and Codex CLI MCP workflow notes to `wiki/ko/storybook/index.md`

## Phase 5: Reader Scenario 3 - Compare AI Native Development Cases (P3)

**Goal**: Reader can choose among the three Figma-based implementation workflows.

**Independent Test**: `wiki/ko/storybook/index.md` includes the three requested cases, reasoning process comparison, and heuristic token comparison.

- [X] T012 [US3] Add three-case AI Native Development comparison table to `wiki/ko/storybook/index.md`
- [X] T013 [US3] Add Claude Code/Codex CLI reasoning-flow comparison to `wiki/ko/storybook/index.md`
- [X] T014 [US3] Add heuristic token-consumption estimate table with caveats to `wiki/ko/storybook/index.md`
- [X] T015 [US3] Add when-to-use, when-not-to-use, and Storybook MCP use cases to `wiki/ko/storybook/index.md`

## Phase 6: Navigation and Logging

- [X] T016 Add Storybook entries to `wiki/ko/SUMMARY.md`
- [X] T017 Add Korean Storybook catalog entry to `wiki/index.md`
- [X] T018 Append Storybook update entry to `wiki/log.md`

## Phase 7: Validation and Notification

- [X] T019 Run wiki validation commands and record results in `specs/025-storybook-https-storybook/analysis.md`
- [X] T020 Send Slack notification via `.wiki/scripts/notify-slack.ts` when `SLACK_WEBHOOK_URL` is available, or record skip reason in `analysis.md`

## Phase 8: Review

- [X] T021 Verify the article satisfies `contracts/storybook-wiki-contract.md`
- [X] T022 Write `specs/025-storybook-https-storybook/review-report.md`

## Dependencies

- T001 before all feature-local commands.
- T002 before T005-T015.
- T003-T004 before article drafting.
- T005-T008 before T009-T015 for reader flow.
- T016-T018 after article files exist.
- T019-T022 after implementation tasks.

## Parallel Opportunities

- T002 and T003 can run in parallel.
- T005 and T006 can be drafted in parallel if frontmatter and heading plan are coordinated.
- T009, T010, and T011 can be drafted independently once the article skeleton exists.

## Implementation Strategy

MVP first: complete T005-T008 to produce a useful Storybook overview. Then add Storybook MCP and AI workflow comparison sections, followed by navigation, validation, Slack notification, and review.
