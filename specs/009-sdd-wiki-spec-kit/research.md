# Research: SDD Wiki — Spec-Driven Development, Kiro, and Spec-Kit

**Feature**: `009-sdd-wiki-spec-kit`
**Phase**: 0 — Research
**Date**: 2026-05-18

---

## Research Questions Resolved

### RQ-1: What is Spec-Driven Development (SDD) and how is it defined?

**Decision**: SDD is treated as an emerging methodology in the AI-assisted development space, synthesized from observable patterns in tools like Kiro and Spec-Kit. It is not yet a formally ratified IEEE/ISO standard; the concept page will synthesize its principles from first principles.

**Rationale**: No canonical academic or industry specification body has standardized "Spec-Driven Development" under that exact name as of 2026. The closest analogues are Behavior-Driven Development (BDD, Dan North, 2006) and Design-by-Contract (Bertrand Meyer, 1986). SDD as described in this feature represents a contemporary pattern where AI-augmented toolchains enforce specification artifacts as the primary governance layer.

**Alternatives considered**:
- Use an existing methodology name (e.g., "Specification by Example") — rejected because SDD specifically emphasizes formal spec artifacts as AI agent constraints, which is a distinct concern.
- Define SDD as a subset of BDD — rejected because SDD is broader (covers all phases, not just behavior scenarios).

**Sources**: Internal observation of Kiro and Spec-Kit patterns; Spec-Kit constitution.md; publicly available Kiro documentation.

---

### RQ-2: What is AWS Kiro and what are its core features?

**Decision**: Kiro is an AWS-developed AI-powered IDE (announced 2025, based on VS Code) that embeds spec-first development natively through three core constructs: steering files, spec documents (requirements/design/tasks), and autopilot mode.

**Key facts gathered**:
- Kiro was announced by AWS in 2025 as an AI-native IDE
- Built on VS Code infrastructure
- Primary differentiator: "specs" folder with structured `requirements.md`, `design.md`, `tasks.md` files that govern agent behavior
- "Steering files" (`.kiro/steering/`) configure agent persona, style, and constraints — analogous to CLAUDE.md
- "Agent tasks" allow Kiro to execute multi-step implementation from a spec
- "Autopilot mode" enables fully autonomous implementation within approved spec scope
- Kiro explicitly embodies spec-first: agents cannot proceed without a spec document
- Available as a standalone download (not yet in AWS Marketplace at time of writing)
- Free preview as of mid-2025; pricing TBD

**Rationale**: Content sourced from publicly available AWS announcements and Kiro official site. A staleness callout is mandatory per FR-006 and spec clarification.

**Alternatives considered**: N/A — Kiro is a specific named product with no alternative representations.

**Caveats**: Kiro is under active development. Features described reflect publicly available information as of 2026-05-18. Readers should verify at https://kiro.dev.

---

### RQ-3: What are the Spec-Kit pipeline stages and key commands?

**Decision**: Spec-Kit is documented from internal project files. The canonical pipeline is: `specify → clarify → plan → tasks → implement → verify`. Key commands are slash commands registered as Claude Code skills.

**Source files consulted** (for `source_count` calculation):
1. `.claude/skills/speckit-specify/` (skill definition)
2. `.claude/skills/speckit-clarify/` (skill definition)
3. `.claude/skills/speckit-plan/` (skill definition)
4. `.claude/skills/speckit-tasks/` (skill definition)
5. `.claude/skills/speckit-implement/` (skill definition)
6. `.claude/skills/speckit-verify-run/` (skill definition)
7. `.specify/memory/constitution.md` (governance layer)
8. `.specify/extensions.yml` (hooks system)

**Total internal files**: 8 — `source_count: 8` for Spec-Kit pages.

**Pipeline summary**:
| Stage | Command | Output | Purpose |
|-------|---------|--------|---------|
| Specify | `/speckit-specify` | `spec.md` | Define requirements from natural language |
| Clarify | `/speckit-clarify` | Updated `spec.md` | Resolve ambiguities |
| Plan | `/speckit-plan` | `plan.md`, `research.md`, `data-model.md`, `contracts/` | Technical design |
| Tasks | `/speckit-tasks` | `tasks.md` | Actionable, dependency-ordered task list |
| Implement | `/speckit-implement` | Source files | Executes tasks |
| Verify | `/speckit-verify-run` | Verification report | Post-implementation gate |

**Extension hooks system**: Before/after each stage, hooks in `.specify/extensions.yml` can fire mandatory or optional skill commands (e.g., `speckit-git-commit`, `speckit-version-guard-check`).

**Rationale**: Documenting from authoritative internal files per spec assumption ("Spec-Kit internals will be derived from existing project files").

---

### RQ-4: How does the SDD comparison table map to BDD, TDD, and ad-hoc development?

**Decision**: Four-row comparison table (per SC-006 and clarification): SDD vs BDD, SDD vs TDD, SDD vs ad-hoc. Plus header row = 5 rows total (header + 4 data rows).

| Dimension | SDD | BDD | TDD | Ad-hoc |
|-----------|-----|-----|-----|--------|
| Primary artifact | `spec.md` (formal requirement doc) | User story + Gherkin scenario | Failing test | None (informal) |
| Governs | AI agent behavior + human implementation | Test suite behavior | Code correctness | Nothing |
| Audience | AI agents + developers + stakeholders | QA + developers + business | Developers | Developers only |
| Specification timing | Before any code or tests | Before code, with test | Before code | After (or none) |
| Tool examples | Kiro, Spec-Kit | Cucumber, SpecFlow | Jest, pytest | N/A |

**Rationale**: BDD and TDD are well-established; ad-hoc was added per clarification session to give readers a baseline contrast.

---

### RQ-5: How should `source_count` be set per page?

**Decision**:
- SDD concept pages: `source_count: 0` — no raw/ files; content is synthesized from publicly known methodology patterns
- Kiro tool pages: `source_count: 0` — no raw/ files; content from public AWS/Kiro documentation
- Spec-Kit tool pages: `source_count: 8` — 8 internal project files consulted (see RQ-3)

**Rationale**: Per spec clarification: "Set `source_count` to the actual number of internal project files consulted per page."

---

### RQ-6: What is the SUMMARY.md update scope and pattern?

**Decision**: Three per-locale SUMMARY.md files must be updated: `wiki/ko/SUMMARY.md`, `wiki/en/SUMMARY.md`, `wiki/ja/SUMMARY.md`. Each gets three new sections (SDD, Kiro, Spec-Kit) following the existing `## Codex CLI` section pattern.

**Pattern from feature 007**:
```
## Codex CLI

* [Codex CLI 개요](codex-cli/README.md)
* [Codex CLI](codex-cli/index.md)
```

**New sections to add** (ko example):
```
## SDD (Spec-Driven Development)

* [SDD 개요](sdd/README.md)
* [Spec-Driven Development](sdd/index.md)

## Kiro

* [Kiro 개요](kiro/README.md)
* [Kiro](kiro/index.md)

## Spec-Kit

* [Spec-Kit 개요](spec-kit/README.md)
* [Spec-Kit](spec-kit/index.md)
```

Each topic folder also needs a `README.md` (category landing page) and `index.md` (main article), following the codex-cli pattern.

**Rationale**: Per FR-015 and the codex-cli precedent established in feature 007.

---

## Decisions Summary

| Decision | Chosen | Rationale |
|----------|--------|-----------|
| SDD definition source | Synthesized from Kiro + Spec-Kit patterns | No canonical standard exists |
| Kiro content source | Public AWS/Kiro documentation | Official product info |
| Spec-Kit content source | 8 internal project files | Authoritative internal source |
| source_count: SDD | 0 | No internal files |
| source_count: Kiro | 0 | No internal files |
| source_count: Spec-Kit | 8 | 8 internal files consulted |
| SDD comparison table | 4 rows: BDD, TDD, ad-hoc | Per SC-006 and clarification |
| Kiro staleness callout | Blockquote at page top | Per FR-006 and clarification |
| SDD abbreviation | Full name on first use, then "SDD" | Per FR-003 and clarification |
| SUMMARY.md scope | 3 locale files, 3 topics each | Per FR-015 |
| File structure | README.md + index.md per topic per locale | Matches codex-cli pattern |
