# Contract: Wiki Article Content Requirements

**Feature**: `009-sdd-wiki-spec-kit`
**Contract Type**: Content Completeness
**Version**: 1.0
**Date**: 2026-05-18

---

## Purpose

This contract defines the mandatory content requirements that each of the 9 wiki articles must satisfy. It is the implementation-time checklist for the `/speckit-implement` stage and the verification baseline for `/speckit-verify-run`.

---

## Universal Rules (apply to all 9 articles)

| Rule | Requirement |
|------|-------------|
| U-1 | Minimum 400 words of substantive content (per SC-001) |
| U-2 | Front-matter passes the front-matter schema contract |
| U-3 | No verbatim copying from `raw/` directory files (per FR-013) |
| U-4 | `raw/` directory not modified (per FR-014) |
| U-5 | Content language matches `language:` field — Korean for `ko`, English for `en`, Japanese for `ja` |
| U-6 | All wikilinks to related pages use double-bracket notation `[[Page Title]]` |

---

## SDD Concept Pages — Content Contract

**Applies to**: `wiki/ko/sdd/index.md`, `wiki/en/sdd/index.md`, `wiki/ja/sdd/index.md`

| ID | Requirement | Verification |
|----|-------------|-------------|
| SDD-1 | Full name "Spec-Driven Development (SDD)" appears on first use; "SDD" used consistently thereafter | String search |
| SDD-2 | Page covers: definition of SDD, why it exists | Section present and non-stub |
| SDD-3 | Page covers: at least 3 core principles (spec-first, living specifications, iterative refinement) | Section present with ≥ 3 subsections |
| SDD-4 | Comparison table with exactly 4 data rows: SDD vs BDD, SDD vs TDD, SDD vs ad-hoc (per SC-006) | Table row count = 4 (excluding header) |
| SDD-5 | Wikilinks to Kiro page present | `[[Kiro]]` or equivalent |
| SDD-6 | Wikilinks to Spec-Kit page present | `[[Spec-Kit]]` or equivalent |
| SDD-7 | At least one real-world application example (code block or scenario) | Code block or numbered scenario |

---

## Kiro Tool Pages — Content Contract

**Applies to**: `wiki/ko/kiro/index.md`, `wiki/en/kiro/index.md`, `wiki/ja/kiro/index.md`

| ID | Requirement | Verification |
|----|-------------|-------------|
| KIRO-1 | Staleness callout blockquote appears at the top of the page (before any section headings) | Blockquote within first 10 lines after front-matter |
| KIRO-2 | Callout states the information date (2026-05-18) and notes Kiro is under active development | Text present in callout |
| KIRO-3 | Page covers: what Kiro is (AWS AI-powered IDE) | Section present |
| KIRO-4 | Page covers: steering files | Named and explained |
| KIRO-5 | Page covers: spec documents (requirements.md, design.md, tasks.md) | Named and explained |
| KIRO-6 | Page covers: agent tasks | Named and explained |
| KIRO-7 | Page covers: autopilot mode | Named and explained |
| KIRO-8 | Quick start example demonstrating basic usage (per SC-007) | Code block or step sequence present |
| KIRO-9 | Page explicitly describes how Kiro embodies the spec-first / SDD approach | Paragraph present |
| KIRO-10 | Wikilink to SDD concept page | `[[SDD]]` or equivalent |
| KIRO-11 | Limitations section present | Section with ≥ 2 known limitations |
| KIRO-12 | Reference link to official Kiro site (https://kiro.dev) | URL present in references |

---

## Spec-Kit Tool Pages — Content Contract

**Applies to**: `wiki/ko/spec-kit/index.md`, `wiki/en/spec-kit/index.md`, `wiki/ja/spec-kit/index.md`

| ID | Requirement | Verification |
|----|-------------|-------------|
| SK-1 | Pipeline stages named and explained: specify → clarify → plan → tasks → implement → verify (per FR-009) | All 6 stages present |
| SK-2 | Key commands listed: `/speckit-specify`, `/speckit-clarify`, `/speckit-plan`, `/speckit-tasks`, `/speckit-implement` (per FR-009) | All 5 commands present |
| SK-3 | Quick start example: at minimum one `/speckit-specify` command invocation (per SC-007) | Command in code block |
| SK-4 | Extension hooks system described (per FR-009) | Section or paragraph present |
| SK-5 | Describes Spec-Kit as an implementation of SDD within Claude Code | Paragraph present |
| SK-6 | Wikilink to SDD concept page | `[[SDD]]` or equivalent |
| SK-7 | Limitations section present | Section with ≥ 2 known limitations |
| SK-8 | `source_count: 8` in front-matter | Numeric value 8 |

---

## Index and Log Contract

| ID | Requirement | Verification |
|----|-------------|-------------|
| IDX-1 | `wiki/index.md` contains entries for all 9 articles (per FR-011) | 9 wikilink entries present |
| IDX-2 | Index entries follow the `[[Title]] — summary (updated: YYYY-MM-DD, sources: N)` pattern | String pattern match |
| LOG-1 | `wiki/log.md` contains exactly one new timestamped entry (per FR-012) | Entry count delta = 1 |
| LOG-2 | Log entry format: `## [YYYY-MM-DD HH:MM] ingest | {title}` | Format match |

---

## SUMMARY.md Contract

| ID | Requirement | Verification |
|----|-------------|-------------|
| SUM-1 | `wiki/ko/SUMMARY.md` has SDD, Kiro, Spec-Kit sections with README.md and index.md links | 3 new sections present |
| SUM-2 | `wiki/en/SUMMARY.md` has SDD, Kiro, Spec-Kit sections with README.md and index.md links | 3 new sections present |
| SUM-3 | `wiki/ja/SUMMARY.md` has SDD, Kiro, Spec-Kit sections with README.md and index.md links | 3 new sections present |
| SUM-4 | All 18 links in SUMMARY.md files (3 locales × 3 topics × 2 files per topic) point to paths that exist | File existence check |
