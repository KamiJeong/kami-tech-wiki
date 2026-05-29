# Research: OpenUI Personalization Case Reference

## Decision: Use a case-reference article, not a tutorial

**Rationale**: The user's need is feasibility screening for real-time personalized screens. A tutorial would imply implementation readiness before evidence is verified. A case-reference article can compare verified OpenUI evidence with adjacent personalization examples and expose open questions.

**Alternatives considered**:
- OpenUI implementation guide: rejected because the request is about feasibility and examples, not building an app.
- Pure personalization market survey: rejected because the feature must answer whether OpenUI is a plausible fit.

## Decision: Place the article under existing OpenUI folders in all three locales

**Rationale**: The repository already has `wiki/{ko,en,ja}/openui/` sections. A case-reference page belongs there and can link back to existing OpenUI overview, architecture, quickstart, and example pages.

**Alternatives considered**:
- New top-level personalization concept page: useful later, but it would weaken the OpenUI-centered decision question.
- New `open-ui/` folder: rejected because this repository uses `open-ui/` for the separate W3C Open UI topic.

## Decision: Use this evidence status taxonomy

**Rationale**: The spec requires transparent separation between verified OpenUI cases and comparable personalization examples.

| Status | Criteria | Article handling |
|--------|----------|------------------|
| Verified OpenUI | A reliable source explicitly says the site, demo, product, or case uses OpenUI | May be discussed as OpenUI evidence |
| Partially supported | Reliable sources support OpenUI relevance, but do not fully prove production use by the named site/service | Must explain what is and is not supported |
| Unclear | Sources are ambiguous, outdated, conflicting, inaccessible, or insufficient | Must not be treated as proof |
| Not verified as OpenUI, comparable | The example demonstrates real-time personalization or adaptive UI but no reliable source proves OpenUI use | May be included only as an analogous personalization example |
| Excluded | No reliable source, inaccessible example, duplicate pattern, or insufficient educational value | Do not include in final case matrix |

**Alternatives considered**:
- Binary verified/not verified labels: rejected because partial and unclear evidence need different treatment.
- Confidence percentages: rejected because they imply precision that source research is unlikely to support.

## Decision: Target 10 cases, but prioritize evidence quality

**Rationale**: The user asked for about 10 good examples, while the spec forbids invented OpenUI adoption claims. The article should include 10 candidate examples if enough reliable evidence exists; if verified OpenUI examples are fewer, it should fill the matrix with clearly labeled comparable examples.

**Alternatives considered**:
- Force exactly 10 verified OpenUI cases: rejected because public proof may be limited.
- Include only verified OpenUI cases: rejected because it may fail the user's need for practical examples if few public cases exist.

## Decision: Require live verification during implementation

**Rationale**: OpenUI capabilities, public examples, demos, and personalized-site behavior are fast-changing. Planning artifacts must define the verification method without freezing source facts.

**Required implementation checks**:
- Verify official OpenUI identity and current positioning from official sources.
- Verify each selected case source live and record access date.
- Record publication date when available; otherwise record access date and source owner.
- Date any claim about current capabilities, availability, pricing, demos, integrations, or observed site behavior.
- Avoid claims about logged-in or region-limited behavior unless the source explicitly supports them.

**Alternatives considered**:
- Use existing wiki pages only: rejected because the feature requires current feasibility evidence.
- Use cached knowledge: rejected because the topic is fast-changing.

## Decision: Define one-article scannability threshold

**Rationale**: The spec prefers one main article but allows a split if the case evidence becomes too long. The threshold makes that decision reviewable.

Keep one article when all of the following hold:
- The final article has 10 or fewer case rows.
- Each case row has a short takeaway plus no more than one brief explanatory paragraph outside the matrix.
- The language version can be read in roughly 10 minutes by a stakeholder.
- The article remains under roughly 2,500 words in English, or a comparable length in Korean/Japanese after localization, excluding source URL text.

Create a linked companion case-list article in all three languages when any of the following occur:
- More than 10 cases are needed for a useful comparison.
- Case evidence requires detailed notes that would interrupt the standard 13-section article flow.
- The main article would exceed the 10-minute scan target.

**Alternatives considered**:
- Always split: rejected because it adds navigation cost for a small case set.
- Never split: rejected because evidence-heavy comparisons can overload the main article.

## Decision: Use portable Markdown tables for the case matrix

**Rationale**: The case matrix is the central evidence surface and must render in GitBook, GitHub, and Obsidian.

**Alternatives considered**:
- GitBook tabs or callouts: rejected because the constitution requires portable Markdown.
- CSV artifact only: rejected because readers need the case matrix inside the article.

## Decision: Keep `source_count: 0` for wiki frontmatter

**Rationale**: AGENTS.md defines `source_count` as the count of referenced `raw/` files. This feature uses live web sources and no `raw/` inputs.

**Alternatives considered**:
- Count web citations in `source_count`: rejected because it would conflict with the repository rule.

## Decision: Preserve draft status until parity and human review pass

**Rationale**: Constitution Principles IV, XII, and XV require multilingual parity, quality gate evidence, and human review before an article is complete.

**Alternatives considered**:
- Mark Korean active first: rejected because this feature has no Principle IV override.
