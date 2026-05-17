---
title: "Codex CLI"
aliases: []
tags: [codex-cli, openai, ai-coding, cli]
category: tool
tool: "Codex CLI"
language: en
date_created: 2026-05-15
date_modified: 2026-05-15
source_count: 0
related: []
status: active
---

# Codex CLI

> A lightweight AI coding agent built by OpenAI that runs in your terminal. It reads, edits, and executes code directly within your project directories, with configurable permission levels, slash commands, and image analysis support. (v0.130.0, Apache 2.0)

---

## Core Concepts

- **Approval Mode**: The permission level controlling how autonomously the agent interacts with the filesystem and shell. Three modes: Auto (fully autonomous), Read-Only (reads but does not modify), and Full Access (unrestricted).
- **Slash Commands**: Typed during an interactive session to switch workflows: `/new`, `/resume`, `/plan`, `/review`, `/diff`, `/permissions`, `/status`.
- **Non-Interactive Mode**: The `codex exec` command runs the agent without a full-screen UI, enabling repeatable automation — useful in CI/CD pipelines.
- **MCP (Model Context Protocol)**: An extension protocol for integrating third-party tools and additional context into the Codex CLI agent.

---

## Use Cases

| When to use | When not to use |
|-------------|-----------------|
| Code development, debugging, and refactoring | Simple file viewing or copying |
| Writing and running tests | No OpenAI account or API key |
| Large-scale codebase migrations | Native Windows in production (WSL2 recommended) |
| CI/CD automation (PR reviews, release notes) | macOS Homebrew install needing Computer Use |
| Data analysis and visualization automation | Offline environments |

---

## Quick Start

### System Requirements

| Requirement | Details |
|-------------|---------|
| Operating System | macOS, Linux, Windows (WSL2 recommended) |
| RAM | 2 GB minimum, 4 GB recommended |
| Node.js | 22 or higher (for npm install method) |
| Authentication | ChatGPT Plus/Pro/Business/Edu/Enterprise account, or OpenAI API key |

### Installation

```bash
# Install via npm (recommended)
npm install -g @openai/codex

# Install via Homebrew (macOS)
brew install --cask codex
```

> [!warning] Note
> The unscoped `codex` npm package is an unrelated tool from 2012. Always install `@openai/codex`.

### Basic Usage

```bash
# Start interactive mode (current directory)
codex

# Run a one-shot task
codex "find and fix the bug in the payment module"

# Non-interactive automation
codex exec "generate a changelog from recent commits"

# Attach images for analysis
codex --image before.png,after.png "compare these two screenshots"
```

**Result**: The agent reads your request, then reads, modifies, or executes commands according to the active approval mode.

> [!tip] Getting started
> Run `codex` to open the full-screen terminal UI. Start in Read-Only mode (`/permissions`) to explore the agent's behavior before granting full access.

---

## Integrations & Connections

- **GitHub Actions**: Use the `openai/codex-action` workflow to run Codex CLI in CI/CD pipelines.
- **MCP Tools**: Connect third-party tools and additional context sources to the agent via the Model Context Protocol.
- **Subagents**: Delegate large or parallelizable tasks to multiple Codex agents running simultaneously.

---

## Caveats & Limitations

> [!warning] Known constraints

| Item | Details |
|------|---------|
| Usage limits | 5-hour rolling window + weekly quota allocation. Quota varies by ChatGPT plan tier |
| Windows support | Native Windows is experimental. WSL2 is recommended for production use |
| macOS Homebrew | Computer Use features are unavailable with Homebrew-installed CLI; requires the Codex.app-bundled CLI |
| Weekly quota drift bug | Quota percentage decreases ~1% per idle period even without usage — a known bug |
| `/status` delay | On first run, the usage section is empty; data loads after the first message is sent |
| Context window | The context compaction threshold cannot exceed 90% of the context window |

> [!note] Version information
> This document is based on Codex CLI **v0.130.0** (released 2026-05-08). The project releases frequently — check the official changelog for the latest updates.

---

## References

- [Codex CLI Official Documentation](https://developers.openai.com/codex/cli) — Full CLI reference and feature guide (2026-05-15)
- [Quickstart Guide](https://developers.openai.com/codex/quickstart) — Get started with Codex CLI in 5 minutes (2026-05-15)
- [GitHub Repository — openai/codex](https://github.com/openai/codex) — Source code, issues, and release notes (2026-05-15)
- [npm Package @openai/codex](https://www.npmjs.com/package/@openai/codex) — Installation info and version history (2026-05-15)
- [Slash Commands Reference](https://developers.openai.com/codex/cli/slash-commands) — Complete list of slash commands (2026-05-15)
- [Changelog](https://developers.openai.com/codex/changelog) — Version-by-version changes (2026-05-15)
