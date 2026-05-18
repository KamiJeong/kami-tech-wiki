---
title: "Spec-Kit"
aliases: ["speckit", "Spec Kit"]
tags: [spec-kit, claude-code, sdd, workflow, tool]
category: tool
tool: "Spec-Kit"
language: en
date_created: 2026-05-18
date_modified: 2026-05-18
source_count: 8
related: ["Spec-Driven Development (SDD)", "Kiro"]
status: active
---

# Spec-Kit

> A six-stage SDD workflow tool built into Claude Code. Turns natural language feature descriptions into structured specs, implementation plans, task lists, and verified code — all through slash commands.

---

## What is Spec-Kit?

Spec-Kit is a Spec-Driven Development ([[Spec-Driven Development (SDD)|SDD]]) workflow toolchain embedded in this project's `.claude/skills/` directory. It extends Claude Code with a structured pipeline that takes a feature description and guides it through six well-defined stages: specify, clarify, plan, tasks, implement, and verify.

Without Spec-Kit, developers relying on Claude Code for implementation often start from vague prompts, leading to misaligned outputs and difficult-to-verify results. Spec-Kit solves this by making the specification the primary input — the AI agent always works from a documented, verifiable source of truth.

---

## Core Concepts

- **Pipeline**: The `specify → clarify → plan → tasks → implement → verify` six-stage development flow
- **Slash Commands**: Workflow triggers executed in Claude Code as `/speckit-specify`, `/speckit-plan`, etc.
- **Extension Hooks**: Automation hooks that run before and after each pipeline stage
- **Pipeline State**: `pipeline-state.json` tracks completion status and blocked conditions for each stage

---

## The Six Pipeline Stages

### Stage 1: Specify

**Command**: `/speckit-specify`

Converts a natural language feature description into a structured `spec.md`. The output includes numbered functional requirements (FR), success criteria (SC), acceptance scenarios, non-functional requirements, and explicit out-of-scope items.

**Output**: `specs/<feature>/spec.md`

### Stage 2: Clarify

**Command**: `/speckit-clarify`

Analyzes the generated spec for underspecified areas and produces up to five targeted clarification questions. Answers are automatically encoded back into `spec.md`, raising spec quality before planning begins.

**Output**: Updated `specs/<feature>/spec.md`

### Stage 3: Plan

**Command**: `/speckit-plan`

Produces a technical implementation plan based on the spec. Covers tech stack decisions, architecture, file structure, and phased implementation approach. Version guard checks and constitution validation run automatically during this stage.

**Output**: `specs/<feature>/plan.md`, `specs/<feature>/research.md`, `specs/<feature>/data-model.md`

### Stage 4: Tasks

**Command**: `/speckit-tasks`

Decomposes the plan into a dependency-ordered, actionable task list. Each task includes its ID, description, target file path, and a parallel execution marker (`[P]`) where applicable. Tasks map directly to spec requirements for full traceability.

**Output**: `specs/<feature>/tasks.md`

### Stage 5: Implement

**Command**: `/speckit-implement`

Executes the tasks in `tasks.md` in dependency order, creating all specified files and code. Parallel tasks (`[P]`) are handled concurrently. Each completed task is marked `[X]` in `tasks.md`.

**Output**: All files specified in `tasks.md`; all tasks marked `[X]`

### Stage 6: Verify

**Command**: `/speckit-verify-run`

Performs a non-destructive validation gate. Checks implemented files against `spec.md`, `plan.md`, `tasks.md`, and `constitution.md`. Detects phantom completions — tasks marked `[X]` that lack corresponding implementation — and reports any unmet requirements.

**Output**: Verification report with pass/fail status and actionable remediation items

---

## Key Commands

| Command | Stage | Description |
|---------|-------|-------------|
| `/speckit-specify` | Specify | Convert a feature description into spec.md |
| `/speckit-clarify` | Clarify | Identify and resolve underspecified areas |
| `/speckit-plan` | Plan | Generate technical plan and architecture docs |
| `/speckit-tasks` | Tasks | Generate dependency-ordered task list |
| `/speckit-implement` | Implement | Execute tasks and create implementation files |
| `/speckit-auto` | Full pipeline | Run the entire pipeline in one command |
| `/speckit-analyze` | Analysis | Cross-check spec.md, plan.md, tasks.md for consistency |
| `/speckit-verify-run` | Verify | Validate implementation against specification |

---

## Quick Start

Run your first Spec-Kit feature in six steps:

```bash
# In Claude Code

# Step 1: Create the spec
/speckit-specify
# Prompt: "Add user authentication — email/password login, JWT token issuance"

# Step 2: Clarify ambiguities (recommended)
/speckit-clarify

# Step 3: Generate the implementation plan
/speckit-plan

# Step 4: Generate the task list
/speckit-tasks

# Step 5: Execute implementation
/speckit-implement

# Step 6: Verify the result
/speckit-verify-run
```

Or run the entire pipeline with a single command:

```bash
/speckit-auto
# Prompt: "Add user authentication — email/password login, JWT token issuance"
```

**Result**: A complete `specs/<feature>/` directory with `spec.md`, `plan.md`, `tasks.md`, and all implementation files. The verify stage confirms every requirement is met.

> [!tip] Getting started
> Run each stage individually on your first feature to understand what each step produces. The quality of the spec is the primary driver of implementation quality — time invested in `/speckit-clarify` pays dividends in `/speckit-implement`.

---

## Extension Hooks System

Spec-Kit supports an automation hook system that runs commands before and after each pipeline stage. Hooks are defined in `.specify/extensions.yml`:

```yaml
hooks:
  before_implement:
    - extension: git
      command: speckit.git.commit
      enabled: true
      optional: false
      description: "Auto-commit before implementation"

  after_implement:
    - extension: verify
      command: speckit.verify.run
      enabled: true
      optional: true
      description: "Auto-verify after implementation"
```

Built-in hooks include:

- **Git hooks**: Auto-commit at each stage boundary (`speckit-git-commit`)
- **Version guard**: Tech stack version validation against live registries (`speckit-version-guard-check`)
- **DocGuard**: Documentation quality gate (`speckit-docguard-guard`)
- **Token analyzer**: Token consumption tracking across pipeline runs (`speckit-token-analyzer-baseline`)

Hooks marked `optional: false` run automatically. Optional hooks prompt for confirmation or can be triggered manually.

---

## Spec-Kit as SDD in Practice

Spec-Kit is the concrete Claude Code implementation of Spec-Driven Development ([[Spec-Driven Development (SDD)|SDD]]). Each SDD principle maps directly to a pipeline stage:

- **Spec-first** → `/speckit-specify` ensures a spec exists before any implementation begins
- **Living specification** → `/speckit-clarify` and stage-level spec updates keep the spec current
- **Iterative refinement** → The six-stage cycle can be repeated as requirements evolve
- **Verifiability** → `/speckit-verify-run` makes every requirement check automated and traceable

---

## Integration & Connections

- **SDD methodology**: The foundational approach Spec-Kit implements → [[Spec-Driven Development (SDD)]]
- **Kiro**: Parallel SDD approach for AWS IDE environments → [[Kiro]]

---

## Limitations

> [!warning] Known constraints
> - **Claude Code only**: Spec-Kit is tightly coupled to the Claude Code slash command system and does not work in other AI agents or IDEs.
> - **Spec quality dependency**: Vague or incomplete specs produce vague implementations. The pipeline amplifies the quality (or lack thereof) of the initial feature description.
> - **Large features**: Features with a very high task count may exceed what is feasible in a single Claude Code session. Split large features into smaller, independently specifiable increments.

> [!note] Internal tool
> Spec-Kit is a project-internal tool. The implementation lives in `.claude/skills/speckit-*` files in this repository.

---

## References

- [Claude Code official docs](https://docs.anthropic.com/claude-code) — The Claude Code environment where Spec-Kit runs (2026-05-18)
- [Kiro official site](https://kiro.dev) — Parallel SDD approach in an AWS IDE (2026-05-18)
