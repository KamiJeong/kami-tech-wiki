# Data Model: GitBook Wiki Ready

This feature operates entirely on the file system. There is no database. The "data model" defines the canonical file structure and the rules that govern each artifact.

---

## Entities

### LocaleDirectory

Represents one language version of the wiki, mapping 1:1 to a GitBook Space.

| Field | Value | Rule |
|-------|-------|------|
| `path` | `wiki/ko`, `wiki/en`, `wiki/ja` | Immutable; must not be renamed |
| `locale` | `ko`, `en`, `ja` | Derived from directory name |
| `gitbook_config` | `.gitbook.yaml` at `path/` | MUST exist; content is fixed (see Contracts) |
| `readme` | `README.md` at `path/` | MUST exist; serves as GitBook Space home page |
| `summary` | `SUMMARY.md` at `path/` | MUST exist; defines GitBook sidebar |

---

### CategoryFolder

A sub-directory within a `LocaleDirectory` grouping related articles.

| Field | Value | Rule |
|-------|-------|------|
| `name` | e.g., `openui`, `claude` | Folder name; used as sidebar section heading (title-cased) |
| `path` | `wiki/{locale}/{name}/` | Single level only; no nested sub-categories |
| `readme` | `README.md` at `path/` | OPTIONAL; linked from `SUMMARY.md` if present; absence produces a CI warning |
| `articles` | All `.md` files except `README.md` | Sorted numerically by filename prefix; `.gitkeep`-only folders are excluded |
| `is_empty` | True if folder has 0 `.md` files (`.gitkeep` only) | Empty folders excluded from `SUMMARY.md` and validation |

---

### Article

A single markdown documentation page within a `CategoryFolder`.

| Field | Value | Rule |
|-------|-------|------|
| `filename` | e.g., `001-introduction.md`, `overview.md` | Must end in `.md`; spaces in filenames are a CI warning |
| `path` | Relative to locale root, e.g., `openui/001-introduction.md` | Used as the link target in `SUMMARY.md` |
| `label` | Human-readable name derived from filename | Strip numeric prefix (`NNN-`), replace hyphens with spaces, title-case each word |
| `order` | Numeric prefix value (0 if none) | Articles sorted ascending by order within a section |

**Label derivation examples**:

| Filename | Label |
|----------|-------|
| `001-introduction.md` | Introduction |
| `api-reference-overview.md` | API Reference Overview |
| `chat-genui.md` | Chat Genui |
| `specification-v05.md` | Specification V05 |

---

### SummaryEntry

One line in `SUMMARY.md`.

| Field | Value | Rule |
|-------|-------|------|
| `type` | `root`, `section-header`, `category-overview`, `article` | Determines rendering |
| `label` | Human-readable string | Must not expose raw filenames |
| `path` | Relative path from locale root | MUST resolve to an existing file on disk |
| `section` | Parent `CategoryFolder.name` | Groups entries under `## Section` headings |

---

### ValidationResult

Output of each validation script.

| Field | Value | Rule |
|-------|-------|------|
| `check` | `coverage`, `links`, `category-readmes`, `locale-parity` | One of four check types |
| `status` | `pass`, `warn`, `fail` | `fail` causes CI to exit non-zero; `warn` prints but exits 0 |
| `detail` | Human-readable description | File path + issue description |

**Severity mapping**:

| Check | On violation | Exit code |
|-------|-------------|-----------|
| Article missing from `SUMMARY.md` | `fail` | 1 |
| `SUMMARY.md` link points to missing file | `fail` | 1 |
| Category folder missing `README.md` | `warn` | 0 |
| Article missing in peer locale | `warn` | 0 |

---

## State Transitions

```
LocaleDirectory (no GitBook files)
  → [add .gitbook.yaml]  → GitBook-discoverable
  → [add README.md]      → GitBook has home page
  → [add SUMMARY.md]     → GitBook has sidebar navigation

CategoryFolder (no README)
  → [add README.md]      → Category overview page available

Article (new)
  → [add to SUMMARY.md]  → Visible in GitBook sidebar
  → [add to peer locales] → Locale-consistent
```
