# Tasks: Personal Tech Wiki Initial Setup

**Input**: Design documents from `specs/001-project-initial-setup/`

**Prerequisites**: plan.md ✅ | spec.md ✅ | research.md ✅ | data-model.md ✅ | contracts/ ✅

**Tests**: Included for the Slack notification script (unit tests). Wiki templates are validated manually.

**Organization**: Grouped by user story for independent implementation and testing.

## Format: `[ID] [P?] [Story] Description`

- **[P]**: Parallelizable (different files, no dependencies on incomplete tasks)
- **[Story]**: User story label (US1 / US2 / US3)
- Paths are relative to repository root

---

## Phase 1: Setup (Shared Infrastructure)

**Purpose**: Project initialization — package.json scripts, directory structure, environment config

- [X] T001 Verify wiki/ directory structure matches plan.md (15 tool/language folders: ko|en|ja × chatgpt|claude|gemini|open-ui|graphify)
- [X] T002 Add .gitkeep to each empty wiki tool folder so git tracks them (wiki/ko/chatgpt/.gitkeep through wiki/ja/graphify/.gitkeep)
- [X] T003 [P] Add .gitkeep to raw/ subdirectories (raw/articles/.gitkeep, raw/papers/.gitkeep, raw/notes/.gitkeep)
- [X] T004 [P] Verify .gitignore covers .env, node_modules, and *.tsbuildinfo

---

## Phase 2: Foundational (Blocking Prerequisites)

**Purpose**: Core schema and navigation artifacts that ALL user stories depend on

**⚠️ CRITICAL**: No user story work begins until this phase is complete

- [X] T005 Verify CLAUDE.md contains complete LLM schema with plan reference, role table, operation rules, template usage guide, and frontmatter required fields
- [X] T006 [P] Verify wiki/index.md is initialized with KO/EN/JA section headers
- [X] T007 [P] Verify wiki/log.md is initialized with append-only format and grep-parseable entry format
- [X] T008 Add package.json scripts block: `"test": "bun test"`, `"test:slack": "bun test .wiki/scripts/"`, `"notify": "bun run .wiki/scripts/notify-slack.ts"`

**Checkpoint**: Foundation ready — all three user stories can now proceed

---

## Phase 3: User Story 1 — Multilingual Wiki Content (Priority: P1) 🎯 MVP

**Goal**: LLM can create, update, and cross-link wiki pages across KO/EN/JA using tool-based folder categories. User can browse all content from wiki/index.md.

**Independent Test**: Add a markdown file to raw/articles/, ask LLM to ingest it, verify a page is created under wiki/ko/\<tool\>/, wiki/index.md is updated, and wiki/log.md has a new entry.

### Implementation for User Story 1

- [X] T009 [P] [US1] Finalize .wiki/templates/tool-page.md — ensure all 7 sections are present (summary, 핵심 개념, 사용 시나리오, 빠른 시작, 통합&연결, 주의사항, 참고 링크) with correct YAML frontmatter schema
- [X] T010 [P] [US1] Finalize .wiki/templates/concept-page.md — verify 6 sections and YAML frontmatter match data-model.md WikiPage entity schema
- [X] T011 [P] [US1] Finalize .wiki/templates/source-summary.md — verify source_path field, related wikilinks section, and immutability note
- [X] T012 [P] [US1] Finalize .wiki/templates/index-entry.md — verify example entries for both Korean and English sections
- [X] T013 [US1] Verify CLAUDE.md Ingest operation steps 1–11 are complete and reference correct template paths (.wiki/templates/tool-page.md, etc.)
- [X] T014 [US1] Verify CLAUDE.md Query, Lint, Translate operation rules are complete per contracts/wiki-schema.md
- [X] T015 [US1] Create a sample wiki page at wiki/ko/claude/overview.md using tool-page.md template (demonstrates template in use; content: Claude model family overview)

**Checkpoint**: US1 complete — wiki structure, templates, and LLM schema are fully operational. Test by ingesting a raw source.

---

## Phase 4: User Story 2 — Slack Notification (Priority: P2)

**Goal**: After any ingest or significant update, a Slack Block Kit message is sent to the configured webhook with operation type, affected pages, and a summary.

**Independent Test**: Run `SLACK_WEBHOOK_URL=<url> bun run .wiki/scripts/notify-slack.ts --operation ingest --pages "Claude Overview" --summary "테스트"` and verify a Slack message is received within 60 seconds.

### Implementation for User Story 2

- [X] T016 [P] [US2] Verify .wiki/scripts/notify-slack.ts — check buildPayload produces valid Slack Block Kit JSON, SLACK_WEBHOOK_URL validation exits with code 1 if unset, all 4 operations (ingest/update/lint/translate) have Korean labels
- [X] T017 [P] [US2] Verify .wiki/scripts/notify-slack.test.ts — check 4 test cases cover: operation label, empty pages fallback, omit summary block, include summary block
- [X] T018 [US2] Run `bun test .wiki/scripts/` and confirm all 4 tests pass
- [X] T019 [US2] Verify .env.example contains SLACK_WEBHOOK_URL= line with placeholder comment and Slack webhook docs URL
- [X] T020 [US2] Update CLAUDE.md Ingest operation step 11 to show exact bun run command with --operation, --pages, --summary flags

**Checkpoint**: US2 complete — Slack notification script tested and integrated into CLAUDE.md ingest workflow.

---

## Phase 5: User Story 3 — Token Usage Tracking (Priority: P2)

**Goal**: Token consumption is captured automatically at every Spec Kit workflow phase (specify, plan, tasks, implement) with zero manual invocations. Results stored per-feature under specs/\<feature\>/token-reports/.

**Independent Test**: Run any `/speckit-*` command and verify token-analyzer baseline fires automatically (check after_specify / after_plan / after_tasks / after_implement hooks in extensions.yml are `optional: false`).

### Implementation for User Story 3

- [X] T021 [US3] Verify all 4 token-analyzer entries in .specify/extensions.yml have `optional: false`: after_specify, after_plan, after_tasks, after_implement
- [X] T022 [P] [US3] Create specs/001-project-initial-setup/token-reports/ directory with .gitkeep
- [X] T023 [US3] Add token-reports/ directory pattern to plan.md Project Structure section (already in plan, verify it is present)
- [X] T024 [US3] Verify spec.md FR-001a states token-analyzer results stored under specs/\<feature-dir\>/token-reports/

**Checkpoint**: US3 complete — token tracking is mandatory and directories are ready for baseline data.

---

## Phase 6: Polish & Cross-Cutting Concerns

**Purpose**: Final validation, README accuracy, and cleanup

- [X] T025 [P] Run `bun test` at repo root and confirm all tests pass (currently: 4 Slack notify tests)
- [X] T026 [P] Verify README.md does not reference the original template; confirms this is a personal tech wiki with KO/EN/JA wiki structure and Slack notification feature
- [X] T027 Verify CLAUDE.md plan reference between SPECKIT markers points to `specs/001-project-initial-setup/plan.md`
- [X] T028 [P] Run quickstart.md validation — confirm all commands in "자주 사용하는 명령" table execute without error (except Slack send which requires real webhook)
- [X] T029 Verify index.ts (created by bun init) is either unused and safe to delete, or repurposed for a wiki utility

---

## Dependencies & Execution Order

### Phase Dependencies

```
Phase 1 (Setup) ──────────────────┐
                                  ▼
Phase 2 (Foundational) ───────────┐
                                  ▼
Phase 3 (US1) ◀── Parallel ──┐   │
Phase 4 (US2) ◀── Parallel ──┤◄──┘
Phase 5 (US3) ◀── Parallel ──┘
                  │
                  ▼
Phase 6 (Polish)
```

- **Setup (Phase 1)**: No dependencies — start immediately
- **Foundational (Phase 2)**: Requires Phase 1 complete — blocks all user stories
- **US1 (Phase 3)**: Requires Phase 2 — independent of US2/US3
- **US2 (Phase 4)**: Requires Phase 2 — independent of US1/US3
- **US3 (Phase 5)**: Requires Phase 2 — independent of US1/US2
- **Polish (Phase 6)**: Requires all desired stories complete

### User Story Dependencies

| Story | Depends On | Blocks |
|-------|------------|--------|
| US1 (P1) | Phase 2 | Nothing |
| US2 (P2) | Phase 2 | Nothing |
| US3 (P2) | Phase 2 | Nothing |

### Parallel Opportunities Within Stories

**US1** (T009–T015): T009, T010, T011, T012 are all parallel (different template files)

**US2** (T016–T020): T016, T017 are parallel (different script files); T018 depends on T016+T017

**US3** (T021–T024): T022, T023, T024 are parallel; T021 is the gate

---

## Parallel Example: User Story 1 (Templates)

```bash
# These 4 tasks touch different files — run in parallel:
T009: Finalize .wiki/templates/tool-page.md
T010: Finalize .wiki/templates/concept-page.md
T011: Finalize .wiki/templates/source-summary.md
T012: Finalize .wiki/templates/index-entry.md

# Then sequentially:
T013: Verify CLAUDE.md Ingest steps (depends on T009–T012 paths being final)
T014: Verify CLAUDE.md other operations
T015: Create sample wiki page (depends on T009 being finalized)
```

---

## Implementation Strategy

### MVP First (User Story 1 Only)

1. Complete Phase 1: Setup (T001–T004)
2. Complete Phase 2: Foundational (T005–T008) — **CRITICAL GATE**
3. Complete Phase 3: User Story 1 (T009–T015)
4. **STOP & VALIDATE**: Ingest a raw source, verify wiki page created, index updated, log appended
5. Proceed to US2/US3 if MVP is confirmed working

### Incremental Delivery

1. Setup + Foundational → Foundation ready
2. US1 → Template + schema operational → **MVP demo: first wiki ingest**
3. US2 → Slack integration working → Async awareness of wiki updates
4. US3 → Token tracking mandatory → Cost visibility confirmed

---

## Notes

- [P] tasks touch different files — safe to parallelize
- Many Phase 1–2 tasks are verifications of work already done during `/speckit-plan`
- T015 (sample wiki page) serves as the US1 acceptance test artifact
- T018 (bun test run) must pass before US2 is considered done
- Token reports directory (T022) must exist before the first post-implement token-analyzer hook fires
