# Feature Specification: GitBook Wiki Ready

**Feature Branch**: `006-gitbook-wiki-ready`

**Created**: 2026-05-15

**Status**: Draft

## User Scenarios & Testing *(mandatory)*

### User Story 1 — Configure GitBook Sync for Each Locale Space (Priority: P1)

A wiki maintainer needs each locale directory (`wiki/ko`, `wiki/en`, `wiki/ja`) to be recognizable by GitBook as a valid project root, so that GitBook Git Sync can connect each existing Space to its corresponding directory without reconfiguration.

**Why this priority**: Without `.gitbook.yaml`, GitBook cannot locate `README.md` or `SUMMARY.md`, making the entire sync unusable. All other stories depend on this.

**Independent Test**: Add `.gitbook.yaml` to one locale directory and confirm GitBook Space can detect the root, readme, and summary without error.

**Acceptance Scenarios**:

1. **Given** `wiki/ko/.gitbook.yaml` exists with `root: ./` and `structure: {readme: README.md, summary: SUMMARY.md}`, **When** GitBook Git Sync reads the directory, **Then** it identifies `wiki/ko/README.md` as the home page and `wiki/ko/SUMMARY.md` as the navigation source.
2. **Given** the same setup for `wiki/en` and `wiki/ja`, **When** their respective Spaces sync, **Then** each Space loads its own locale content independently.
3. **Given** an existing `.gitbook.yaml` with incorrect `root`, **When** the file is corrected and pushed, **Then** GitBook re-syncs successfully on the next push.

---

### User Story 2 — Navigate Wiki Articles Through GitBook Sidebar (Priority: P1)

A reader using GitBook wants to browse all published wiki articles through the sidebar without needing to know file paths, so that documentation is discoverable and well-organized.

**Why this priority**: SUMMARY.md controls the entire GitBook sidebar. Without it, articles are invisible to readers.

**Independent Test**: Add `SUMMARY.md` to one locale, sync with GitBook, and confirm the sidebar lists all existing articles grouped by category in numeric order.

**Acceptance Scenarios**:

1. **Given** `wiki/ko/SUMMARY.md` lists all articles under their category sections, **When** a user opens the Korean GitBook Space, **Then** the sidebar shows every article grouped by tool/category folder with human-readable labels.
2. **Given** `wiki/ko/openui/introduction.md` exists and is listed in `SUMMARY.md`, **When** a user clicks it in the sidebar, **Then** the page loads correctly.
3. **Given** numeric filenames like `001-toast.md`, **When** the sidebar renders them, **Then** labels show clean names (e.g., "Toast") without the numeric prefix.
4. **Given** a new article is added to `wiki/ko/openui/` but not added to `SUMMARY.md`, **When** a PR is opened, **Then** the validation check fails with a clear error identifying the missing entry.

---

### User Story 3 — Land on a Meaningful Home Page per Locale (Priority: P2)

A reader who opens a GitBook Space lands on a home page that introduces the wiki's purpose and content for that language, so they understand what documentation is available and how it is organized.

**Why this priority**: Without `README.md`, GitBook shows a blank or error page. The home page is the first impression of the wiki.

**Independent Test**: Add `README.md` to one locale directory, sync, and confirm GitBook renders it as the Space landing page.

**Acceptance Scenarios**:

1. **Given** `wiki/ko/README.md` exists with an introduction, **When** a user navigates to the Korean Space root, **Then** the home page renders the introduction content.
2. **Given** `wiki/en/README.md` and `wiki/ja/README.md` exist in English and Japanese respectively, **When** users visit each Space, **Then** each home page is in the correct language.

---

### User Story 4 — Understand Category Content via Category Overview Pages (Priority: P2)

A reader who opens a category in the sidebar sees a brief overview of what that category covers, so they can decide which articles to read without opening each one.

**Why this priority**: Category `README.md` pages improve discoverability and are linked from `SUMMARY.md`. They are not blocking but significantly improve quality.

**Independent Test**: Add `wiki/ko/openui/README.md`, reference it in `SUMMARY.md`, and confirm it renders as the category overview page in GitBook.

**Acceptance Scenarios**:

1. **Given** `wiki/ko/openui/README.md` exists, **When** a user clicks "OpenUI" in the sidebar, **Then** they see a description of what OpenUI is and what articles are in the section.
2. **Given** a category folder has no `README.md`, **When** validation runs, **Then** a warning (non-blocking) is emitted identifying the missing overview page.

---

### User Story 5 — Detect Missing or Mismatched Locale Files in Pull Requests (Priority: P3)

A contributor who adds a new article to one locale (e.g., Korean) is warned when the equivalent article is missing in the other locales (English and Japanese), so the wiki stays consistent across languages.

**Why this priority**: Locale consistency is important but not blocking for the initial GitBook sync. Validation can be added incrementally.

**Independent Test**: Add an article to `wiki/ko/openui/` without adding equivalents to `wiki/en/openui/` and `wiki/ja/openui/`, open a PR, and confirm the workflow reports the missing locale counterparts.

**Acceptance Scenarios**:

1. **Given** `wiki/ko/openui/new-article.md` exists but `wiki/en/openui/new-article.md` and `wiki/ja/openui/new-article.md` do not, **When** a PR is opened or pushed to `main`, **Then** the GitHub Actions workflow lists the missing locale counterparts.
2. **Given** all three locale counterparts exist for every article, **When** a PR runs validation, **Then** no locale-mismatch errors are reported.

---

### Edge Cases

- What happens when a category folder exists but contains only `.gitkeep` and no real articles? The folder should be excluded from `SUMMARY.md` and not cause validation errors.
- What happens when an article filename contains spaces or non-ASCII characters? Validation should flag these as warnings since GitBook may not handle them correctly.
- What happens when `SUMMARY.md` references a file path that does not exist? Validation must fail with the exact broken link path listed.
- What happens when the wiki has nested sub-category folders beyond one level deep? Assumed out of scope for v1; single-level category folders only.

## Requirements *(mandatory)*

### Functional Requirements

- **FR-001**: Each locale directory (`wiki/ko`, `wiki/en`, `wiki/ja`) MUST contain a `.gitbook.yaml` file with `root: ./`, `structure.readme: README.md`, and `structure.summary: SUMMARY.md`.
- **FR-002**: Each locale directory MUST contain a `README.md` that serves as the GitBook Space home page in the appropriate language.
- **FR-003**: Each locale directory MUST contain a `SUMMARY.md` that lists all articles grouped by category folder, preserving numeric filename order.
- **FR-004**: `SUMMARY.md` MUST display human-readable labels for articles, removing numeric prefixes and hyphens from filenames (e.g., `001-introduction.md` → "Introduction").
- **FR-005**: `SUMMARY.md` MUST include a link to the locale `README.md` as the first entry.
- **FR-006**: `SUMMARY.md` MUST include a link to a category `README.md` when that file exists in the category folder.
- **FR-007**: Category folders MUST support a `README.md` overview page; its presence is validated but its absence produces a warning, not a failure.
- **FR-008**: A validation script MUST verify that every `.md` article in each locale directory is referenced in the corresponding `SUMMARY.md`.
- **FR-009**: A validation script MUST verify that every link in each `SUMMARY.md` points to a file that exists on disk.
- **FR-010**: A validation script MUST verify that for every article in one locale, equivalent paths exist in all other locales.
- **FR-011**: A GitHub Actions workflow MUST run validation on `pull_request` and on `push` to `main`, triggered only when files under `wiki/**` change.
- **FR-012**: The GitHub Actions workflow MUST check markdown formatting, broken links in `SUMMARY.md`, SUMMARY.md coverage, missing locale counterpart files, and missing category `README.md` files.
- **FR-013**: Category folders that contain only `.gitkeep` and no real `.md` articles MUST be excluded from `SUMMARY.md` and MUST NOT trigger validation failures.
- **FR-014**: Existing files in `wiki/ko`, `wiki/en`, and `wiki/ja` MUST NOT be moved, renamed, or deleted as part of this feature.

### Key Entities

- **Locale Directory**: One of `wiki/ko`, `wiki/en`, `wiki/ja`; maps 1:1 to a GitBook Space.
- **GitBook Configuration**: `.gitbook.yaml` per locale directory; tells GitBook where to find the home page and navigation.
- **SUMMARY.md**: Navigation manifest per locale; defines the GitBook sidebar structure and article order.
- **Category Folder**: A sub-directory within a locale directory (e.g., `openui/`, `claude/`) grouping related articles.
- **Category README**: Optional overview page at the root of a category folder.
- **Validation Script**: A standalone script that checks structural integrity of a locale directory.
- **GitHub Actions Workflow**: CI definition that runs validation scripts on relevant wiki changes.

## Success Criteria *(mandatory)*

### Measurable Outcomes

- **SC-001**: All three GitBook Spaces sync without errors after the feature is merged — 0 sync errors across ko, en, ja.
- **SC-002**: 100% of existing articles appear in the GitBook sidebar for each locale without manual intervention.
- **SC-003**: A pull request that adds an article to one locale but omits it from `SUMMARY.md` fails CI within 2 minutes of being opened.
- **SC-004**: A pull request that adds an article to one locale but omits the counterpart in other locales reports a warning within 2 minutes of being opened.
- **SC-005**: All existing wiki files remain at their current paths after the feature is merged — 0 files moved or renamed.
- **SC-006**: Validation scripts complete a full wiki check in under 30 seconds on the current file set.

## Assumptions

- GitBook Spaces for Korean, English, and Japanese are already created and connected to this repository via GitBook Git Sync; no new Space creation is needed.
- GitHub is the source of truth; changes flow GitHub → GitBook, not the reverse.
- Category folders are single-level only (e.g., `wiki/ko/openui/`); nested sub-categories are out of scope.
- `.gitkeep` files in empty category folders are placeholders and should be ignored by validation and excluded from `SUMMARY.md`.
- The legacy `gitbook-cli` package is not used; any tooling uses only the GitBook YAML configuration format supported by the current GitBook Git Sync.
- The validation scripts run in a standard POSIX shell environment available in GitHub Actions (Ubuntu runner).
- Article filenames follow the pattern `NNN-slug.md` or plain `slug.md`; filenames with spaces are treated as warnings, not failures.
- The `wiki/index.md` and `wiki/log.md` at the root of `wiki/` are not part of any GitBook Space and are excluded from locale validation.
