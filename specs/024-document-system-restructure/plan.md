# Implementation Plan: Documentation System Restructure and Exposure Governance

**Branch**: `024-document-system-restructure` | **Date**: 2026-05-28 | **Spec**: [spec.md](spec.md)

**Input**: Feature specification from `specs/024-document-system-restructure/spec.md`

## Summary

Audit the repository documentation system, classify every current or missing document, propose an improved navigation model, and apply only low-risk menu/link updates that have explicit rationale. Canonical full audit outputs stay under `specs/024-document-system-restructure/`; user-facing docs/wiki surfaces may receive only concise summaries, landing updates, or additive links needed for navigation or maintenance clarity.

The plan incorporates clarification decisions:

1. `specs/**/*.md` is inventoried as grouped entries by feature/artifact type, with `specs/` treated as internal by default.
2. Delete/archive actions, file moves, file renames, visibility removals, semantic rewrites, and broad content rewrites are out of scope.
3. Missing documents are classified in full; only lightweight placeholder or landing pages may be created when needed for navigation clarity.
4. Low-risk navigation updates are limited to additive menu/link changes, label fixes, and concise landing updates that do not change document meaning.

## Technical Context

**Language/Version**: Markdown (GitHub-Flavored Markdown / portable Markdown)

**Primary Dependencies**: Repository filesystem, GitBook `SUMMARY.md` conventions, existing Spec Kit artifact structure, DocGuard diagnostic output

**Storage**: Git repository filesystem (`docs/`, `wiki/`, `specs/`, `.specify/`)

**Testing**: Markdown inventory checks, `SUMMARY.md` coverage checks, relative-link validation, taxonomy/contract validation, manual review of destructive candidates

**Target Platform**: GitBook, GitHub Markdown, Obsidian-compatible Markdown readers

**Project Type**: Documentation governance and knowledge-wiki maintenance

**Performance Goals**: Audit should produce complete file coverage for the current repository state; no runtime performance target applies.

**Constraints**:
- Do not modify `raw/`.
- Do not rewrite all articles as part of this feature.
- Do not classify a document as Spec Kit related solely because the repository uses Spec Kit or because the artifact was generated during a Spec Kit workflow.
- Do not expose every document in menus; decide based on reader value, navigation value, and maintenance ownership.
- Do not perform destructive delete/archive actions, file moves, file renames, visibility removals, or semantic rewrites in this feature.
- Canonical full audit outputs stay under `specs/024-document-system-restructure/`.
- Slack notification requires `SLACK_WEBHOOK_URL` from the environment only and applies to eventual wiki-content updates, not internal Spec Kit planning artifacts.

**Scale/Scope**:
- Current observed Markdown count from the existing spec: 203 files under `docs/` and `wiki/`.
- Root GitBook points to `docs/`.
- Locale wiki menus exist under `wiki/ko`, `wiki/en`, and `wiki/ja`.
- `specs/**/*.md` is included through grouped feature/artifact entries, not per-file rows unless a group requires special treatment.

## Constitution Check

*GATE: Must pass before Phase 0 research. Re-check after Phase 1 design.*

Verify alignment with the constitution at `.specify/memory/constitution.md` (v2.0.0).

| Principle | Gate question | Pass? |
|-----------|---------------|-------|
| I. Audience-First | Are maintainers, reviewers, and contributors identified as target readers? | Yes |
| II. Accuracy | Are repository files and generated audit results the primary sources? | Yes |
| IV. Multilingual Parity | Are ko/en/ja wiki surfaces and parity gaps in scope? | Yes |
| V. Portable Markdown | Does the plan avoid platform-specific Markdown in canonical outputs? | Yes |
| VI. Progressive Depth | Are audit, policy, summary, and follow-up levels separated? | Yes |
| VII. IA & Navigation | Is navigation optimization a primary output? | Yes |
| VIII. Article Template | Is standard article prose out of scope with an exception documented? | Yes |
| IX. Terminology | Are status, treatment, exposure, and Spec Kit boundary terms governed? | Yes |
| XII. Quality Gates | Are inventory, link, taxonomy, and rationale validation included? | Yes |
| XIII. Maintenance | Are review triggers and reusable maintenance rules required? | Yes |
| XIV. Separation | Does the plan separate audit artifacts from user-facing article prose? | Yes |
| XV. Human Review | Are destructive decisions review-only and rationale-backed? | Yes |

No constitution violations.

## Project Structure

### Documentation (this feature)

```text
specs/024-document-system-restructure/
├── spec.md
├── plan.md
├── research.md
├── data-model.md
├── quickstart.md
├── analysis.md                  # Existing/follow-up audit analysis location
├── version-guard-report.md
├── contracts/
│   └── documentation-audit-contract.md
└── checklists/
    └── requirements.md
```

### Potential Follow-Up Output Locations

```text
docs/
├── SUMMARY.md                   # Low-risk additive menu/link updates only
└── ...                          # Concise summary/landing updates only when needed

wiki/
├── index.md                     # Catalog/link updates only when justified
├── log.md                       # Append-only work log for wiki-content changes
├── ko/SUMMARY.md                # Low-risk additive menu/link updates only
├── en/SUMMARY.md
└── ja/SUMMARY.md

specs/
└── */*.md                       # Grouped internal Spec Kit artifact inventory
```

**Structure Decision**: Use the feature directory as the canonical home for full audit tables and policies. Published docs/wiki changes are limited to additive discovery improvements and concise landing/summary updates that the audit justifies.

## Phase 0: Research

Research is repository-local. No external web research is required for this documentation governance plan.

Research decisions:

1. Treat `docs/`, `wiki/{ko,en,ja}/`, root/project guidance, and `specs/` as distinct documentation surfaces.
2. Treat `specs/**/*.md` as grouped internal inventory entries by feature/artifact type.
3. Treat `SUMMARY.md` exposure as necessary but insufficient evidence of discoverability.
4. Treat Spec Kit relevance as semantic, not provenance-based.
5. Treat missing multilingual counterparts as parity candidates, not automatic write tasks.
6. Apply only low-risk additive navigation updates in this feature.
7. Keep full audit outputs in the feature directory and publish only concise summaries or landing updates when needed.
8. Use DocGuard findings as additional audit input, not as automatic scope expansion.

See [research.md](research.md).

## Phase 1: Design

### Data Model

See [data-model.md](data-model.md). Core entities:

- DocumentationSurface
- DocumentInventoryEntry
- GroupedSpecArtifactEntry
- ExposureDecision
- LowRiskNavigationChange
- MissingDocumentCandidate
- MenuSectionProposal
- AuditPublicationSummary
- MaintenanceRule
- SpecKitBoundaryRule

### Contract

See [contracts/documentation-audit-contract.md](contracts/documentation-audit-contract.md). The contract defines required columns, allowed enum values, grouped Spec Kit artifact rules, low-risk navigation constraints, delete/archive review requirements, and validation checks.

### Quickstart

See [quickstart.md](quickstart.md) for the reviewer workflow.

### Agent Context

`AGENTS.md` already points to `specs/024-document-system-restructure/plan.md` inside the SPECKIT block. No path change is required.

## Phase 2: Task Strategy

Tasks should be generated in this order:

1. Refresh repository inventory and grouped Spec Kit artifact inventory.
2. Apply the treatment, exposure, latestness, missing-document, and Spec Kit boundary taxonomy.
3. Produce canonical audit outputs in the feature directory.
4. Propose improved menu structure and identify link-only documents.
5. Apply only justified low-risk additive menu/link/label/landing updates.
6. Record delete/archive/hold candidates as review-only recommendations.
7. Validate file coverage, link health, taxonomy completeness, and rationale completeness.

## Complexity Tracking

No constitution complexity exceptions.

## Hook Results

- DocGuard review ran before planning and reported existing project-wide documentation gaps. These are captured as audit input and do not expand this feature into broad canonical documentation generation.
- Version Guard ran before planning and wrote [version-guard-report.md](version-guard-report.md). No incompatible dependency constraints affect this documentation-only plan.
