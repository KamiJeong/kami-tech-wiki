# Implementation Plan: Multilingual Wiki Series — Kiro & GitHub Spec Kit

**Branch**: `021-create-replace-multilingual` | **Date**: 2026-05-19 | **Spec**: [spec.md](spec.md)

**Input**: Feature specification from `specs/021-create-replace-multilingual/spec.md`

## Summary

Create 69 Markdown wiki pages (12 Kiro files + 10 Spec Kit files per language × 3 languages + 3 comparison pages) explaining Kiro (agentic IDE/CLI) and GitHub Spec Kit (SDD toolkit) to non-developer audiences. Existing single-file overviews in `wiki/*/kiro/` and `wiki/*/spec-kit/` are replaced with multi-page series. Delivery is English-first, then Korean, then Japanese. All pages use GFM-only Markdown and the standard 13-section wiki template.

## Technical Context

**Language/Version**: Markdown (GitHub-Flavored Markdown / GFM) — no build toolchain required

**Primary Dependencies**: N/A — pure Markdown content; no frameworks or libraries

**Storage**: Git repository filesystem (`wiki/ko/`, `wiki/en/`, `wiki/ja/` directories)

**Testing**: Manual review per constitution quality gates; `/speckit-analyze` cross-artifact check

**Target Platform**: GitHub, GitBook, Obsidian — GFM-compatible Markdown readers (CR-009)

**Project Type**: Knowledge wiki content publication (not code)

**Performance Goals**: N/A — static Markdown files

**Constraints**: GFM-only Markdown; no platform-specific callouts; each page independently readable; English-first delivery order

**Scale/Scope**: 69 output files across 3 language directories; replaces 12 existing single-file wiki pages

## Constitution Check

| Principle | Gate question | Pass? |
|-----------|---------------|-------|
| I. Audience-First | Is the target reader (non-developer) clearly defined in the spec? | ✅ Non-developers, PMs, founders, beginner devs |
| II. Accuracy | Are research sources identified and reliable? | ✅ SR-001/SR-002 require verifiable, dated sources |
| IV. Multilingual Parity | Are all three languages (ko/en/ja) in scope and tasked? | ✅ English-first, then ko, then ja |
| V. Portable Markdown | Does the plan avoid platform-specific Markdown features? | ✅ GFM-only (CR-009) |
| VI. Progressive Depth | Does the article structure include all required depth layers? | ✅ Overview → concepts → workflow → tutorial → glossary |
| VII. IA & Navigation | Are prerequisites and related articles identified? | ✅ SDD cross-ref; each page has suggested next reads |
| VIII. Article Template | Is the standard 13-section structure applied or exception documented? | ✅ CR-001 mandates 13 sections |
| IX. Terminology | Are new terms identified and a glossary-update task included? | ✅ TR-001–TR-004; glossary pages are pages 10 (Kiro) and 09 (SpecKit) |
| XII. Quality Gates | Are all 10 quality gate review tasks included in tasks.md? | ⏳ To be confirmed in tasks stage |
| XIII. Maintenance | Is `review_cycle` declared (stable / periodic / fast-changing)? | ✅ fast-changing, every 3 months |
| XIV. Separation | Does the plan contain no article prose? | ✅ Plan describes structure only |
| XV. Human Review | Is a human review task included before merge to main? | ⏳ To be included in tasks |

## Project Structure

### Documentation (this feature)

```text
specs/021-create-replace-multilingual/
├── spec.md              # Feature specification
├── plan.md              # This file
├── research.md          # Phase 0 output
├── data-model.md        # Phase 1 output (wiki page schema)
├── contracts/           # Phase 1 output (page template contracts)
│   └── page-template-contract.md
└── tasks.md             # Phase 2 output (/speckit-tasks)
```

### Output files (wiki content)

```text
wiki/
├── en/
│   ├── kiro/
│   │   ├── index.md                  # Series landing page (replaces existing)
│   │   ├── 01-what-is-kiro.md
│   │   ├── 02-why-kiro-matters.md
│   │   ├── 03-core-concepts.md
│   │   ├── 04-specs-workflow.md
│   │   ├── 05-steering.md
│   │   ├── 06-hooks.md
│   │   ├── 07-mcp.md
│   │   ├── 08-tutorial.md
│   │   ├── 09-best-practices.md
│   │   └── 10-glossary.md
│   ├── spec-kit/
│   │   ├── index.md                  # Series landing page (replaces existing)
│   │   ├── 01-what-is-spec-kit.md
│   │   ├── 02-why-spec-kit-matters.md
│   │   ├── 03-core-concepts.md
│   │   ├── 04-workflow.md
│   │   ├── 05-command-guide.md
│   │   ├── 06-tutorial.md
│   │   ├── 07-best-practices.md
│   │   ├── 08-risks.md
│   │   └── 09-glossary.md
│   └── kiro-vs-spec-kit.md           # Comparison page
├── ko/                               # Same structure as en/
└── ja/                               # Same structure as en/
```

**File count**: 12 (Kiro series including index.md and 03a split) + 10 (Spec Kit series including index.md) + 1 (comparison) = 23 per language × 3 = 69 files
(Note: includes index.md landing pages per directory and the added Kiro 03a environment overview page)

**Structure Decision**: Single flat directory per tool per language. No nested subfolders beyond `wiki/{lang}/{tool}/`. Series pages are prefixed with two-digit numbers for sort order.

## Phase 0: Research

Research is minimal for this feature — it covers a content creation task, not a code implementation. The key unknowns are factual claims about Kiro and Spec Kit that must be verified from public sources.

See `research.md` for full findings.

**Research tasks:**
1. Verify current Kiro feature set (specs, steering, hooks, MCP, agentic chat) from kiro.dev
2. Verify Spec Kit command behavior from this repository's skill definitions
3. Identify translation precedents for "vibe coding", "steering", "constitution" in Korean/Japanese tech writing
4. Confirm existing wiki page status (which are AI-generated vs. hand-authored)

## Phase 1: Design

### Wiki Page Schema (data-model.md)

Each page follows a strict schema (see `data-model.md`):
- Frontmatter fields: title, aliases, tags, category, tool, language, date_created, date_modified, source_count, related, status, review_cycle, freshness_date
- Body sections: 13 mandatory sections per CR-001

### Page Template Contract (contracts/)

The page template contract (see `contracts/page-template-contract.md`) defines:
- The exact 13-section names and order
- Required content per section (minimum, format, examples)
- Frontmatter field types and allowed values
- Translation parity rules between language versions

### Writing sequence

English-first delivery (CR-010):
1. All 22 English files (Kiro series → Spec Kit series → comparison → landing pages)
2. All 22 Korean files (same order)
3. All 22 Japanese files (same order)

Within each language, write in series order (p01 → p10 for Kiro, p01 → p09 for Spec Kit) so that cross-references to earlier pages in the series are always available.

## Complexity Tracking

No constitution violations. Feature is a content publication task using standard wiki templates. No complexity justification required.
