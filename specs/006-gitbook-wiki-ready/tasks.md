# Tasks: GitBook Wiki Ready

**Input**: Design documents from `specs/006-gitbook-wiki-ready/`

**Prerequisites**: plan.md ✅ | spec.md ✅ | research.md ✅ | data-model.md ✅ | contracts/ ✅ | quickstart.md ✅

**Organization**: Tasks grouped by user story to enable independent implementation and delivery.

## Format: `[ID] [P?] [Story] Description`

- **[P]**: Can run in parallel (different files, no dependencies)
- **[Story]**: Maps to user story in spec.md (US1–US5)

---

## Phase 1: Setup

**Purpose**: Markdown linting configuration used by the GitHub Actions workflow (US5).

- [x] T001 Create `wiki/.markdownlint.yaml` with rules: disable MD013 (line-length), MD033 (inline HTML), MD041 (first-line heading); enable all other defaults

---

## Phase 2: Foundational — Locale Home Pages (covers US3)

**Purpose**: `README.md` files at each locale root are required by `.gitbook.yaml` (US1) and linked from `SUMMARY.md` (US2). Must exist before those phases.

**⚠️ CRITICAL**: Phases 3, 4, and 5 cannot be validated until this phase is complete.

- [x] T002 [P] Add `wiki/ko/README.md` — Korean Space home page. Content: H1 title "카미 기술 위키", one-paragraph introduction explaining this is the Korean AI tools knowledge base, note that GitHub is the source of truth and GitBook is the viewer.
- [x] T003 [P] Add `wiki/en/README.md` — English Space home page. Content: H1 title "Kami Tech Wiki", one-paragraph introduction explaining this is the English AI tools knowledge base, note that GitHub is the source of truth and GitBook is the viewer.
- [x] T004 [P] Add `wiki/ja/README.md` — Japanese Space home page. Content: H1 title "カミ テクノロジー ウィキ", one-paragraph introduction explaining this is the Japanese AI tools knowledge base, note that GitHub is the source of truth and GitBook is the viewer.

**Checkpoint**: All three locale `README.md` files exist. US3 is now complete.

---

## Phase 3: US1 — GitBook Configuration (Priority: P1)

**Goal**: Each locale directory is recognized as a valid GitBook project root. GitBook Git Sync can connect each Space to its locale directory without any reconfiguration.

**Independent Test**: Add `.gitbook.yaml` to one locale, sync that Space, and confirm GitBook identifies `README.md` as the home page and `SUMMARY.md` as the navigation source without error.

- [x] T005 [P] [US1] Add `wiki/ko/.gitbook.yaml` — exact content per `contracts/gitbook-config.md`: `root: ./` and `structure: {readme: README.md, summary: SUMMARY.md}`
- [x] T006 [P] [US1] Add `wiki/en/.gitbook.yaml` — same content as T005
- [x] T007 [P] [US1] Add `wiki/ja/.gitbook.yaml` — same content as T005

**Checkpoint**: All three `.gitbook.yaml` files exist with correct content. GitBook can discover each Space's home page and navigation.

---

## Phase 4: US4 — Category Overview Pages (Priority: P2)

**Purpose**: Category `README.md` files must be created before `SUMMARY.md` is generated in Phase 5, because `SUMMARY.md` links to them. Creating them here also ensures the validate-summary-links check passes immediately after Phase 5.

**Goal**: Each non-empty category folder has an overview page explaining its contents.

**Independent Test**: Add `wiki/ko/openui/README.md`, reference it in `SUMMARY.md`, and confirm GitBook renders it as the OpenUI category landing page.

- [x] T008 [P] [US4] Add `wiki/ko/openui/README.md` — OpenUI category overview in Korean. Content: H1 "OpenUI", one paragraph describing what OpenUI is (open-source AI UI generation tool), brief list of what articles are in this section.
- [x] T009 [P] [US4] Add `wiki/en/openui/README.md` — OpenUI category overview in English. Same structure as T008, in English.
- [x] T010 [P] [US4] Add `wiki/ja/openui/README.md` — OpenUI category overview in Japanese. Same structure as T008, in Japanese.
- [x] T011 [US4] Add `wiki/ko/claude/README.md` — Claude category overview in Korean. Content: H1 "Claude", one paragraph describing Anthropic Claude, brief list of articles in this section. (Note: `wiki/en/claude/` and `wiki/ja/claude/` contain only `.gitkeep` — no articles — so no category README is needed there yet.)

**Checkpoint**: All active category folders with articles now have `README.md` overview pages.

---

## Phase 5: US2 — SUMMARY.md Navigation (Priority: P1)

**Goal**: Each locale has a complete `SUMMARY.md` that drives the GitBook sidebar, listing all articles grouped by category with human-readable labels.

**Independent Test**: Add `SUMMARY.md` to one locale, sync GitBook, and confirm the sidebar shows all articles grouped by category in correct order with clean labels.

Follow the contract in `contracts/summary-format.md` for exact format.

- [x] T012 [P] [US2] Add `wiki/ko/SUMMARY.md` with the following structure:
  ```
  # Summary

  * [Introduction](README.md)

  ## Claude

  * [Claude Overview](claude/README.md)
  * [Overview](claude/overview.md)

  ## OpenUI

  * [OpenUI Overview](openui/README.md)
  * [Introduction](openui/introduction.md)
  * [Overview](openui/overview.md)
  * [Architecture](openui/architecture.md)
  * [Quickstart](openui/quickstart.md)
  * [Chat Introduction](openui/chat-introduction.md)
  * [Chat GenUI](openui/chat-genui.md)
  * [Benchmarks](openui/benchmarks.md)
  * [Example Vercel AI Chat](openui/example-vercel-ai-chat.md)
  * [System Prompts](openui/system-prompts.md)
  * [API Reference Overview](openui/api-reference-overview.md)
  * [API Reference React UI](openui/api-reference-react-ui.md)
  * [Specification V05](openui/specification-v05.md)
  * [Index](openui/index.md)
  ```

- [x] T013 [P] [US2] Add `wiki/en/SUMMARY.md` with the following structure:
  ```
  # Summary

  * [Introduction](README.md)

  ## OpenUI

  * [OpenUI Overview](openui/README.md)
  * [Introduction](openui/introduction.md)
  * [Overview](openui/overview.md)
  * [Architecture](openui/architecture.md)
  * [Quickstart](openui/quickstart.md)
  * [Chat Introduction](openui/chat-introduction.md)
  * [Chat GenUI](openui/chat-genui.md)
  * [Benchmarks](openui/benchmarks.md)
  * [Example Vercel AI Chat](openui/example-vercel-ai-chat.md)
  * [System Prompts](openui/system-prompts.md)
  * [API Reference Overview](openui/api-reference-overview.md)
  * [API Reference React UI](openui/api-reference-react-ui.md)
  * [Specification V05](openui/specification-v05.md)
  * [Index](openui/index.md)
  ```

- [x] T014 [P] [US2] Add `wiki/ja/SUMMARY.md` — same structure as `wiki/en/SUMMARY.md` (Japanese locale has the same openui articles; no claude articles yet)

**Checkpoint**: All three SUMMARY.md files exist and link to every article. GitBook sidebar navigation is complete for all locales.

---

## Phase 6: US5 — Validation Scripts and GitHub Actions (Priority: P3)

**Goal**: Contributors are warned automatically in PRs when articles are missing from `SUMMARY.md`, when SUMMARY links are broken, or when locale counterparts are missing.

**Independent Test**: Add an article to `wiki/ko/openui/` without updating `SUMMARY.md`, run `bash .wiki/scripts/validate-wiki.sh`, and confirm it exits non-zero with a clear error message.

- [x] T015 [P] [US5] Add `.wiki/scripts/validate-summary-coverage.sh` — checks every `.md` file in a locale (excluding `SUMMARY.md`, locale root `README.md`, category `README.md`, and `.gitkeep`-only folders) is listed in `SUMMARY.md`. Accepts locale path as argument. Exits 1 on failure with message listing uncovered files.
- [x] T016 [P] [US5] Add `.wiki/scripts/validate-summary-links.sh` — parses all `(path)` entries in `SUMMARY.md` and verifies each path resolves to an existing file relative to the locale root. Accepts locale path as argument. Exits 1 on failure with message listing broken paths.
- [x] T017 [P] [US5] Add `.wiki/scripts/validate-category-readmes.sh` — checks each category folder with at least one non-README `.md` article has a `README.md`. Accepts locale path as argument. Exits 0 but prints a warning listing folders missing README.
- [x] T018 [P] [US5] Add `.wiki/scripts/validate-locale-parity.sh` — for every `.md` article (excluding `README.md`, `SUMMARY.md`) in `wiki/ko`, checks whether a matching path exists in `wiki/en` and `wiki/ja`. Exits 0 but prints a warning listing missing counterparts.
- [x] T019 [US5] Add `.wiki/scripts/validate-wiki.sh` — main runner that invokes T015–T018 for all three locales (`wiki/ko`, `wiki/en`, `wiki/ja`) and prints a pass/fail summary. Exits 1 if any check exits 1. Depends on T015–T018.
- [x] T020 [US5] Add `.github/workflows/wiki-validation.yml` — GitHub Actions workflow triggered on `pull_request` and `push` to `main` with path filter `wiki/**`. Runner: `ubuntu-22.04`. Steps: (1) checkout, (2) run `markdownlint-cli2` via `DavidAnson/markdownlint-cli2-action@v16` on `wiki/**/*.md`, (3) run `lycheeverse/lychee-action@v2` on `wiki/**/*.md` scoped to local links only, (4) run `bash .wiki/scripts/validate-wiki.sh`. Depends on T019.

**Checkpoint**: CI runs on every PR touching `wiki/**`. Missing SUMMARY entries and broken links cause PR failure.

---

## Phase 7: Polish

**Purpose**: Finalize records and documentation to complete the wiki operation lifecycle per CLAUDE.md rules.

- [x] T021 Append entry to `wiki/log.md` in format `## [2026-05-15 HH:MM] ingest | GitBook Wiki Ready — added .gitbook.yaml, README.md, SUMMARY.md, category READMEs, validation scripts, and CI workflow`
- [x] T022 Update `wiki/index.md` to add a note that each locale directory now contains `.gitbook.yaml`, `README.md`, and `SUMMARY.md` and is synced to a GitBook Space

---

## Dependencies & Execution Order

### Phase Dependencies

- **Phase 1 (Setup)**: No dependencies — start immediately
- **Phase 2 (Foundational)**: Depends on Phase 1 — BLOCKS Phase 3, 4, 5
- **Phase 3 (US1 — .gitbook.yaml)**: Depends on Phase 2 (README.md must exist)
- **Phase 4 (US4 — Category READMEs)**: Depends on Phase 2 — must complete before Phase 5
- **Phase 5 (US2 — SUMMARY.md)**: Depends on Phase 2 AND Phase 4 (all linked files must exist)
- **Phase 6 (US5 — Validation + CI)**: Depends on Phase 5 (SUMMARY.md must exist to test coverage)
- **Phase 7 (Polish)**: Depends on all preceding phases

### User Story Dependencies

| Story | Phase | Depends On | Note |
|-------|-------|------------|------|
| US3 (README.md) | Phase 2 | Phase 1 | Promoted to Foundational — blocks US1 and US2 |
| US1 (.gitbook.yaml) | Phase 3 | Phase 2 | All three locale tasks are fully parallel |
| US4 (Category READMEs) | Phase 4 | Phase 2 | Must finish before US2 to avoid broken SUMMARY links |
| US2 (SUMMARY.md) | Phase 5 | Phase 2 + Phase 4 | All three locale tasks are fully parallel |
| US5 (Validation + CI) | Phase 6 | Phase 5 | T015–T018 parallel; T019 after them; T020 after T019 |

### Parallel Opportunities

- **Phase 2**: T002, T003, T004 — all different files, fully parallel
- **Phase 3**: T005, T006, T007 — all different files, fully parallel
- **Phase 4**: T008, T009, T010 — all different files, fully parallel; T011 sequential (depends on its own file)
- **Phase 5**: T012, T013, T014 — all different files, fully parallel
- **Phase 6**: T015–T018 fully parallel; T019 after all of them; T020 after T019

---

## Parallel Example: Phase 2 (Foundational)

```
# All three locale README.md files can be created simultaneously:
Task T002: wiki/ko/README.md
Task T003: wiki/en/README.md
Task T004: wiki/ja/README.md
```

## Parallel Example: Phase 5 (US2 — SUMMARY.md)

```
# All three SUMMARY.md files can be created simultaneously:
Task T012: wiki/ko/SUMMARY.md
Task T013: wiki/en/SUMMARY.md
Task T014: wiki/ja/SUMMARY.md
```

---

## Implementation Strategy

### MVP (User Stories 1 + 3 only — minimum for GitBook sync)

1. Complete Phase 1: Setup
2. Complete Phase 2: Foundational (README.md) — US3 done ✅
3. Complete Phase 3: US1 (.gitbook.yaml) — US1 done ✅
4. **STOP and VALIDATE**: Open GitBook Space, confirm sync detects locale root and home page
5. Add Phase 5 (SUMMARY.md) for full sidebar — US2 done ✅

### Full Delivery (all user stories)

1. Phase 1 → 2 → 3 → 4 → 5 → 6 → 7
2. Each phase checkpoint verifies independent functionality before proceeding

---

## Notes

- No files under `wiki/` are moved, renamed, or deleted — FR-014 strictly observed
- `.gitkeep`-only folders (`chatgpt/`, `gemini/`, `graphify/`, `open-ui/`, `en/claude/`, `ja/claude/`) are excluded from all SUMMARY.md files and all validation checks
- `wiki/ko/openui/index.md` is an article (not a category README) — it appears in SUMMARY.md as "Index"
- Validation scripts exit 1 (fail CI) for: uncovered articles, broken SUMMARY links — exit 0 with warning for: missing category READMEs, missing locale counterparts
