# Feature Specification: Spec-Driven Development Multilingual Wiki

**Feature Branch**: `019-create-replace-multilingual`

**Created**: 2026-05-19

**Status**: Draft

**Input**: Create or replace a multilingual wiki article set about "Spec-Driven Development", especially in the context of modern AI-assisted software development.

## Content Overview *(mandatory)*

**Article type**: conceptual

**Primary learning goal**: Readers will understand what Spec-Driven Development is, why it matters in the AI coding era, and how it differs from traditional development and vibe coding — well enough to decide if it is right for their project.

**Target reader**: Non-developers (product managers, startup founders, business stakeholders) and beginner developers who are starting to work with AI coding agents and want a structured approach.

**Languages in scope**: Korean (`wiki/ko/`) | English (`wiki/en/`) | Japanese (`wiki/ja/`)

**Review cycle**: periodic (reviewed every 6 months — SDD practices evolve with AI tooling, but the core concept is stable)

## Reader Scenarios *(mandatory)*

### Reader Scenario 1 - Product Manager Learns SDD (Priority: P1)

A product manager has heard the term "Spec-Driven Development" at a team meeting. They want to understand what it is and whether they should advocate for it on their team.

**Why this priority**: This is the primary audience — non-technical decision-makers who need clear, jargon-free explanations to act on.

**Completion check**: After reading, the reader can explain SDD in one sentence, name two benefits, and identify one situation where it would and would not be appropriate.

**Acceptance scenarios**:

1. **Given** a reader with no software development experience, **when** they read the article, **then** they can explain SDD using a plain-language analogy without needing to look it up.
2. **Given** a product manager evaluating whether to adopt SDD, **when** they finish the article, **then** they can list at least two concrete benefits and two limitations relevant to their context.
3. **Given** a reader from any of the three language versions (Korean, English, Japanese), **when** they read the article, **then** they receive equivalent information and reach the same understanding.

---

### Reader Scenario 2 - Beginner Developer Understands the Workflow (Priority: P2)

A developer who is new to AI coding tools wants to understand the SDD workflow so they can apply it to their own project.

**Why this priority**: Beginner developers are a key secondary audience — they benefit from concrete steps they can follow immediately.

**Completion check**: After reading, the reader can describe the six SDD workflow stages in order and explain the role of the specification in each stage.

**Acceptance scenarios**:

1. **Given** a beginner developer unfamiliar with SDD, **when** they read the workflow section, **then** they can name all six stages (Constitution → Specify → Plan → Tasks → Implement → Review) and give a one-sentence description of each.
2. **Given** a developer considering SDD for a new project, **when** they read the "When to use" and "When not to use" sections, **then** they can make an informed decision for their specific context.

---

### Reader Scenario 3 - Vibe Coder Understands the Difference (Priority: P3)

A developer who currently "vibes" with AI tools (gives loose instructions without a spec) wants to understand how SDD differs and when making the switch would help them.

**Why this priority**: Many AI-era developers start with vibe coding. A direct, respectful comparison removes defensiveness and focuses on practical outcomes.

**Completion check**: The reader can articulate the key difference between SDD and vibe coding and identify a specific situation where SDD would have saved them time.

**Acceptance scenarios**:

1. **Given** a developer who uses vibe coding, **when** they read the comparison section, **then** they understand that SDD is not about bureaucracy but about reducing rework and AI output instability.
2. **Given** a reader who knows TDD or BDD, **when** they read the comparison table, **then** they can place SDD correctly in relation to methods they already know.

---

### Edge cases

- What if the reader has no prior knowledge of AI coding agents? → The article must briefly define AI coding agents in plain language before referencing them.
- What if a reader encounters an untranslatable term (e.g., "vibe coding", "specification")? → The article must provide a parenthetical explanation in the target language.
- What if the article becomes too long for a single page? → The article defaults to single-page. If the draft exceeds 3,000 words per language, split into up to 7 linked sub-pages per CR-004, each independently readable.

## Content Requirements *(mandatory)*

### Structural requirements

- **CR-000**: If an article already exists at the target path (`wiki/ko/`, `wiki/en/`, `wiki/ja/`), overwrite it in place. No backup or parallel file shall be created.
- **CR-001**: The article MUST include all 22 required sections listed in the feature input (from Title through Last reviewed date).
- **CR-002**: The article MUST include at least one plain-language analogy for non-developers (e.g., architecture blueprint analogy).
- **CR-003**: The article MUST include a "Common misconceptions" section.
- **CR-004**: Default to a single-page article. Split into up to 7 linked sub-pages only if the drafted single-page content exceeds 3,000 words per language version. Sub-page structure when splitting:
  - 01. What Is Spec-Driven Development?
  - 02. Why SDD Matters in the AI Era
  - 03. SDD Workflow
  - 04. SDD vs TDD, BDD, and Vibe Coding
  - 05. Practical Example
  - 06. Risks, Limitations, and Best Practices
  - 07. Glossary: SDD Terms
- **CR-005**: All three language versions MUST have equivalent structure, section order, terminology decisions, and learning goals. Translation must be natural, not literal.
- **CR-005a**: Cross-references to related articles MUST be rendered as inline hyperlinks within prose. A separate "See Also" block is not required.
- **CR-006**: No article prose shall appear in this spec (Constitution Principle XIV).

### Terminology requirements

- **TR-001**: New terms introduced in this article: Spec-Driven Development (SDD), specification, constitution (in SDD context), vibe coding, AI coding agent, pipeline
- **TR-002**: Existing glossary terms referenced: TDD (Test-Driven Development), BDD (Behavior-Driven Development)
- **TR-003**: Translation decisions (locked):
  - "vibe coding" → 바이브 코딩 (ko) / バイブコーディング (ja) — no parenthetical description required; the term is used as-is with a brief inline definition on first use
  - "specification" → 명세서 (ko) / 仕様書 (ja) — use consistently; do not use 명세 (ko) or 仕様 (ja) alone
  - "constitution" (SDD context) → 원칙 문서 (ko) / 原則文書 (ja) — locked; do not use alternative translations

### Source requirements

- **SR-001**: Minimum 2 verifiable sources for factual claims about TDD/BDD definitions
- **SR-002**: Claims about AI coding agent capabilities MUST be dated with the knowledge cutoff or publication date
- **SR-003**: No direct copying from sources — all content must be original synthesis (Constitution Principle III)

### Exception documentation

| Omitted section | Reason | Approver |
|-----------------|--------|----------|
| None | All standard sections apply | — |

## Constitution Check *(mandatory)*

| Principle | Requirement | Met? |
|-----------|-------------|------|
| I. Audience-First | Target reader is a non-developer | ✅ PM, startup founder, beginner dev |
| II. Accuracy | Sources identified; claim types distinguished | ✅ SR-001, SR-002 defined |
| III. Original Synthesis | No article prose in this spec | ✅ |
| IV. Multilingual Parity | All three languages declared in scope | ✅ ko, en, ja |
| VI. Progressive Depth | All depth layers included in requirements | ✅ beginner main + technical comparison table |
| VII. IA & Navigation | Prerequisite articles identified | ✅ see Prerequisites below |
| VIII. Article Template | Standard structure applied | ✅ 22 sections required |
| IX. Terminology | New terms listed; glossary update planned | ✅ TR-001, TR-002, TR-003 |
| XIII. Maintenance | `review_cycle` declared | ✅ periodic (6 months) |
| XIV. Separation | Spec contains no article prose | ✅ |

## Prerequisites and Navigation

**Prerequisite articles** (reader should read these first):
- What is AI? — TBD (do not create stub)
- What is a coding agent? — TBD (do not create stub)

**Related articles** (reader may want to read after):
- Claude Code overview — `wiki/ko/claude-code/`, `wiki/en/claude-code/`, `wiki/ja/claude-code/`
- Prompt Engineering basics — TBD
- Spec Kit workflow — TBD (internal Spec Kit documentation)

**Parent section**: AI Development Practices

## Clarifications

### Session 2026-05-19

- Q: If an article already exists at the target path, should the new content overwrite it in place or be written to a new file? → A: Overwrite in place.
- Q: How should cross-references to related articles be rendered — inline hyperlinks, a dedicated "See Also" section, or footnotes? → A: Inline hyperlinks.
- Q: What are the locked translation decisions for untranslatable terms? → A: "vibe coding" → 바이브 코딩 (ko) / バイブコーディング (ja); "specification" → 명세서 (ko) / 仕様書 (ja); "constitution" (SDD context) → 원칙 문서 (ko) / 原則文書 (ja).
- Q: Should the article default to single-page or multi-page layout? → A: Single-page default; split only after drafting confirms the content exceeds 3,000 words.
- Q: Should prerequisite article links be created as stubs now, or marked TBD without stub creation? → A: Mark TBD; do not create stubs.

## Assumptions

- The reader has general computer literacy but no software development background.
- "Vibe coding" is a concept the audience may have practiced but not yet named — the article will name it and define it.
- Primary sources will be in English; Japanese and Korean translations of source concepts may need to be created fresh rather than cited from existing translated materials.
- The "AI coding agent" concept is accessible to the audience if introduced with a brief plain-language definition.
- The Spec Kit workflow (Constitution → Specify → Plan → Tasks → Implement → Review) is used as the canonical SDD workflow example, consistent with existing internal documentation.
- If a single-page article exceeds approximately 3,000 words per language, it should be split per CR-004.
