---
title: "Hands-on Tutorial: Build Your First Feature with Kiro"
aliases: ["Kiro tutorial", "Kiro getting started", "Kiro practice project"]
tags: [kiro, tool, tutorial, beginner, hands-on]
category: process
tool: "Kiro"
language: en
date_created: 2026-05-19
date_modified: 2026-05-19
source_count: 2
related: ["How Kiro Specs Work", "Kiro Steering Guide", "Kiro Best Practices"]
status: draft
review_cycle: fast-changing
freshness_date: 2026-05-19
---

# Hands-on Tutorial: Build Your First Feature with Kiro

> Walk through the complete Kiro workflow — from writing a spec to reviewing the implementation — using a personal task tracker as the practice project.

## Who this page is for

This page is for developers who have read the Kiro overview articles and are ready to try the workflow with a concrete practice project. Basic familiarity with a code editor is assumed, but deep technical knowledge is not required.

## Why this matters

Reading about Kiro's workflow is useful. Actually running through it once — writing a real spec, reviewing a real design, watching the AI implement a real feature — makes the concepts concrete and memorable. This tutorial is designed to give you that experience in a safe practice environment, using a project small enough to complete in an hour but complex enough to exercise all of Kiro's core features.

## Plain-language explanation

This tutorial walks through building a personal task tracker application using Kiro's spec-driven workflow. The practice project has four features: add a task, mark a task complete, filter tasks by status, and delete a task. These four features are simple enough to understand at a glance but complex enough to exercise requirements writing, design review, and task execution.

You will write a spec, review it, watch Kiro implement it, and review the result. By the end, you will have completed one full Kiro workflow cycle from start to finish.

## Key concepts

### Practice project scope

The personal task tracker includes:
- Add a task with a title
- Mark a task as complete
- Filter tasks (show all / show active / show completed)
- Delete a task

This is the full scope. Nothing beyond these four features is in scope for this tutorial.

**Why this scope**: Four features gives enough complexity to exercise all parts of the spec (multiple user stories, multiple design components, multiple tasks) without requiring specialized knowledge to understand.

### Freshness notice

> **As of 2026-05-19**: Kiro was in active development at the time this tutorial was written. Specific UI elements, command names, and file formats may have changed. Refer to [kiro.dev](https://kiro.dev) for the current documentation if you encounter discrepancies.

## Example or analogy

> Building with Kiro is like working with a general contractor on a small home renovation. You describe what you want (the requirements), the contractor draws up a plan (the design), you both agree on the work order (the tasks), and then the contractor executes. Your job is to review at each stage and say: "yes, that's what I wanted" or "actually, let me correct that."

This tutorial is your first time working with this contractor. After it, you will know the rhythm of the collaboration.

## Practical applications

### Prerequisites

Before starting:
- Kiro installed (download from [kiro.dev](https://kiro.dev))
- A project directory opened in Kiro's IDE
- Basic familiarity with what a spec is (read [How Kiro Specs Work](04-specs-workflow.md) first)

### Step 1: Write the initial feature description

Open Kiro's Agentic Chat. Type the following (or your own equivalent):

```
I want to build a personal task tracker. Users should be able to:
- Add a task with a title
- Mark a task as complete
- Filter tasks to show all, only active, or only completed tasks
- Delete a task

This is a simple single-user application. No accounts, no cloud storage.
```

**Expected output**: Kiro acknowledges the description and proposes generating a spec.

**Common mistake**: Adding requirements that are out of scope (user accounts, sharing, cloud sync). Keep the scope minimal for this tutorial.

### Step 2: Review requirements.md

Kiro generates `requirements.md` with user stories and acceptance criteria. Open the file and read through it.

Check that each of the four features has:
- A user story ("As a user, I want to... so that...")
- At least one measurable acceptance criterion

**Example review**: If the acceptance criterion for "add a task" says only "task is added," ask Kiro to be more specific: "the task appears in the list immediately after being added, the task is assigned a unique ID, and a task with an empty title cannot be submitted."

**Expected output**: A requirements.md with 4 user stories and specific, measurable acceptance criteria for each.

### Step 3: Review design.md

Kiro generates `design.md` describing how the task tracker will be built. Even if you are not technical, check:
- Does the design include a data model for tasks? (What fields does a task have?)
- Does it describe a UI component for displaying the task list?
- Does it describe how filtering will work?

**Expected output**: A design.md describing the task data model, the UI components, and the filtering logic.

**Common mistake**: Approving a design without reading it. The design is where architectural choices are made. If you disagree with a choice, say so now — changing it later is more expensive.

### Step 4: Review tasks.md

Kiro generates `tasks.md` — an ordered checklist of implementation steps. Review for:
- Are the tasks in a logical order? (Data model before UI components, for example)
- Does every acceptance criterion in requirements.md map to at least one task?
- Are the tasks specific enough to verify? ("Create the Task data model" is specific; "implement the back-end" is not)

**Expected output**: A tasks.md with 6-12 specific, ordered implementation tasks.

### Step 5: Implement

Tell Kiro to begin implementation:

```
The spec looks good. Please implement all the tasks in tasks.md.
```

Watch the progress as Kiro works through the task list. Each task should correspond to a specific file change or addition.

**Expected output**: Implemented code for all four features. Kiro will report when each task is complete and flag any it could not complete.

**Common mistake**: Walking away during implementation. Stay available to answer questions if Kiro encounters an ambiguity not covered by the spec.

### Step 6: Review the implementation

After implementation, test the result against the acceptance criteria in requirements.md:

- Can you add a task with a title?
- Does the task appear in the list immediately?
- Can you mark a task as complete?
- Do the filters show the correct tasks?
- Can you delete a task?

**If a feature does not work as specified**: Update the relevant section of requirements.md to clarify the intended behavior, then ask Kiro to re-implement that specific task.

**Expected output**: All four features working as described in requirements.md.

### Step 7: What's next

After completing this tutorial, you are ready to:
- Add [Steering files](05-steering.md) to your project to capture the conventions you established during this build
- Set up a [Hook](06-hooks.md) to keep tests in sync with future changes
- Apply the same workflow to a real feature in an existing project

## Common misconceptions

1. **"I need to understand all the generated code to complete this tutorial."** — You need to understand the spec documents, not necessarily the implementation code. Review whether the code satisfies the acceptance criteria in requirements.md, not whether you understand every line.
2. **"If Kiro makes a mistake, something is wrong."** — AI output is rarely perfect on the first pass. Review, correct the spec, and re-implement. This is the normal workflow, not a failure.
3. **"I should complete all steps in one session."** — The spec documents are committed to git. You can pause after any step and continue later. The spec preserves your intent across sessions.

## Related terms

- [How Kiro Specs Work](04-specs-workflow.md) — Deep dive on requirements.md, design.md, and tasks.md
- [Kiro Steering Guide](05-steering.md) — Adding persistent guidance after completing this tutorial
- [Kiro Best Practices](09-best-practices.md) — Lessons for more effective Kiro usage

## Further reading

- [Kiro official site — Getting started](https://kiro.dev) — Official tutorial and setup guide. As of 2026-05-19.
- [AWS DevOps Blog](https://aws.amazon.com/blogs/devops/) — Real-world examples of spec-driven development with Kiro. As of 2026-05-19.

## Troubleshooting checklist

If something is not working, check these in order:

- [ ] Is Kiro installed and running? (Check [kiro.dev](https://kiro.dev) for install steps)
- [ ] Is a project directory open in Kiro's IDE?
- [ ] Did you review and approve the spec before asking Kiro to implement?
- [ ] Is the feature you are testing covered by an acceptance criterion in requirements.md?
- [ ] Did Kiro report any errors or blocked tasks during implementation?
- [ ] If a feature does not work, has the relevant section of requirements.md been corrected and implementation re-run?
