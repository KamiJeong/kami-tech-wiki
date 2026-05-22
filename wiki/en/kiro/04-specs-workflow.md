---
title: "How Kiro Specs Work"
aliases: ["Kiro spec lifecycle", "Kiro requirements design tasks"]
tags: [kiro, tool, concept, beginner, specs, workflow]
category: concept
tool: "Kiro"
language: en
date_created: 2026-05-19
date_modified: 2026-05-19
source_count: 2
related: ["Kiro Core Concepts: Workflow", "Kiro Steering Guide", "Kiro Hooks Guide"]
status: draft
review_cycle: fast-changing
freshness_date: 2026-05-19
---

# How Kiro Specs Work

> A Kiro spec is a set of three structured documents — requirements, design, and tasks — that guide the AI from a feature idea all the way to a reviewed implementation.

## Who this page is for

This page is for developers and product managers who want to understand the full Kiro spec lifecycle — from writing the initial description to reviewing the completed implementation. Some familiarity with software development concepts is helpful but not required.

## Why this matters

The spec is the central artifact of Kiro's workflow. Everything Kiro does flows from it. Understanding how the spec works — what documents it contains, how they relate to each other, and how to update them — is the foundation of working effectively with Kiro.

Without understanding the spec lifecycle, teams often treat Kiro as a code generator and miss its core value: a structured process that keeps the AI's output aligned with the team's actual intent.

## Plain-language explanation

A Kiro spec starts with a simple description of a feature you want to build. From that description, Kiro's AI generates three structured documents. You review and refine those documents. Then Kiro implements the feature from those documents.

The three documents are:

- **`requirements.md`** — What the user should be able to do (user stories and acceptance criteria)
- **`design.md`** — How the feature will be built (technical architecture, components, data structures)
- **`tasks.md`** — The ordered list of steps to implement the design

These documents live in your project under `.kiro/specs/[feature-name]/`. They are version-controlled alongside your code, so the spec history and code history stay in sync.

## Key concepts

### requirements.md

The requirements document captures user stories — short statements describing what a user wants to do and why. Each user story has acceptance criteria: measurable conditions that determine when the requirement is satisfied.

**Why it matters**: Requirements written in plain language (user stories) allow non-technical stakeholders to review and approve what is being built before any code is written. Acceptance criteria give the AI a concrete target to implement against.

**Example**:
```
## User Story 1: Add a task
As a user, I want to add a task with a title so I can track what I need to do.
Acceptance criteria:
- The task appears in the task list immediately after being added
- Tasks without a title cannot be submitted
- The task is assigned a unique ID automatically
```

### design.md

The design document translates the requirements into a technical plan: which components will be built, what data structures they will use, and how they will interact. This is where architectural decisions are documented before any code is written.

**Why it matters**: Writing the design before implementation reveals conflicts and unclear requirements early — when changes are cheap — rather than after code is written, when changes are expensive.

**Example**: A design document for a task tracker feature might specify that tasks will be stored in a local JSON file, that the UI will render a list component, and that each task object will have `id`, `title`, `status`, and `created_at` fields.

### tasks.md

The tasks document is an ordered checklist derived from the design. Each task is independently completable, specific enough to verify, and small enough to implement in a single session.

**Why it matters**: A task list derived from a spec gives the AI clear, bounded work units. Each task has a defined scope and can be verified against the design document. This prevents the AI from drifting outside the agreed-upon plan.

**Example**:
```
- [ ] Create the Task data model with id, title, status, created_at fields
- [ ] Implement the addTask() function that accepts a title and returns a Task
- [ ] Implement the renderTaskList() component that displays all tasks
- [ ] Write acceptance tests for User Story 1
```

## Example or analogy

> Think of building a house. The requirements document is the list of rooms and features the homeowner wants ("three bedrooms, a home office, a garage"). The design document is the architect's blueprint — the actual layout, dimensions, and specifications. The tasks document is the contractor's work order — "pour foundation on day 1, frame walls on days 2-3, install roof on days 4-5."

Each document answers a different question: what do we want, how will we build it, and who does what and when. All three are needed before construction begins.

## Practical applications

**Step-by-step workflow**:

1. **Describe the feature**: Tell Kiro what you want to build in plain language. "I want to build a personal task tracker where I can add, complete, filter, and delete tasks."

2. **Review requirements.md**: Kiro generates user stories and acceptance criteria. Read them carefully. Do they match your intent? Are the acceptance criteria measurable? Edit the document until it accurately represents what you want.

3. **Review design.md**: Kiro generates the technical design. If you have a technical background, check for architectural choices you disagree with. If you are non-technical, confirm that the design serves the requirements.

4. **Review tasks.md**: Kiro generates the implementation task list. Check that the tasks are in a logical order and cover all the requirements.

5. **Implement**: Tell Kiro to implement the tasks. Kiro works through the task list, checking each task against the requirements and design documents.

6. **Review and iterate**: Review the implementation against the acceptance criteria in requirements.md. If something is wrong, update the spec first, then ask Kiro to re-implement the affected tasks.

## Common misconceptions

1. **"The spec documents replace code comments and documentation."** — Spec documents describe intent before implementation. Code comments describe how the implementation works. Both serve different purposes and both are needed.
2. **"Once the spec is written, it should not change."** — Specs are living documents. When requirements change or the implementation reveals a flaw in the design, the spec is updated first, and implementation follows. A spec that never changes is a spec that fell out of sync with reality.
3. **"Kiro writes the spec automatically — I just approve it."** — Kiro drafts the spec from your description. You are responsible for reviewing and correcting it. The quality of the implementation depends entirely on the quality of the spec you approve.

## Related terms

- [Kiro Core Concepts: Workflow](03-core-concepts.md) — How Specs, Steering, and Hooks fit together
- [Kiro Steering Guide](05-steering.md) — Project-wide guidance that supplements the spec
- [Hands-on Tutorial](08-tutorial.md) — Walk through the full spec workflow with a practice project

## Further reading

- [Kiro official site — Specs documentation](https://kiro.dev) — Official reference for spec file structure and format. As of 2026-05-19.
- [AWS DevOps Blog](https://aws.amazon.com/blogs/devops/) — Background on Kiro's three-document spec design. As of 2026-05-19.

## Advanced notes

> **For advanced readers only** — you do not need to read this section to understand how Kiro specs work.

The three-document spec format (requirements, design, tasks) mirrors the waterfall-influenced systems engineering approach of separating requirements specification (what) from design specification (how) from work breakdown structure (sequence). Kiro adapts this for iterative development by treating specs as living documents rather than frozen sign-off artifacts. The key difference from classical waterfall: in Kiro, updating the spec is expected and planned for, not a failure of the upfront process.
