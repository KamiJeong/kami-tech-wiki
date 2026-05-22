---
title: "Spec Kit Core Concepts"
aliases: ["Spec Kit concepts", "Spec Kit constitution spec plan tasks"]
tags: [spec-kit, tool, concept, beginner, sdd]
category: concept
tool: "Spec-Kit"
language: en
date_created: 2026-05-19
date_modified: 2026-05-19
source_count: 2
related: ["Spec Kit Workflow", "Spec Kit Command Guide", "What Is GitHub Spec Kit?"]
status: draft
review_cycle: fast-changing
freshness_date: 2026-05-19
---

# Spec Kit Core Concepts

> Spec Kit's workflow rests on five core concepts: constitution (project rules), specification (what to build), plan (how to build it), tasks (the work units), and quality gate (did it work?).

## Who this page is for

This page is for developers and team leads who want to understand what each step of the Spec Kit workflow produces and why each step exists. Basic familiarity with software development concepts is helpful.

## Why this matters

Understanding Spec Kit's core concepts helps you use the toolkit intentionally, not mechanically. Knowing what each artifact is for and what goes into a good one makes the difference between a Spec Kit workflow that produces reliable output and one that produces better-formatted versions of the same ambiguous prompts.

## Plain-language explanation

Spec Kit's workflow produces a set of documents called pipeline artifacts. Each artifact answers a specific question:

- **Constitution** → What rules does this project always follow?
- **Specification (spec.md)** → What is this feature and what does "done" look like?
- **Plan (plan.md)** → How will this feature be built?
- **Tasks (tasks.md)** → What are the individual steps?
- **Quality gate** → Does the implementation match the specification?

These documents are generated in sequence, each building on the previous. Together, they form a complete, documented record of the feature's development.

## Key concepts

### Constitution

The constitution is a project-wide governance document that defines the rules every feature must follow: technology choices, coding conventions, quality standards, architectural patterns, and review requirements. It is created once at the project level and applies to all subsequent specifications.

**Why it matters**: Without a constitution, every new feature spec must re-specify the same foundational rules. With a constitution, those rules are inherited automatically. The spec focuses only on what is specific to this feature.

**Example**: A constitution might specify: "All APIs must be implemented in TypeScript. All database queries must use parameterized statements. Every feature must have a spec.md before implementation begins." Every feature spec inherits these rules without repeating them.

**Created with**: `/speckit-constitution`

### Specification (spec.md)

The specification is a structured document describing a single feature: what it is, who it is for, what "done" looks like (acceptance criteria), what is explicitly out of scope, and what edge cases must be handled.

**Why it matters**: The specification is the primary input for every subsequent step. A clear, precise specification produces a clear plan and a reliable implementation. A vague specification produces a vague plan and a corrective implementation.

**Example**: A specification for a task filter feature would include: user stories (who uses the filter and why), acceptance criteria (filtering by "active" shows only incomplete tasks), out-of-scope items (sorting is not in scope for this feature), and edge cases (what happens when the filter returns zero results).

**Created with**: `/speckit-specify`

### Plan (plan.md)

The plan is a technical implementation document created from the specification. It describes: the technology stack, the file structure, the architectural approach, and the phased implementation sequence.

**Why it matters**: Reviewing the plan before implementation gives the team a chance to catch architectural mistakes when they are cheap to fix — before any code is written. The plan also constrains the AI: it works from the plan, not from its own architectural preferences.

**Example**: A plan for the task filter feature might specify: filters will be implemented as pure functions in a `filters.ts` file, the UI will use the existing `TaskList` component with a filter prop, and the filter state will be managed in the parent component without a state management library.

**Created with**: `/speckit-plan`

### Tasks (tasks.md)

The task list is an ordered checklist of specific, independently completable implementation steps derived from the plan. Each task is small enough to verify, specific enough to know when it is done, and traceable to a requirement in the specification.

**Why it matters**: A task list derived from a reviewed specification gives the AI bounded, reviewable work units. It prevents scope creep (the AI implementing beyond what was planned) and makes progress visible (you can see which tasks are complete and which remain).

**Example tasks for the filter feature**:
- Create `filters.ts` with `filterByStatus(tasks, status)` function
- Update `TaskList` component to accept a `filter` prop
- Add filter buttons (All, Active, Completed) to the main UI
- Write tests for `filterByStatus` with empty, partial, and full datasets

**Created with**: `/speckit-tasks`

### Quality gate

The quality gate is a verification step that checks whether the implementation satisfies the specification. It reviews completed tasks against the acceptance criteria and identifies any requirements that are not met.

**Why it matters**: Without a quality gate, it is easy to mark a task complete and miss that the acceptance criterion it was supposed to satisfy is still failing. The quality gate makes verification systematic rather than relying on developer memory.

**Example**: The quality gate checks: Does filtering by "active" show only tasks with status "active"? Does the filter reset when the user navigates away and returns? Are the acceptance criteria in spec.md each satisfied by at least one implemented behavior?

**Run with**: `/speckit-verify-run`

## Example or analogy

> Building a feature with Spec Kit is like commissioning a painting. The constitution is the gallery's standing rules (no larger than 5 feet, must use archival materials). The specification is the commission brief (a landscape of the harbor at sunrise, from a specific viewpoint). The plan is the artist's sketch (rough composition, color palette, sequence of layers). The tasks are the daily work orders (prime the canvas, block in the sky, add the water). The quality gate is the final inspection against the commission brief before the painting is delivered.

Each step answers a question that the previous step raised. Each step is reviewed before the next begins.

## Practical applications

**Constitution setup (one-time per project)**:
- Run `/speckit-constitution`
- Document: tech stack, coding conventions, required quality standards, review process
- Commit to git — all subsequent specs inherit from it

**Per-feature workflow**:
1. `/speckit-specify` — Write the spec; review carefully before proceeding
2. `/speckit-clarify` — Resolve ambiguities; update the spec
3. `/speckit-plan` — Review the technical approach before implementation
4. `/speckit-tasks` — Review the task list; check that all acceptance criteria are covered
5. `/speckit-implement` — Watch implementation proceed; answer questions as they arise
6. `/speckit-verify-run` — Confirm the implementation satisfies the spec

## Common misconceptions

1. **"The constitution is a README."** — A README explains the project to a human reader. The constitution is a governance document that the Spec Kit pipeline reads and enforces. It constrains every specification and implementation that follows.
2. **"Plan.md is optional if the spec is detailed enough."** — The plan translates the specification into a technical approach. Without a plan, the AI chooses the approach freely — which may conflict with the project's architecture. The plan review step is where architectural alignment happens.
3. **"Tasks are just a checklist."** — Tasks are the AI's work instructions. Each task must be specific enough that the AI knows exactly what to do and the developer knows exactly what to verify. A vague task ("implement the filter") is not a task — it is a delegation of all remaining thinking to the AI.

## Related terms

- [Spec Kit Workflow](04-workflow.md) — How the core concepts fit together in sequence
- [Spec Kit Command Guide](05-command-guide.md) — The specific commands that produce each artifact
- [Spec-Driven Development (SDD)](../sdd/index.md) — The methodology these concepts implement

## Further reading

- [Claude Code official documentation](https://docs.anthropic.com/claude-code) — Context for Claude Code skills, which is how Spec Kit commands are implemented. As of 2026-05-19.
- [Spec-Driven Development (SDD)](../sdd/index.md) — Detailed explanation of the SDD methodology that these concepts operationalize.

## Language notes

| English term | Korean | Japanese | Translation note |
|---|---|---|---|
| constitution | 프로젝트 규약 | プロジェクト憲章 | Project-wide governing document — not a national constitution |
| spec / specification | 명세서 (스펙) | 仕様書（スペック） | The structured document describing what to build |
| quality gate | 품질 검증 | 品質ゲート | Verification step that checks implementation against spec |
