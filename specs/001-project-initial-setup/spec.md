# Feature Specification: Personal Tech Wiki Initial Setup

**Feature Branch**: `001-project-initial-setup`

**Created**: 2026-05-15

**Status**: Draft

**Input**: User description: "initial options for current project - spec kit extensions: token-analyzer set optional: false, check extensions.yml file - update README.md about this project: point is 'this project is my tech wiki'"

## User Scenarios & Testing *(mandatory)*

### User Story 1 - Browse and Maintain Multilingual Wiki Content (Priority: P1)

The wiki owner (user) maintains a personal tech wiki following the LLM wiki pattern. The LLM incrementally builds and maintains a persistent, interlinked collection of markdown files across three languages (Korean, English, Japanese). The user curates sources; the LLM handles all writing, cross-referencing, and maintenance.

**Why this priority**: This is the core purpose of the project — a personal knowledge base that compounds over time rather than re-deriving knowledge on every query.

**Independent Test**: Can be tested by adding a source document and verifying that the LLM creates/updates wiki pages in the appropriate language folder with proper cross-references.

**Acceptance Scenarios**:

1. **Given** a new source article about Claude in Korean, **When** the user asks the LLM to ingest it, **Then** a summary page is created under `wiki/ko/claude/`, the index is updated, and related tool pages (e.g., `wiki/ko/chatgpt/`) are cross-linked where relevant.
2. **Given** wiki content exists under `wiki/ko/gemini/`, **When** the user requests an English version, **Then** the content is available under `wiki/en/gemini/` and linked from the main index.
3. **Given** the wiki has grown to 50+ pages, **When** the user runs a lint operation, **Then** orphan pages, stale claims, and missing cross-references are identified.

---

### User Story 2 - Slack Notification on Wiki Generation (Priority: P2)

When new wiki content is generated or significantly updated, a Slack message is automatically sent to notify the user.

**Why this priority**: Enables async awareness of wiki updates without actively monitoring the file system.

**Independent Test**: Can be tested by generating a new wiki page and confirming a Slack message is received with the page title and summary.

**Acceptance Scenarios**:

1. **Given** the user instructs the LLM to ingest a source, **When** the wiki generation is complete, **Then** a Slack message is sent containing the names of created/updated pages.
2. **Given** a Slack notification is triggered, **When** the message is received, **Then** it includes: page title, operation type (ingest/update/lint), and a brief summary.

---

### User Story 3 - Token Usage Tracking (Priority: P2)

Token consumption is tracked at every Spec Kit workflow boundary (specify, plan, tasks, implement) using the token-analyzer extension, which is mandatory (not optional).

**Why this priority**: Ensures cost visibility and prevents unbounded token spend. The constitution's "Local-First & Cost-Aware" principle requires this.

**Independent Test**: Can be tested by running any Spec Kit command and verifying a token baseline is captured automatically without manual invocation.

**Acceptance Scenarios**:

1. **Given** the token-analyzer extension is set to `optional: false` in `extensions.yml`, **When** any `after_*` hook fires, **Then** token metrics are captured automatically.
2. **Given** multiple workflow phases have been run, **When** the user runs `/speckit-token-analyzer-report`, **Then** a comparison of token usage across phases is available.

---

### Edge Cases

- What happens when the Slack webhook is unavailable at notification time?
- How does the wiki handle a source that is in a language not covered by the i18n structure (e.g., Japanese-only source when only KO/EN folders exist)?
- What happens when a wiki page in one language contradicts the equivalent page in another language?

## Requirements *(mandatory)*

### Functional Requirements

- **FR-001**: The `extensions.yml` file MUST set the `token-analyzer` extension hooks to `optional: false` for all `after_*` events where it is registered.
- **FR-001a**: Token-analyzer baseline results MUST be stored under `specs/<feature-dir>/token-reports/` so that cost data is co-located with the feature spec it belongs to.
- **FR-002**: The `README.md` MUST be updated to describe this repository as the user's personal tech wiki, not a generic template.
- **FR-003**: The wiki MUST use a language-separated folder structure supporting Korean (`ko/`), English (`en/`), and Japanese (`ja/`) under a top-level `wiki/` directory.
- **FR-004**: The wiki MUST follow the LLM wiki pattern: raw sources are immutable, the LLM owns and maintains all wiki markdown files, and a `CLAUDE.md` schema governs LLM behavior.
- **FR-005**: The wiki MUST maintain a content-oriented `wiki/index.md` and a chronological `wiki/log.md` as navigation artifacts.
- **FR-006**: A Slack notification MUST be sent when the LLM completes a wiki ingest or significant update operation.
- **FR-007**: Each language subfolder MUST mirror the same tool/service-based category structure. Categories are named after the AI tool or service they cover (e.g., `chatgpt/`, `claude/`, `gemini/`, `open-ui/`, `graphify/`). New tool folders are added as the wiki grows. Each language folder mirrors the same set of tool subfolders.
- **FR-008**: Raw source documents MUST be stored under a `raw/` directory, immutable and separate from the wiki.

### Key Entities

- **Wiki Page**: A LLM-maintained markdown file under `wiki/<lang>/`, with optional YAML frontmatter (tags, date, source count), cross-links to related pages.
- **Raw Source**: An immutable input document (article, paper, note) stored under `raw/`, never modified by the LLM.
- **Language Folder**: One of `wiki/ko/`, `wiki/en/`, `wiki/ja/` — each containing the same set of tool/service subfolders (e.g., `claude/`, `chatgpt/`, `gemini/`, `open-ui/`, `graphify/`).
- **Tool Folder**: A named subdirectory under a language folder representing one AI tool or service (e.g., `wiki/ko/claude/`). Pages inside cover features, updates, comparisons, and usage notes for that tool.
- **Index**: `wiki/index.md` — content catalog updated on every ingest, organized by language and tool/service name.
- **Log**: `wiki/log.md` — append-only chronological record of all operations (ingest, query, lint).
- **Schema**: `CLAUDE.md` — the LLM behavior specification governing wiki maintenance conventions.
- **Token Report**: A baseline metrics file stored under `specs/<feature>/token-reports/`, capturing token usage per workflow phase (specify, plan, tasks, implement).

## Success Criteria *(mandatory)*

### Measurable Outcomes

- **SC-001**: Token usage is captured automatically on every workflow phase completion — zero manual invocations required.
- **SC-002**: Slack notification is delivered within 60 seconds of wiki generation completing.
- **SC-003**: Wiki content is browsable and cross-linked across all three languages (Korean, English, Japanese) from a single index.
- **SC-004**: The README clearly identifies this project as a personal tech wiki to any first-time visitor — without referencing the original template.
- **SC-005**: A new source can be ingested and reflected in the wiki (summary page + index update) within one LLM session.

## Assumptions

- The Slack workspace and webhook URL are already configured and accessible.
- The user is the sole maintainer; no multi-user collaboration or permission model is required.
- Obsidian (or equivalent markdown reader) is used as the reading interface — the wiki is optimized for markdown rendering.
- The primary language for wiki creation will be Korean (`ko/`), with English (`en/`) as the secondary language and Japanese (`ja/`) as tertiary.
- Translation between languages is done on-demand by the LLM, not automatically on every ingest.
- The LLM wiki pattern is the authoritative design reference for wiki structure and operations.
- Mobile support is out of scope; the wiki is desktop-only.
- **Bun** (v1.2.22) is the chosen runtime and package manager (`bun install`, `bun run`). npm, pnpm, and yarn are not used in this project.
- Dependency versions are pinned exactly: `@types/bun@1.3.14`, `typescript@6.0.3`. No `^`, `~`, or `latest` ranges.

## Clarifications

### Session 2026-05-15

- Q: Should Slack notifications be sent for every minor wiki edit, or only for ingest/lint operations? → A: Only for ingest and significant update operations (not minor cross-reference edits).
- Q: What is the preferred i18n folder structure? → A: Language-separated subfolders under `wiki/`: `wiki/ko/`, `wiki/en/`, `wiki/ja/`, each with mirrored category structure.
- Q: Should the wiki follow the LLM wiki pattern? → A: Yes — LLM owns all wiki content; user curates sources; CLAUDE.md is the schema; `index.md` and `log.md` are navigation artifacts.
- Q: How should wiki content be categorized within each language folder? → A: By tool/service name (e.g., `chatgpt/`, `claude/`, `gemini/`, `open-ui/`, `graphify/`). Each language folder mirrors the same set of tool subfolders.
- Q: Where should token-analyzer results be stored? → A: `specs/<feature>/token-reports/` — per-feature directory, co-located with the spec.
- Q: What package manager and runtime should be used? → A: Bun — `package.json` initialized with `bun init`.
- Q: Should dependency versions be pinned? → A: Yes — exact versions: `@types/bun@1.3.14`, `typescript@6.0.3`. No ranges.
