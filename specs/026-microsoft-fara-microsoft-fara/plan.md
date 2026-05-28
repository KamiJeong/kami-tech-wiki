# Implementation Plan: Microsoft Fara Overview

**Branch**: `026-microsoft-fara-microsoft-fara` | **Date**: 2026-05-28 | **Spec**: [spec.md](spec.md)

**Input**: Feature specification from `specs/026-microsoft-fara-microsoft-fara/spec.md`

## Summary

Create the planning and design basis for a Korean Microsoft Fara wiki overview. The later implementation will create `wiki/ko/microsoft-fara/README.md` and `wiki/ko/microsoft-fara/index.md`, update `wiki/index.md` and `wiki/ko/SUMMARY.md`, append `wiki/log.md`, and send the existing Slack notification only when `SLACK_WEBHOOK_URL` is present.

The article must explain Microsoft Fara as Microsoft Research computer-use-agent model work, distinguish Fara-7B from the newer Fara1.5 family, and provide practical pilot and safety guidance. Implementation must verify current official sources live before drafting; this plan intentionally does not freeze fast-changing Fara facts. Because this issue is Korean-only under a documented Principle IV override, the article remains `draft` until the human review record accepts the override or multilingual parity is implemented.

## Technical Context

**Language/Version**: Portable Markdown with Korean article content; Spec Kit artifacts in Markdown.

**Primary Dependencies**: `.wiki/templates/tool-page.md`, `.wiki/templates/index-entry.md`, GitBook `SUMMARY.md` conventions, `AGENTS.md` wiki governance rules, official web sources checked during implementation.

**Storage**: Git repository filesystem. Planning artifacts live under `specs/026-microsoft-fara-microsoft-fara/`; later wiki content lives under `wiki/ko/microsoft-fara/` and shared wiki navigation files.

**Testing**: Manual and scripted content checks: frontmatter completeness, `source_count: 0`, source-register coverage, visual attribution coverage, glossary coverage, Markdown portability, internal relative links, `raw/` unchanged, navigation entries present, `wiki/log.md` appended, Slack notification attempted only when the environment variable exists, and evidence recorded for every Constitution Principle XII quality gate.

**Target Platform**: GitBook, GitHub Markdown, and Obsidian-compatible Markdown readers.

**Project Type**: Documentation and knowledge-wiki content feature.

**Performance Goals**: No runtime performance target. Implementation should keep the overview scannable for non-developers while preserving dated source accuracy for fast-changing claims.

**Constraints**:
- Do not modify `raw/`.
- Do not draft reader-facing article prose in planning artifacts.
- Re-check current official sources during implementation before writing claims about capability, availability, benchmark results, model cards, safety notes, or licensing.
- Prefer official Microsoft, Microsoft Research, GitHub, arXiv, Microsoft Foundry, and Hugging Face model-card sources over secondary commentary.
- Set wiki page frontmatter `source_count: 0` because this feature uses live official web sources and no `raw/` inputs; list web sources in the article body.
- Add or update the Microsoft Fara terminology record in `wiki/glossary/microsoft-fara.md` before publication review.
- Record all Principle XII review-gate results in `specs/026-microsoft-fara-microsoft-fara/review-gates.md`.
- Embedded visuals must have alt text, caption, source owner, source URL or local path, access date, and a defensible rights decision.
- Do not commit copied binary images unless source license or owner terms make reuse defensible. Use remote official image references, linked visual references, local captured screenshots, or original diagrams when safer.
- Slack notification must read `SLACK_WEBHOOK_URL` from the environment only and must not be hardcoded.

**Scale/Scope**:
- Two Korean wiki pages: `README.md` summary page and `index.md` full overview.
- Three shared wiki maintenance surfaces: `wiki/index.md`, `wiki/ko/SUMMARY.md`, and append-only `wiki/log.md`.
- Optional local assets only under `wiki/ko/microsoft-fara/assets/` if implementation creates original diagrams or defensibly captured screenshots.

## Constitution Check

*GATE: Must pass before Phase 0 research. Re-check after Phase 1 design.*

Verified against `.specify/memory/constitution.md` v2.0.0.

| Principle | Gate question | Pass? |
|-----------|---------------|-------|
| I. Audience-First | Is the target reader non-developer friendly and clearly defined? | Yes |
| II. Accuracy | Are reliable current-source verification rules required? | Yes |
| III. Original Synthesis | Does the plan avoid copying source text and require synthesized explanation? | Yes |
| IV. Multilingual Parity | Is the Korean-only scope exception documented with principle, reason, approver, and review/expiry date, without claiming full parity? | Yes, documented override |
| V. Portable Markdown | Does the plan require portable Markdown and standard image syntax? | Yes |
| VI. Progressive Depth | Does the planned article structure support summary, beginner, practical, misconception, and advanced context layers? | Yes |
| VII. IA & Navigation | Are prerequisite, related, index, and SUMMARY updates required? | Yes |
| VIII. Article Template | Is the tool-page template required with documented deviations? | Yes |
| IX. Terminology | Are new terms, Korean translation choices, and glossary update/check tasks carried into implementation requirements? | Yes |
| X. Reader Engagement | Are analogy, example, and practical use-case requirements retained? | Yes |
| XI. Depth Without Overload | Is this scoped to a practical overview rather than a production setup guide? | Yes |
| XII. Quality Gates | Are all ten required quality gates assigned to review tasks with evidence tracking? | Yes |
| XIII. Maintenance | Is the fast-changing review cycle and dated claims requirement preserved? | Yes |
| XIV. Separation | Does this plan avoid article prose and keep implementation content separate? | Yes |
| XV. Human Review | Is human editorial review required before treating the article as complete? | Yes |

No unresolved constitution gates after the documented Principle IV override. The Korean-only exception is bounded to issue #29, approved by the issue requester/repository owner subject to human editorial review, and expires on 2026-08-28 or before any `draft` to `active` status change, whichever comes first. This work must not be represented as full multilingual completion.

## Project Structure

### Documentation (this feature)

```text
specs/026-microsoft-fara-microsoft-fara/
├── spec.md
├── plan.md
├── research.md
├── data-model.md
├── quickstart.md
├── review-gates.md              # Created during implementation/review
├── version-guard-report.md
├── contracts/
│   └── microsoft-fara-wiki-contract.md
└── checklists/
    └── requirements.md
```

### Later Wiki Output Locations

```text
wiki/
├── glossary/
│   └── microsoft-fara.md        # Multilingual terminology record for this topic
├── index.md
├── log.md
└── ko/
    ├── SUMMARY.md
    └── microsoft-fara/
        ├── README.md
        ├── index.md
        └── assets/                  # Only if original or defensibly licensed local visuals are created
```

**Structure Decision**: Use the feature directory for planning, design, and review-gate evidence artifacts. Reader-facing Korean wiki content, the glossary terminology record, and maintenance updates are deferred to implementation.

## Phase 0: Research

Research planning decisions are captured in [research.md](research.md). The key decision is that implementation must perform live current-source verification and record source roles, publication dates, or access dates before drafting the article.

## Phase 1: Design

### Data Model

See [data-model.md](data-model.md). Core entities include `WikiArticle`, `SourceReference`, `VisualReference`, `NavigationUpdate`, `WikiLogEntry`, `SlackNotification`, `TermDecision`, and `ReviewGateResult`.

### Contract

See [contracts/microsoft-fara-wiki-contract.md](contracts/microsoft-fara-wiki-contract.md). The contract defines required output files, frontmatter, source-reference fields, visual attribution fields, navigation updates, log append format, Slack behavior, and validation checks.

### Quickstart

See [quickstart.md](quickstart.md) for the implementation and review workflow.

### Agent Context

`AGENTS.md` must point to this plan inside the `SPECKIT` block so subsequent stages load the current feature context.

## Phase 2: Task Strategy

Tasks should be generated in this order:

1. Re-check official Microsoft/Microsoft Research/GitHub/arXiv/Foundry/Hugging Face sources live and record source roles, publication dates, and access dates.
2. Decide visual strategy for at least two visuals or linked visual references, including licensing and attribution status.
3. Inspect existing glossary surfaces and add/update `wiki/glossary/microsoft-fara.md` for introduced terms.
4. Create `wiki/ko/microsoft-fara/README.md` using the short section-page role.
5. Create `wiki/ko/microsoft-fara/index.md` using the Korean tool-page style and full overview requirements.
6. Ensure both wiki pages include required frontmatter, `review_cycle: fast-changing`, and `source_count: 0`.
7. Update `wiki/index.md` and `wiki/ko/SUMMARY.md` with relative links.
8. Append `wiki/log.md` with the required timestamped operation format.
9. Send Slack notification after wiki updates only when `SLACK_WEBHOOK_URL` exists.
10. Run content checks for source coverage, dated fast-changing claims, visual attribution, glossary consistency, Markdown portability, internal links, no `raw/` modifications, navigation coverage, and human-review readiness.
11. Record all ten Constitution Principle XII review gates in `review-gates.md` with pass/fail/not-applicable status and evidence paths.

## Complexity Tracking

No unresolved complexity gates.

| Exception | Reason | Follow-up |
|-----------|--------|-----------|
| Korean-only article scope | Issue #29 and AGENTS.md default language target Korean first for this issue; Principle IV override is explicitly documented in spec.md | Keep pages `draft`; do not mark full multilingual parity complete until English and Japanese counterparts are specified and implemented, or until a human reviewer records acceptance of the override before 2026-08-28 |

## Hook Results

- DocGuard review ran before planning. It reported existing project-wide documentation issues and a warning that this feature spec lacks a section name expected by DocGuard. No DocGuard fixes were applied because they are outside this planning request.
- Version Guard ran before planning and wrote [version-guard-report.md](version-guard-report.md). Root npm dependencies are current and no OSV vulnerability records were returned for the checked locked versions.
