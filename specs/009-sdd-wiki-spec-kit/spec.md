# Feature Specification: SDD Wiki — Spec-Driven Development, Kiro, and Spec-Kit

**Feature Branch**: `009-sdd-wiki-spec-kit`

**Created**: 2026-05-18

**Status**: Draft

**Input**: User description: "spec driven development 관련 주제로 WIKI 작성, 하위 카테고리로 Kiro (AWS Kiro IDE), spec-kit 관련 Wiki도 작성"

---

## Clarifications

### Session 2026-05-18

- Q: What should `source_count` reflect for Spec-Kit pages built from internal project files? → A: Set `source_count` to the actual number of internal project files consulted per page (e.g., `.claude/skills/`, `.specify/` files counted individually).
- Q: Should a formal functional requirement cover the SUMMARY.md update? → A: Yes — add FR-015 requiring SUMMARY.md to be updated for all 9 new pages.
- Q: What form should the Kiro staleness caveat take? → A: A callout block (blockquote) at the top of each Kiro page noting the information date.
- Q: Should pages use "SDD" as the primary abbreviation or always spell out "Spec-Driven Development"? → A: Full name on first use ("Spec-Driven Development (SDD)"), then "SDD" consistently thereafter.
- Q: Should the SDD comparison table include ad-hoc development as a 4th comparator beyond BDD and TDD? → A: Yes — 4 rows: SDD vs BDD, TDD, and ad-hoc development.

---

## User Scenarios & Testing *(mandatory)*

### User Story 1 — Read SDD Concept in Korean (Priority: P1)

A Korean-speaking developer or team member wants to understand what Spec-Driven Development (SDD) is, why it matters, and how to apply it. They navigate to the `wiki/ko/sdd/` section and find a comprehensive concept page covering the methodology, core principles, and connections to related tools.

**Why this priority**: SDD is the parent concept that gives context to Kiro and Spec-Kit. Without it, sub-topic pages lack foundation.

**Independent Test**: A reader who has never heard of SDD can read the Korean concept page, understand the methodology, and identify at least two real-world tools that implement it — all without leaving the page.

**Acceptance Scenarios**:

1. **Given** a reader visits `wiki/ko/sdd/index.md`, **When** they read the page, **Then** they can explain what SDD is, why it exists, and how it differs from traditional ad-hoc development.
2. **Given** the page exists, **When** a reader looks for related tools, **Then** they find wikilinks to Kiro and Spec-Kit pages.
3. **Given** the page exists, **When** checked for front-matter compliance, **Then** all mandatory fields (`title`, `tags`, `category: concept`, `language: ko`, `date_created`, `date_modified`, `source_count`, `status`) are present and correctly filled.

---

### User Story 2 — Read Kiro (AWS Kiro IDE) Tool Pages (Priority: P2)

A developer evaluating AI-powered IDEs wants to understand what AWS Kiro is, how it relates to SDD, and whether it fits their workflow. They find trilingual Kiro tool pages under `wiki/ko/kiro/`, `wiki/en/kiro/`, and `wiki/ja/kiro/`.

**Why this priority**: Kiro is a concrete, timely tool page that readers can immediately evaluate and adopt. Its value is independent of the broader SDD concept page.

**Independent Test**: A developer unfamiliar with Kiro reads the Korean tool page and can decide within 5 minutes whether Kiro fits their workflow, including installation requirements and key use cases.

**Acceptance Scenarios**:

1. **Given** a reader visits `wiki/ko/kiro/index.md`, **When** they read the page, **Then** they understand what Kiro is (AWS AI-powered IDE), its core features (spec-first workflow, agent tasks, autopilot), and how to get started.
2. **Given** all three language pages exist, **When** front-matter is checked, **Then** each page carries the correct `language:` value (`ko`, `en`, `ja`) and `category: tool`.
3. **Given** the Kiro pages exist, **When** a reader looks for the relationship to SDD, **Then** the page explicitly describes how Kiro embodies the spec-first approach.

---

### User Story 3 — Read Spec-Kit Tool Pages (Priority: P3)

A developer working with Claude Code wants to understand Spec-Kit — the workflow automation layer used in this project — as a concrete implementation of SDD. They find trilingual Spec-Kit tool pages under `wiki/ko/spec-kit/`, `wiki/en/spec-kit/`, and `wiki/ja/spec-kit/`.

**Why this priority**: Spec-Kit is the internal toolchain used in this project. Its documentation is directly useful to all contributors but is project-specific, making it slightly lower priority than the externally available Kiro.

**Independent Test**: A new project contributor reads the Korean Spec-Kit page and can run their first `/speckit-specify` command without additional guidance.

**Acceptance Scenarios**:

1. **Given** a reader visits `wiki/ko/spec-kit/index.md`, **When** they read the page, **Then** they understand the pipeline stages (`specify → plan → tasks → implement → verify`) and the role of each stage.
2. **Given** all three language pages exist, **When** front-matter is checked, **Then** each page carries the correct `language:` value and `category: tool`.
3. **Given** the Spec-Kit pages exist, **When** a reader looks for the connection to SDD, **Then** the page describes Spec-Kit as an implementation of SDD principles within Claude Code.

---

### User Story 4 — Trilingual Coverage for All Pages (Priority: P4)

A non-Korean-speaking reader (English or Japanese) wants to access the same knowledge. Every wiki article written for this feature must exist in all three languages: Korean (`wiki/ko/`), English (`wiki/en/`), and Japanese (`wiki/ja/`).

**Why this priority**: Trilingual coverage is a project-wide convention established by prior features (e.g., codex-cli). It ensures no reader is excluded.

**Independent Test**: For each of the three topics (SDD concept, Kiro tool, Spec-Kit tool), all three language variants exist and contain equivalent content depth (not just stubs).

**Acceptance Scenarios**:

1. **Given** the feature is complete, **When** the `wiki/` directory is inspected, **Then** `ko/sdd/`, `en/sdd/`, `ja/sdd/`, `ko/kiro/`, `en/kiro/`, `ja/kiro/`, `ko/spec-kit/`, `en/spec-kit/`, `ja/spec-kit/` all exist with `index.md` files.
2. **Given** an English reader visits `wiki/en/kiro/index.md`, **When** they read the page, **Then** all content is in English and the front-matter has `language: en`.
3. **Given** a Japanese reader visits `wiki/ja/spec-kit/index.md`, **When** they read the page, **Then** all content is in Japanese and the front-matter has `language: ja`.

---

### User Story 5 — Wiki Index and Log Updated (Priority: P5)

After the new pages are created, the wiki catalog and operation log must reflect the additions so readers can discover new content.

**Why this priority**: Index and log updates are maintenance housekeeping. The articles deliver value even without the index update, hence lowest priority.

**Independent Test**: After creation, `wiki/index.md` lists all 9 new pages (3 topics × 3 languages) and `wiki/log.md` contains a timestamped entry for this ingest operation.

**Acceptance Scenarios**:

1. **Given** the articles are created, **When** `wiki/index.md` is read, **Then** entries for `sdd`, `kiro`, and `spec-kit` appear with correct language tags.
2. **Given** the articles are created, **When** `wiki/log.md` is read, **Then** a new entry matching the format `## [YYYY-MM-DD HH:MM] ingest | {title}` exists.

---

### Edge Cases

- What if Kiro's features change significantly before articles are finalized? — Each Kiro page MUST open with a callout blockquote stating the information date and noting that Kiro is under active development (see FR-006).
- What if a language translation is not yet available? — All three languages are required; no stubs or placeholder pages are acceptable as deliverables.
- What if the SDD concept overlaps heavily with BDD or TDD? — The concept page must include a comparison table distinguishing SDD from BDD and TDD.

---

## Requirements *(mandatory)*

### Functional Requirements

**SDD Concept Pages**

- **FR-001**: The system MUST create `wiki/ko/sdd/index.md` as a concept-category page covering Spec-Driven Development using the `concept-page.md` template and all mandatory front-matter fields.
- **FR-002**: The system MUST create equivalent SDD concept pages in English (`wiki/en/sdd/index.md`) and Japanese (`wiki/ja/sdd/index.md`), each with language-appropriate content and correct `language:` front-matter.
- **FR-003**: The SDD concept pages MUST cover: definition of SDD, core principles (spec-first, living specifications, iterative refinement), comparison with related methodologies (BDD, TDD, ad-hoc development), and links to Kiro and Spec-Kit as implementing tools. All pages MUST introduce the full name "Spec-Driven Development (SDD)" on first use, then use the abbreviation "SDD" consistently throughout the remainder of the page.

**Kiro Tool Pages**

- **FR-004**: The system MUST create `wiki/ko/kiro/index.md` as a tool-category page covering AWS Kiro IDE using the `tool-page.md` template and all mandatory front-matter fields.
- **FR-005**: The system MUST create equivalent Kiro tool pages in English (`wiki/en/kiro/index.md`) and Japanese (`wiki/ja/kiro/index.md`).
- **FR-006**: Kiro tool pages MUST cover: what Kiro is (AWS AI-powered IDE), core features (steering files / spec documents, agent tasks, autopilot mode), use cases, quick start guidance, limitations, and the relationship to SDD. Each Kiro page MUST begin with a callout blockquote noting the information date (e.g., `> **Note**: Information based on Kiro as of YYYY-MM-DD. Kiro is under active development; verify current features at the official source.`).

**Spec-Kit Tool Pages**

- **FR-007**: The system MUST create `wiki/ko/spec-kit/index.md` as a tool-category page covering Spec-Kit using the `tool-page.md` template and all mandatory front-matter fields.
- **FR-008**: The system MUST create equivalent Spec-Kit tool pages in English (`wiki/en/spec-kit/index.md`) and Japanese (`wiki/ja/spec-kit/index.md`).
- **FR-009**: Spec-Kit tool pages MUST cover: the pipeline stages (`specify → plan → tasks → implement → verify`), key commands (e.g., `/speckit-specify`, `/speckit-plan`, `/speckit-tasks`, `/speckit-implement`), extension hooks system, relationship to SDD, and getting started within this project.

**Cross-Cutting Requirements**

- **FR-010**: All pages MUST include all mandatory front-matter fields: `title`, `tags`, `category`, `language`, `date_created`, `date_modified`, `source_count`, `status`.
- **FR-011**: The `wiki/index.md` MUST be updated to include entries for all 9 new pages following the `index-entry.md` template pattern.
- **FR-012**: The `wiki/log.md` MUST be appended with a new timestamped entry for this operation in the format: `## [YYYY-MM-DD HH:MM] ingest | {title}`.
- **FR-013**: Pages MUST NOT copy raw source content verbatim from `raw/` directory files; all wiki content must be synthesized summaries.
- **FR-014**: The `raw/` directory MUST NOT be modified.
- **FR-015**: If `SUMMARY.md` exists at the repository root (GitBook navigation file), it MUST be updated to include entries for all 9 new pages following the pattern established in feature 007 (`codex-cli`). Each entry must link to the correct `wiki/<language>/<topic>/index.md` path.

### Key Entities

- **Wiki Article**: A markdown file with YAML front-matter, placed under `wiki/<language>/<topic>/index.md`. Carries category (`concept` or `tool`), language, and status metadata.
- **SDD (Spec-Driven Development)**: The parent concept. A software development methodology where formal specifications drive all implementation decisions.
- **Kiro**: AWS-developed AI-powered IDE that embeds spec-first development natively into the IDE workflow via steering files and agent tasks.
- **Spec-Kit**: The workflow automation toolchain for Claude Code used in this project. Implements SDD through a pipeline of specifier, planner, task generator, implementer, and verifier stages.
- **Language Variant**: Each topic produces three independent pages — Korean, English, Japanese — with equivalent content depth.

---

## Success Criteria *(mandatory)*

### Measurable Outcomes

- **SC-001**: All 9 wiki pages (3 topics × 3 languages) exist with non-stub content of at least 400 words per page by the time the feature is marked complete.
- **SC-002**: 100% of pages pass front-matter validation — all mandatory fields present, no empty or placeholder values.
- **SC-003**: A reader unfamiliar with SDD can read the Korean concept page and correctly answer 3 out of 3 comprehension questions about the methodology without external research.
- **SC-004**: `wiki/index.md` contains entries for all 9 new pages within 1 hour of article creation completing.
- **SC-005**: `wiki/log.md` contains exactly one new timestamped entry per ingest operation (no duplicates).
- **SC-006**: The SDD concept page contains a comparison table with exactly 4 rows: SDD vs BDD, SDD vs TDD, and SDD vs ad-hoc development (plus a header row). This aligns with FR-003's comparison scope.
- **SC-007**: Each Kiro and Spec-Kit tool page contains at least one "quick start" example demonstrating the most basic usage pattern.

---

## Assumptions

- **Kiro availability**: Kiro (AWS Kiro IDE) is an AWS product that was publicly announced/available as of 2026. Content will be based on publicly available information and noted with a version/date caveat.
- **Spec-Kit internals**: Spec-Kit documentation will be derived from the existing project files in `.claude/skills/`, `.specify/`, and related directories — these are the authoritative sources, not `raw/`.
- **SDD as a defined methodology**: Spec-Driven Development is treated as a recognized methodology in the AI-assisted development space. The concept page will synthesize its principles from observable patterns in tools like Kiro and Spec-Kit.
- **Template adherence**: All pages will strictly follow `.wiki/templates/concept-page.md` or `.wiki/templates/tool-page.md` as the structural baseline.
- **Trilingual parity**: All three language variants will have equivalent content depth. Machine-assisted translation may be used but each page must be reviewed for naturalness.
- **No raw/ files**: There are no existing `raw/` source files for these topics. Content will be synthesized from publicly known information and internal project files. The `source_count` front-matter field MUST be set to the actual number of internal project files consulted per page (e.g., individual files under `.claude/skills/`, `.specify/`, etc.). For pages with no internal file sources, `source_count` is `0`.
- **SUMMARY.md update**: If `SUMMARY.md` exists, it must be updated to include all 9 new pages — consistent with how `codex-cli` was handled in feature 007. This is now formalized as FR-015.
