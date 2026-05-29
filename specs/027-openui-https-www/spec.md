# Feature Specification: OpenUI Personalization Case Reference

**Feature Branch**: `027-openui-https-www`

**Created**: 2026-05-28

**Status**: Draft

**Input**: User description: "OpenUI를 사용해서 실시간 개인화된 화면을 제공해줄 수 있는 사이트가 가능한지 검토 중. 실시간 개인화된 화면을 제공하는 좋은 사례 10개 정도를 뽑고 간단히 사이트 소개 및 어떤 내용들이 있는지 알고 싶음."

## Content Overview *(mandatory)*

**Article type**: tool-overview, with a case-reference focus

**Primary learning goal**: Readers will understand whether OpenUI is a plausible fit for real-time personalized screen generation by reviewing evidence-backed examples of OpenUI use and comparable real-time personalization sites.

**Target reader**: A non-developer product planner, service owner, or business stakeholder evaluating whether AI-generated UI and personalization patterns are mature enough to inform a new website or service concept.

**Languages in scope**: Korean (`wiki/ko/`) first, then English (`wiki/en/`) and Japanese (`wiki/ja/`) for parity before the article can move from `draft` to `active`.

**Review cycle**: fast-changing
- OpenUI capabilities, public examples, product positioning, and personalization implementations can change quickly and must be rechecked during implementation and future review.

## Clarifications

### Session 2026-05-28

No critical ambiguities requiring user input were found after reviewing issue #32 and the current spec.

## Reader Scenarios *(mandatory)*

### Reader Scenario 1 - Feasibility Screening (Priority: P1)

A product or business reader wants to know whether OpenUI can realistically support a website that adapts screens in real time for different users, without needing a deep engineering explanation.

**Why this priority**: The user's stated decision need is feasibility assessment, so the article must first help readers separate proven OpenUI usage from optimistic assumptions.

**Completion check**: The reader can state whether the cited evidence supports OpenUI-based real-time personalization, what remains unproven, and what next validation step would be needed before committing to the idea.

**Acceptance scenarios**:

1. **Given** a reader who has only heard the name OpenUI, **when** they read the article, **then** they can explain in plain language what OpenUI appears to help with and where real-time personalization claims still require verification.
2. **Given** a reader evaluating a new personalized website concept, **when** they review the case table, **then** they can distinguish verified OpenUI examples from adjacent personalization examples that do not prove OpenUI adoption.

---

### Reader Scenario 2 - Case Discovery (Priority: P2)

A reader wants approximately 10 useful examples that show how personalized or adaptive screens appear in real sites or services, with short descriptions and clear source links.

**Why this priority**: The user explicitly requested about 10 good example sites and a concise explanation of what each site contains.

**Completion check**: The reader can scan the article and identify 10 candidate examples, each with a site description, personalization/adaptive UI pattern, evidence status, and practical takeaway.

**Acceptance scenarios**:

1. **Given** a reader comparing personalization examples, **when** they read the examples section, **then** they can identify which sites personalize content, layout, recommendations, onboarding, or task flows.
2. **Given** fewer than 10 publicly verifiable OpenUI adoption cases are available, **when** the reader uses the article, **then** they see the shortfall explained transparently and can still review comparable personalization sites clearly labeled as not verified OpenUI cases.

---

### Reader Scenario 3 - Stakeholder Summary (Priority: P3)

A reader needs a short decision-oriented summary for a meeting about whether to investigate OpenUI further.

**Why this priority**: The article should be useful as a working reference, not only as a list of links.

**Completion check**: The reader can extract a concise recommendation, key risks, and follow-up questions without reading every source in full.

**Acceptance scenarios**:

1. **Given** a reader preparing a discussion note, **when** they read the summary and recommendation sections, **then** they can name the strongest opportunities, the biggest evidence gaps, and the most relevant next experiments.

### Edge cases

- If no or very few public sites can be verified as using OpenUI, the article must not invent OpenUI adoption claims; it must clearly separate "verified OpenUI examples" from "comparable real-time personalization examples."
- If a cited site has changed since the source was published, the article must date the observation and avoid implying the behavior is still present unless verified at implementation time.
- If the reader has no prior knowledge of generative UI, personalization, or OpenUI, the article must define these terms before using case comparisons.
- If the Korean, English, or Japanese versions use different terms for "real-time personalization" or "generative UI," the language note must explain the translation choice.

## Content Requirements *(mandatory)*

### Structural requirements

- **CR-001**: Article MUST follow the standard 13-section template from Constitution Principle VIII, adapted as a tool overview with a case-reference section.
- **CR-002**: Article MUST include at least one plain-language analogy or real-world scenario explaining real-time personalized UI for non-developers.
- **CR-003**: Article MUST include a "Common misconceptions" section that addresses at least: "personalization equals OpenUI adoption," "AI-generated UI is automatically real time," and "a demo proves production readiness."
- **CR-004**: Article MUST remain one main article unless implementation finds that case evidence and OpenUI background together exceed a scannable length; if split, the case list must become a linked companion article.
- **CR-005**: Article MUST include a case matrix with a target of 10 examples. Each row must include site/service name, URL, short description, personalization or adaptive UI pattern, OpenUI evidence status, source link, access date, and practical takeaway.
- **CR-006**: Article MUST include a feasibility summary that distinguishes confirmed facts, reasonable interpretations, assumptions, and open questions.
- **CR-007**: Article MUST include a recommendation section for whether OpenUI deserves further validation for a real-time personalized screen project.
- **CR-008**: Article MUST include a brief "how to read this evidence" explanation so readers understand the difference between vendor demos, public production sites, case studies, and analogous examples.

### Terminology requirements

- **TR-001**: New terms introduced in this article: OpenUI, generative UI, real-time personalization, adaptive screen, evidence status.
- **TR-002**: Existing glossary terms referenced: AI tool, user interface, personalization, recommendation system, prompt, large language model if already present; otherwise the implementation must add or update glossary entries before publication.
- **TR-003**: Translation decisions needed: "OpenUI" remains untranslated as a product/tool name; "generative UI" should include a Korean and Japanese plain-language explanation; "real-time personalization" must be translated consistently across all language versions.

### Source requirements

- **SR-001**: Minimum 12 verifiable sources are required: the official OpenUI site or documentation, source evidence for each selected example, and at least one source explaining any comparable personalization example that is not verified as OpenUI.
- **SR-002**: Fast-changing claims about OpenUI capabilities, availability, pricing, demos, integrations, or public adoption MUST be dated with publication date or access date.
- **SR-003**: The article MUST NOT state that a site uses OpenUI unless a reliable source explicitly supports that claim.
- **SR-004**: If the article includes comparable examples not proven to use OpenUI, those examples MUST be labeled as "not verified as OpenUI" or equivalent in every language version.
- **SR-005**: Sources MUST be summarized in original wording, with no paragraph-length copied text from source material.
- **SR-006**: Implementation MUST verify current web sources live before drafting claims about OpenUI and the selected sites; planning artifacts must not freeze case facts in advance.

### Exception documentation *(if any standard sections are omitted)*

| Omitted section | Reason | Approver |
|-----------------|--------|----------|
| None | Standard article structure remains in scope | Not required |

## Success Criteria *(mandatory)*

- **SC-001**: A first-time non-developer reader can correctly identify the article's conclusion about OpenUI feasibility and at least two unresolved evidence gaps after reading the summary and recommendation sections.
- **SC-002**: The finished article presents 10 candidate examples, or explicitly explains why fewer verified OpenUI examples are available and fills the remaining slots with clearly labeled comparable personalization examples.
- **SC-003**: 100% of case examples include a site or service description, personalization/adaptive UI pattern, evidence status, source link, access date, and practical takeaway.
- **SC-004**: 100% of claims that a site uses OpenUI are backed by a cited source that directly supports that claim.
- **SC-005**: Reviewers can verify that all three language versions preserve the same case classifications, evidence labels, recommendations, and glossary terms before the article is marked `active`.
- **SC-006**: The article can be scanned by a stakeholder in under 10 minutes while still providing source links for deeper verification.

## Constitution Check *(mandatory)*

| Principle | Requirement | Met? |
|-----------|-------------|------|
| I. Audience-First | Target reader is a non-developer product or business stakeholder | Yes |
| II. Accuracy | Source requirements require verified, dated evidence and evidence-status labeling | Yes |
| III. Original Synthesis | This spec contains no article prose and requires original summaries | Yes |
| IV. Multilingual Parity | Korean, English, and Japanese are declared in scope | Yes |
| VI. Progressive Depth | Requirements include summary, plain explanation, examples, misconceptions, use cases, and further reading | Yes |
| VII. IA & Navigation | Prerequisite and related articles are identified below | Yes |
| VIII. Article Template | Standard structure applies with a documented case-reference adaptation | Yes |
| IX. Terminology | New terms and translation decisions are listed; glossary work is required | Yes |
| XIII. Maintenance | `review_cycle` is declared as fast-changing | Yes |
| XIV. Separation | Spec describes content needs without drafting the article | Yes |

## Prerequisites and Navigation

**Prerequisite articles** (reader should read these first):
- AI tools overview - link to existing wiki page if present, otherwise create or mark as a related future article during planning.
- Personalization or recommendation systems - link to existing wiki page if present, otherwise plan a glossary or concept entry.
- User interface basics - link to existing wiki page if present, otherwise define briefly in the article.

**Related articles** (reader may want to read after):
- Generative UI - glossary or concept entry to be created if absent.
- Prompt-based app building tools - related tool category page if present.
- AI product evaluation checklist - related process article if present.

**Parent section**: AI tools and product implementation references

## Key Content Entities

- **Case Example**: A site, product, demo, or case study considered for the list of approximately 10 examples.
- **Evidence Status**: A label that states whether OpenUI usage is verified, partially supported, unclear, or not verified but comparable.
- **Personalization Pattern**: The user-facing adaptive behavior, such as content ranking, layout adaptation, recommendation, onboarding variation, or task-flow customization.
- **Source Reference**: A verifiable source link with owner, publication date when available, access date, and the claim it supports.
- **Feasibility Finding**: A decision-oriented takeaway about whether the evidence supports further OpenUI validation.

## Assumptions

- The first implementation target is Korean wiki content, but English and Japanese parity remains required before the article can be treated as active.
- The article should answer a practical evaluation question rather than function as an OpenUI tutorial or implementation guide.
- The target count is approximately 10 useful examples, but evidence quality is more important than forcing exactly 10 verified OpenUI adoption claims.
- Publicly verifiable OpenUI production adoption may be limited; comparable personalization examples are acceptable only when clearly separated from verified OpenUI cases.
- No files under `raw/` are needed or modified for this feature unless the user later provides source materials there.
