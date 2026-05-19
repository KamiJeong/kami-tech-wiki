<!--
SYNC IMPACT REPORT
==================
Version change: 1.0.0 → 2.0.0
Bump rationale: MAJOR — all 16 software-engineering principles replaced with 15 content and
                editorial governance principles for a Multilingual AI Knowledge Wiki.
                Domain change (code product → knowledge publication) requires a full rewrite.

Modified principles (old → new):
  I.   Spec Before Code              → Audience-First Explanation
  II.  Single Source of Truth        → Accuracy and Source Integrity
  III. Explicit Overrides Only       → Original Synthesis, Not Copying
  IV.  Version-Pinned Stack          → Multilingual Parity
  V.   Type Safety                   → Portable Markdown First
  VI.  Code Quality                  → Progressive Depth
  VII. Testing Standards             → Information Architecture and Navigation
  VIII.UX Consistency                → Consistent Article Template
  IX.  Design System & Storybook     → Terminology Governance
  X.   Accessibility                 → Reader Engagement
  XI.  Performance Budgets           → Depth Without Overload
  XII. Security and Privacy          → Review and Quality Gates
  XIII.Clear Module Boundaries       → Versioning and Maintenance
  XIV. Local-First & Cost-Aware Dev  → Separation of Concerns
  XV.  AI Agent Governance           → Human Editorial Judgment
  XVI. Definition of Done            → (merged into Principle XII and Editorial Workflow)

Removed sections:
  - Engineering Constraints (replaced by Content Constraints)
  - Development Workflow & Quality Gates (replaced by Editorial Workflow & Quality Gates)

Templates requiring updates:
  - ✅ .specify/memory/constitution.md (this file)
  - ✅ .specify/templates/plan-template.md — Constitution Check updated to wiki gates
  - ✅ .specify/templates/spec-template.md — Sections updated for content specifications
  - ✅ .specify/templates/tasks-template.md — Phases updated for wiki content workflow
  - ⚠ .claude/skills/speckit-*/ — verify command guidance does not contradict new principles

Deferred items: None.

Follow-up TODOs: None.
-->

# Multilingual AI Knowledge Wiki — Project Constitution

This constitution defines the non-negotiable principles, constraints, and governance rules
that bind every contributor — human and AI — working in this repository. It is the single
source of authority for all Spec Kit commands (`/speckit-specify`, `/speckit-plan`,
`/speckit-tasks`, `/speckit-implement`, `/speckit-analyze`) and all editorial workflows
(content drafting, translation, review, and publication).

## Core Principles

### I. Audience-First Explanation (NON-NEGOTIABLE)

All content MUST be understandable to non-developers. Technical terms MUST be explained
with plain-language definitions, analogies, real-world examples, and practical context.
Developer-level detail MAY be included in optional advanced sections only after the
beginner-friendly explanation is fully established.

- **Rationale**: The wiki's value is in making difficult AI concepts accessible to people
  who lack a technical background. Content that requires prior expertise fails its primary
  mission before the reader finishes the first paragraph.
- **Enforcement**: Every article MUST pass a "non-developer readability check" (Principle XII)
  before being marked complete. `/speckit-analyze` MUST flag spec requirements or tasks that
  omit the target reader definition.
- **Example violation**: An article on "Transformer architecture" that opens with attention
  matrices and softmax notation without first explaining what the model is trying to do and
  why it matters to a non-technical reader.

### II. Accuracy and Source Integrity (NON-NEGOTIABLE)

All factual claims about AI concepts, tools, models, research, laws, industry practices,
or recent developments MUST be verified against reliable sources. The wiki MUST explicitly
distinguish between: established facts, common interpretations, expert opinions, assumptions,
and emerging or contested trends. Unsupported hype, vague superlatives, and unverifiable
claims are forbidden.

- **Rationale**: Readers trust the wiki as an educational reference. A single inaccurate
  claim erodes that trust for all readers who catch it — and misleads those who do not.
- **Enforcement**: Every article MUST cite at least one verifiable source per major claim.
  `/speckit-analyze` MUST flag spec requirements referencing unverified industry data.
  Review quality gate MUST include a factual accuracy check (Principle XII).
- **Example violation**: "GPT-4 is the most capable AI model ever created" with no citation
  or date; asserting a regulatory law is in effect without citing the law and its status.

### III. Original Synthesis, Not Copying

The wiki MUST NOT reproduce source material by copying large sections of text, even with
attribution. Every article MUST synthesize information from multiple sources where appropriate,
rewrite explanations in original wording, and add educational value through structure,
examples, comparisons, diagrams, glossaries, or step-by-step breakdowns.

- **Rationale**: Copying is both a legal risk (copyright) and an editorial failure —
  it adds no value over linking to the original source, and it removes the wiki's
  opportunity to teach rather than merely repeat.
- **Enforcement**: Review MUST include a copying/plagiarism risk check (Principle XII).
  AI-generated drafts MUST be reviewed and rewritten for originality, not accepted verbatim.
- **Example violation**: Pasting three paragraphs from an academic paper with only a
  citation added; reproducing a product's marketing copy as a factual description.

### IV. Multilingual Parity

Every major article MUST be produced in Korean (`wiki/ko/`), English (`wiki/en/`), and
Japanese (`wiki/ja/`). The three language versions MUST preserve: the same meaning, heading
structure, examples, learning goals, and terminology intent. Translation MUST be natural
and idiomatic — never word-for-word literal. When a concept does not translate cleanly,
the article MUST include localized wording with a short explanation of the translation choice.

- **Rationale**: Releasing incomplete language versions creates an unequal reader experience
  and undermines the wiki's stated multilingual mission from day one.
- **Enforcement**: A feature spec MUST list all three languages in scope. Tasks MUST include
  translation and multilingual consistency review tasks. An article is NOT complete until all
  three language versions pass the multilingual consistency check (Principle XII).
- **Example violation**: Publishing the Korean version of a new article while leaving the
  English and Japanese versions as stubs for "later"; translating idioms word-for-word
  without checking whether the result is natural in the target language.

### V. Portable Markdown First

All wiki content MUST be written in clean, portable Markdown compatible with GitBook,
Obsidian, Confluence, GitHub Markdown, and common static documentation tools. Platform-
specific syntax (e.g., GitBook `{% hint %}` blocks, Obsidian `[[wikilinks]]`) MUST NOT
appear in the canonical article body. Callout/admonition patterns MUST degrade gracefully
to readable plain Markdown on platforms that do not support them. Internal links MUST be
relative paths. Image references MUST use simple, stable `![alt](path)` syntax.

- **Rationale**: The wiki must survive platform migrations. Locking content to a single
  platform's syntax creates expensive rewrites whenever the hosting environment changes.
- **Enforcement**: `/speckit-analyze` MUST flag any spec or task requiring platform-specific
  Markdown features in the canonical content layer. The Markdown portability check
  (Principle XII) MUST run before an article is marked complete.
- **Example violation**: Using GitBook's `{% tabs %}` block inside a core article; using
  Obsidian's `[[Page Title]]` link syntax in a file intended for GitHub rendering.

### VI. Progressive Depth

Each article MUST support layered learning. At minimum, every article MUST contain:
a short summary for first-time readers, a beginner-friendly explanation, a deeper
conceptual section, at least one example or analogy, common misunderstandings, practical
use cases, and related terms with links. Optional advanced notes for technical readers
MAY appear in a clearly separated final section.

- **Rationale**: Readers arrive at an article with wildly different background knowledge.
  A flat structure written for one level excludes everyone else. Layered content lets the
  same article serve a curious newcomer and an informed practitioner.
- **Enforcement**: The article template (Principle VIII) encodes these layers as mandatory
  sections. `/speckit-tasks` MUST include tasks for each layer. An article that skips
  required layers fails the quality gate (Principle XII).
- **Example violation**: An article with only a dense technical explanation and no plain-
  language summary; an article that lists use cases without first explaining the concept.

### VII. Information Architecture and Navigation

The wiki MUST be organized as a connected knowledge system, not a flat collection of
isolated articles. Every article MUST declare: title, one-sentence purpose, intended audience
level, prerequisites, related articles (with links), glossary terms defined in this article,
and recommended next reads. Large topics MUST be split into multiple linked articles rather
than a single long-form mega-document. The top-level information architecture (categories,
sections, navigation) MUST be specified before individual article specs are written.

- **Rationale**: Readers navigate by curiosity and by need. Disconnected articles leave
  readers stranded; oversized articles bury the concepts readers are looking for.
- **Enforcement**: Every article spec MUST include a navigation section. `/speckit-analyze`
  MUST flag articles without prerequisite or related-article declarations. The navigation
  check (Principle XII) MUST verify that all declared links resolve.
- **Example violation**: An article on "Fine-tuning" with no link to the "Training" article;
  a single 8,000-word mega-article on "Large Language Models" that should be six linked pages.

### VIII. Consistent Article Template

Every conceptual article MUST follow the standard structure listed below unless a documented
exception (with reason) is recorded in the spec. Deviation requires an explicit override
note citing which sections are omitted and why.

**Standard structure** (in order):
1. Title
2. One-sentence summary
3. Who this page is for
4. Why this matters
5. Plain-language explanation
6. Key concepts
7. Example or analogy
8. Practical applications
9. Common misconceptions
10. Related terms (linked)
11. Further reading (cited sources)
12. Language notes (when a term does not translate cleanly)
13. Advanced notes (optional, clearly marked)

- **Rationale**: Consistent structure reduces the cognitive load of navigating between articles
  and makes the wiki feel like a coherent publication rather than a patchwork of styles.
- **Enforcement**: Article tasks MUST map to the sections above. The review quality gate
  (Principle XII) MUST verify structural compliance before marking an article complete.
- **Example violation**: An article that jumps directly to "Key concepts" with no summary or
  audience definition; an article missing "Common misconceptions" without a documented reason.

### IX. Terminology Governance

AI terminology MUST be managed consistently across Korean, English, and Japanese. This
project MUST maintain a multilingual glossary (`wiki/glossary/`) containing: preferred terms,
alternative terms, abbreviations, definitions, usage notes, and cross-language equivalents.
New articles MUST reuse glossary terms and add new terms to the glossary before publishing.
Inventing inconsistent wording for an already-defined concept is forbidden.

- **Rationale**: AI terminology is already unstable in English; inconsistent translation
  across three languages compounds the confusion. A governed glossary ensures readers
  build a coherent mental model across all articles.
- **Enforcement**: Article tasks MUST include a "terminology check against glossary" step.
  `/speckit-analyze` MUST flag specs that introduce terms not yet in the glossary without
  a corresponding glossary-update task.
- **Example violation**: Using "언어 모델", "대규모 언어 모델", and "LLM" interchangeably in
  the same article without defining which is preferred; defining "hallucination" differently
  in the Korean and English versions of the same concept.

### X. Reader Engagement

Articles MUST be educational and interesting — not dry reference material. Every article
MUST use at least one of the following: a relatable real-world scenario, a concrete worked
example, a comparison table, a "why this matters to you" framing, a memorable analogy, or
a question that prompts the reader to think. Engagement techniques MUST NOT come at the cost
of accuracy (Principle II) or clarity (Principle I).

- **Rationale**: A technically accurate article that bores the reader fails to educate them.
  Engagement is not decoration — it is the mechanism by which information becomes knowledge.
- **Enforcement**: The non-developer readability check (Principle XII) MUST assess whether
  the article would hold a non-technical reader's attention. Tasks MUST include an "add
  example or analogy" step for every conceptual article.
- **Example violation**: An article that reads as a definition list with no narrative thread;
  a "why this matters" section that says only "this is important for AI development."

### XI. Depth Without Overload

When a topic is complex, it MUST be split into multiple linked articles, each with one
clear learning goal. No single article MUST introduce more than three to five new core
concepts. Advanced technical details MUST be separated into optional advanced sections or
dedicated advanced articles, clearly marked and linked from the main article. Readers MUST
be able to leave any article with a complete understanding of its stated learning goal
without needing to read the advanced section.

- **Rationale**: Cognitive overload is the primary reason educational content fails readers.
  A single page that tries to teach everything about a topic teaches nothing well.
- **Enforcement**: Every article spec MUST state one primary learning goal. `/speckit-analyze`
  MUST flag specs with more than five core concepts in a single article without a splitting
  plan. The review gate MUST verify the learning goal is achievable without the advanced section.
- **Example violation**: A single article titled "AI" that covers history, model types,
  training, inference, safety, regulation, and tools; burying the practical use case
  behind seven prerequisites the reader must first understand.

### XII. Review and Quality Gates (NON-NEGOTIABLE)

No article is complete until it passes ALL of the following checks. These gates apply
equally to AI-generated drafts and human-written drafts.

| Gate | Description |
|------|-------------|
| **Readability** | A non-developer can read and understand the article without external help |
| **Factual accuracy** | All major claims are verified against cited, reliable sources |
| **Source integrity** | No copied text; all borrowed ideas are synthesized and rewritten |
| **Multilingual consistency** | All three language versions convey the same meaning and structure |
| **Markdown portability** | Content renders correctly in GitBook, GitHub, and Obsidian |
| **Terminology consistency** | All terms match the glossary; new terms are added to the glossary |
| **Navigation** | All internal links resolve; prerequisites and related articles are declared |
| **Copying/plagiarism risk** | No paragraph-length reproduction of source material |
| **Template compliance** | Article follows the standard structure (Principle VIII) or has a documented exception |
| **Learning goal** | The article achieves its stated learning goal without the advanced section |

- **Rationale**: Without explicit, checkable gates, "done" is subjective. These gates make
  completion verifiable and reviewable by anyone, including future AI agents.
- **Enforcement**: `/speckit-tasks` MUST include a review task for each gate listed above.
  `/speckit-analyze` MUST flag task lists missing review tasks. An article may NOT be
  committed to `main` until all gates are documented as passed.

### XIII. Versioning and Maintenance

Every article MUST include frontmatter with: `date_created`, `date_modified`, `status`
(draft | active | deprecated), and `review_cycle` (stable | periodic | fast-changing).
Articles about fast-changing subjects (specific model versions, regulatory status, market
trends, product pricing) MUST be tagged `review_cycle: fast-changing` and reviewed at least
every six months. Articles about stable conceptual topics MAY be tagged `review_cycle: stable`
and reviewed annually. Deprecated articles MUST be marked and linked to their replacement.

- **Rationale**: AI evolves rapidly. An article accurate today may be misleading in six months.
  Without explicit maintenance metadata, outdated content accumulates invisibly and silently
  degrades reader trust.
- **Enforcement**: The article template MUST include the required frontmatter fields.
  `/speckit-specify` MUST require a `review_cycle` declaration in every article spec.
  The review gate (Principle XII) MUST check that frontmatter is present and complete.
- **Example violation**: An article about "GPT-4 capabilities" with no review date; an
  article about the EU AI Act published in 2024 still marked "active" in 2026 without review.

### XIV. Separation of Concerns

The following layers of this project MUST NOT be mixed:

| Layer | Responsibility |
|-------|----------------|
| **Constitution** | Non-negotiable principles and governance rules |
| **Feature specification** | What content is needed, for whom, and why |
| **Implementation plan** | How the content will be researched, written, and structured |
| **Article draft** | Reader-facing educational content focused on learning outcomes |
| **Translation** | Language-adapted version of an approved article |
| **Review record** | Gate results, corrections, and approvals |

A spec MUST describe the content need without prescribing article wording. A plan MUST
describe the research and writing approach without writing the article. An article MUST not
embed editorial process notes. These concerns MUST be kept in separate files.

- **Rationale**: Mixing concerns makes artifacts harder to review, maintain, and hand off.
  A spec that contains draft article text conflates two different decisions at different
  quality levels.
- **Enforcement**: `/speckit-specify` MUST reject specs containing article prose.
  `/speckit-analyze` MUST flag plans that attempt to pre-write article content.
- **Example violation**: A spec for "Write an article about RAG" that includes a draft
  introduction paragraph; a plan.md that contains translated article sentences.

### XV. Human Editorial Judgment (NON-NEGOTIABLE)

AI assistance MAY be used to draft, translate, summarize, research, and structure content.
However, final wiki content MUST be reviewed by a human as educational material intended for
real readers before being merged to `main`. The review MUST assess clarity, usefulness,
trustworthiness, and long-term maintainability — not only whether the text is grammatically
correct. AI agents MUST NOT self-approve their own content contributions. Speed of generation
MUST NOT take priority over quality of reader experience.

- **Rationale**: AI-generated content can be fluent but subtly inaccurate, culturally
  inappropriate, or misleading in ways that only a human reader notices. The wiki's
  credibility depends on human editorial accountability, not automated throughput.
- **Enforcement**: CODEOWNERS or branch protection MUST require at least one human reviewer
  approval for any merge to `main`. `/speckit-implement` MUST NOT auto-merge wiki articles.
  The review record (Principle XIV) MUST include the human reviewer's name and date.
- **Example violation**: An AI agent committing a translated article directly to `main`
  without human review; merging a draft because it "passed the quality gate script" without
  a human reading the content.

## Content Constraints

- **Language scope**: Korean (`wiki/ko/`), English (`wiki/en/`), Japanese (`wiki/ja/`) are
  the three canonical languages. All three MUST be present before an article is complete.
- **Article types**: Conceptual articles follow Principle VIII. Other types (tool overviews,
  source summaries, glossary entries, index pages) follow their respective templates in
  `.wiki/templates/`.
- **Frontmatter**: All articles MUST include the mandatory frontmatter fields defined in
  `CLAUDE.md` (`title`, `tags`, `category`, `language`, `date_created`, `date_modified`,
  `source_count`, `status`, `review_cycle`).
- **Source materials**: `raw/` directory files MUST NOT be modified. They are read-only
  inputs. All wiki content is generated in `wiki/`.
- **Links**: Internal links MUST use relative paths. External links MUST be verified as
  accessible at time of writing and cited in "Further reading."
- **Images and diagrams**: Image references MUST use standard Markdown syntax. Alt text
  MUST describe the image content for screen readers and plain-text environments.
- **AI content disclosure**: Articles substantially drafted by AI MUST be reviewed per
  Principle XV before merging. The review record file MUST note AI involvement.

## Editorial Workflow & Quality Gates

The Spec Kit workflow is the mandatory path for any new article or significant revision:

1. `/speckit-specify` → produces `spec.md`. Gate: spec declares target audience, all three
   language scopes, article type, learning goal, and review cycle; no article prose present
   (Principle XIV); Constitution Check section passes.

2. `/speckit-clarify` → resolves ambiguity. Gate: learning goal is unambiguous; target
   reader is precisely defined; no `TBD` markers remain in normative sections.

3. `/speckit-plan` → produces `plan.md`. Gate: research sources identified; translation
   approach confirmed; article structure aligned with Principle VIII; all ten quality gates
   (Principle XII) are assigned to tasks; Constitution Check passes.

4. `/speckit-tasks` → produces `tasks.md`. Gate: every task maps to a spec requirement;
   tasks exist for all three languages; review tasks exist for all ten quality gates;
   glossary update task included when new terms are introduced.

5. `/speckit-implement` → executes tasks (drafts, translates, structures content). Gate:
   each task satisfies the Definition of Done before being marked `[X]`:
   (a) content written and structured per template, (b) terminology checked against glossary,
   (c) internal links verified, (d) frontmatter complete, (e) all three languages present.

6. `/speckit-analyze` → cross-artifact consistency check. Gate: spec ↔ plan ↔ tasks ↔
   article coherence; all ten quality gates assigned and tracked; no orphan requirements.

7. **Human review** (Principle XV): A human reviewer MUST read the article in at least one
   language and confirm all ten quality gates (Principle XII) before merge to `main`.

8. **Post-merge**: `wiki/index.md` and `wiki/log.md` MUST be updated. Slack notification
   MUST be sent per `CLAUDE.md`.

**Content review**: At least one human reviewer MUST approve every article merge. Reviewers
MUST verify educational quality and constitutional compliance, not only grammar and formatting.

## Governance

This constitution supersedes all other editorial practices, conventions, and AI-agent defaults
for this repository. Conflicts MUST be resolved in favor of this document.

**Amendment procedure**:
1. Propose the amendment as a PR modifying `.specify/memory/constitution.md`, including an
   updated Sync Impact Report and a clear rationale for the change.
2. The PR MUST update dependent templates (`plan-template.md`, `spec-template.md`,
   `tasks-template.md`) and any affected skill guidance files to remain consistent.
3. Approval requires at least one maintainer. MAJOR changes require team consensus documented
   in the PR body.
4. On merge, run `/speckit-constitution` to confirm propagation and version bump.

**Versioning policy** (semantic):
- **MAJOR**: Removing or redefining a principle in a backward-incompatible way; removing
  a mandatory quality gate; changing the core audience definition.
- **MINOR**: Adding a new principle; materially expanding an existing one; adding a new
  mandatory gate or content constraint.
- **PATCH**: Wording clarifications, typo fixes, example updates, non-semantic refinements.

**Compliance review**: Every PR description MUST include a "Constitution Check" note
confirming which principles are relevant and whether any exceptions are filed. `/speckit-analyze`
SHOULD run on any branch before requesting human review. Every six months, maintainers SHOULD
audit a sample of merged articles against this constitution and file follow-ups for any drift.

**Runtime guidance**: Day-to-day agent behavior is configured via `CLAUDE.md` and the
`.claude/skills/` directory. Those files MUST NOT contradict this constitution. When they do,
this constitution wins and the guidance files MUST be amended.

**Exception documentation**: Any deliberate deviation from a principle MUST be recorded in
the relevant spec or plan with: (a) the principle overridden, (b) the reason, (c) the
approver, and (d) a review or expiry date.

**Version**: 2.0.0 | **Ratified**: 2026-05-13 | **Last Amended**: 2026-05-19
