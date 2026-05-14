# template-spec-kit-claude

A GitHub repository template that bootstraps a **Spec Kit + Claude** project — giving you a complete, opinionated spec-driven development (SDD) workflow powered by Claude AI from day one.

## What is this?

This template wires together two things:

| Component | What it does |
|-----------|-------------|
| **[Spec Kit](https://github.com/github/spec-kit)** | A CLI + AI-workflow framework that enforces a structured path from idea → specification → plan → tasks → code |
| **Claude integration** | Claude Code skills (`.claude/skills/`) that implement every Spec Kit command as an AI-assisted action inside Claude |

When you create a new repository from this template, you get a ready-to-use SDD environment where every non-trivial feature must travel through a documented, reviewable pipeline before a single line of production code is written.

## How the workflow works

```
/speckit.specify   →   spec.md   (what to build)
/speckit.clarify   →   spec.md   (resolve ambiguities)
/speckit.plan      →   plan.md   (how to build it)
/speckit.tasks     →   tasks.md  (granular work items)
/speckit.implement →   code      (execute tasks)
/speckit.analyze   →   report    (cross-artifact consistency check)
```

Each step is a gate. You cannot skip ahead — plans need a spec, tasks need a plan, and implementation must trace every task back to a spec requirement.

## What's included

### Spec Kit configuration (`.specify/`)

| Path | Purpose |
|------|---------|
| `templates/spec-template.md` | Scaffold for writing feature specs (user stories, requirements, acceptance criteria) |
| `templates/plan-template.md` | Scaffold for technical implementation plans (tech context, project structure, performance budgets) |
| `templates/tasks-template.md` | Scaffold for dependency-ordered, user-story-grouped task lists |
| `templates/checklist-template.md` | Custom feature checklist template |
| `templates/constitution-template.md` | Blank constitution template for new projects |
| `memory/constitution.md` | The **Analyze Site Design Constitution** — 16 non-negotiable principles that govern this repository |
| `extensions.yml` | Auto-execute hooks (git commits, DocGuard, version-guard, token-analyzer) at each workflow boundary |
| `workflows/speckit/workflow.yml` | Full SDD cycle workflow: specify → plan → tasks → implement with human review gates |
| `init-options.json` | Spec Kit initialization settings (AI: claude, branch numbering: sequential) |

### Claude skills (`.claude/skills/`)

Each skill is a `SKILL.md` file that teaches Claude how to execute a Spec Kit command:

| Skill | What Claude does |
|-------|-----------------|
| `speckit-specify` | Generates a `spec.md` from a natural-language description |
| `speckit-clarify` | Asks targeted questions and encodes answers into the spec |
| `speckit-plan` | Produces a `plan.md` with tech context, project structure, and performance budgets |
| `speckit-tasks` | Generates a dependency-ordered `tasks.md` grouped by user story |
| `speckit-implement` | Executes tasks one by one, marking each `[X]` only when the DoD is fully met |
| `speckit-analyze` | Cross-artifact consistency check — flags orphan requirements and fabricated tasks |
| `speckit-checklist` | Generates a custom feature checklist |
| `speckit-constitution` | Creates or updates the project constitution and syncs dependent templates |
| `speckit-taskstoissues` | Converts `tasks.md` items into GitHub Issues |
| `speckit-git-*` | Git helpers: initialize repo, create feature branches, auto-commit at checkpoints |
| `speckit-docguard-*` | DocGuard suite: generate, review, guard, diagnose, fix, and score documentation |
| `speckit-version-guard-*` | Version Guard suite: check live registries, load constraints, validate generated code |
| `speckit-verify-*` | Post-implementation verification: check spec coverage and detect phantom completions |
| `speckit-token-analyzer-*` | Token consumption telemetry: baseline, compare, and report across workflow phases |

### The Constitution (`.specify/memory/constitution.md`)

The constitution is the single source of authority for everything in this repository. It defines **16 core principles** that every contributor — human or AI — must follow:

1. **Spec Before Code** — every feature needs an approved spec before any production code
2. **Single Source of Truth** — no duplicated definitions; derive from the canonical source
3. **Explicit Overrides Only** — deviations must be documented with reason, approver, and expiry
4. **Version-Pinned Stack** — all versions pinned to exact values; no `^`, `~`, or `latest`
5. **Type Safety** — statically typed end-to-end; no implicit `any`; schema-validate all inputs
6. **Code Quality** — small functions, single responsibility, no dead code, formatters enforced
7. **Testing Standards** — every requirement covered by tests; testing pyramid respected
8. **UX Consistency** — all UI from the design system; no ad-hoc variations
9. **Design System & Storybook** — shared primitives in design system with stories and typed props
10. **Accessibility** — WCAG 2.2 AA; semantic HTML; keyboard-operable; CI a11y checks
11. **Performance Budgets** — declare LCP/TTI/latency budgets in `plan.md`; CI must enforce them
12. **Security & Privacy by Default** — no committed secrets; PII-safe logs; auth designed in spec
13. **Clear Module Boundaries** — explicit public APIs; no reach-through imports; no cycles
14. **Local-First & Cost-Aware** — full dev loop runs without paid cloud; token cost tracked
15. **AI Agent Governance** — agents consult spec/plan/tasks before writing code; humans review all PRs
16. **Definition of Done** — a task is done only when type-check, tests, a11y, perf, security, and human review all pass

## Quality gates (auto-wired via `extensions.yml`)

These run automatically at workflow boundaries:

| Gate | When it runs |
|------|-------------|
| `speckit.git.feature` | Before `specify` — creates a feature branch |
| `speckit.version-guard.check` | Before `plan` — pins all tech stack versions |
| `speckit.docguard.review` | Before `tasks` — checks documentation consistency |
| `speckit.version-guard.load` | Before `tasks` and `implement` — loads version constraints into context |
| `speckit.docguard.guard` | After `implement` — ensures docs stay in sync with code |
| `speckit.verify.run` | After `implement` — validates implementation against spec requirements |
| `speckit.verify-tasks.run` | After `implement` — detects phantom completions (tasks marked done but not backed by real code) |
| `speckit.version-guard.validate` | After `implement` — scans generated code for version-incompatible API patterns |

## Getting started

### 1. Create a new repository from this template

Click **Use this template** → **Create a new repository** on GitHub.

### 2. Install Spec Kit

```bash
pip install spec-kit
```

### 3. Start a new feature

Open Claude Code in your repository and run:

```
/speckit.specify Build a user authentication system with email and password
```

Claude will generate a `specs/<branch>/spec.md` with user stories, requirements, and acceptance criteria.

### 4. Follow the workflow

```
/speckit.clarify      # resolve any ambiguities
/speckit.plan         # generate the implementation plan
/speckit.tasks        # generate the task list
/speckit.implement    # execute tasks with AI assistance
/speckit.analyze      # verify consistency across all artifacts
```

### 5. Customize the constitution

Edit `.specify/memory/constitution.md` to replace the "Analyze Site Design" constitution with your project's own principles, then run:

```
/speckit.constitution
```

This propagates your changes to all dependent templates.

## Project metadata

| Setting | Value |
|---------|-------|
| Spec Kit version | `0.8.10.dev0` |
| AI integration | Claude |
| Branch numbering | Sequential |
| Context file | `CLAUDE.md` |
| Shell | `sh` |
