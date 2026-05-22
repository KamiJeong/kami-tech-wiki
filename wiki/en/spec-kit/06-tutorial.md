---
title: "Hands-on Tutorial: Build Your First Feature with Spec Kit"
aliases: ["Spec Kit tutorial", "Spec Kit getting started", "Spec Kit practice project"]
tags: [spec-kit, tool, tutorial, beginner, hands-on]
category: process
tool: "Spec-Kit"
language: en
date_created: 2026-05-19
date_modified: 2026-05-19
source_count: 2
related: ["Spec Kit Workflow", "Spec Kit Command Guide", "Spec Kit Best Practices"]
status: draft
review_cycle: fast-changing
freshness_date: 2026-05-19
---

# Hands-on Tutorial: Build Your First Feature with Spec Kit

> Walk through the complete Spec Kit workflow — from specification to verified implementation — using a personal task tracker as the practice project.

## Who this page is for

This page is for developers who have read the Spec Kit overview articles and are ready to run the workflow with a concrete practice project. Claude Code must be available in your environment. Basic familiarity with a code editor and a terminal is assumed.

## Why this matters

Running Spec Kit once — writing a real spec, reviewing a real plan, watching the AI implement a real feature — makes the concepts concrete in a way that reading alone does not. This tutorial is designed to give you that experience in a safe practice environment.

## Plain-language explanation

This tutorial walks through building a personal task tracker using Spec Kit's simplified four-step workflow (specify → plan → tasks → implement). The practice project has four features: add a task, mark a task complete, filter tasks by status, and delete a task.

By the end, you will have completed one full Spec Kit workflow cycle and produced three pipeline artifacts: `spec.md`, `plan.md`, and `tasks.md`.

## Key concepts

### Practice project scope

The personal task tracker includes:
- Add a task with a title
- Mark a task as complete
- Filter tasks (show all / show active / show completed)
- Delete a task

This is the complete scope. Nothing beyond these four features is in scope for this tutorial.

### Freshness notice

> **As of 2026-05-19**: Spec Kit is implemented as Claude Code skills in this repository. The exact command invocation method depends on your Claude Code configuration. If a command does not work as shown, check the Claude Code documentation or the `.claude/skills/` directory for the current invocation format.

## Example or analogy

> Working through this tutorial is like learning to drive in a parking lot before taking the car on the highway. The parking lot (this tutorial) uses a simple, low-stakes scenario. The highway (a real project feature) uses the same skills but with higher consequences. The parking lot practice is what makes the highway safe.

## Practical applications

### Prerequisites

- Claude Code running in your development environment
- A project directory open in Claude Code
- Spec Kit skills available (check that `/speckit-specify` responds in Claude Code)

### Step 1: Write the specification

In Claude Code, run:

```
/speckit-specify
```

When prompted for a description, provide:

```
Build a personal task tracker. Users should be able to:
- Add a task with a title
- Mark a task as complete
- Filter tasks: show all, only active (incomplete), or only completed tasks
- Delete a task

Single-user application. No accounts. Tasks persist between sessions (localStorage).
```

**Review the output**: Open `spec.md`. Check that:
- All four features appear as user stories
- Each user story has measurable acceptance criteria
- "No accounts" and "localStorage" appear as scope constraints
- Edge cases are addressed (empty title, empty list, filter with no results)

**Common mistake**: Approving the spec without reading the acceptance criteria. The AI may write criteria that are vague ("the task is added") rather than measurable ("the task appears in the list with a unique ID and the title as provided"). Correct them before proceeding.

**Expected output**: `specs/task-tracker/spec.md` with 4 user stories and specific acceptance criteria for each.

### Step 2: Create the implementation plan

In Claude Code, run:

```
/speckit-plan
```

Spec Kit reads `spec.md` and generates `plan.md`. Review the plan for:
- Does the proposed tech stack match your project's stack?
- Does the data model for a task (fields, types) match your expectations?
- Is the file structure sensible?
- Are there any architectural choices you disagree with?

**If something is wrong**: Edit `spec.md` or tell Spec Kit what to change, then re-run `/speckit-plan`.

**Expected output**: `specs/task-tracker/plan.md` with tech stack decisions, a task data model, proposed file structure, and phased implementation approach.

### Step 3: Generate the task list

In Claude Code, run:

```
/speckit-tasks
```

Spec Kit reads `plan.md` and generates `tasks.md`. Review the task list for:
- Are tasks in a logical order? (Data model first, then UI components, then integration)
- Does every acceptance criterion in `spec.md` map to at least one task?
- Are tasks specific? ("Create `filterByStatus()` function" is specific; "implement filtering" is not)

**Expected output**: `specs/task-tracker/tasks.md` with 6-10 specific, ordered implementation tasks.

### Step 4: Implement

In Claude Code, run:

```
/speckit-implement
```

Watch as Spec Kit works through the task list. Each task corresponds to one or more file changes. Spec Kit marks each task `[X]` as it completes.

**During implementation**: Stay available. If Spec Kit encounters an ambiguity in the spec, it will ask. Answer based on your spec — if the answer requires a spec change, make the change in `spec.md` and confirm.

**Expected output**: All tasks marked `[X]` in `tasks.md`, all files created or updated as specified.

### Step 5: Verify the implementation

Test each acceptance criterion from `spec.md`:
- Can you add a task with a title?
- Does the task appear immediately with a unique ID?
- Can you mark a task as complete?
- Do filters show the correct subset of tasks?
- Can you delete a task?

**If a feature does not work**: Update the relevant acceptance criterion in `spec.md` to be more precise, then re-run `/speckit-implement` for the affected task (not the full task list).

**Optional**: Run `/speckit-verify-run` for a systematic check of all acceptance criteria.

### Step 6: What's next

After completing this tutorial:
- Try the full workflow (add `/speckit-clarify`, `/speckit-checklist`, `/speckit-analyze` between steps 1 and 2)
- Apply the same workflow to a real feature in an existing project
- Explore the [Best Practices](07-best-practices.md) article for advice on getting the most from Spec Kit

## Common misconceptions

1. **"I need to understand every file Spec Kit creates."** — Focus on the spec documents (`spec.md`, `plan.md`, `tasks.md`), not the implementation files. Your job is to review whether the implementation satisfies the acceptance criteria, not to read every line of generated code.
2. **"If Spec Kit makes a mistake, the tutorial is broken."** — AI output is imperfect. Review, correct the spec, and re-implement. This is the intended workflow, not a failure mode.
3. **"The simplified workflow is for simple features only."** — The simplified workflow is for features with clear, unambiguous requirements. Complexity of implementation is separate from complexity of requirements. A complex feature with clear requirements can use the simplified workflow; a simple feature with unclear requirements may need the full workflow.

## Related terms

- [Spec Kit Command Guide](05-command-guide.md) — What each command does in detail
- [Spec Kit Workflow](04-workflow.md) — Full and simplified workflow options
- [Spec Kit Best Practices](07-best-practices.md) — Advice for more effective Spec Kit usage

## Further reading

- [Claude Code official documentation](https://docs.anthropic.com/claude-code) — Reference for Claude Code skills and command invocation. As of 2026-05-19.
- [Spec-Driven Development (SDD)](../sdd/index.md) — The methodology this tutorial practices.

## Troubleshooting checklist

- [ ] Is Claude Code running and responding to commands?
- [ ] Does `/speckit-specify` respond in your Claude Code environment?
- [ ] Did you review `spec.md` before running `/speckit-plan`?
- [ ] Did you review `plan.md` before running `/speckit-tasks`?
- [ ] Did you review `tasks.md` before running `/speckit-implement`?
- [ ] Is the feature you are testing covered by an acceptance criterion in `spec.md`?
- [ ] If a feature does not work, has the relevant `spec.md` criterion been corrected and implementation re-run?
