# Implementation Plan: SDD Wiki — Spec-Driven Development, Kiro, and Spec-Kit

**Branch**: `009-sdd-wiki-spec-kit` | **Date**: 2026-05-18 | **Spec**: [spec.md](spec.md)

**Input**: Feature specification from `specs/009-sdd-wiki-spec-kit/spec.md`

---

## Summary

Create 9 trilingual wiki articles (3 topics × 3 languages) covering Spec-Driven Development as a concept, and Kiro (AWS AI-powered IDE) and Spec-Kit (Claude Code workflow toolchain) as implementing tools. Additionally update `wiki/index.md`, `wiki/log.md`, and all three locale `SUMMARY.md` files. All content is synthesized — no `raw/` source files exist for these topics. Spec-Kit pages draw from 8 internal project files.

---

## Technical Context

**Language/Version**: Markdown (CommonMark + YAML front-matter); Bun runtime for notify script

**Primary Dependencies**: None introduced — uses existing `.wiki/templates/` structure

**Storage**: Git-tracked markdown files under `wiki/ko/`, `wiki/en/`, `wiki/ja/`

**Testing**: Acceptance criteria verified via manual checklist (contracts/article-content-contract.md) and `speckit-verify-run` post-implementation gate

**Target Platform**: GitBook (renders from `wiki/<locale>/SUMMARY.md`) + Obsidian (wikilink navigation)

**Project Type**: Content wiki (markdown documentation)

**Performance Goals**: N/A — static markdown

**Constraints**: 400 words minimum per article (SC-001); no verbatim raw/ copies (FR-013); trilingual parity required (all 3 languages, no stubs)

**Scale/Scope**: 9 index.md articles + 9 README.md landing pages + 3 SUMMARY.md updates + wiki/index.md update + wiki/log.md append = 23 file operations

---

## Constitution Check

*GATE: Must pass before Phase 0 research. Re-check after Phase 1 design.*

| Principle | Status | Notes |
|-----------|--------|-------|
| I. Spec Before Code | PASS | spec.md exists, clarified, FR-001 through FR-015 numbered and testable |
| II. Single Source of Truth | PASS | Each article is sole definition for its topic; wikilinks reference, not duplicate |
| III. Explicit Overrides Only | PASS | No deviations from constitution planned |
| IV. Version-Pinned Stack | PASS | version-guard confirmed @types/bun@1.3.14 and typescript@6.0.3 are current; no new packages |
| V. Type Safety | N/A | No production code generated |
| VI. Code Quality | N/A | No production code; markdown structure follows templates |
| VII. Testing Standards | N/A | Content verification via acceptance scenarios and content contracts |
| VIII. UX Consistency | N/A | No UI |
| IX. Design System | N/A | No UI components |
| X. Accessibility | N/A | No UI |
| XI. Performance Budgets | N/A | Static markdown; no latency or bundle surface |
| XII. Security and Privacy | PASS | No PII, no secrets, no sensitive data in wiki content |
| XIII. Module Boundaries | PASS | Files placed in established wiki/<locale>/<topic>/ convention; no cross-directory imports |
| XIV. Local-First | PASS | All authoring is local markdown; no cloud dependency |
| XV. AI Agent Governance | PASS | Agent traces to spec requirements; must not fabricate Kiro/SDD facts not in public record |
| XVI. Definition of Done | PASS | DoD applied: articles must hit 400w, pass front-matter validation, pass content contract, be verified by speckit-verify-run |

**Constitution Check Result**: ALL GATES PASS. No violations. No complexity justification required.

---

## Project Structure

### Documentation (this feature)

```text
specs/009-sdd-wiki-spec-kit/
├── spec.md                          # Feature specification
├── plan.md                          # This file
├── research.md                      # Phase 0 output
├── data-model.md                    # Phase 1 output
├── contracts/
│   ├── front-matter-schema.md       # Phase 1 output — YAML front-matter contract
│   └── article-content-contract.md  # Phase 1 output — content completeness contract
├── version-guard-report.md          # Pre-hook output — all packages current
└── tasks.md                         # Phase 2 output (created by /speckit-tasks)
```

### Wiki Files (repository root — to be created)

```text
wiki/
├── index.md                         # UPDATE — add 9 new index entries
├── log.md                           # APPEND — add 1 timestamped entry
├── ko/
│   ├── SUMMARY.md                   # UPDATE — add SDD, Kiro, Spec-Kit sections
│   ├── sdd/
│   │   ├── README.md                # NEW — Korean SDD category landing page
│   │   └── index.md                 # NEW — Korean SDD concept article
│   ├── kiro/
│   │   ├── README.md                # NEW — Korean Kiro category landing page
│   │   └── index.md                 # NEW — Korean Kiro tool article
│   └── spec-kit/
│       ├── README.md                # NEW — Korean Spec-Kit category landing page
│       └── index.md                 # NEW — Korean Spec-Kit tool article
├── en/
│   ├── SUMMARY.md                   # UPDATE — add SDD, Kiro, Spec-Kit sections
│   ├── sdd/
│   │   ├── README.md                # NEW
│   │   └── index.md                 # NEW
│   ├── kiro/
│   │   ├── README.md                # NEW
│   │   └── index.md                 # NEW
│   └── spec-kit/
│       ├── README.md                # NEW
│       └── index.md                 # NEW
└── ja/
    ├── SUMMARY.md                   # UPDATE — add SDD, Kiro, Spec-Kit sections
    ├── sdd/
    │   ├── README.md                # NEW
    │   └── index.md                 # NEW
    ├── kiro/
    │   ├── README.md                # NEW
    │   └── index.md                 # NEW
    └── spec-kit/
        ├── README.md                # NEW
        └── index.md                 # NEW
```

**Structure Decision**: Follows the established codex-cli pattern from feature 007 — each topic gets a `<topic>/README.md` (category landing) and `<topic>/index.md` (main article) per locale. This is the GitBook-compatible layout already in use.

---

## Implementation Phases (for /speckit-tasks)

### Phase A: Korean Articles (P1 — highest priority per User Story 1)

1. Create `wiki/ko/sdd/README.md` and `wiki/ko/sdd/index.md`
   - Template: concept-page.md
   - Mandatory: full name on first use, 4-row comparison table, wikilinks to Kiro + Spec-Kit
   - Minimum 400 words

2. Create `wiki/ko/kiro/README.md` and `wiki/ko/kiro/index.md`
   - Template: tool-page.md
   - Mandatory: staleness callout at top, core features (steering files, spec docs, agent tasks, autopilot), quick start example, SDD relationship

3. Create `wiki/ko/spec-kit/README.md` and `wiki/ko/spec-kit/index.md`
   - Template: tool-page.md
   - Mandatory: all 6 pipeline stages, 5 key commands, quick start example, extension hooks, source_count: 8

### Phase B: English Articles (P4 — trilingual coverage)

4. Create `wiki/en/sdd/README.md` and `wiki/en/sdd/index.md` — English equivalent of Phase A-1
5. Create `wiki/en/kiro/README.md` and `wiki/en/kiro/index.md` — English equivalent of Phase A-2
6. Create `wiki/en/spec-kit/README.md` and `wiki/en/spec-kit/index.md` — English equivalent of Phase A-3

### Phase C: Japanese Articles (P4 — trilingual coverage)

7. Create `wiki/ja/sdd/README.md` and `wiki/ja/sdd/index.md` — Japanese equivalent
8. Create `wiki/ja/kiro/README.md` and `wiki/ja/kiro/index.md` — Japanese equivalent
9. Create `wiki/ja/spec-kit/README.md` and `wiki/ja/spec-kit/index.md` — Japanese equivalent

### Phase D: Catalog and Navigation Updates (P5)

10. Update `wiki/index.md` — add 9 new entries (3 topics × 3 languages) following index-entry.md pattern
11. Append `wiki/log.md` — add one timestamped entry: `## [2026-05-18 HH:MM] ingest | SDD Wiki — Spec-Driven Development, Kiro, and Spec-Kit`
12. Update `wiki/ko/SUMMARY.md` — add SDD, Kiro, Spec-Kit sections
13. Update `wiki/en/SUMMARY.md` — add SDD, Kiro, Spec-Kit sections
14. Update `wiki/ja/SUMMARY.md` — add SDD, Kiro, Spec-Kit sections

---

## Key Content Decisions (from research.md)

| Decision | Value |
|----------|-------|
| SDD definition source | Synthesized from Kiro + Spec-Kit patterns; no canonical standard |
| Kiro staleness callout format | Blockquote before first section heading |
| SDD abbreviation | "Spec-Driven Development (SDD)" on first use; "SDD" thereafter |
| Comparison table rows | 4 data rows: BDD, TDD, ad-hoc (+ header = 5 rows total) |
| source_count: SDD | 0 |
| source_count: Kiro | 0 |
| source_count: Spec-Kit | 8 |
| README.md pattern | Category landing page per codex-cli precedent |

---

## Complexity Tracking

No constitution violations requiring justification.
