# Feature Specification: Atlassian Rovo Overview

**Feature Branch**: `023-atlassian-rovo`

**Created**: 2026-05-28

**Status**: Draft

**Input**: User description: "Atlassian Rovo 에 대해 알고 싶습니다. 최근 작성일 기준 정보로 초안 작성, 문서 제목, 수정 일, 카테고리, Rovo MCP/API 기능, server에서 Rovo를 활용할 방법 예시나, 가능 케이스 제안"

## Content Overview *(mandatory)*

**Article type**: tool-overview

**Primary learning goal**: Korean readers should understand what Atlassian Rovo is, where MCP/API capabilities fit, and how a server-side workflow might use Rovo-adjacent Atlassian integrations.

**Target reader**: Korean product managers, founders, operators, and beginner developers who use Jira or Confluence and want a current, practical overview before deciding whether to test Rovo.

**Languages in scope**: Korean (`wiki/ko/`) only for this issue.

**Review cycle**: fast-changing

## Reader Scenarios *(mandatory)*

### Reader Scenario 1 - Understand Rovo's Role (Priority: P1)

A reader has heard "Rovo" in an Atlassian context and wants to know whether it is search, chat, automation, an agent platform, or an API product.

**Why this priority**: The page is valuable only if the reader can place Rovo in the Atlassian product map.

**Completion check**: The reader can explain Search, Chat, Agents, Studio, MCP Server, and Forge Rovo agents in plain language.

**Acceptance scenarios**:

1. **Given** a reader who knows Jira and Confluence but not Rovo, **when** they read the article, **then** they can describe Rovo as Atlassian's AI layer for search, chat, agents, and builder workflows.
2. **Given** a non-developer evaluating AI tools, **when** they read the article, **then** they can identify that Rovo is primarily for Atlassian Cloud environments, not a generic standalone LLM.

---

### Reader Scenario 2 - Evaluate MCP/API Fit (Priority: P2)

A technical stakeholder wants to know whether Rovo can be connected to external clients or server workflows.

**Why this priority**: The issue explicitly asks for Rovo MCP/API capabilities and server usage examples.

**Completion check**: The reader can distinguish between Atlassian Rovo MCP Server, Forge Rovo agent modules, and ordinary Atlassian REST API usage.

**Acceptance scenarios**:

1. **Given** a team using Claude, ChatGPT, Cursor, or VS Code, **when** they read the article, **then** they can explain how the Atlassian Rovo MCP Server can connect compatible clients to Jira, Confluence, and Compass.
2. **Given** a developer considering a backend integration, **when** they read the article, **then** they understand that server-side use should usually combine Atlassian REST APIs, Forge apps, automation, and MCP-enabled client flows rather than assume a broad backend Rovo API.

---

### Reader Scenario 3 - Identify Practical Use Cases (Priority: P3)

A team lead wants examples of realistic Rovo adoption scenarios.

**Why this priority**: Rovo is a broad product family; concrete examples prevent overgeneralized expectations.

**Completion check**: The reader can choose 2-3 safe pilot use cases and recognize when not to use Rovo.

**Acceptance scenarios**:

1. **Given** a support or product team, **when** they read the article, **then** they can identify examples such as backlog cleanup, release note drafting, onboarding Q&A, and incident summary workflows.

### Edge cases

- The reader may not know MCP; define it as a standard connection protocol for AI clients and tools.
- The reader may assume Rovo has a universal backend API; clarify what is documented and what remains better handled through Forge or Atlassian REST APIs.
- Rovo features are changing quickly; date all capability claims.

## Content Requirements *(mandatory)*

### Structural requirements

- **CR-001**: Article MUST follow the wiki tool-page style with progressive sections for beginner and technical readers.
- **CR-002**: Article MUST include at least one practical analogy or real-world example.
- **CR-003**: Article MUST include common misconceptions.
- **CR-004**: Article MUST be one Korean page plus a short section README.
- **CR-005**: Article MUST update `wiki/index.md`, `wiki/ko/SUMMARY.md`, and `wiki/log.md`.

### Terminology requirements

- **TR-001**: New terms introduced: Rovo Search, Rovo Chat, Rovo Agents, Rovo Studio, Atlassian Rovo MCP Server, Forge Rovo Agent, Teamwork Graph, MCP, browser-based consent flow.
- **TR-002**: Existing glossary terms referenced: AI agent, MCP, automation, API.
- **TR-003**: Translation decisions: keep product names in English; render "agent" as "에이전트"; render "Studio" as "Studio"; render "MCP Server" as "MCP 서버".

### Source requirements

- **SR-001**: Minimum 5 current, verifiable Atlassian sources required.
- **SR-002**: Fast-changing claims MUST be dated "2026-05-28 기준".
- **SR-003**: Prefer official Atlassian support/developer/product sources over community commentary.

### Exception documentation *(if any standard sections are omitted)*

| Omitted section | Reason | Approver |
|-----------------|--------|----------|
| Full multilingual parity | User requested Korean content and project default is Korean when unspecified | Issue scope |

## Constitution Check *(mandatory)*

| Principle | Requirement | Met? |
|-----------|-------------|------|
| I. Audience-First | Target reader is a non-developer | Yes |
| II. Accuracy | Sources identified; claim types distinguished | Yes |
| III. Original Synthesis | No article prose in this spec | Yes |
| IV. Multilingual Parity | Korean-only exception documented | Yes |
| VI. Progressive Depth | Beginner overview plus technical MCP/API section required | Yes |
| VII. IA & Navigation | Index and SUMMARY updates required | Yes |
| VIII. Article Template | Tool-page structure applied | Yes |
| IX. Terminology | New terms listed | Yes |
| XIII. Maintenance | `review_cycle` declared | Yes |
| XIV. Separation | Spec contains requirements, not final article prose | Yes |

## Prerequisites and Navigation

**Prerequisite articles**:
- None required.

**Related articles**:
- Codex CLI — agent/client-side MCP context.
- Kiro MCP guide — MCP as a pattern for AI tool integration.
- Spec-Driven Development — possible workflow content that Rovo could summarize or route.

**Parent section**: Korean AI tools.

## Assumptions

- The target reader uses, evaluates, or administers Atlassian Cloud products.
- Advanced Forge implementation details are out of scope for the overview page.
- The page should not promise undocumented backend Rovo API capabilities.
