# Research: GitBook Wiki Ready

## Decision 1 — GitBook Git Sync Configuration Format

**Decision**: Use `.gitbook.yaml` at each locale root with `root: ./`, `structure.readme: README.md`, `structure.summary: SUMMARY.md`.

**Rationale**: GitBook Git Sync reads `.gitbook.yaml` to locate the Space home page (`README.md`) and navigation manifest (`SUMMARY.md`). Setting `root: ./` means the locale directory itself is the GitBook project root, matching the one-Space-per-locale design.

**Alternatives considered**:
- Single `.gitbook.yaml` at repo root with a `root:` pointing to `wiki/ko` — rejected because GitBook Git Sync supports one config per Space, and each locale is a separate Space.
- No `.gitbook.yaml` (relying on GitBook defaults) — rejected because GitBook defaults expect `README.md` and `SUMMARY.md` at the repo root, not a subdirectory.

---

## Decision 2 — SUMMARY.md Format

**Decision**: Use standard GitBook Markdown summary format: `# Summary` header, `* [Label](path)` list items, `## Section` headings for category groups.

**Rationale**: GitBook Git Sync parses `SUMMARY.md` using this exact format to build the sidebar. Deviating from it causes sync errors.

**Label derivation rule**: Strip numeric prefix and hyphens from filenames, then title-case each word. Example: `001-api-reference-overview.md` → "API Reference Overview". Category folders use their folder name title-cased.

**Alternatives considered**:
- Using `{% hint %}` or GitBook-specific block syntax — rejected; those are content features, not navigation.

---

## Decision 3 — Markdown Linting Tool

**Decision**: Use `markdownlint-cli2` via the `DavidAnson/markdownlint-cli2-action@v16` GitHub Action.

**Rationale**: `markdownlint-cli2` is actively maintained, supports per-directory config files (`.markdownlint.yaml`), and integrates natively with GitHub Actions. It catches common markdown formatting issues (inconsistent headers, trailing spaces, bare URLs).

**Alternatives considered**:
- `markdownlint-cli` (v1) — older; `markdownlint-cli2` is the recommended successor.
- `remark-lint` — more powerful but heavier setup; overkill for this use case.

---

## Decision 4 — Link Checking Tool

**Decision**: Use `lychee-action` (`lycheeverse/lychee-action@v2`) for broken link detection.

**Rationale**: Lychee is a Rust-based link checker — fast, no Node.js dependency, and natively handles relative markdown links. It can be scoped to `wiki/**` only and supports excluding anchor links and external URLs.

**Configuration**: Run with `--no-progress --include-verbatim` targeting `wiki/**/*.md`. Exclude external URLs to avoid false positives from rate-limited registries.

**Alternatives considered**:
- `markdown-link-check` (npm) — widely used but requires Node setup in CI; slower on large file sets.
- Manual grep — not maintainable at scale.

---

## Decision 5 — Validation Script Language

**Decision**: Write validation scripts in POSIX bash (`.sh`), compatible with the `ubuntu-22.04` GitHub Actions runner.

**Rationale**: The project already uses bash scripts (`.specify/extensions/git/scripts/bash/`). Bash requires no additional runtime setup, runs locally without cloud services (Principle XIV), and keeps the dependency surface minimal.

**Scripts needed**:
1. `validate-summary-coverage.sh` — checks every `.md` article in a locale is in `SUMMARY.md`
2. `validate-summary-links.sh` — checks every link in `SUMMARY.md` points to an existing file
3. `validate-category-readmes.sh` — warns when a category folder has no `README.md`
4. `validate-locale-parity.sh` — checks that article paths exist across all three locales

**Alternatives considered**:
- TypeScript/Bun scripts — consistent with `notify-slack.ts` but heavier for pure file-system checks.
- Python — not installed by default on all developer machines; bash is universal.

---

## Decision 6 — GitHub Actions Runner Version

**Decision**: Pin to `ubuntu-22.04` (not `ubuntu-latest`).

**Rationale**: Principle IV (Version-Pinned Stack) requires pinned versions. `ubuntu-latest` shifts over time and can introduce unexpected behavior changes. `ubuntu-22.04` is the current LTS with long-term support on GitHub-hosted runners.

---

## Decision 7 — Empty Category Folder Handling

**Decision**: Folders containing only `.gitkeep` (no real `.md` files) are excluded from `SUMMARY.md` and from validation checks.

**Rationale**: The current wiki has several empty placeholder folders (`chatgpt/`, `gemini/`, `graphify/`, `open-ui/`, `claude/` in en/ja). Including them in SUMMARY.md would create broken links or empty sidebar sections.

**Implementation**: Validation scripts skip folders where the only file is `.gitkeep` or the folder contains zero `.md` files.
