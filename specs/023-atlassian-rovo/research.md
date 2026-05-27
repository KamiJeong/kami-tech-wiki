# Research: Atlassian Rovo Overview

**Date**: 2026-05-28

## Primary Sources Reviewed

| Source | Use |
|--------|-----|
| Atlassian Support: What is Rovo? | Defines Rovo Search, Chat, Agents, Studio, and definitions |
| Atlassian Support: Getting started with the Atlassian Rovo MCP Server | Defines MCP Server endpoint, OAuth/API token controls, supported clients, examples, and security model |
| Atlassian Support: What is Rovo Studio? | Defines Studio as the place to build agents, automations, and apps |
| Atlassian Support: What are agents? | Defines Rovo agents, their parts, and common use cases |
| Atlassian Developer: Forge `rovo:agent` module | Defines app-based Rovo agents, manifest fields, action hooks, and Forge bridge interaction |
| Atlassian blog: Extend what Rovo can do across your stack with MCP | Provides current examples of MCP-enabled Rovo agents and third-party app workflows |

## Key Findings

1. Rovo is not a single feature. It is Atlassian's AI layer around search, chat, agents, Studio builders, and contextual definitions.
2. Rovo Search combines Atlassian app data with connected third-party apps while respecting existing user permissions.
3. Rovo Chat answers questions and helps take action using accessible company data across Atlassian and connected apps.
4. Rovo Agents are configurable AI teammates that can appear in Chat, automation flows, Confluence/Jira editing surfaces, and Studio.
5. Rovo Studio is the builder surface for agents, automations, and apps. Agent configuration includes identity, behavior, knowledge, and skills.
6. Atlassian Rovo MCP Server is documented as a cloud bridge for compatible external clients to interact with Jira, Compass, and Confluence data. It uses OAuth 2.1 and may allow API token authentication if an admin enables it.
7. The MCP Server endpoint recommended by Atlassian is `https://mcp.atlassian.com/v1/mcp/authv2`; Atlassian says the older SSE endpoint will stop being supported after 2026-06-30.
8. Forge supports `rovo:agent` modules. These app-based agents can define prompts, conversation starters, and actions, and can be invoked from Jira/Confluence surfaces or automation.
9. There is not enough official documentation to describe a broad "backend Rovo API" for arbitrary server-to-Rovo conversations. The safer guidance is to use Atlassian REST APIs for backend data operations, Forge Rovo agents for Atlassian app extensions, and the Rovo MCP Server for compatible AI clients.

## Decisions

- Create a Korean overview page at `wiki/ko/atlassian-rovo/index.md`.
- Create a Korean section README at `wiki/ko/atlassian-rovo/README.md`.
- Mark the page `review_cycle: fast-changing` and `freshness_date: 2026-05-28`.
- Use `status: draft` because the page is an initial AI-generated overview that should receive human review before being treated as canonical.
