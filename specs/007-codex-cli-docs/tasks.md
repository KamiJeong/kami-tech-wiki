# Tasks: Codex CLI Wiki Documentation

**Input**: Design documents from `specs/007-codex-cli-docs/`

**Prerequisites**: plan.md ✅ spec.md ✅ research.md ✅ data-model.md ✅ contracts/ ✅

**Tests**: Not requested — no test tasks generated.

**Organization**: Tasks grouped by user story. Each story is independently implementable and testable.

## Format: `[ID] [P?] [Story] Description`

- **[P]**: Can run in parallel (different files, no pending dependencies)
- **[Story]**: Which user story this task belongs to (US1–US4)

---

## Phase 1: Setup (Shared Infrastructure)

**Purpose**: Create directory structure required before any wiki page can be written.

- [x] T001 Create directory `wiki/ko/codex-cli/` for Korean wiki page
- [x] T002 [P] Create directory `wiki/en/codex-cli/` for English wiki page
- [x] T003 [P] Create directory `wiki/ja/codex-cli/` for Japanese wiki page

**Checkpoint**: All three locale directories exist — wiki page authoring can begin in parallel.

---

## Phase 2: Foundational (Blocking Prerequisites)

**Purpose**: Review the tool-page template and content plan before authoring. Establishes the shared content structure that all three language pages will follow.

- [x] T004 Read `.wiki/templates/tool-page.md` and `specs/007-codex-cli-docs/research.md` to internalize Codex CLI facts and template structure before writing any page
- [x] T005 Read `specs/007-codex-cli-docs/contracts/wiki-page-contract.md` to confirm required sections (Overview, Key Features, Requirements, Installation, Basic Usage, Use Cases, Limitations, References) and frontmatter rules

**Checkpoint**: Template and content contract understood — user story implementation can now begin. US1 (Korean) must be completed before US2 and US3 begin, since Korean is the primary language.

---

## Phase 3: User Story 1 — Korean Codex CLI Documentation (Priority: P1) 🎯 MVP

**Goal**: Deliver a complete, accurate Korean-language Codex CLI wiki page at `wiki/ko/codex-cli/index.md`.

**Independent Test**: Open `wiki/ko/codex-cli/index.md` — verify it renders correctly, all 8 content sections are present with substantive content, frontmatter fields are all populated with correct values (`category: tool`, `language: ko`, `status: active`, `source_count: 0`), and no placeholder text remains.

### Implementation for User Story 1

- [x] T006 [US1] Create `wiki/ko/codex-cli/index.md` with complete frontmatter: `title: "Codex CLI"`, `tags: [codex-cli, openai, ai-coding, cli]`, `category: tool`, `language: ko`, `date_created: 2026-05-15`, `date_modified: 2026-05-15`, `source_count: 0`, `status: active`
- [x] T007 [US1] Write the Overview section in `wiki/ko/codex-cli/index.md`: one-line summary callout (OpenAI가 개발한 터미널 기반 AI 코딩 에이전트, 버전 0.130.0, Apache 2.0 라이선스) and 2–4 sentence description
- [x] T008 [US1] Write the 핵심 개념 (Key Features / Core Concepts) section in `wiki/ko/codex-cli/index.md`: list Approval Modes (Auto/Read-Only/Full Access), Slash Commands (/new /resume /plan /review /diff /permissions /status), Image Analysis, Non-Interactive exec mode, MCP integration, Subagent workflows
- [x] T009 [US1] Write the 사용 시나리오 (Use Cases) section in `wiki/ko/codex-cli/index.md`: table with "적합한 경우" (code development, debugging, test writing, codebase refactoring, CI/CD automation, data analysis) vs "적합하지 않은 경우" (simple file edits, no OpenAI account, Windows without WSL2 in production)
- [x] T010 [US1] Write the 빠른 시작 (Quick Start / Installation + Basic Usage) section in `wiki/ko/codex-cli/index.md`: system requirements table (macOS/Linux/Windows, Node.js 22+, 2GB RAM, ChatGPT account or API key), install command (`npm install -g @openai/codex`), and basic usage examples (`codex`, `codex "task"`, `codex exec "task"`)
- [x] T011 [US1] Write the 주의사항 & 한계 (Limitations / Caveats) section in `wiki/ko/codex-cli/index.md`: table covering usage quota (5-hour rolling window + weekly limit), Windows experimental support (WSL2 recommended), macOS Homebrew Computer Use restriction, weekly quota drift bug, /status initial delay bug
- [x] T012 [US1] Write the 참고 링크 (References) section in `wiki/ko/codex-cli/index.md`: official docs (developers.openai.com/codex/cli), GitHub repo (github.com/openai/codex), npm package (@openai/codex), quickstart guide, changelog — each with date 2026-05-15
- [x] T013 [US1] Final review of `wiki/ko/codex-cli/index.md`: confirm all 8 content areas covered, no template placeholder text ({{...}}) remains, frontmatter is valid YAML, and the page reads naturally in Korean

**Checkpoint**: `wiki/ko/codex-cli/index.md` is complete and passes independent test. MVP delivered.

---

## Phase 4: User Story 2 — English Codex CLI Documentation (Priority: P2)

**Goal**: Deliver a complete English-language Codex CLI wiki page at `wiki/en/codex-cli/index.md`, equivalent in structure and depth to the Korean version.

**Independent Test**: Open `wiki/en/codex-cli/index.md` — verify all 8 sections present, frontmatter valid (`language: en`, `status: active`), content is natural English, no placeholder text remains, and coverage matches the Korean page section by section.

### Implementation for User Story 2

- [x] T014 [US2] Create `wiki/en/codex-cli/index.md` with complete frontmatter: `title: "Codex CLI"`, `tags: [codex-cli, openai, ai-coding, cli]`, `category: tool`, `language: en`, `date_created: 2026-05-15`, `date_modified: 2026-05-15`, `source_count: 0`, `status: active`
- [x] T015 [US2] Write the Overview section in `wiki/en/codex-cli/index.md`: one-line summary (AI coding agent built by OpenAI that runs in your terminal, v0.130.0, Apache 2.0) and 2–4 sentence description
- [x] T016 [US2] Write the Key Features / Core Concepts section in `wiki/en/codex-cli/index.md`: Approval Modes, Slash Commands, Image Analysis, Non-Interactive exec mode, MCP integration, Subagent workflows — equivalent depth to Korean T008
- [x] T017 [US2] Write the Use Cases section in `wiki/en/codex-cli/index.md`: table (When to use / When not to use) with same scenarios as Korean T009, written in natural English
- [x] T018 [US2] Write the Quick Start (Installation + Basic Usage) section in `wiki/en/codex-cli/index.md`: same requirements table, install commands, and usage examples as Korean T010, written in English
- [x] T019 [US2] Write the Limitations / Caveats section in `wiki/en/codex-cli/index.md`: same limitation table as Korean T011, written in English
- [x] T020 [US2] Write the References section in `wiki/en/codex-cli/index.md`: same links as Korean T012, with English link descriptions
- [x] T021 [US2] Final review of `wiki/en/codex-cli/index.md`: confirm all sections covered, no placeholder text remains, frontmatter is valid YAML, content reads naturally in English, and depth matches Korean page

**Checkpoint**: `wiki/en/codex-cli/index.md` is complete and passes independent test.

---

## Phase 5: User Story 3 — Japanese Codex CLI Documentation (Priority: P3)

**Goal**: Deliver a complete Japanese-language Codex CLI wiki page at `wiki/ja/codex-cli/index.md`, equivalent in structure and depth to the Korean and English versions.

**Independent Test**: Open `wiki/ja/codex-cli/index.md` — verify all 8 sections present, frontmatter valid (`language: ja`, `status: active`), content is natural Japanese (丁寧語), no placeholder text remains, and coverage matches Korean and English pages.

### Implementation for User Story 3

- [x] T022 [US3] Create `wiki/ja/codex-cli/index.md` with complete frontmatter: `title: "Codex CLI"`, `tags: [codex-cli, openai, ai-coding, cli]`, `category: tool`, `language: ja`, `date_created: 2026-05-15`, `date_modified: 2026-05-15`, `source_count: 0`, `status: active`
- [x] T023 [US3] Write the Overview section in `wiki/ja/codex-cli/index.md`: one-line summary in Japanese (OpenAIが開発したターミナルベースのAIコーディングエージェント、v0.130.0、Apache 2.0ライセンス) and 2–4 sentence description in 丁寧語
- [x] T024 [US3] Write the 主な機能 (Key Features / Core Concepts) section in `wiki/ja/codex-cli/index.md`: Approval Modes (自動/読み取り専用/フルアクセス), Slash Commands, Image Analysis, Non-Interactive exec mode, MCP integration, Subagent workflows — written in Japanese
- [x] T025 [US3] Write the 使用シナリオ (Use Cases) section in `wiki/ja/codex-cli/index.md`: table (適している場合 / 適していない場合) with same scenarios as Korean and English versions, written in Japanese
- [x] T026 [US3] Write the クイックスタート (Quick Start / Installation + Basic Usage) section in `wiki/ja/codex-cli/index.md`: requirements table, install command, and usage examples written in Japanese; technical commands remain in English
- [x] T027 [US3] Write the 注意事項・制限 (Limitations / Caveats) section in `wiki/ja/codex-cli/index.md`: same limitation coverage as Korean T011, written in Japanese
- [x] T028 [US3] Write the 参考リンク (References) section in `wiki/ja/codex-cli/index.md`: same links as Korean T012, with Japanese link descriptions and date 2026-05-15
- [x] T029 [US3] Final review of `wiki/ja/codex-cli/index.md`: confirm all sections covered, no placeholder text remains, frontmatter is valid YAML, content reads naturally in Japanese, and depth matches Korean and English pages

**Checkpoint**: `wiki/ja/codex-cli/index.md` is complete. All three language pages are independently functional.

---

## Phase 6: User Story 4 — Index Discoverability & Logging (Priority: P4)

**Goal**: Update `wiki/index.md` with entries for all three Codex CLI pages, append an ingest record to `wiki/log.md`, and send a Slack notification.

**Independent Test**: Search `wiki/index.md` for "Codex CLI" — find 3 entries (ko, en, ja) with correct paths and descriptions. Tail `wiki/log.md` — find a new entry dated 2026-05-15 with operation `ingest`. Slack notification sent (or skipped gracefully if `SLACK_WEBHOOK_URL` is unset).

### Implementation for User Story 4

- [x] T030 [US4] Add Korean Codex CLI entry to `wiki/index.md` under the `## 한국어 (ko)` section: new `### Codex CLI` subsection with entry `- [[Codex CLI]] — OpenAI의 터미널 기반 AI 코딩 에이전트. 자동 승인 모드·슬래시 명령·이미지 분석 지원 (updated: 2026-05-15, sources: 0)`
- [x] T031 [US4] Add English Codex CLI entry to `wiki/index.md` under the `## English (en)` section: new `### Codex CLI` subsection with entry `- [[Codex CLI]] — Terminal-based AI coding agent by OpenAI. Supports approval modes, slash commands, and image analysis (updated: 2026-05-15, sources: 0)`
- [x] T032 [US4] Add Japanese Codex CLI entry to `wiki/index.md` under the `## 日本語 (ja)` section: new `### Codex CLI` subsection with entry `- [[Codex CLI]] — OpenAIのターミナルベースAIコーディングエージェント。承認モード、スラッシュコマンド、画像解析をサポート (updated: 2026-05-15, sources: 0)`
- [x] T033 [US4] Append ingest log entry to `wiki/log.md`: `## [2026-05-15 00:00] ingest | Codex CLI` followed by a 2–3 line summary (pages created: wiki/ko/codex-cli/index.md, wiki/en/codex-cli/index.md, wiki/ja/codex-cli/index.md; source_count: 0; index.md updated)
- [x] T034 [US4] Send Slack notification via `.wiki/scripts/notify-slack.ts` with `--operation ingest`, `--pages "Codex CLI (ko), Codex CLI (en), Codex CLI (ja)"`, `--summary "Codex CLI 문서 인제스트 완료 — 3개 언어 페이지 생성"` — if `SLACK_WEBHOOK_URL` is not set, skip with a warning and do not fail

**Checkpoint**: `wiki/index.md` has 3 new Codex CLI entries, `wiki/log.md` has a new record, and Slack notification was sent (or skipped gracefully).

---

## Phase 7: Polish & Cross-Cutting Concerns

**Purpose**: Final validation across all pages.

- [x] T035 [P] Validate frontmatter in `wiki/ko/codex-cli/index.md`, `wiki/en/codex-cli/index.md`, and `wiki/ja/codex-cli/index.md`: confirm `source_count: 0`, `status: active`, `date_modified: 2026-05-15`, and no required fields are missing or null
- [x] T036 [P] Confirm no template placeholder text (`{{...}}`, `[NEEDS CLARIFICATION]`, lorem ipsum, or ACTION REQUIRED comments) remains in any of the three wiki pages
- [x] T037 Verify cross-language equivalence: confirm all three pages have the same 8 content areas, no page is a summary or subset of another, and Codex CLI version (0.130.0) is consistently cited

---

## Dependencies & Execution Order

### Phase Dependencies

- **Setup (Phase 1)**: No dependencies — start immediately; T001–T003 all parallel
- **Foundational (Phase 2)**: Depends on Phase 1 — read-only, no file creation; T004–T005 sequential (read in order)
- **US1 Korean (Phase 3)**: Depends on Phase 2 — must complete before US2 and US3 begin (Korean is the primary reference)
- **US2 English (Phase 4)**: Depends on Phase 3 completion — Korean page is the structural reference
- **US3 Japanese (Phase 5)**: Depends on Phase 3 completion — Korean page is the structural reference; can run in parallel with US2
- **US4 Index/Log (Phase 6)**: Depends on Phases 3, 4, 5 all complete — all three pages must exist before index entries are added
- **Polish (Phase 7)**: Depends on Phase 6 — all pages and records complete

### User Story Dependencies

- **US1 (P1)**: No story dependencies — start after Foundational
- **US2 (P2)**: Depends on US1 complete (use Korean as structural reference)
- **US3 (P3)**: Depends on US1 complete; can run in parallel with US2
- **US4 (P4)**: Depends on US1 + US2 + US3 all complete

### Within Each User Story

- Frontmatter task first (T006/T014/T022) — establishes the file
- Content sections in order: Overview → Key Features → Use Cases → Quick Start → Limitations → References
- Final review task last (T013/T021/T029)

### Parallel Opportunities

- T001, T002, T003 (Phase 1): All parallel — different directories
- T002 and T003: Parallel with each other
- US2 (T014–T021) and US3 (T022–T029): Parallel once US1 is complete
- T030, T031, T032 (Phase 6 index entries): Parallel — different sections of index.md
- T035, T036 (Phase 7): Parallel — different validation concerns

---

## Parallel Example: Phases 4 & 5 (after US1 complete)

```text
# Both can run simultaneously once wiki/ko/codex-cli/index.md is done:

Agent A: US2 English page (T014–T021)
  → wiki/en/codex-cli/index.md

Agent B: US3 Japanese page (T022–T029)
  → wiki/ja/codex-cli/index.md
```

---

## Implementation Strategy

### MVP First (User Story 1 Only)

1. Complete Phase 1: Setup (T001–T003)
2. Complete Phase 2: Foundational (T004–T005)
3. Complete Phase 3: US1 Korean page (T006–T013)
4. **STOP and VALIDATE**: Open `wiki/ko/codex-cli/index.md` and confirm independent test passes
5. If validated, proceed to US2 + US3 in parallel

### Incremental Delivery

1. Phase 1 + 2 → directories created, template understood
2. Phase 3 (US1) → Korean page complete — MVP delivered
3. Phase 4 + 5 in parallel → English and Japanese pages complete
4. Phase 6 → index.md updated, log.md updated, Slack sent
5. Phase 7 → cross-language validation passes

### Single-Agent Sequential Strategy

T001 → T002 → T003 → T004 → T005 → T006 → T007 → T008 → T009 → T010 → T011 → T012 → T013 → T014 → T015 → T016 → T017 → T018 → T019 → T020 → T021 → T022 → T023 → T024 → T025 → T026 → T027 → T028 → T029 → T030 → T031 → T032 → T033 → T034 → T035 → T036 → T037

---

## Notes

- `raw/` directory MUST NOT be modified — content is authored from publicly available Codex CLI documentation per `specs/007-codex-cli-docs/research.md`
- All `source_count` values MUST be `0` (no raw/ files referenced)
- Slack notification (T034) gracefully skips if `SLACK_WEBHOOK_URL` is not set — do not fail the task
- Version: cite Codex CLI 0.130.0 consistently across all three language pages
- Each story is independently testable: validate before moving to the next priority
