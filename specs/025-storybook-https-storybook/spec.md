# Feature Specification: Storybook Overview for AI Native Frontend Development

**Feature Branch**: `025-storybook-https-storybook`

**Created**: 2026-05-28

**Status**: Draft

**Input**: User description: "Storybook에 대해 알고 싶어. Storybook이란, Storybook과 Design System의 관계, Storybook 기능, Storybook MCP, AI Native Development에서 Storybook MCP를 사용할 때 Figma 기반 화면 구현과 비교, Claude CLI/Codex CLI에서 화면 구현을 위해 추론하는 과정과 예상 Token 소비량 비교, Storybook을 언제 쓰면 좋은지 사례 공유"

## Content Overview *(mandatory)*

**Article type**: tool-overview

**Primary learning goal**: Korean readers should understand what Storybook is, how it supports design systems, what Storybook MCP adds for AI coding agents, and when Storybook is worth adopting.

**Target reader**: Korean product builders, designers, frontend engineers, beginner developers, and AI-native development practitioners who use Figma, Claude Code, Codex CLI, or similar agents to build UI.

**Languages in scope**: Korean (`wiki/ko/`) only for this issue.

**Review cycle**: fast-changing

## User Scenarios *(mandatory)*

### Reader Scenario 1 - Understand Storybook and Design Systems (Priority: P1)

A reader has heard of Storybook but does not know whether it is documentation, a test tool, a design system site, or a development environment.

**Why this priority**: The article must first give the reader a correct mental model before comparing AI workflows.

**Completion check**: The reader can explain stories, isolated component development, generated docs, and the relationship between Storybook and a design system.

**Acceptance scenarios**:

1. **Given** a reader who knows Figma but not Storybook, **when** they read the article, **then** they can explain Storybook as a frontend workshop where component states are captured as stories.
2. **Given** a team evaluating a design system, **when** they read the article, **then** they can distinguish Figma design definitions from Storybook's executable component documentation.

---

### Reader Scenario 2 - Evaluate Storybook MCP for AI Coding Agents (Priority: P2)

A reader wants to know how Storybook MCP changes the way Claude Code, Codex CLI, or another MCP-capable coding agent implements frontend UI.

**Why this priority**: The issue explicitly asks for Storybook MCP and AI Native Development strengths.

**Completion check**: The reader can describe how Storybook MCP exposes component docs, story instructions, previews, and test execution to an AI agent.

**Acceptance scenarios**:

1. **Given** a team with an existing React Storybook, **when** they read the article, **then** they can explain how an MCP-capable agent can query documented components before writing UI code.
2. **Given** a reader comparing Figma-only implementation against Storybook MCP implementation, **when** they read the comparison, **then** they can identify why executable component knowledge reduces guesswork.

---

### Reader Scenario 3 - Compare Figma-Based Implementation Cases (Priority: P3)

A team lead wants a pragmatic comparison of three implementation paths:

1. Figma only.
2. Figma plus Markdown explanation.
3. Figma plus a Storybook-backed design system and Storybook MCP.

**Why this priority**: The page should help a team decide whether Storybook setup cost is justified.

**Completion check**: The reader can choose a suitable workflow for prototypes, one-off pages, or reusable product UI.

**Acceptance scenarios**:

1. **Given** a one-off landing page, **when** the reader checks the recommendation table, **then** they can see why Storybook may be optional.
2. **Given** a product team building reusable UI, **when** the reader checks the comparison, **then** they can see why Storybook MCP provides stronger component reuse and validation.
3. **Given** a budget-sensitive AI workflow, **when** the reader reads the token section, **then** they understand that token numbers are estimates and should be interpreted as relative ranges, not benchmarks.

### Edge Cases

- The reader may think Storybook replaces Figma; clarify that Figma remains the design source while Storybook documents executable UI behavior.
- Storybook MCP is preview and currently React-focused; date capability claims and call out scope limits.
- Token consumption varies by model, prompt style, repository size, MCP output size, and number of iterations; present estimated ranges with assumptions.
- The reader may not know MCP; define it as a standard protocol for connecting AI clients to tool/data servers.

## Functional Requirements *(mandatory)*

- **FR-001**: The article MUST explain Storybook as a frontend workshop for isolated component and page development.
- **FR-002**: The article MUST explain the relationship between Storybook and a design system, including where Figma fits and where executable component stories fit.
- **FR-003**: The article MUST list major Storybook capabilities: stories, docs, addons, interaction testing, visual testing, accessibility testing, sharing, and CI use.
- **FR-004**: The article MUST explain Storybook MCP, its three documented toolset categories, and its preview/React-focused limitation as of 2026-05-28.
- **FR-005**: The article MUST compare the three Figma-based AI implementation cases requested by the issue.
- **FR-006**: The article MUST describe how Claude Code and Codex CLI reason through frontend implementation with and without Storybook MCP context.
- **FR-007**: The article MUST include relative token consumption estimates with assumptions and explicit non-benchmark caveats.
- **FR-008**: The article MUST provide adoption guidance and practical cases where Storybook and Storybook MCP are worth using.

## Success Criteria *(mandatory)*

- **SC-001**: A reader can summarize Storybook, Storybook stories, and Storybook's design-system role in under three sentences.
- **SC-002**: A reader can identify at least three Storybook capabilities that are relevant to a product UI team.
- **SC-003**: A reader can distinguish Figma MCP/design context from Storybook MCP/executable component context.
- **SC-004**: A reader can choose among Figma-only, Figma plus Markdown, and Figma plus Storybook MCP workflows for a given project.
- **SC-005**: The page labels token numbers as estimates and does not present them as measured benchmark results.

## Content Requirements *(mandatory)*

### Structural Requirements

- **CR-001**: Article MUST use the Korean wiki tool-page style with a short section README and a full `index.md` overview page.
- **CR-002**: Article MUST answer the six requested topics explicitly:
  1. What Storybook is.
  2. How Storybook relates to a design system.
  3. Major Storybook capabilities.
  4. What Storybook MCP is.
  5. AI Native Development comparison for three Figma-driven cases, including Claude Code/Codex CLI reasoning flow and expected token consumption.
  6. When to use Storybook, including Storybook MCP use cases.
- **CR-003**: Article MUST include at least one analogy or real-world example.
- **CR-004**: Article MUST include common misconceptions and practical adoption guidance.
- **CR-005**: Article MUST update `wiki/index.md`, `wiki/ko/SUMMARY.md`, and append `wiki/log.md`.

### Terminology Requirements

- **TR-001**: New terms introduced: Storybook, story, Component Story Format (CSF), design system, design token, addon, interaction test, visual test, accessibility test, Storybook MCP, manifest, toolset, Figma Dev Mode MCP Server.
- **TR-002**: Existing related terms referenced: Codex CLI, Claude Code, MCP, Figma, AI agent, design-to-code.
- **TR-003**: Translation decisions: keep product names in English; render "story" as "스토리"; render "design system" as "디자인 시스템"; render "toolset" as "툴셋"; render "agentic development" as "에이전트형 개발" or "AI Native Development" depending on context.

### Source Requirements

- **SR-001**: Use current official Storybook documentation and Storybook blog sources for Storybook and Storybook MCP claims.
- **SR-002**: Use official Figma sources for Figma Dev Mode and Figma MCP claims.
- **SR-003**: Use official Anthropic and OpenAI/OpenAI GitHub sources for Claude Code and Codex CLI MCP capability claims.
- **SR-004**: Date fast-changing product claims as "2026-05-28 기준".
- **SR-005**: Token consumption estimates MUST be labeled as heuristic estimates, not measured benchmark claims.

### Exception Documentation *(if any standard sections are omitted)*

| Omitted section | Reason | Approver |
|-----------------|--------|----------|
| Full multilingual parity | User request and project default target Korean first | Issue scope |
| Per-source raw summary page | No `raw/` source file was provided; official web sources are cited directly in the article | Issue scope |

## Constitution Check *(mandatory)*

| Principle | Requirement | Met? |
|-----------|-------------|------|
| I. Audience-First | Target readers include non-developers and AI-native practitioners | Yes |
| II. Accuracy | Current official sources required; estimates labeled | Yes |
| III. Original Synthesis | No final article prose in this spec | Yes |
| IV. Multilingual Parity | Korean-only exception documented | Yes |
| VI. Progressive Depth | Beginner overview, comparison, and technical MCP detail required | Yes |
| VII. IA & Navigation | Index, SUMMARY, and related links required | Yes |
| VIII. Article Template | Tool-page style applied | Yes |
| IX. Terminology | New and related terms listed | Yes |
| XIII. Maintenance | `review_cycle` declared as fast-changing | Yes |
| XIV. Separation | Spec contains requirements, not final article prose | Yes |

## Prerequisites and Navigation

**Prerequisite articles**:
- None required.

**Related articles**:
- Codex CLI — MCP-capable local coding agent context.
- Kiro MCP guide — MCP pattern for AI tool integration.
- OpenUI — generated UI and token-efficiency comparison context.
- Spec-Driven Development — specification-first workflow that can complement Storybook.

**Parent section**: Korean AI tools.

## Assumptions

- The first deliverable is a Korean page under `wiki/ko/storybook/`.
- The page should prioritize practical understanding over exhaustive Storybook API reference.
- The token comparison can use relative ranges because exact token consumption depends on model, prompt, repository size, and iteration count.
- Storybook MCP guidance should not overpromise non-React support while official docs mark AI capabilities as preview.
