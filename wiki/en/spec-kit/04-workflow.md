---
title: "Spec Kit Workflow"
aliases: ["Spec Kit pipeline", "Spec Kit steps", "SDD workflow"]
tags: [spec-kit, tool, concept, beginner, workflow]
category: process
tool: "Spec-Kit"
language: en
date_created: 2026-05-19
date_modified: 2026-05-19
source_count: 2
related: ["Spec Kit Core Concepts", "Spec Kit Command Guide", "Hands-on Tutorial"]
status: draft
review_cycle: fast-changing
freshness_date: 2026-05-19
---

# Spec Kit Workflow

> Spec Kit's full workflow runs eight commands in sequence — from establishing project rules (constitution) to verifying the implementation — with a simplified four-step version available for lower-risk features.

## Who this page is for

This page is for developers and team leads who want to understand the complete Spec Kit workflow, when to use the full pipeline versus the simplified version, and what each step produces. Familiarity with [Spec Kit Core Concepts](03-core-concepts.md) is recommended before reading this page.

## Why this matters

Knowing the workflow sequence matters because each step builds on the previous one. Running `/speckit-implement` without a reviewed plan means implementing against an unreviewed design. Running `/speckit-plan` without a clarified spec means planning against an ambiguous specification. The sequence is not arbitrary — each step exists to resolve a specific type of uncertainty before it becomes expensive to fix.

Understanding when to use the full pipeline versus the simplified version also matters. Applying eight steps to a three-line change is waste. Applying four steps to a feature with six edge cases is risk. Knowing which to choose requires understanding what each step does.

## Plain-language explanation

Spec Kit has two workflow options:

**Full workflow** (8 steps): For features of meaningful complexity, features with cross-cutting concerns, or features that require team review before implementation.

```
constitution → specify → clarify → checklist → plan → tasks → analyze → implement
```

**Simplified workflow** (4 steps): For lower-risk features with clear requirements and straightforward implementations.

```
specify → plan → tasks → implement
```

After implementation, a verification step (`/speckit-verify-run`) confirms the implementation matches the specification. This step applies to both workflows.

## Key concepts

### Full workflow — eight steps

**Step 1: Constitution** (`/speckit-constitution`)
Establish the project's governing rules. Done once at the start of a project; all subsequent specs inherit from it. Skip this step if the constitution already exists for your project.

**Step 2: Specify** (`/speckit-specify`)
Write the specification. Describe the feature in plain language; Spec Kit generates a structured `spec.md` with user stories, acceptance criteria, out-of-scope items, and edge cases.

**Step 3: Clarify** (`/speckit-clarify`)
Identify and resolve ambiguities in the specification. Spec Kit asks up to five targeted questions about unclear areas. Answers are encoded back into `spec.md`.

**Step 4: Checklist** (`/speckit-checklist`)
Generate a quality checklist for the specification. Validates that all required spec sections are complete, acceptance criteria are measurable, and edge cases are covered.

**Step 5: Plan** (`/speckit-plan`)
Generate the implementation plan. Spec Kit reads the specification and produces `plan.md` with the technical approach, file structure, and phased implementation sequence.

**Step 6: Tasks** (`/speckit-tasks`)
Generate the task list. Spec Kit reads the plan and produces `tasks.md` — an ordered, independently completable checklist of implementation steps.

**Step 7: Analyze** (`/speckit-analyze`)
Cross-check all artifacts for consistency. Verifies that `spec.md`, `plan.md`, and `tasks.md` are consistent with each other and that all acceptance criteria are covered by at least one task.

**Step 8: Implement** (`/speckit-implement`)
Execute the task list. The AI implements each task in order, checking its output against the specification and plan. Completed tasks are marked `[X]` in `tasks.md`.

### Simplified workflow — four steps

For features with clear requirements, isolated scope, and straightforward implementations, the simplified workflow skips clarification, checklist, and analysis:

1. `/speckit-specify` — Write the spec
2. `/speckit-plan` — Create the implementation plan
3. `/speckit-tasks` — Generate the task list
4. `/speckit-implement` — Execute the tasks

**When to use the simplified workflow**:
- The feature is well-understood with clear requirements
- The scope is narrow (one or two files affected)
- The team does not need to review the approach before implementation
- The feature is low risk (easy to correct if something is wrong)

**When to use the full workflow**:
- The feature touches multiple components or files
- Requirements are partially unclear or need stakeholder alignment
- The implementation approach needs team review before code is written
- The feature is high-stakes (difficult to correct if something is wrong)

## Example or analogy

> The full workflow is like planning a cross-country road trip: you check the map, confirm your destination, identify ambiguous segments, plan fuel stops, pack the car, review the route, and then drive. The simplified workflow is like driving to the grocery store two blocks away: you know where you are going, the route is familiar, and the cost of a wrong turn is low.

Neither approach is universally right. The key is matching the planning effort to the complexity and risk of the journey.

## Practical applications

**Choosing the right workflow**:

| Feature characteristic | Recommended workflow |
|------------------------|---------------------|
| Clear requirements, narrow scope | Simplified (4 steps) |
| Unclear requirements, multiple stakeholders | Full (8 steps) |
| Touches multiple files/components | Full (8 steps) |
| Single file change, isolated | Simplified (4 steps) |
| High-stakes (auth, payment, data migration) | Full (8 steps) |
| Low-stakes (UI text, style updates) | Simplified (4 steps) |

**Reviewing at each step**: At every step of the workflow, review the artifact before running the next command. The value of the workflow comes from human review at each stage — not from running all commands in sequence without stopping to read.

**When to stop and re-clarify**: If a later step reveals that an earlier artifact was wrong (the plan reveals an ambiguity in the spec, for example), go back and fix the earlier artifact before continuing. The workflow is designed to be iterable, not a one-pass process.

## Common misconceptions

1. **"The full workflow is always better."** — Applying eight steps to a trivial change creates unnecessary overhead. Match the workflow to the complexity of the feature.
2. **"You can run all steps without reviewing intermediate artifacts."** — Running commands without reviewing their output is the single most common reason Spec Kit produces poor results. Review is not optional — it is the point.
3. **"The workflow ends at implement."** — Implementation is not the end. The verify step (`/speckit-verify-run`) confirms the implementation matches the specification. Skip it and you may ship code that satisfies the tasks but misses the intent.

## Related terms

- [Spec Kit Core Concepts](03-core-concepts.md) — What each artifact is and what it is for
- [Spec Kit Command Guide](05-command-guide.md) — Detailed explanation of each command
- [Hands-on Tutorial](06-tutorial.md) — Walk through the simplified workflow with a practice project

## Further reading

- [Claude Code official documentation](https://docs.anthropic.com/claude-code) — Context for how Claude Code skills execute Spec Kit commands. As of 2026-05-19.
- [Spec-Driven Development (SDD)](../sdd/index.md) — The methodology this workflow implements.
