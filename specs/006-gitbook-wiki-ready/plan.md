# Implementation Plan: GitBook Wiki Ready

**Branch**: `006-gitbook-wiki-ready` | **Date**: 2026-05-15 | **Spec**: [spec.md](spec.md)

## Summary

Make the existing `wiki/ko`, `wiki/en`, and `wiki/ja` directories GitBook-ready by adding `.gitbook.yaml`, `README.md`, `SUMMARY.md`, and category overview pages to each locale — without moving any existing files. Add validation scripts and a GitHub Actions workflow that enforces SUMMARY.md coverage, broken link detection, and locale parity on every PR and push to `main`.

## Technical Context

**Language/Version**: POSIX bash (shell scripts); YAML 1.2 (GitHub Actions, GitBook config); Markdown (CommonMark)

**Primary Dependencies**: GitBook Git Sync (pre-configured), GitHub Actions (`ubuntu-22.04`), `markdownlint-cli2` (via `DavidAnson/markdownlint-cli2-action@v16`), `lychee` (via `lycheeverse/lychee-action@v2`)

**Storage**: File system only — `wiki/` directory tree

**Testing**: GitHub Actions workflow + locally-runnable bash validation scripts

**Target Platform**: GitHub (CI/CD) + GitBook Git Sync (documentation viewer)

**Project Type**: Documentation infrastructure / developer tooling

**Performance Goals**: Validation scripts complete full wiki check in under 30 seconds (SC-006)

**Constraints**: Existing files under `wiki/` MUST NOT be moved, renamed, or deleted (FR-014); no legacy `gitbook-cli`; no new npm dependencies

**Scale/Scope**: 3 locales, ~13 articles per locale (openui), 1 additional article (ko/claude), expandable

## Constitution Check

| Principle | Status | Notes |
|-----------|--------|-------|
| I — Spec Before Code | ✅ Pass | spec.md approved with 14 FRs |
| II — Single Source of Truth | ✅ Pass | SUMMARY.md is the sole navigation source; .gitbook.yaml references it |
| III — Explicit Overrides Only | ✅ Pass | No overrides needed |
| IV — Version-Pinned Stack | ✅ Pass | Actions pinned to specific versions; runner pinned to ubuntu-22.04; no floating deps |
| V — Type Safety | ✅ N/A | No typed language in scope; bash scripts validated by shellcheck in CI |
| VI — Code Quality | ✅ Pass | Each script has single responsibility; functions fit on one screen |
| VII — Testing Standards | ✅ Pass | Each FR maps to a specific validation check or CI step |
| VIII — UX Consistency | ✅ N/A | No user-facing UI |
| IX — Design System | ✅ N/A | No UI components |
| X — Accessibility | ✅ N/A | No UI components |
| XI — Performance Budgets | ✅ Pass | SC-006 declares 30-second budget; enforced by script timeout |
| XII — Security & Privacy | ✅ Pass | No secrets; .gitbook.yaml has no sensitive data |
| XIII — Module Boundaries | ✅ N/A | File-based; no code modules |
| XIV — Local-First | ✅ Pass | validate-wiki.sh runs locally without cloud services |
| XV — AI Agent Governance | ✅ Pass | Following spec requirements; no fabricated requirements |
| XVI — Definition of Done | ✅ Pass | Each task maps to spec FRs; CI is the enforcement gate |

**Result: All gates pass. No violations.**

## Project Structure

### Documentation (this feature)

```text
specs/006-gitbook-wiki-ready/
├── plan.md                    # This file
├── research.md                # Tool and format decisions
├── data-model.md              # File system entity definitions
├── quickstart.md              # How to add articles
├── contracts/
│   ├── gitbook-config.md      # .gitbook.yaml format contract
│   └── summary-format.md      # SUMMARY.md format contract
├── version-guard-report.md    # Version check (all current)
└── tasks.md                   # Phase 2 output (speckit-tasks)
```

### Source Code (repository root)

```text
wiki/
├── ko/
│   ├── .gitbook.yaml          # NEW — GitBook Space config
│   ├── README.md              # NEW — Korean home page
│   ├── SUMMARY.md             # NEW — Korean sidebar navigation
│   ├── claude/
│   │   ├── README.md          # NEW — Claude category overview (ko)
│   │   └── overview.md        # existing
│   └── openui/
│       ├── README.md          # NEW — OpenUI category overview (ko)
│       └── *.md               # existing (13 files)
├── en/
│   ├── .gitbook.yaml          # NEW
│   ├── README.md              # NEW — English home page
│   ├── SUMMARY.md             # NEW — English sidebar navigation
│   └── openui/
│       ├── README.md          # NEW — OpenUI category overview (en)
│       └── *.md               # existing (13 files)
└── ja/
    ├── .gitbook.yaml          # NEW
    ├── README.md              # NEW — Japanese home page
    ├── SUMMARY.md             # NEW — Japanese sidebar navigation
    └── openui/
        ├── README.md          # NEW — OpenUI category overview (ja)
        └── *.md               # existing (13 files)

.wiki/scripts/
├── notify-slack.ts            # existing
└── validate-wiki.sh           # NEW — runs all 4 validation checks

.github/workflows/
└── wiki-validation.yml        # NEW — CI workflow for wiki/** changes
```

**Structure Decision**: Single project layout. All new files are added within the existing `wiki/` tree. Validation scripts go in `.wiki/scripts/` to follow the existing convention. GitHub Actions workflow goes in `.github/workflows/`.

Empty placeholder folders (`chatgpt/`, `gemini/`, `graphify/`, `open-ui/`) in all locales are excluded from SUMMARY.md and validation — they contain only `.gitkeep` files.

## Complexity Tracking

No constitution violations. Section not applicable.
