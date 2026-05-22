# Feature Specification: Multilingual Wiki Series — Kiro & GitHub Spec Kit

**Feature Branch**: `021-create-replace-multilingual`

**Created**: 2026-05-19

**Status**: Draft

**Input**: Create or replace a multilingual wiki article set about Kiro and GitHub Spec Kit. Two separate series: Series 1 Kiro (agentic IDE/CLI: specs, steering, hooks, MCP, agentic chat, 10 pages), Series 2 GitHub Spec Kit (SDD toolkit: constitution/specify/clarify/checklist/plan/tasks/analyze/implement commands, 9 pages), plus one Kiro vs Spec Kit comparison page. All content in Korean, English, Japanese.

## Content Overview *(mandatory)*

**Article type**: tool-overview (two series) + conceptual (comparison page)

**Primary learning goal**: A reader with no developer background can understand what Kiro and GitHub Spec Kit are, why they matter for AI-assisted software development, and how to take the first practical steps with each tool — independently of the other.

**Target reader**: Non-developers, product managers, startup founders, beginner developers, and teams transitioning from vibe coding to structured AI-assisted development workflows.

**Languages in scope**: Korean (`wiki/ko/`) | English (`wiki/en/`) | Japanese (`wiki/ja/`)

**Review cycle**: fast-changing
- Kiro is under active development. Spec Kit is tied to Claude Code releases. Both evolve rapidly; pages should be reviewed every 3 months and freshness notices dated.

## Reader Scenarios *(mandatory)*

### Reader Scenario 1 — First-time learner wants to understand Kiro (Priority: P1)

A product manager or startup founder has heard "Kiro" mentioned in an AI development context and wants a clear, jargon-free explanation of what it is, what it does, and whether it is relevant to their work.

**Why this priority**: The Kiro series must first succeed as a standalone explanation before tutorials or advanced concepts are useful.

**Completion check**: The reader can explain Kiro to a colleague in plain language after reading the introductory pages.

**Acceptance scenarios**:

1. **Given** a reader with no prior knowledge of Kiro, **when** they read "01. What Is Kiro?", **then** they can describe Kiro's core purpose (agentic IDE/CLI for structured AI-assisted development) in their own words without using developer jargon.
2. **Given** a reader who uses AI chatbots to generate code informally, **when** they read "02. Why Kiro Matters", **then** they can articulate at least two reasons why structured specs improve on informal prompting.
3. **Given** a reader in a non-English locale, **when** they access the Korean or Japanese version, **then** they find content with the same meaning, structure, and practical value as the English version — not a literal translation.

---

### Reader Scenario 2 — Beginner developer wants to follow the Kiro hands-on tutorial (Priority: P2)

A developer who has used AI coding assistants informally wants to try Kiro's spec-driven workflow for the first time using a simple practice project.

**Why this priority**: The tutorial is the highest-value page for retention. Readers who complete a tutorial are more likely to adopt the tool.

**Completion check**: The reader completes at least one full spec-to-task cycle in Kiro using the practice project described in the tutorial.

**Acceptance scenarios**:

1. **Given** a beginner developer with Kiro installed, **when** they follow "08. Hands-on Tutorial: Build Your First Feature with Kiro", **then** they produce a working spec, a design document, and a task list for the practice project without external help.
2. **Given** a reader who makes a common beginner mistake (e.g., writing vague requirements), **when** they consult the troubleshooting checklist in the tutorial, **then** they find guidance that resolves the issue.

---

### Reader Scenario 3 — Non-developer wants to understand GitHub Spec Kit (Priority: P1)

A team lead or project manager wants to know what GitHub Spec Kit is and whether their development team should use it alongside an AI coding agent.

**Why this priority**: The Spec Kit series must earn its own readership independent of the Kiro series.

**Completion check**: The reader understands that Spec Kit is a methodology-and-toolset for structuring AI-generated features, and can name the core workflow stages.

**Acceptance scenarios**:

1. **Given** a non-developer team lead, **when** they read "01. What Is GitHub Spec Kit?", **then** they can describe Spec Kit as a Spec-Driven Development toolkit and name at least four workflow stages (e.g., specify, plan, tasks, implement).
2. **Given** a reader who has heard "SDD" used loosely, **when** they read "03. Spec Kit Core Concepts", **then** they can distinguish constitution, specification, plan, tasks, and implementation as separate artifacts with different roles.

---

### Reader Scenario 4 — Reader wants to choose between Kiro and Spec Kit (Priority: P3)

A developer or team evaluating AI-assisted development tools wants to know the practical differences between Kiro and GitHub Spec Kit so they can choose one, the other, or both.

**Why this priority**: The comparison page serves readers who already understand both tools at a basic level and need a decision framework.

**Completion check**: The reader can state which tool (or combination) fits their workflow and explain why using the comparison table.

**Acceptance scenarios**:

1. **Given** a reader who has read both introductory pages, **when** they read "Kiro vs GitHub Spec Kit: What Is the Difference?", **then** they can identify at least three dimensions where the tools differ (e.g., interface, scope, integration model).
2. **Given** a reader who primarily wants a CLI/IDE workflow, **when** they read the comparison, **then** they understand why Kiro is the closer fit and what Spec Kit adds if used alongside it.

---

### Edge cases

- What if the reader has no prior knowledge of "specs" or "structured development"? Each series must define these terms in its own first page without assuming prior reading.
- What if a reader accesses pages out of order? Each page must be independently useful with a clear "Suggested next reads" section.
- What if a term does not translate cleanly into Japanese or Korean (e.g., "steering", "hooks", "vibe coding")? Retain the English term in parentheses on first use and add a footnote explaining the localized interpretation.
- What if existing wiki pages overlap with the new series? Only AI-generated wiki pages under these directories should be replaced. Source materials, glossary infrastructure, and navigation files must not be deleted.

## Content Requirements *(mandatory)*

### Structural requirements

- **CR-001**: Each article page MUST follow the standard 13-section wiki template (Constitution Principle VIII): (1) title, (2) one-sentence summary, (3) who this page is for, (4) why this matters, (5) plain-language explanation, (6) key concepts, (7) example or analogy, (8) practical applications, (9) common misconceptions, (10) related terms (linked), (11) further reading (cited sources), (12) language notes (conditional), (13) advanced notes (optional). Tutorial pages expand section 8 into a full step-by-step guide. Glossary pages use a different structure (documented exception).
- **CR-002**: Each page MUST include at least one analogy or real-world example that a non-developer can relate to.
- **CR-003**: Each page MUST include a "Common misconceptions" section with ≥ 2 entries.
- **CR-004**: The Kiro series MUST span 12 files per language (1 landing page + 11 article pages, including the 03/03a concepts split); the Spec Kit series MUST span 10 files per language (1 landing page + 9 article pages); plus 1 comparison page per language = 23 pages per language × 3 languages = 69 total files. Each article MUST introduce ≤ 5 core concepts (Constitution Principle XI).
- **CR-005**: Existing wiki pages under `wiki/*/kiro/` and `wiki/*/spec-kit/` that are AI-generated MAY be replaced. Source files under `raw/` MUST NOT be modified.
- **CR-006**: The SDD directory (`wiki/*/sdd/`) must not be removed — only cross-references may be added.
- **CR-007**: Each page MUST include a "Last reviewed date" and "Freshness status" field in the frontmatter.
- **CR-008**: The tutorial pages (Kiro page 08, Spec Kit page 06) MUST use the same practice project: "Create a personal task tracker with add, complete, filter, and delete features."
- **CR-009**: All pages MUST use GitHub-Flavored Markdown (GFM) only. No platform-specific callout syntax. Use standard blockquotes (`> text`) for notices and freshness warnings. Pages must render correctly on GitHub, GitBook, and Obsidian without modification.
- **CR-010**: Implementation MUST follow English-first delivery order: all 22 English pages first, then 22 Korean pages, then 22 Japanese pages. This allows incremental review after each language batch.

### Page inventory

**Series 1: Kiro** (prefix: `wiki/{lang}/kiro/`)

| Page | Filename |
|------|----------|
| 01. What Is Kiro? | `01-what-is-kiro.md` |
| 02. Why Kiro Matters | `02-why-kiro-matters.md` |
| 03. Kiro Core Concepts: Workflow | `03-core-concepts.md` |
| 03a. Kiro Core Concepts: Environment | `03a-environment-overview.md` |
| 04. How Kiro Specs Work | `04-specs-workflow.md` |
| 05. Kiro Steering Guide | `05-steering.md` |
| 06. Kiro Hooks Guide | `06-hooks.md` |
| 07. Kiro MCP Guide | `07-mcp.md` |
| 08. Hands-on Tutorial | `08-tutorial.md` |
| 09. Kiro Best Practices | `09-best-practices.md` |
| 10. Kiro Glossary | `10-glossary.md` |

> **Note**: Page 03 covers workflow concepts (Specs, Steering, Hooks) ≤ 3 concepts. Page 03a covers environment/interface concepts (Agentic Chat, MCP servers, IDE vs. CLI) ≤ 3 concepts. "Vibe coding vs. structured development" is covered in page 02 (Why Kiro Matters). Split required by Constitution Principle XI (≤ 5 concepts per article).

**Series 2: GitHub Spec Kit** (prefix: `wiki/{lang}/spec-kit/`)

| Page | Filename |
|------|----------|
| 01. What Is GitHub Spec Kit? | `01-what-is-spec-kit.md` |
| 02. Why Spec Kit Matters | `02-why-spec-kit-matters.md` |
| 03. Spec Kit Core Concepts | `03-core-concepts.md` |
| 04. Spec Kit Workflow | `04-workflow.md` |
| 05. Spec Kit Command Guide | `05-command-guide.md` |
| 06. Hands-on Tutorial | `06-tutorial.md` |
| 07. Spec Kit Best Practices | `07-best-practices.md` |
| 08. Risks and Limitations | `08-risks.md` |
| 09. Spec Kit Glossary | `09-glossary.md` |

**Comparison page** (prefix: `wiki/{lang}/`)

| Page | Filename |
|------|----------|
| Kiro vs GitHub Spec Kit | `kiro-vs-spec-kit.md` |

### Terminology requirements

- **TR-001**: New terms introduced in the Kiro series: Kiro, specs (Kiro context), steering, hooks (Kiro context), agentic chat, MCP (Model Context Protocol), vibe coding.
- **TR-002**: New terms introduced in the Spec Kit series: Spec-Driven Development (SDD), constitution (Spec Kit context), specification, implementation guard, quality gate, feature branch, pipeline artifact.
- **TR-003**: Existing glossary terms referenced: AI coding agent, LLM, prompt, context window.
- **TR-004**: Translation decisions needed:
  - "vibe coding" — retain English; Korean: 바이브 코딩 (vibe coding), Japanese: バイブコーディング (vibe coding) (add note; use transliteration per research.md Decision 3)
  - "steering" — Korean: 가이드라인/스티어링, Japanese: ステアリング (retain with note)
  - "hooks" — Korean: 훅, Japanese: フック
  - "spec" — Korean: 명세, Japanese: 仕様書 / スペック
  - "constitution" — Korean: 헌법/규약, Japanese: コンスティテューション (retain with note)

### Source requirements

- **SR-001**: Minimum 2 verifiable sources per tool (official documentation or credible tech media) required for factual claims.
- **SR-002**: All capability claims about Kiro and Spec Kit MUST be dated. Format: "As of [YYYY-MM-DD]".
- **SR-003**: Do NOT copy text from source materials. All content must be original synthesis written in plain language.

### Existing content to replace

The following existing wiki files will be replaced (single-page overviews superseded by the new series):

- `wiki/ko/kiro/index.md`, `wiki/ko/kiro/README.md`
- `wiki/en/kiro/index.md`, `wiki/en/kiro/README.md`
- `wiki/ja/kiro/index.md`, `wiki/ja/kiro/README.md`
- `wiki/ko/spec-kit/index.md`, `wiki/ko/spec-kit/README.md`
- `wiki/en/spec-kit/index.md`, `wiki/en/spec-kit/README.md`
- `wiki/ja/spec-kit/index.md`, `wiki/ja/spec-kit/README.md`

These `index.md` and `README.md` files will be converted to series navigation landing pages.

## Constitution Check *(mandatory)*

| Principle | Requirement | Met? |
|-----------|-------------|------|
| I. Audience-First | Target reader is a non-developer | ✅ Scoped to non-developers, PMs, founders |
| II. Accuracy | Sources identified; claim types distinguished | ✅ SR-001/002 require dated, sourced claims |
| III. Original Synthesis | No article prose in this spec | ✅ Only requirements and structure defined |
| IV. Multilingual Parity | All three languages declared in scope | ✅ ko/en/ja all required at equal depth |
| VI. Progressive Depth | All depth layers included in requirements | ✅ Overview → concepts → workflow → tutorial → glossary |
| VII. IA & Navigation | Prerequisite articles identified | ✅ SDD pages cross-referenced; each page has "suggested next reads" |
| VIII. Article Template | Standard structure applied or exception documented | ✅ CR-001 mandates 13-section template |
| IX. Terminology | New terms listed; glossary update planned | ✅ TR-001 through TR-004 |
| XIII. Maintenance | `review_cycle` declared | ✅ fast-changing, every 3 months |
| XIV. Separation | Spec contains no article prose | ✅ No article content written here |

## Prerequisites and Navigation

**Prerequisite articles** (reader should read these first):
- "Spec-Driven Development (SDD)" — `wiki/{lang}/sdd/index.md` (already exists)

**Related articles** (reader may want to read after):
- "Claude Code Overview" — TBD
- "Prompt Engineering Basics" — TBD

**Parent section**: AI Development Tools (`wiki/{lang}/`)

## Clarifications

### Session 2026-05-19

- Q: What Markdown flavor/compatibility target should all wiki pages use? → A: GitHub-Flavored Markdown (GFM). All pages must render correctly on GitHub, GitBook, and Obsidian. Avoid platform-specific syntax (admonitions, custom callout blocks). Use standard blockquotes (`> text`) for notices.
- Q: Should the article files be delivered all at once or in a phased order? → A: English-first delivery. Implement all English pages first (23 files: 12 Kiro + 10 Spec Kit + 1 comparison), then Korean, then Japanese. Tasks.md should reflect this order to allow incremental review.

## Assumptions

- Readers are assumed to know what software development is in general terms but not how to code.
- "Kiro" refers to the agentic IDE and CLI tool at kiro.dev (AWS product). This spec does not cover any other product named Kiro.
- "GitHub Spec Kit" refers to the SDD toolkit distributed as Claude Code skills/commands in this repository. It is not an official GitHub product.
- The practice project ("personal task tracker") is used across both tutorials to allow direct workflow comparison by readers who follow both series.
- Japanese and Korean primary sources may be limited; English sources with dated freshness notices are acceptable.
- The `wiki/*/sdd/` pages cover broader SDD concepts and are NOT replaced — only cross-references are added.
- All 69 output files (66 series pages + 3 comparison pages) are written during implementation. This spec defines structure only; plan and tasks define the writing sequence.
