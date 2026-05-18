---
title: "What is Codex"
aliases: ["OpenAI Codex", "Codex Introduction"]
tags: [codex, openai, ai-coding, code-generation]
category: tool
tool: "OpenAI Codex"
language: en
date_created: 2026-05-18
date_modified: 2026-05-18
source_count: 1
related: ["Codex CLI", "Codex 101"]
status: active
---

# OpenAI Codex

> An AI software engineering tool built by OpenAI. Codex generates, modifies, and executes code from natural language instructions — delivered as a fully autonomous cloud agent and as a local terminal CLI.

---

## Core Concepts

- **Codex (cloud agent)**: A software engineering agent embedded in ChatGPT and the OpenAI API. It handles coding tasks end-to-end — writing, debugging, and creating PRs — running each task inside an isolated cloud sandbox.
- **Codex CLI**: A local terminal AI coding agent. It reads and modifies your codebase directly, with approval modes that let you control how much autonomy it has.
- **Sandbox isolation**: The cloud agent runs in a container with restricted network access, enabling safe code execution, testing, and iteration.
- **Multitasking**: Multiple tasks can run in parallel — a significant throughput advantage over single-agent workflows.

---

## When to use Codex

| Good fit | Poor fit |
|----------|----------|
| Automating feature implementation, bug fixes, and refactoring | Offline or air-gapped environments |
| Automating code review and PR creation | Environments where external AI tools are blocked by policy |
| Writing and running test suites | Architecture design requiring deep domain knowledge |
| Large-scale migrations (language or framework changes) | Simple file viewing or copying tasks |
| Parallelizing many independent development tasks | No OpenAI account or API key |

---

## Two forms: Cloud Agent vs CLI

| | Codex (cloud agent) | Codex CLI |
|---|---|---|
| Runs in | OpenAI cloud sandbox | Local terminal |
| Access | ChatGPT interface / API | `npm install -g @openai/codex` |
| Autonomy | Fully autonomous (per-task) | Configurable via approval modes |
| Parallel execution | Multiple tasks simultaneously | Single session |
| Primary use | Complex multi-step engineering tasks | Codebase exploration, editing, automation |

---

## How it works

1. **Receive task**: Natural language instruction (e.g., "Fix this bug and add a test")
2. **Explore code**: Identify relevant files, functions, and dependencies
3. **Plan**: Determine the scope and order of changes
4. **Execute and iterate**: Modify code → run tests → review results → retry if needed
5. **Deliver**: Return changes as a PR or modified files

---

## Quick Start

### Using Codex agent in ChatGPT

```
1. Open ChatGPT (Pro or Plus plan)
2. Select [Codex] in the sidebar
3. Connect your GitHub repository
4. Enter a task: "Fix the authentication bug in src/api/user.ts"
5. The agent analyzes code in a sandbox and opens a PR
```

### Installing Codex CLI

```bash
# Requires Node.js 22+
npm install -g @openai/codex

# Start interactive mode
codex

# Run a single task
codex "Fix all TypeScript errors in this directory"
```

> [!tip] Getting started
> ChatGPT Pro/Plus users can access the Codex agent immediately — no extra setup. For the CLI, you need an OpenAI API key or a ChatGPT login.

---

## Integrations

- **GitHub**: The Codex agent connects directly to GitHub repositories and opens PRs → [[GitHub Actions]]
- **Codex CLI**: Use the same AI capabilities from your terminal → [[Codex CLI]]
- **Codex 101**: Full practical guide to setup and usage → [[Codex 101]]
- **MCP**: Connect external tools to the agent via Model Context Protocol

---

## Known limitations

> [!warning] Constraints to be aware of
> - The Codex cloud agent requires a ChatGPT Pro/Plus/Team/Enterprise plan. API access is billed separately.
> - The cloud sandbox has restricted network access — tasks that require calling external APIs directly may be limited.
> - All autonomous output must be reviewed by a human. Complex domain logic may be misinterpreted.

> [!note] Version note
> This page is based on the OpenAI Codex official page (https://openai.com/codex) as of May 2026.

---

## References

- [OpenAI Codex official page](https://openai.com/codex) — Overview and feature summary (2026-05-18)
- [Codex CLI GitHub repository](https://github.com/openai/codex) — Source code, issues, release notes (2026-05-18)
- [OpenAI developer documentation](https://platform.openai.com/docs) — API reference and integration guides (2026-05-18)
