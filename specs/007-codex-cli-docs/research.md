# Research: Codex CLI Wiki Documentation

**Date**: 2026-05-15
**Feature**: specs/007-codex-cli-docs

No NEEDS CLARIFICATION items were raised in the spec. This research documents all factual decisions made for the wiki content.

---

## Decision 1: Subject Definition — Which "Codex CLI"?

**Decision**: Document the **OpenAI Codex CLI** (`@openai/codex` npm package, GitHub: `openai/codex`).

**Rationale**: This is the current, actively maintained AI coding assistant CLI released by OpenAI. It must not be confused with:
- The original "Codex" model API (deprecated 2023)
- The unscoped npm package `codex` (unrelated 2012 package)
- `microsoft/Codex-CLI` (separate Microsoft project for translating natural language to shell commands)

**Alternatives considered**: The Microsoft Codex-CLI is a distinct product; documentation of both was considered but rejected — the OpenAI Codex CLI is the more current, widely adopted product.

---

## Decision 2: Content Scope — What Sections to Include

**Decision**: Each page covers 8 sections: Overview, Key Features, Requirements, Installation, Basic Usage, Use Cases, Limitations, References.

**Rationale**: Matches the `tool-page` template structure and provides complete onboarding information. The audience (IT/AX team members) needs enough to evaluate the tool and get started, not a full API reference.

**Alternatives considered**: A shorter "overview + quickstart" format was considered but rejected — the tool has enough complexity (approval modes, slash commands, quota limits) that a fuller treatment is warranted.

---

## Decision 3: Version to Document

**Decision**: Document version **0.130.0** (released 2026-05-08), the latest stable release as of research date.

**Rationale**: Most accurate and current for the team's use. The `date_modified` frontmatter field will reflect when the page was created, allowing future maintainers to assess staleness.

**Alternatives considered**: Omitting version entirely was rejected — the project releases rapidly (700+ releases) and version context is essential for readers.

---

## Decision 4: Authentication Prerequisites

**Decision**: Document **two authentication paths**: (a) ChatGPT account (Plus/Pro/Business/Edu/Enterprise), (b) OpenAI API key.

**Rationale**: Both are valid; team members may have either. The wiki should not assume one is preferred.

**Alternatives considered**: API key only — rejected because many users will access via ChatGPT account without needing separate API keys.

---

## Factual Findings

### Product Overview
- **Official description**: "Lightweight coding agent that runs in your terminal"
- **Built with**: Rust (for performance)
- **License**: Apache 2.0
- **GitHub**: https://github.com/openai/codex
- **npm package**: `@openai/codex`
- **Current version**: 0.130.0 (2026-05-08)

### System Requirements
| Requirement | Value |
|---|---|
| OS | macOS, Linux, Windows (WSL2 recommended) |
| RAM | 2 GB min, 4 GB recommended |
| Node.js | 22+ (for npm install method) |
| Auth | ChatGPT Plus/Pro/Business/Edu/Enterprise OR OpenAI API key |

### Installation
```bash
npm install -g @openai/codex
# or
brew install --cask codex
```

### Key Usage Patterns
```bash
codex                              # Interactive mode
codex "describe your task"         # One-shot mode
codex exec "automate this task"    # Non-interactive automation
codex --image before.png "..."     # With image attachment
```

### Approval Modes
| Mode | Description |
|---|---|
| Auto | Agent acts autonomously |
| Read-Only | Agent reads but does not modify files |
| Full Access | Full filesystem and command execution |

### Slash Commands (in interactive session)
`/new`, `/resume`, `/plan`, `/review`, `/diff`, `/permissions`, `/status`

### Key Use Cases
1. Code development, debugging, and refactoring
2. Test writing and execution
3. Data analysis and visualization
4. CI/CD automation (PR review, release notes)
5. Large-scale codebase migrations

### Known Limitations
- Usage limits: 5-hour rolling window + weekly quota
- Windows: Native support experimental; WSL2 recommended
- macOS Homebrew install: Cannot use Computer Use features (requires Codex.app CLI)
- Weekly quota drift bug: Quota % decreases ~1% per idle period (known bug)

### References
- Official docs: https://developers.openai.com/codex/cli
- GitHub: https://github.com/openai/codex
- npm: https://www.npmjs.com/package/@openai/codex
- Quickstart: https://developers.openai.com/codex/quickstart
