---
title: "Spec Kit Command Guide"
aliases: ["Spec Kit commands", "Spec Kit slash commands", "Spec Kit skills"]
tags: [spec-kit, tool, reference, beginner]
category: reference
tool: "Spec-Kit"
language: en
date_created: 2026-05-19
date_modified: 2026-05-19
source_count: 2
related: ["Spec Kit Workflow", "Spec Kit Core Concepts", "Hands-on Tutorial"]
status: draft
review_cycle: fast-changing
freshness_date: 2026-05-19
---

# Spec Kit Command Guide

> Plain-language explanations of every Spec Kit command, what it does, when to use it, and what it produces.

## Who this page is for

This page is for developers who want a practical reference for Spec Kit commands. It covers each command in the order they are typically used, with plain-language explanations and concrete examples.

## Why this matters

Knowing that a command exists is only half the knowledge you need. Understanding what the command does, what input it needs, and what it produces determines whether you use it effectively. This guide closes that gap.

## Plain-language explanation

Spec Kit commands are implemented as Claude Code skills. In Claude Code, they appear as `/speckit-[name]` commands. In skills mode (where Claude Code skills are invoked directly), they may be referenced without the slash prefix. This guide uses the full command format (`/speckit-[name]`) throughout.

## Key concepts

### /speckit-constitution

**What it does**: Creates or updates the project constitution — the project-wide governance document that defines rules every feature must follow.

**When to use it**: Once at the start of a new project. Re-run if the project's foundational rules change significantly (new tech stack, new quality standards).

**Input**: You describe the project's context, technology choices, quality standards, and architectural principles.

**Output**: `.specify/memory/constitution.md` — the project constitution that all subsequent commands read.

**Example**: "Create a constitution for a Node.js REST API project. We use TypeScript, PostgreSQL, and Jest for testing. Every API endpoint must have a spec before implementation. Security: no credentials hard-coded anywhere."

---

### /speckit-specify

**What it does**: Creates a structured feature specification (`spec.md`) from a plain-language description.

**When to use it**: At the start of every feature, before any planning or implementation.

**Input**: A plain-language description of the feature — what it does, who uses it, what success looks like.

**Output**: `specs/[feature-name]/spec.md` — containing user stories, acceptance criteria, out-of-scope items, edge cases, and dependencies.

**Example**: "Build a personal task tracker where users can add tasks with a title, mark tasks as complete, filter by status (all/active/completed), and delete tasks. Single user, no accounts, local storage only."

---

### /speckit-clarify

**What it does**: Analyzes the current `spec.md` for ambiguous or underspecified areas and asks up to five targeted clarification questions. Answers are encoded back into the spec.

**When to use it**: After `/speckit-specify`, before `/speckit-plan`. Skip only for features where the specification is already complete and unambiguous.

**Input**: Reads `spec.md` automatically; you answer the questions it generates.

**Output**: Updated `spec.md` with clarifications incorporated.

**Example**: Spec Kit might ask: "You specified 'local storage only' — should tasks persist between browser sessions, or is this session-only?" Your answer updates the spec before planning begins.

---

### /speckit-checklist

**What it does**: Generates a quality checklist for the current specification and optionally validates completeness.

**When to use it**: After `/speckit-clarify`, as a final check before planning. Most useful when the spec is complex or when multiple people need to review it.

**Input**: Reads `spec.md` automatically.

**Output**: `specs/[feature-name]/checklists/requirements.md` — a checklist confirming that all required spec sections are complete, criteria are measurable, and edge cases are addressed.

**Example output**: "[ ] Acceptance criterion for filter-by-status is measurable (specifies what 'active' means). [X] Out-of-scope items identified. [ ] Edge case for empty task list is addressed."

---

### /speckit-plan

**What it does**: Generates an implementation plan from the specification. Describes the technical approach, architecture, file structure, and phased implementation sequence.

**When to use it**: After the specification is complete and reviewed (clarified, checklist passed).

**Input**: Reads `spec.md` and `constitution.md` automatically.

**Output**: `specs/[feature-name]/plan.md` (implementation approach), `research.md` (technical decisions and alternatives considered), `data-model.md` (entity relationships, if applicable).

**Example**: The plan for a task tracker might specify: tasks stored as JSON in localStorage, a `TaskStore` class for CRUD operations, a functional React component for the list, and a filter function in a separate `utils/filters.ts` file.

---

### /speckit-tasks

**What it does**: Generates a dependency-ordered task list from the implementation plan.

**When to use it**: After the plan is reviewed and approved.

**Input**: Reads `plan.md` and `spec.md` automatically.

**Output**: `specs/[feature-name]/tasks.md` — an ordered checklist of specific, independently completable implementation steps.

**Example tasks**:
```
- [ ] T001 Create TaskStore class with add(), complete(), delete(), getAll() methods
- [ ] T002 [P] Create filterByStatus() utility function in utils/filters.ts
- [ ] T003 Create TaskList React component with filter prop support
- [ ] T004 Add filter UI (All/Active/Completed buttons) to the main view
```

---

### /speckit-analyze

**What it does**: Cross-checks `spec.md`, `plan.md`, and `tasks.md` for consistency. Identifies mismatches: acceptance criteria without corresponding tasks, tasks not traceable to requirements, plan elements not covered by tasks.

**When to use it**: After generating tasks and before implementing. Part of the full workflow; optional in the simplified workflow.

**Input**: Reads `spec.md`, `plan.md`, and `tasks.md` automatically.

**Output**: Analysis report documenting consistency check results and any identified gaps.

**Example finding**: "Acceptance criterion SC-003 (filter returns zero results gracefully) is not covered by any task in tasks.md. Suggest adding a task for the empty-state UI component."

---

### /speckit-implement

**What it does**: Executes the task list, implementing each task in order. Marks completed tasks `[X]` in `tasks.md`.

**When to use it**: After the task list is complete, reviewed, and consistent with the specification.

**Input**: Reads `tasks.md`, `plan.md`, `spec.md`, and `constitution.md` automatically.

**Output**: All files and code specified in `tasks.md`, with tasks marked `[X]` on completion.

**Note**: Parallel tasks (marked `[P]` in tasks.md) can run simultaneously where the task design allows it.

---

## Example or analogy

> Spec Kit commands are like the steps of a recipe. `/speckit-constitution` is assembling your pantry staples before you start cooking for the season. `/speckit-specify` is choosing the dish. `/speckit-clarify` is reading the recipe carefully and noting the questions before you shop. `/speckit-plan` is writing your shopping list and prep order. `/speckit-tasks` is the step-by-step cooking instructions. `/speckit-analyze` is checking you have all the ingredients before you start. `/speckit-implement` is cooking.

Running the commands out of order — implementing before planning, planning before clarifying — is like starting to cook before you have the recipe or the ingredients.

## Practical applications

**Quick reference**: When in doubt, run the commands in this order:
1. `/speckit-constitution` (once per project)
2. `/speckit-specify`
3. `/speckit-clarify`
4. `/speckit-checklist`
5. `/speckit-plan`
6. `/speckit-tasks`
7. `/speckit-analyze`
8. `/speckit-implement`
9. `/speckit-verify-run` (after implementation)

**Skills mode note**: In some configurations, Spec Kit commands run as Claude Code skills rather than slash commands. The command names remain the same; the invocation method may differ depending on how Claude Code is configured in your project.

## Common misconceptions

1. **"I only need /speckit-implement."** — Implementation is the last step, not the only step. The quality of the implementation depends on the quality of the specification, plan, and task list that precede it.
2. **"Clarify is optional."** — Clarification is optional for simple, clear features. For features with any ambiguity, skipping clarification means the AI must choose how to resolve the ambiguity — and its choice may not match your intent.
3. **"Analyze is redundant if I review each step manually."** — Manual review catches obvious gaps. `/speckit-analyze` systematically cross-checks all three artifacts for consistency. Both are valuable; neither replaces the other.

## Related terms

- [Spec Kit Workflow](04-workflow.md) — How commands fit into the full and simplified workflows
- [Spec Kit Core Concepts](03-core-concepts.md) — What each artifact produced by these commands is for
- [Hands-on Tutorial](06-tutorial.md) — Walk through these commands with a practice project

## Further reading

- [Claude Code official documentation](https://docs.anthropic.com/claude-code) — Reference for how Claude Code skills work. As of 2026-05-19.
- [Spec-Driven Development (SDD)](../sdd/index.md) — The methodology these commands implement.
