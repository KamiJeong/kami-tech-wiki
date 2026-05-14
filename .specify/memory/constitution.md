<!--
SYNC IMPACT REPORT
==================
Version change: (uninitialized template) → 1.0.0
Bump rationale: Initial ratification. All placeholders replaced with concrete principles
                for AI-assisted spec-driven development. MAJOR baseline established.

Modified principles: N/A (initial adoption)

Added sections:
  - Core Principles (16 principles, expanded from 5-slot template per user request)
  - Engineering Constraints (replaces SECTION_2_NAME)
  - Development Workflow & Quality Gates (replaces SECTION_3_NAME)
  - Governance

Removed sections: None

Templates requiring updates:
  - ✅ .specify/memory/constitution.md (this file)
  - ⚠ .specify/templates/plan-template.md — verify Constitution Check section references
    the 16 principles below; update if it still cites placeholder principle names
  - ⚠ .specify/templates/spec-template.md — verify mandatory scope/requirements sections
    align with Principles I, II, III, XV
  - ⚠ .specify/templates/tasks-template.md — verify task categorization covers principles
    VI (type safety), VII (testing), IX (Storybook), X (a11y), XI (perf), XII (security)
  - ⚠ .claude/skills/speckit-*/ — verify command guidance does not contradict principles

Deferred items: None.

Follow-up TODOs: None.
-->

# Analyze Site Design Constitution

This constitution defines the non-negotiable principles, constraints, and governance
rules that bind every contributor — human and AI — working in this repository. It is
the single source of authority for `/speckit.specify`, `/speckit.clarify`,
`/speckit.plan`, `/speckit.tasks`, `/speckit.implement`, `/speckit.analyze`, and the
extension-based quality gates (DocGuard, Version Guard, Verify, Token Analyzer).

## Core Principles

### I. Spec Before Code (NON-NEGOTIABLE)
Every feature MUST originate from an approved `spec.md` produced via `/speckit.specify`
and refined through `/speckit.clarify` before any production code is written. Plans,
tasks, and implementation MUST trace back to numbered spec requirements. Exploratory
spikes MAY exist on throwaway branches but MUST NOT be merged without a retroactive
spec.

- **Rationale**: AI agents amplify whatever ambiguity exists upstream; written specs
  bound the agent's interpretive freedom and create a reviewable artifact.
- **Enforcement**: `/speckit.plan` MUST refuse to run without a spec; `/speckit.analyze`
  MUST flag plan/task items that do not map to a spec requirement ID.
- **Example violation**: Opening a PR that adds a new API endpoint with no
  corresponding `spec.md` requirement, or implementing functionality that "extends"
  the spec without re-running clarification.

### II. Single Source of Truth
Each fact (requirement, type, constant, schema, API contract, design token) MUST have
exactly one authoritative definition. Other artifacts MUST reference or generate from
it; duplication is forbidden. When a fact appears in multiple places, a generator
SHOULD produce the derivatives.

- **Rationale**: Drift between duplicated definitions is the dominant source of
  AI-introduced bugs and stale documentation.
- **Enforcement**: DocGuard MUST flag duplicated definitions; reviewers MUST reject
  copy-pasted constants, hand-maintained type mirrors, or parallel schemas.
- **Example violation**: Defining an enum in TypeScript and re-declaring the same
  string literals in a JSON config; copy-pasting an OpenAPI schema into the client.

### III. Explicit Overrides Only
Any deviation from this constitution, the spec, the plan, or `version-guard`
constraints MUST be documented inline (code comment, plan section, or spec note)
with: (a) the rule overridden, (b) the reason, (c) the approver, (d) the expiry or
review date. Silent overrides are forbidden.

- **Rationale**: Undocumented exceptions metastasize; an explicit override is
  reviewable, searchable, and revocable.
- **Enforcement**: `/speckit.analyze` and DocGuard MUST scan for override markers and
  reject undocumented deviations.
- **Example violation**: Disabling a lint rule with `// eslint-disable` and no reason;
  hardcoding a value that contradicts the spec without an `OVERRIDE:` note.

### IV. Version-Pinned Stack
All runtime, language, framework, library, and tool versions MUST be pinned to exact
versions (no `^`, `~`, `latest`, or floating tags) and recorded in lockfiles and
`version-guard` constraints. Upgrades MUST be deliberate, single-purpose PRs.

- **Rationale**: AI agents trained on mixed-version corpora will emit
  version-incompatible code unless constrained; reproducibility demands pinning.
- **Enforcement**: `speckit.version-guard.check` MUST run before `/speckit.plan`;
  `speckit.version-guard.validate` MUST run after `/speckit.implement` and reject
  API patterns incompatible with the pinned version.
- **Example violation**: `"react": "^18.0.0"` in `package.json`; using a Python API
  removed in the pinned interpreter version; mixing Node 18 and Node 20 features.

### V. Type Safety
All production code MUST be statically typed end-to-end with no implicit `any`,
unchecked casts, or untyped boundaries. External inputs (HTTP, env vars, files,
LLM outputs) MUST be parsed and validated at the boundary with a schema (e.g.,
Zod, Pydantic). Generated types MUST come from the single source of truth (II).

- **Rationale**: Types are the cheapest, fastest feedback loop for AI-generated code.
- **Enforcement**: Strict compiler/linter settings MUST be enabled and CI MUST fail
  on type errors. `// @ts-ignore`, `as any`, or equivalent suppressions require an
  explicit override (III).
- **Example violation**: `function handler(req: any)` at an HTTP boundary; parsing
  JSON without schema validation; casting an `unknown` LLM response to a typed
  interface without runtime checks.

### VI. Code Quality
Code MUST be small, readable, and conventional: functions SHOULD fit on one screen,
modules SHOULD have a single responsibility, names MUST describe intent, and dead
code MUST be removed (unless explicitly retained per III). Formatters and linters
MUST run in CI and pre-commit hooks.

- **Rationale**: Reviewers — and future AI agents — read code far more often than
  they write it; complexity tax compounds.
- **Enforcement**: `/speckit.implement` MUST produce code that passes formatters,
  linters, and complexity thresholds. Reviewers MUST reject unjustified complexity.
- **Example violation**: A 400-line function; commented-out blocks left "for later";
  introducing an abstraction layer for a single caller.

### VII. Testing Standards
Every spec requirement MUST be covered by at least one automated test. The testing
pyramid MUST be respected: unit tests for logic, integration tests for boundaries,
end-to-end tests for critical user journeys. Mocks MUST NOT replace integration
tests at trust boundaries (DB, external APIs the spec depends on). Tests MUST be
deterministic; flaky tests MUST be quarantined or fixed within one sprint.

- **Rationale**: Without enforceable tests, AI-generated changes silently break
  invariants the human reviewer cannot hold in working memory.
- **Enforcement**: `speckit.verify.run` MUST run after `/speckit.implement` and
  refuse to certify completion if requirements lack tests; `speckit.verify-tasks.run`
  MUST detect phantom completions.
- **Example violation**: A task marked `[X]` with no corresponding test; mocking the
  database in a migration test; an E2E suite skipped in CI.

### VIII. UX Consistency
User-facing behavior — copy tone, spacing, motion, error messaging, empty states,
loading patterns, keyboard interactions — MUST be consistent across the product and
MUST come from the design system (IX). Ad-hoc UI variations require an explicit
override (III) with design approval.

- **Rationale**: Inconsistency erodes trust faster than missing features.
- **Enforcement**: Storybook visual review and design-system lint rules MUST run on
  every UI PR; `/speckit.analyze` MUST flag UI requirements not bound to design
  tokens.
- **Example violation**: A new modal that uses raw CSS instead of the system's
  `<Dialog>`; bespoke error text instead of the standard error component.

### IX. Design System and Storybook Governance
All shared UI primitives MUST live in the design system package, MUST have a
Storybook story covering default, loading, error, empty, and a11y states, and MUST
expose typed props (V). Application code MUST NOT redefine primitives that exist in
the system. Design tokens (color, spacing, typography, motion) are the single source
of truth (II) for styling.

- **Rationale**: Storybook is the executable contract between design and engineering;
  without it, AI agents reinvent components and drift accumulates.
- **Enforcement**: CI MUST run Storybook build, visual regression, and a11y addon
  checks. Reviewers MUST reject new primitives in app code.
- **Example violation**: A `<CustomButton>` defined inside a feature folder; a new
  primitive merged without stories; hardcoded `#FF0000` instead of a token.

### X. Accessibility
All user-facing UI MUST meet WCAG 2.2 Level AA: semantic HTML, keyboard operability,
visible focus, sufficient contrast, proper labels, and respect for `prefers-reduced-
motion`. Automated a11y checks (axe, Storybook a11y addon) MUST run in CI; manual
keyboard and screen-reader review SHOULD run for new flows.

- **Rationale**: Accessibility is a legal, ethical, and product-quality baseline; it
  is cheapest to enforce at component creation.
- **Enforcement**: a11y checks MUST be a blocking CI step; Storybook stories MUST
  pass the a11y addon; `/speckit.analyze` MUST flag UI requirements missing a11y
  acceptance criteria.
- **Example violation**: A `<div onClick>` instead of `<button>`; an icon-only button
  with no `aria-label`; modal traps that ignore Escape.

### XI. Performance Budgets
Each user-facing surface MUST declare a performance budget (e.g., LCP, TTI,
bundle size, API p95 latency, query cost) in `plan.md`. Budgets MUST be measured in
CI on representative data and MUST fail the build when exceeded. Optimizations
beyond the budget are out of scope.

- **Rationale**: Budgets convert "fast" from opinion to measurement; without them,
  AI-generated bloat (heavy deps, N+1 queries) ships unnoticed.
- **Enforcement**: `/speckit.plan` MUST require a Performance section with numeric
  budgets; CI MUST run Lighthouse / load tests / bundle analyzers as appropriate.
- **Example violation**: Adding moment.js for one format call; a list view that
  fires N queries per row; an unbudgeted 600 KB image hero.

### XII. Security and Privacy by Default
Secrets MUST NEVER be committed; they MUST be loaded from environment or a secret
manager. All external input MUST be validated (V). Output to logs, telemetry, or
LLM prompts MUST be free of PII, credentials, financial raw data, and unreleased
product information. Authentication, authorization, and audit logging MUST be
designed in the spec, not retrofitted.

- **Rationale**: Privacy and security mistakes are expensive and often irreversible;
  AI agents will happily echo secrets if not constrained.
- **Enforcement**: Secret-scanning MUST run in CI; PII masking MUST be enforced at
  log boundaries; `/speckit.specify` MUST include a Security & Privacy section for
  any feature touching user data.
- **Example violation**: A `.env` file committed to git; logging a full request body
  containing tokens; sending raw customer records to an external LLM.

### XIII. Clear Module Boundaries
Modules MUST have explicit public APIs (an `index` file or equivalent); internals
MUST NOT be imported across module boundaries. Cross-module dependencies MUST flow
in one direction (no cycles). Shared types live in dedicated packages, not in
ad-hoc shared folders.

- **Rationale**: Boundaries are the only durable defense against entropy in a
  multi-agent, multi-contributor codebase.
- **Enforcement**: Dependency-cruiser / eslint-boundaries (or language-equivalent)
  MUST run in CI; reviewers MUST reject reach-through imports.
- **Example violation**: `import { x } from "../../feature-a/internal/util"`; a
  circular dependency between `auth` and `user`; a god-module `shared/utils`.

### XIV. Local-First and Cost-Aware Development
The full development loop — build, lint, type-check, unit + integration tests,
Storybook — MUST run on a developer laptop without paid cloud services. AI agent
runs, LLM calls, and cloud builds MUST be measurable; the project SHOULD track
token consumption per Spec Kit phase via `speckit.token-analyzer.baseline` and
investigate regressions.

- **Rationale**: Tight local feedback loops are the cheapest accelerator; cost blind
  spots compound when AI is in the loop.
- **Enforcement**: A documented `make dev` / `npm run dev` (or equivalent) MUST
  bring up everything locally; token-analyzer reports SHOULD be reviewed at each
  Spec Kit phase boundary.
- **Example violation**: A test suite that requires a cloud database to run; a
  feature whose only validation path is a deployed environment; unbounded LLM
  retries with no token telemetry.

### XV. AI Agent Governance
AI agents (Claude Code, Cursor, Copilot, etc.) MUST operate within this
constitution. Agents MUST: (a) consult `spec.md`, `plan.md`, `tasks.md`, and this
constitution before writing code; (b) respect version-guard constraints; (c) refuse
to invent requirements; (d) flag ambiguity rather than guess; (e) leave an audit
trail (commit messages, task updates). Agent-generated code MUST be reviewed by a
human before merge; agents MUST NOT self-approve PRs.

- **Rationale**: Agents are powerful but unaccountable without explicit rules;
  governance turns them from liability into leverage.
- **Enforcement**: `/speckit.implement` MUST honor version-guard and DocGuard
  outputs; CODEOWNERS MUST require human approval; `/speckit.analyze` MUST flag
  agent-introduced drift.
- **Example violation**: An agent fabricating an API endpoint not in the spec; an
  agent merging its own PR; an agent ignoring a version-guard warning to "make the
  build pass."

### XVI. Definition of Done
A task is "done" only when ALL of the following hold: (1) it maps to a spec
requirement; (2) implementation passes type-check, lint, and format; (3) tests at
the appropriate pyramid level pass and cover the requirement (VII); (4) performance
budgets are met (XI); (5) a11y checks pass for UI (X); (6) security and privacy
checks pass (XII); (7) docs and stories are updated (II, IX); (8)
`speckit.verify.run` and `speckit.verify-tasks.run` certify the implementation;
(9) a human has reviewed and approved.

- **Rationale**: A precise DoD prevents "phantom completions" where tasks are marked
  done but the work is incomplete or fictional.
- **Enforcement**: `/speckit.implement` MUST NOT mark a task `[X]` until all DoD
  criteria pass; `speckit.verify-tasks.run` MUST audit task status against code.
- **Example violation**: Marking a task done with failing tests; closing an issue
  because "the code compiles"; merging without a11y or perf checks on a UI surface.

## Engineering Constraints

- **Language & runtime versions**: Pinned in `version-guard` constraints (IV). No
  feature may rely on a runtime/library version that is not pinned.
- **Repository layout**: Modules MUST follow the boundary rules of Principle XIII.
  Shared packages live under a clearly designated path (e.g., `packages/`, `libs/`).
- **Configuration**: All configuration MUST be typed (V), schema-validated at load,
  and documented in a single canonical file referenced from the spec (II).
- **Data**: Schemas (DB, API, events) MUST be versioned; breaking changes require
  a migration plan in `plan.md` and an explicit override note (III) if backward
  compatibility is broken.
- **Observability**: Production code MUST emit structured logs and metrics for the
  user journeys named in the spec; logs MUST be PII-safe (XII).

## Development Workflow & Quality Gates

The Spec Kit workflow is the mandatory path for any non-trivial change:

1. `/speckit.specify` → produces `spec.md`. Gate: spec lists numbered, testable
   requirements with acceptance criteria; includes Security & Privacy and (for UI)
   a11y and UX sections.
2. `/speckit.clarify` → resolves ambiguity. Gate: no `TBD`/`TODO` markers remain in
   normative sections.
3. `/speckit.plan` → produces `plan.md`. Gate: version-guard constraints written;
   performance budgets declared (XI); module boundaries identified (XIII);
   Constitution Check passes.
4. `/speckit.tasks` → produces `tasks.md`. Gate: every task maps to a spec
   requirement and a DoD slice (XVI); version-guard constraints loaded into context.
5. `/speckit.implement` → executes tasks. Gate: each task satisfies XVI before being
   marked `[X]`.
6. `/speckit.analyze` → cross-artifact consistency check. Gate: spec ↔ plan ↔ tasks
   ↔ code coherence; no orphan requirements; no fabricated tasks.
7. **Post-implementation**: `speckit.verify.run`, `speckit.verify-tasks.run`,
   `speckit.docguard.guard`, `speckit.version-guard.validate` MUST run; failures
   block merge unless an explicit override (III) is filed.

**Code review**: At least one human reviewer (not the agent operator alone) MUST
approve every change. Reviewers MUST verify constitution compliance, not just code
correctness.

## Governance

This constitution supersedes all other practices, conventions, and AI-agent
defaults. Conflicts MUST be resolved in favor of this document.

**Amendment procedure**:
1. Propose the amendment as a PR modifying `.specify/memory/constitution.md`,
   including an updated Sync Impact Report and the rationale.
2. The PR MUST update dependent templates (`plan-template.md`,
   `spec-template.md`, `tasks-template.md`) and command guidance to remain
   consistent.
3. Approval requires at least one maintainer; substantive principle changes
   (MAJOR) require team consensus documented in the PR.
4. On merge, run `/speckit.constitution` to confirm propagation and bump the
   version.

**Versioning policy** (semantic):
- **MAJOR**: Removing or redefining a principle in a backward-incompatible way,
  or removing a governance rule.
- **MINOR**: Adding a new principle, materially expanding an existing one, or
  adding a new mandatory gate.
- **PATCH**: Wording, clarifications, typo fixes, non-semantic refinements.

**Compliance review**: Every PR description MUST include a "Constitution Check"
note confirming the principles touched and any overrides filed. `/speckit.analyze`
SHOULD be run on any branch before requesting review. Quarterly, the maintainers
SHOULD audit a sample of merged PRs against this constitution and file follow-ups
for any drift.

**Runtime guidance**: Day-to-day agent behavior is configured via `CLAUDE.md` and
the `.claude/skills/` directory; those files MUST NOT contradict this constitution.
When they do, this constitution wins and the guidance files MUST be amended.

**Version**: 1.0.0 | **Ratified**: 2026-05-13 | **Last Amended**: 2026-05-13
