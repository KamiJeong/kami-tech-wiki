---
title: "Kiro Core Concepts: Workflow"
aliases: ["Kiro specs steering hooks", "Kiro workflow concepts"]
tags: [kiro, tool, concept, beginner, specs, steering, hooks]
category: concept
tool: "Kiro"
language: en
date_created: 2026-05-19
date_modified: 2026-05-19
source_count: 2
related: ["Kiro Core Concepts: Environment", "How Kiro Specs Work", "Kiro Steering Guide", "Kiro Hooks Guide"]
status: draft
review_cycle: fast-changing
freshness_date: 2026-05-19
---

# Kiro Core Concepts: Workflow

> Kiro's workflow rests on three pillars — Specs, Steering, and Hooks — each of which gives the AI agent a different kind of structured guidance.

## Who this page is for

This page is for anyone who wants to understand how Kiro's core workflow features fit together. It covers three concepts and explains what each one does without assuming prior technical knowledge. Read [What Is Kiro?](01-what-is-kiro.md) first if you haven't already.

## Why this matters

AI coding tools work from the context they are given. When the context is a short, informal prompt, the AI makes many assumptions. When the context is structured — a specification, a set of persistent guidelines, and automated triggers — the AI's output becomes more predictable and more consistent.

Kiro's three workflow concepts are the mechanism by which that structured context is created and maintained. Understanding them explains why Kiro produces more consistent results than informal AI prompting, and what it takes to set Kiro up to work well.

## Plain-language explanation

Kiro's workflow is built around giving the AI agent three types of input:

1. **Specs** — What to build for this specific feature (short-lived, feature-specific)
2. **Steering** — How to build everything in this project (persistent, project-wide)
3. **Hooks** — What to do automatically when something changes (triggered, event-driven)

These three inputs work together. Specs describe the target. Steering describes the rules. Hooks maintain consistency automatically as the project evolves.

## Key concepts

### Specs

A Spec is a set of three structured documents Kiro generates from a feature description: `requirements.md`, `design.md`, and `tasks.md`. Together, they answer: what are we building, how will we build it, and what are the steps?

**Why it matters**: Without a spec, the AI works from whatever you typed in the chat. With a spec, the AI works from a structured document that was reviewed before any code was written. The spec becomes the contract between your intent and the AI's output.

**Example**: You want to add a "forget password" feature to your application. Instead of typing "add a forgot password flow," you ask Kiro to create a spec. Kiro generates requirements.md (what the user should be able to do), design.md (what components will be built), and tasks.md (the ordered list of implementation steps). You review and approve the spec, then Kiro implements it.

### Steering

Steering files are Markdown documents stored in the `.kiro/steering/` folder of your project. They contain persistent guidance for the AI agent — things like coding conventions, naming rules, which libraries to use, and architectural patterns to follow.

**Why it matters**: Steering files solve the consistency problem. Every time Kiro runs, it reads the steering files. This means every AI action — regardless of which team member triggered it or which session it runs in — follows the same project-wide rules.

**Example**: A steering file called `conventions.md` might say: "All API responses must use a JSON envelope with `status`, `data`, and `error` fields. All variable names use camelCase. Error messages must be human-readable." Every API endpoint Kiro generates will follow these rules automatically.

### Hooks

Hooks are automated AI actions triggered by file system events. They are defined in `.kiro/hooks/` and specify: when a file matching a pattern changes, run this AI action.

**Why it matters**: As a project grows, keeping related files in sync becomes a maintenance burden. Hooks let you automate that maintenance. When an API changes, Kiro can automatically update the related tests. When a new component is added, Kiro can automatically generate the documentation.

**Example**: A hook defined as "when `api/*.ts` changes, update the corresponding tests in `tests/api/`" runs automatically whenever a developer saves a change to an API file. The AI reviews the change and updates the test file accordingly.

## Example or analogy

> Think of running a franchise restaurant. The Spec is the recipe for tonight's special — written specifically for this dish, reviewed before the kitchen starts cooking. The Steering is the franchise operations manual — the rules that apply to every dish in every location. The Hooks are the kitchen timers — automated reminders that trigger when something needs attention.

All three work together. The recipe tells tonight's cook what to make. The operations manual ensures it is made consistently with every other dish. The timers make sure nothing burns while the cook is focused elsewhere.

## Practical applications

**Setup scenario**: A team starting a new project with Kiro begins by writing steering files that capture their technology choices and coding conventions. Before any feature work begins, the AI has a clear set of rules to follow across the entire project.

**Feature scenario**: For a new login feature, a developer asks Kiro to generate a spec. The spec is reviewed, approved, and then used to guide implementation. The AI reads both the spec (what to build) and the steering files (how to build it).

**Maintenance scenario**: A hook is set up to update API documentation whenever an API file changes. When a developer modifies an API endpoint six months later, the documentation updates automatically without requiring a separate manual task.

## Common misconceptions

1. **"Specs are just documentation."** — Specs are active working documents. Kiro reads and executes against them. They are the primary input for AI-driven implementation — not a record of what was built, but a blueprint for what to build.
2. **"Steering is the same as a README."** — A README explains the project to a human reader. Steering files are instructions for the AI agent specifically. They are written to guide automated behavior, not to explain the project's history or setup steps.
3. **"Hooks run code automatically."** — Hooks trigger AI actions, not arbitrary code execution. They cause the AI agent to perform a specific, scoped task when a file event occurs. The developer reviews the AI's output before it is accepted.

## Related terms

- [How Kiro Specs Work](04-specs-workflow.md) — Full spec lifecycle in detail
- [Kiro Steering Guide](05-steering.md) — How to write and maintain effective steering files
- [Kiro Hooks Guide](06-hooks.md) — How to define and use hooks
- [Kiro Core Concepts: Environment](03a-environment-overview.md) — Agentic Chat, MCP, and IDE vs. CLI

## Further reading

- [Kiro official site](https://kiro.dev) — Official documentation for Specs, Steering, and Hooks. As of 2026-05-19.
- [AWS DevOps Blog](https://aws.amazon.com/blogs/devops/) — Background on the design decisions behind Kiro's workflow architecture. As of 2026-05-19.

## Language notes

| English term | Korean | Japanese | Translation note |
|---|---|---|---|
| spec | 명세서 (스펙) | 仕様書（スペック） | The structured documents (requirements, design, tasks) that guide Kiro |
| steering | 스티어링 (steering) | ステアリング | Persistent AI guidance — "AI에게 주는 지속적 가이드라인" |
| hooks | 훅 | フック | File event-triggered AI actions |

## Advanced notes

> **For advanced readers only** — you do not need to read this section to understand Kiro's core workflow concepts.

Specs, Steering, and Hooks map to three classical software engineering concepts: specification (what), convention (how), and automation (when). Kiro's contribution is making all three machine-readable inputs for an AI agent rather than documents written for human readers. The `.kiro/` directory structure makes these three inputs explicit and version-controllable, which means the AI's behavior can be tracked and audited through the project's git history.
