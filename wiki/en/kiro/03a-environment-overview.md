---
title: "Kiro Core Concepts: Environment"
aliases: ["Kiro agentic chat", "Kiro MCP", "Kiro IDE vs CLI"]
tags: [kiro, tool, concept, beginner, mcp, agentic-chat]
category: concept
tool: "Kiro"
language: en
date_created: 2026-05-19
date_modified: 2026-05-19
source_count: 2
related: ["Kiro Core Concepts: Workflow", "Kiro MCP Guide", "What Is Kiro?"]
status: draft
review_cycle: fast-changing
freshness_date: 2026-05-19
---

# Kiro Core Concepts: Environment

> Kiro's environment concepts — Agentic Chat, MCP servers, and IDE vs. CLI — determine how you interact with the AI and what external tools it can reach.

## Who this page is for

This page is for product managers, developers new to Kiro, and anyone who wants to understand how Kiro connects to the outside world. Read [Kiro Core Concepts: Workflow](03-core-concepts.md) first to understand Specs, Steering, and Hooks before reading this page.

## Why this matters

Knowing what Kiro's workflow concepts do (Specs, Steering, Hooks) is only half of the picture. The other half is understanding how you interact with those concepts in practice: through Agentic Chat, through MCP-connected tools, and through either the IDE or the CLI. These choices affect what Kiro can do, what external data it can access, and how it fits into a team's existing development setup.

## Plain-language explanation

Kiro provides two ways to give it instructions (Agentic Chat and CLI), and one mechanism for connecting it to external information sources (MCP). Understanding these three concepts tells you what Kiro can see, what it can do, and how you direct it.

**Agentic Chat** is the conversational interface inside the IDE. You type a request; Kiro reads the project files, understands the context, and takes multi-step action — not just suggesting code, but actually making changes, running verification steps, and reporting back.

**MCP (Model Context Protocol)** is the standard Kiro uses to connect to external tools and data sources: databases, APIs, documentation sites, project management systems. MCP is an open standard, which means any MCP-compatible tool can be plugged into Kiro.

**IDE vs. CLI** is the choice of interface. The IDE gives you a visual environment with file browsing, code highlighting, and an integrated chat panel. The CLI gives you terminal-based access, useful for automation and server environments.

## Key concepts

### Agentic Chat

Agentic Chat is the conversational AI interface within Kiro's IDE. Unlike a standard chat interface that only outputs text, Agentic Chat can take actions: read and modify files, run commands, access MCP-connected tools, and execute multi-step tasks.

**Why it matters**: The word "agentic" is the key distinction. An agent does things. A standard AI chat interface answers questions and suggests text. Agentic Chat reads your project, understands its context, and acts — producing changes in the codebase, not just suggestions in a chat window.

**Example**: You open Agentic Chat and type: "Add error handling to the payment API." Kiro reads the payment API files, identifies where errors are not handled, writes the error handling code, and reports what it changed — all in a single exchange.

### MCP (Model Context Protocol)

MCP is an open standard that defines how AI models can connect to external tools and data sources. Kiro supports MCP, which means it can be configured to query databases, call APIs, read from documentation systems, or interact with project management tools.

**Why it matters**: Without MCP, Kiro can only see the files in your project. With MCP, Kiro can see external context — the current state of a database, a live API's response format, documentation from a third-party service. This makes Kiro's output more accurate for projects that depend on external systems.

**Example**: A Kiro setup with an MCP connection to a PostgreSQL database can read the current database schema and generate code that matches the actual column names and types — rather than guessing or requiring the developer to copy-paste the schema manually.

### IDE vs. CLI

Kiro provides two interfaces: an IDE (built on Visual Studio Code) and a CLI (invoked from a terminal). Both use the same underlying AI model and respect the same Spec, Steering, and Hook files.

**Why it matters**: The right interface depends on the context. Developers working on a feature interactively will typically use the IDE for its visual environment. Teams automating workflows, running Kiro in CI/CD pipelines, or working in server environments will use the CLI.

**Example — IDE**: A developer opens Kiro's IDE, browses the project files, reviews the spec documents, and uses Agentic Chat to implement a task.

**Example — CLI**: A CI/CD pipeline runs `kiro implement --spec feature-login` as part of an automated build process, without any human interaction.

## Example or analogy

> Think of Kiro as a highly capable assistant working in your office. Agentic Chat is how you talk to them — you describe what you need, and they take action, not just advice. MCP is their access card — it determines which rooms, databases, and systems they can enter. The IDE vs. CLI distinction is whether they work at their own desk with full equipment (IDE) or use a phone line from a remote location (CLI).

All three matter for getting the most from the assistant.

## Practical applications

**Scenario 1 — Interactive development**: A developer uses the IDE's Agentic Chat to implement a new feature step by step, reviewing changes in the file browser as they are made.

**Scenario 2 — External data integration**: A team connects Kiro to their company's internal API documentation via MCP. When writing code that calls those APIs, Kiro can reference the actual documentation to generate accurate request and response handling.

**Scenario 3 — Automated pipeline**: A team runs the Kiro CLI in their CI/CD pipeline. After a spec is approved and merged, an automated job runs `kiro implement` to generate the initial implementation, which is then reviewed by a developer before merging.

## Common misconceptions

1. **"Agentic Chat is just ChatGPT in an IDE."** — Agentic Chat has direct access to the project's file system, can modify files, and can run commands. It is integrated into the development environment and context, not a general-purpose chat interface.
2. **"MCP requires a specific external service."** — MCP is an open standard. Any service that implements the MCP protocol can be connected to Kiro. The set of available integrations grows as the ecosystem develops.
3. **"The CLI is a limited version of the IDE."** — The CLI uses the same AI model and respects the same Spec and Steering files as the IDE. It is a different interface, not a reduced version.

## Related terms

- [Kiro MCP Guide](07-mcp.md) — Full guide to connecting Kiro to external tools via MCP
- [Kiro Core Concepts: Workflow](03-core-concepts.md) — Specs, Steering, and Hooks
- [What Is Kiro?](01-what-is-kiro.md) — Overview of Kiro as a product

## Further reading

- [Kiro official site](https://kiro.dev) — Documentation for Agentic Chat, MCP setup, and CLI usage. As of 2026-05-19.
- [MCP specification](https://modelcontextprotocol.io) — The open standard Kiro uses for external tool connections. As of 2026-05-19.

## Advanced notes

> **For advanced readers only** — you do not need to read this section to understand Kiro's environment concepts.

MCP (Model Context Protocol) was originally developed to standardize how AI models receive external context at inference time. By adopting MCP, Kiro benefits from a growing ecosystem of pre-built connectors for common tools (databases, issue trackers, documentation platforms). Developers building custom MCP connectors can extend Kiro's reach to any system that exposes a programmatic interface.
