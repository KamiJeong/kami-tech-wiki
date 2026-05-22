---
title: "Kiro MCP Guide"
aliases: ["Kiro Model Context Protocol", "Kiro external tools", "Kiro MCP integration"]
tags: [kiro, tool, concept, beginner, mcp]
category: concept
tool: "Kiro"
language: en
date_created: 2026-05-19
date_modified: 2026-05-19
source_count: 3
related: ["Kiro Core Concepts: Environment", "Kiro Best Practices", "What Is Kiro?"]
status: draft
review_cycle: fast-changing
freshness_date: 2026-05-19
---

# Kiro MCP Guide

> MCP (Model Context Protocol) is the open standard that lets Kiro connect to external tools, databases, APIs, and documentation sources — extending what the AI can see and do beyond your project files.

## Who this page is for

This page is for developers who want to give Kiro access to external systems — databases, internal APIs, third-party documentation, or project management tools. Some familiarity with APIs is helpful but not required.

## Why this matters

By default, Kiro's AI agent can only see the files inside your project directory. For many tasks, that is enough. But for projects that depend on external systems — a live database, a third-party API with specific response formats, a company's internal documentation — working only from local files means the AI must guess at things it could otherwise know.

MCP closes that gap. By configuring MCP connections, a team gives Kiro access to external context: the actual database schema, the real API response format, the internal documentation site. The AI's output becomes more accurate because it works from real data instead of educated guesses.

## Plain-language explanation

MCP stands for Model Context Protocol. It is an open standard — not a Kiro-specific technology — that defines a common way for AI models to request and receive information from external tools and data sources.

Think of MCP as a universal plug standard for AI tools. Just as a USB port lets you connect any USB-compatible device to a computer, MCP lets Kiro connect to any MCP-compatible data source or tool. The set of available MCP connectors grows as the standard is adopted by more tools.

To use MCP with Kiro, you configure which external sources to connect to in Kiro's settings. When the AI needs information from an external source — for example, the current structure of a database table — it sends a request through the MCP connection and receives the information back.

This happens transparently. You do not need to manually copy the database schema into a file and paste it into a prompt. Kiro's AI fetches the information automatically through the MCP connection.

## Key concepts

### External data sources

MCP allows Kiro to connect to data sources: databases, file systems outside the project directory, documentation servers, and other systems that expose information.

**Why it matters**: When a project depends on a database, the AI needs to know the table structure to generate accurate queries or ORM code. With MCP, Kiro can read the actual database schema. Without MCP, it must be told the schema manually or guess from context.

**Example**: A Kiro setup with an MCP connection to a PostgreSQL database reads that the `users` table has columns `id (uuid)`, `email (varchar)`, `created_at (timestamp)`. When generating a user query function, Kiro uses the correct column names and types — no copy-pasting the schema.

### External tools and services

MCP also allows Kiro to connect to tools — systems that take input and perform actions. Examples include web search, issue trackers, CI/CD systems, and code review tools.

**Why it matters**: When Kiro can interact with external tools, it can do more than generate code. It can retrieve the current status of a GitHub issue, look up the latest version of a dependency, or check whether a test suite has passed.

**Example**: An MCP connection to a GitHub issue tracker lets Kiro read the acceptance criteria directly from a linked issue, rather than requiring the developer to copy them into the spec manually.

### Open standard ecosystem

MCP is maintained as an open standard. This means third-party developers can build MCP connectors for any service, and those connectors work with any MCP-compatible AI tool — not just Kiro.

**Why it matters**: Adopting MCP means Kiro benefits from a growing ecosystem of pre-built connectors. A connector built for one MCP-compatible tool can often be adapted for Kiro with little modification.

**Example**: An MCP connector built for a documentation platform can be configured in Kiro, giving the AI access to the platform's content without Kiro needing a specific integration for that platform.

## Example or analogy

> A research assistant who can only read the documents on their desk is useful, but limited. A research assistant who can also call the library, check the company database, and look up current news is far more useful — not because they are smarter, but because they have access to more information.

MCP is the equivalent of giving Kiro a telephone and a library card. The AI is the same; what changes is the breadth of information it can access before generating its output.

## Practical applications

**Scenario 1 — Database-aware code generation**: Connect Kiro to a development database via MCP. When generating data access code, Kiro reads the actual table schema and generates queries that match the real structure. No manual schema documentation required.

**Scenario 2 — Internal documentation lookup**: Connect Kiro to a company's internal documentation site. When generating code that calls an internal API, Kiro references the actual API documentation to get endpoint paths, parameters, and response formats right.

**Scenario 3 — Issue tracker integration**: Connect Kiro to GitHub Issues. When starting a new feature spec, Kiro reads the relevant issue for context — user stories, acceptance criteria, and any existing discussion — rather than starting from scratch.

**Configuring a basic MCP connection**:
1. Open Kiro's settings panel.
2. Navigate to the MCP connections section.
3. Add a connection: select the connector type (database, web search, custom), provide the connection details.
4. Test the connection to verify Kiro can reach the external source.
5. Use the connection: in Agentic Chat or spec generation, Kiro will automatically draw on the connected source when relevant.

## Common misconceptions

1. **"MCP gives Kiro access to the internet by default."** — MCP connections are configured explicitly. Kiro does not browse the internet automatically. Each connection must be set up and authorized.
2. **"MCP is a Kiro-specific feature."** — MCP is an open standard. It is designed to work with multiple AI tools. Kiro supports MCP, but MCP is not exclusive to Kiro.
3. **"Setting up MCP requires a developer."** — Basic MCP connections (web search, local file paths) can often be configured through Kiro's settings UI without writing code. Complex custom integrations may require developer involvement.

## Related terms

- [Kiro Core Concepts: Environment](03a-environment-overview.md) — MCP in the context of Kiro's broader environment
- [Kiro Best Practices](09-best-practices.md) — When to use MCP and what to watch for
- [Kiro Glossary](10-glossary.md) — Quick reference for MCP and related terms

## Further reading

- [Kiro official site — MCP documentation](https://kiro.dev) — Official reference for configuring MCP connections in Kiro. As of 2026-05-19.
- [MCP specification](https://modelcontextprotocol.io) — The open standard specification for Model Context Protocol. As of 2026-05-19.
- [AWS DevOps Blog](https://aws.amazon.com/blogs/devops/) — AWS coverage of AI tool integrations and MCP adoption. As of 2026-05-19.

## Advanced notes

> **For advanced readers only** — you do not need to read this section to understand Kiro's MCP integration.

MCP uses a client-server model. Kiro acts as an MCP client; external data sources expose MCP servers. The protocol defines how the client requests information (resources), calls actions (tools), and receives structured responses. Custom MCP servers can be built for any system that exposes a programmatic interface — REST API, GraphQL, SQL database, file system, or proprietary format — giving teams the ability to extend Kiro's context to any internal system.
