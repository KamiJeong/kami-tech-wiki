# Feature Specification: [FEATURE NAME]

**Feature Branch**: `[###-feature-name]`

**Created**: [DATE]

**Status**: Draft

**Input**: User description: "$ARGUMENTS"

## Content Overview *(mandatory)*

<!--
  Define what content this spec covers and who it is for.
  Do NOT include article prose here — this section describes the content need, not the content itself.
  (Constitution Principle XIV: Separation of Concerns)
-->

**Article type**: [conceptual | tool-overview | source-summary | glossary | index]

**Primary learning goal**: [One sentence: what will the reader understand after reading this article?]

**Target reader**: [Describe the non-developer audience. e.g., "A business manager curious about how AI recommendation systems work"]

**Languages in scope**: Korean (`wiki/ko/`) | English (`wiki/en/`) | Japanese (`wiki/ja/`)

**Review cycle**: [stable | periodic | fast-changing]
- stable = conceptual topics unlikely to change (e.g., "what is a neural network")
- periodic = evolving topics reviewed every 6 months (e.g., "state of AI regulation")
- fast-changing = specific model/product/market info reviewed every 3 months

## Reader Scenarios *(mandatory)*

<!--
  Describe how target readers will encounter and use this article.
  Each scenario must be independently satisfiable — a reader achieving one scenario
  gains value even if they do not read the others.

  Assign priorities (P1 = most critical to the reader experience).
-->

### Reader Scenario 1 - [Brief Title] (Priority: P1)

[Describe the reader's situation and what they want to learn]

**Why this priority**: [Why is this the most important thing this article must achieve?]

**Completion check**: [How do we know the reader got what they came for?]

**Acceptance scenarios**:

1. **Given** a reader who [starting knowledge state], **when** they read this article, **then** they can [specific outcome].
2. **Given** [another reader profile], **when** [action], **then** [expected understanding].

---

### Reader Scenario 2 - [Brief Title] (Priority: P2)

[Describe the reader's situation and what they want to learn]

**Why this priority**: [Explain the value]

**Completion check**: [How do we verify this was achieved?]

**Acceptance scenarios**:

1. **Given** [initial state], **when** [action], **then** [expected outcome].

---

[Add more reader scenarios as needed]

### Edge cases

- What if the reader has no prior knowledge of [prerequisite concept]?
- What if the reader is reading the [ko/en/ja] version and encounters an untranslatable term?

## Content Requirements *(mandatory)*

<!--
  List what this article MUST contain. Do not write the article here.
  Use "NEEDS CLARIFICATION" for anything not yet decided.
-->

### Structural requirements

- **CR-001**: Article MUST follow the standard 13-section template (Constitution Principle VIII) [or: exception documented below]
- **CR-002**: Article MUST include at least one analogy or real-world example (Principle X)
- **CR-003**: Article MUST include a "Common misconceptions" section (Principle VIII)
- **CR-004**: Article MUST be split across [N] pages if the learning goal cannot be achieved in one article (Principle XI)

### Terminology requirements

- **TR-001**: New terms introduced in this article: [list terms or "none"]
- **TR-002**: Existing glossary terms referenced: [list terms]
- **TR-003**: Translation decisions needed: [list concepts that may not translate cleanly, or "none"]

### Source requirements

- **SR-001**: Minimum [N] verifiable sources required for factual claims (Principle II)
- **SR-002**: Fast-changing claims (model capabilities, laws, pricing) MUST be dated (Principle XIII)

### Exception documentation *(if any standard sections are omitted)*

| Omitted section | Reason | Approver |
|-----------------|--------|----------|
| [section name] | [reason] | [name] |

## Constitution Check *(mandatory)*

| Principle | Requirement | Met? |
|-----------|-------------|------|
| I. Audience-First | Target reader is a non-developer | |
| II. Accuracy | Sources identified; claim types distinguished | |
| III. Original Synthesis | No article prose in this spec | |
| IV. Multilingual Parity | All three languages declared in scope | |
| VI. Progressive Depth | All depth layers included in requirements | |
| VII. IA & Navigation | Prerequisite articles identified | |
| VIII. Article Template | Standard structure applied or exception documented | |
| IX. Terminology | New terms listed; glossary update planned | |
| XIII. Maintenance | `review_cycle` declared | |
| XIV. Separation | Spec contains no article prose | |

## Prerequisites and Navigation

**Prerequisite articles** (reader should read these first):
- [Article title] — [link or "TBD"]

**Related articles** (reader may want to read after):
- [Article title] — [link or "TBD"]

**Parent section**: [Top-level wiki category this article belongs to]

## Assumptions

- [Assumption about target reader's prior knowledge]
- [Assumption about scope boundaries, e.g., "Advanced ML training details are out of scope"]
- [Assumption about source availability, e.g., "Primary sources are in English; Japanese sources may be limited"]
