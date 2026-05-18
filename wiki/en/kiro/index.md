---
title: "Kiro"
aliases: ["Kiro IDE", "AWS Kiro"]
tags: [kiro, aws, ai-ide, tool]
category: tool
tool: "Kiro"
language: en
date_created: 2026-05-18
date_modified: 2026-05-18
source_count: 0
related: ["Spec-Driven Development (SDD)", "Spec-Kit"]
status: active
---

# Kiro

> **Freshness Notice**: The information on this page reflects the state of Kiro as of 2026-05-18. Kiro is under active development and features, interfaces, and availability may change. Always check the official site at [https://kiro.dev](https://kiro.dev) for the latest information.

---

## What is Kiro?

Kiro is an AI-powered integrated development environment (IDE) built by AWS. It is based on VS Code, which means developers can bring their existing VS Code extensions and settings, while gaining a purpose-built Spec-Driven Development ([[Spec-Driven Development (SDD)|SDD]]) workflow on top.

The core philosophy of Kiro is "spec before code." A developer describes a feature in natural language, and Kiro's AI agent generates structured spec documents, decomposes them into implementation tasks, and writes the code — all driven by the specification.

---

## Core Concepts

### Steering Files

Steering files are markdown files that define how the Kiro agent behaves throughout a project. They capture coding conventions, architectural principles, naming rules, and forbidden patterns, stored under `.kiro/steering/`. The agent reads these files at the start of every session, ensuring consistent code generation across the entire project lifecycle.

For example, a steering file might specify "all API responses must use a common envelope format." Every time Kiro generates an API handler, it will automatically follow this rule.

### Spec Documents

Kiro's spec system revolves around three files:

- **requirements.md**: Defines user stories and functional requirements. Includes acceptance criteria in the format "As a user, I want to..." with measurable conditions.
- **design.md**: Covers technical architecture, data models, API contracts, and component structure. This answers "how to build it" before a single line of code is written.
- **tasks.md**: A dependency-ordered list of implementation tasks derived from the design. Each task is independently completable and traceable to a requirement.

### Agent Tasks

Agent tasks are the concrete implementation units derived from the spec. A developer selects a task and assigns it to the Kiro agent. The agent reads the relevant spec documents and steering files, implements the task, and performs a self-check against the acceptance criteria before marking the task complete.

### Autopilot Mode

Autopilot mode allows Kiro to complete all tasks in a spec without human intervention between steps. The developer defines the spec, activates autopilot, and reviews the final result. This mode is particularly effective for initial feature scaffolding and repetitive implementation work where the spec is detailed enough to guide the agent through the full workflow.

---

## Usage Scenarios

| Good fit | Poor fit |
|----------|----------|
| Defining a spec first and letting AI implement it | Quickly editing already-written code |
| Enforcing consistent coding conventions across a team | Rapid prototyping without upfront design |
| Breaking a complex feature into traceable tasks | Working in a language or framework with limited Kiro support |

---

## Quick Start

The following is a basic Kiro workflow for a new feature:

```bash
# 1. Install Kiro and open your project
#    (Download the installer from kiro.dev)

# 2. Create a new spec
#    Command Palette → "Kiro: New Spec"
#    or manually create a folder under .kiro/specs/

# 3. Write requirements in requirements.md
# Example:
# ## User Stories
# - As a user, I want to log in with email and password
#   - Acceptance: Login completes within 2 seconds
#   - Acceptance: Invalid credentials show an error message

# 4. Ask Kiro to generate design.md
#    "Based on requirements.md, generate the technical design"

# 5. Ask Kiro to generate tasks.md
#    "Break the design into implementation tasks"

# 6. Execute tasks
#    Select a task → "Run with Kiro Agent"
#    Or activate autopilot:
#    Command Palette → "Kiro: Run Autopilot"
```

**Result**: The Kiro agent reads the spec documents and generates code that satisfies the defined requirements, then runs a self-verification pass against the acceptance criteria.

> [!tip] Getting started
> Start with steering files before writing your first spec. Define your tech stack, naming conventions, and architectural rules in `.kiro/steering/conventions.md` — this ensures every agent action respects your project standards from the very first task.

---

## Relationship to SDD

Kiro is a concrete IDE-level implementation of Spec-Driven Development ([[Spec-Driven Development (SDD)|SDD]]). The SDD principle of "spec-first" maps directly to Kiro's three-document spec system. "Living specification" maps to Kiro's ability to update spec documents as implementation progresses. "Iterative refinement" maps to the task-by-task execution and verification cycle that Kiro enforces by design.

Using Kiro is, in practice, practicing SDD with IDE-level tooling support.

---

## Integration & Connections

- **SDD methodology**: The foundational approach Kiro implements → [[Spec-Driven Development (SDD)]]
- **Spec-Kit**: The same SDD approach in the Claude Code environment → [[Spec-Kit]]

---

## Limitations

> [!warning] Known constraints
> - **Platform support**: As of 2026-05-18, Kiro supports macOS and Windows. Linux support may be limited. Check the official site for the current platform matrix.
> - **Language and framework coverage**: Not all languages and frameworks have the same level of agent support. Autopilot accuracy depends heavily on spec detail — vague specs produce vague code.

> [!note] Under active development
> Kiro is a rapidly evolving product. Features, UI, and APIs may change with updates. The information on this page is accurate as of 2026-05-18. Refer to the official documentation for the latest details.

---

## References

- [Kiro official site](https://kiro.dev) — AWS Kiro IDE official documentation and download (2026-05-18)
