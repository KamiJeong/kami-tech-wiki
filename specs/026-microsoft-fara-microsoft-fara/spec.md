# Feature Specification: Microsoft Fara Overview

**Feature Branch**: `026-microsoft-fara-microsoft-fara`

**Created**: 2026-05-28

**Status**: Draft

**Input**: User description: "Microsoft Fara에 대해 알려줘 - Microsoft Fara란 - 최신 문서 기준 설명 - 최신 내용 설명 및 사진들을 이용한 내용 (이미지 출처 표시) - 어디에 쓰일 수 있는지 어떻게 활용 해야하는지에 대한 이야기"

## Content Overview *(mandatory)*

**Article type**: tool-overview

**Primary learning goal**: Korean readers should understand what Microsoft Fara is, how Fara-7B and Fara1.5 fit into Microsoft's computer-use-agent research, what the latest official documentation says, and where Fara-style agents may be useful or risky.

**Target reader**: Korean product managers, operators, founders, AI tool evaluators, and beginner developers who want a practical, current explanation of Microsoft Fara before deciding whether to study, test, or reference it.

**Languages in scope**: Korean (`wiki/ko/`) only for this issue, under the Principle IV override documented below. English (`wiki/en/`) and Japanese (`wiki/ja/`) parity is deferred; this issue MUST NOT claim full multilingual completion.

**Review cycle**: fast-changing

## Clarifications

### Session 2026-05-28

- Q: What exact Korean wiki files are in scope for the Microsoft Fara topic? → A: Create/update `wiki/ko/microsoft-fara/README.md` and `wiki/ko/microsoft-fara/index.md`.
- Q: How should latest-source freshness be handled? → A: Re-check official sources during implementation and date claims with source publication or access dates.
- Q: How should visual assets be used? → A: Use official remote visuals, locally captured demo screenshots, or original diagrams with attribution; do not copy unclear-rights images.
- Q: How should frontmatter `source_count` work without `raw/` files? → A: Set `source_count: 0` and list web sources in the article body.
- Q: How deep should usage guidance go? → A: Provide practical pilot and safety guidance, not a full production setup guide.
- Q: How should the high-risk financial-action caution be worded so the pipeline guard does not block implementation on a false positive? → A: Reword to "money-moving or purchase-related tasks" while preserving the safety requirement.

## Reader Scenarios *(mandatory)*

### Reader Scenario 1 - Understand What Microsoft Fara Is (Priority: P1)

A reader has heard the name "Microsoft Fara" and wants to know whether it is a model, a product, an agent framework, a Microsoft Copilot feature, or a research project.

**Why this priority**: The article must establish the correct mental model before discussing documentation, images, use cases, or adoption advice.

**Completion check**: The reader can explain Microsoft Fara as Microsoft Research's computer-use-agent model work, including the relationship between Fara-7B, Fara1.5, screenshots, coordinate-based actions, and small/efficient agentic models.

**Acceptance scenarios**:

1. **Given** a reader who knows general chatbots but not computer-use agents, **when** they read the article, **then** they can explain that Fara is designed to operate software interfaces through visual perception and actions rather than only producing text.
2. **Given** a reader familiar with Microsoft Copilot, **when** they read the article, **then** they can distinguish Fara research models from broad Microsoft Copilot or Agent Factory offerings.

---

### Reader Scenario 2 - Read the Latest Source-Based Explanation (Priority: P2)

A reader wants an up-to-date explanation based on official Microsoft documentation and research materials, not outdated launch summaries or copied marketing text.

**Why this priority**: The request explicitly asks for the latest document-based explanation, and Fara is a fast-changing research area.

**Completion check**: The reader can identify which claims are current as of 2026-05-28, which official sources support them, and which capabilities are still research-preview or availability-dependent.

**Acceptance scenarios**:

1. **Given** Microsoft Research and GitHub sources with different publication dates, **when** the reader checks the article, **then** they can see the latest dated state of Fara1.5, Fara-7B, model availability, safety guidance, and benchmark context.
2. **Given** a reader comparing several secondary news articles, **when** they read the wiki page, **then** they can rely on official Microsoft, GitHub, model-card, and research-paper sources as the factual baseline.
3. **Given** a source that may have changed since the spec was written, **when** the article is implemented, **then** the implementer re-checks the official source live and records either the publication date or the 2026-05-28 access date used for the claim.

---

### Reader Scenario 3 - Learn Through Images and Examples (Priority: P3)

A reader wants visual context for how Fara-style computer-use agents work and where the article's images came from.

**Why this priority**: The issue asks for content using photos/images with image sources clearly displayed.

**Completion check**: The article includes relevant images or screenshots with alt text, captions, source labels, source URLs, and the access date.

**Acceptance scenarios**:

1. **Given** an image from an official Microsoft Research page, GitHub repository, model card, or captured demo, **when** it appears in the article, **then** the caption identifies the source, URL, and date accessed.
2. **Given** an image that cannot be copied safely, **when** the article needs the same teaching value, **then** it uses a linked reference or original explanatory diagram instead of embedding an unclear-rights asset.
3. **Given** a locally captured screenshot or original diagram is created during implementation, **when** it is stored in the repository, **then** it is placed under `wiki/ko/microsoft-fara/assets/` and referenced from the article with owner/path/date metadata.

---

### Reader Scenario 4 - Decide Practical Use Cases and Limits (Priority: P4)

A team lead wants to know where Fara could be useful, how to approach experimentation, and which use cases require caution.

**Why this priority**: Practical adoption advice is necessary because computer-use agents can take actions with real-world consequences.

**Completion check**: The reader can list plausible use cases, safe pilot conditions, required supervision, and situations where Fara-style automation should not be used.

**Acceptance scenarios**:

1. **Given** a team considering browser workflow automation, **when** they read the article, **then** they can identify suitable exploratory cases such as web task research, form-heavy workflow prototyping, benchmark study, and agent UI research.
2. **Given** a team handling sensitive, regulated, irreversible, money-moving, or purchase-related tasks, **when** they read the article, **then** they understand why human approval, sandboxing, audit logs, and sensitive-data limits are required.

### Edge Cases

- Readers may confuse Fara-7B, Fara1.5, FaraGen, FaraEnvs, MagenticLite, Microsoft Foundry, and Microsoft Copilot; define each only to the depth needed for the overview.
- Availability may differ across Fara-7B, Fara1.5-4B, Fara1.5-9B, and Fara1.5-27B; date every availability claim and avoid treating announced future availability as present availability.
- Benchmark claims may be misunderstood as general productivity proof; present them as evaluation results under stated benchmark conditions.
- Computer-use-agent demos may look autonomous, but the article must emphasize monitoring, sandboxing, refusal behavior, critical-point handoff, and human approval for consequential actions.
- Image use must not rely on unclear copyright status; every embedded image needs a source label and a defensible usage decision.

## Functional Requirements *(mandatory)*

- **FR-001**: The article MUST explain Microsoft Fara as Microsoft Research computer-use-agent model work rather than a generic chatbot or ordinary Microsoft 365 Copilot feature.
- **FR-002**: The article MUST explain the relationship between Fara-7B and the newer Fara1.5 family using latest official documentation available on 2026-05-28.
- **FR-003**: The article MUST explain the core computer-use-agent idea in plain language: screenshots or visual interface perception, coordinate-based actions, multi-step task trajectories, and browser or software interaction.
- **FR-004**: The article MUST explain why Fara emphasizes smaller or efficient agentic models, including local or lower-latency experimentation where official sources support those claims.
- **FR-005**: The article MUST summarize documented capabilities, documented limits, availability status, and safety guidance without promising unsupported production readiness.
- **FR-006**: The article MUST include a latest-documents section that lists the primary official sources, their publication or access dates, and what each source is used to verify.
- **FR-007**: The article MUST include at least two relevant visual assets or linked visual references, each with alt text, caption, source URL or local path, image source owner, and access date.
- **FR-008**: The article MUST explain practical use cases and how to approach use safely, including sandboxed experimentation, monitored browser tasks, research evaluation, workflow prototyping, human approval checkpoints, and pilot-only evaluation guidance.
- **FR-009**: The article MUST include a "not for" or caution section for sensitive data, money-moving or purchase-related actions, legal/medical/financial decisions, irreversible actions, and unattended production automation.
- **FR-010**: The article MUST include common misconceptions, especially "Fara is just Copilot", "Fara is ready for every desktop task", and "benchmark success means safe production automation".

## Success Criteria *(mandatory)*

- **SC-001**: A reader can summarize Microsoft Fara, Fara-7B, and Fara1.5 in under three sentences without confusing them with Microsoft Copilot.
- **SC-002**: A reader can name at least three official sources used by the article and understand which claims each source supports.
- **SC-003**: A reader can explain in plain language how a computer-use agent differs from a text-only chatbot.
- **SC-004**: A reader can identify at least three suitable exploratory use cases and at least three high-risk use cases that require avoidance or strict human approval.
- **SC-005**: All fast-changing capability, benchmark, safety, and availability claims are labeled with dates or source publication context.
- **SC-006**: Every embedded image or visual reference includes source attribution, alt text, and an access date.

## Content Requirements *(mandatory)*

### Structural requirements

- **CR-001**: Article MUST use the Korean wiki tool-page style with progressive sections for beginner and technical readers.
- **CR-002**: Article MUST include `wiki/ko/microsoft-fara/README.md` as the short section page and `wiki/ko/microsoft-fara/index.md` as the full overview page.
- **CR-003**: Article MUST answer the four requested topics explicitly:
  1. What Microsoft Fara is.
  2. What the latest official documents say.
  3. What latest content and images show, with image source attribution.
  4. Where Fara can be used and how it should be used safely.
- **CR-004**: Article MUST include at least one analogy or real-world example explaining computer-use agents to non-developers.
- **CR-005**: Article MUST include common misconceptions, practical adoption guidance, safety limits, and recommended next reads.
- **CR-006**: Article MUST update `wiki/index.md`, `wiki/ko/SUMMARY.md`, and append `wiki/log.md` during the implementation stage.
- **CR-007**: Both Microsoft Fara pages MUST include the required wiki frontmatter. Because this feature uses live official web sources and no `raw/` inputs, `source_count` MUST be `0`; official web references MUST be listed in the body instead.
- **CR-008**: Implementation MUST add or update a Microsoft Fara terminology record in `wiki/glossary/microsoft-fara.md`, including preferred terms, alternatives, abbreviations, definitions, usage notes, and Korean/English/Japanese equivalents for the new terms introduced by this article.
- **CR-009**: Implementation MUST create or update `specs/026-microsoft-fara-microsoft-fara/review-gates.md` with evidence for every Constitution Principle XII quality gate before review is considered ready.

### Terminology requirements

- **TR-001**: New terms introduced: Microsoft Fara, Fara-7B, Fara1.5, computer-use agent (CUA), small language model (SLM), FaraGen, FaraEnvs, WebTailBench, trajectory, verifier, critical point, MagenticLite, Microsoft Foundry.
- **TR-002**: Existing related terms referenced: AI agent, Microsoft Copilot, MCP, benchmark, model card, synthetic data, browser automation, human-in-the-loop.
- **TR-003**: Translation decisions: keep model and product names in English; render "computer-use agent" as "컴퓨터 사용 에이전트"; render "trajectory" as "작업 궤적"; render "critical point" as "중요 지점"; render "verifier" as "검증기"; render "research preview" as "연구 프리뷰".
- **TR-004**: New and referenced terms MUST be checked against existing wiki glossary surfaces before publication; missing Microsoft Fara terms MUST be added to `wiki/glossary/microsoft-fara.md`.

### Source requirements

- **SR-001**: Use current official Microsoft Research sources for Fara1.5 claims, including publication date and research-preview status.
- **SR-002**: Use the official `microsoft/fara` GitHub repository for Fara-7B, installation, demos, benchmark context, safety notes, and repository update context.
- **SR-003**: Use the Fara-7B arXiv paper for research framing, FaraGen, benchmark claims, and open-weight claims.
- **SR-004**: Use official Microsoft Foundry, Hugging Face, or model-card sources for model availability and usage constraints when those claims appear.
- **SR-005**: Date fast-changing claims as "2026-05-28 기준" or with a more specific source publication date when available.
- **SR-006**: Prefer official Microsoft, Microsoft Research, GitHub, arXiv, Microsoft Foundry, and Hugging Face model-card sources over secondary commentary.
- **SR-007**: Image assets MUST come from official Microsoft/Microsoft Research/GitHub/model-card pages, locally captured demo screenshots, or original explanatory diagrams; each image MUST include owner, URL/path, and access date.
- **SR-008**: Implementation MUST re-check primary official sources live on the implementation date before drafting, because Fara availability, model cards, benchmark notes, and safety guidance are fast-changing.
- **SR-009**: Copied binary image files MUST NOT be committed unless the source license or owner terms make reuse defensible; otherwise use a remote official image reference, a text link to the source visual, or an original explanatory diagram.

### Exception documentation *(if any standard sections are omitted)*

| Exception | Principle overridden | Reason | Approver | Review / expiry date |
|-----------|----------------------|--------|----------|----------------------|
| Korean-only delivery for this issue | IV. Multilingual Parity | The GitHub issue request is written in Korean, AGENTS.md sets Korean as the default language when unspecified, and this issue is scoped to the first Korean article draft. English/Japanese parity is not complete and MUST remain a follow-up before any claim of full multilingual completion. | Issue #29 requester / repository owner (KamiJeong), subject to human editorial review before publication | 2026-08-28 or before changing any Microsoft Fara page from `draft` to `active`, whichever comes first |
| Per-source raw summary page | II. Accuracy / wiki raw-source workflow | No `raw/` source file was provided; official web sources are expected to be cited directly in the article body and `source_count` remains `0`. | Issue #29 requester / repository owner (KamiJeong), subject to human editorial review before publication | 2026-08-28 |

## Constitution Check *(mandatory)*

| Principle | Requirement | Met? |
|-----------|-------------|------|
| I. Audience-First | Target reader includes non-developers and beginner technical evaluators | Yes |
| II. Accuracy | Latest official sources, dates, and source roles are required | Yes |
| III. Original Synthesis | No final article prose is included in this spec | Yes |
| IV. Multilingual Parity | Korean-only exception includes principle, reason, approver, and review/expiry date; full multilingual completion is not claimed | Yes, override documented |
| V. Portable Markdown | Wiki outputs must use portable Markdown, relative internal links, and standard visual references | Yes |
| VI. Progressive Depth | Beginner overview, visual explanation, source context, and practical safety depth are required | Yes |
| VII. IA & Navigation | Index, SUMMARY, related articles, and next reads are required | Yes |
| VIII. Article Template | Tool-page structure is required, with documented exceptions | Yes |
| IX. Terminology | New terms, translation decisions, and glossary update requirement are listed | Yes |
| X. Reader Engagement | At least one analogy or real-world example is required | Yes |
| XI. Depth Without Overload | Usage guidance is bounded to practical pilot and safety guidance, not a full production setup guide | Yes |
| XII. Quality Gates | `review-gates.md` must record all ten Principle XII gates with evidence | Yes |
| XIII. Maintenance | `review_cycle` is declared as fast-changing | Yes |
| XIV. Separation | Spec contains article requirements, not the article body | Yes |
| XV. Human Review | Human review evidence is required before `active` status or publication-ready claims | Yes |

## Prerequisites and Navigation

**Prerequisite articles**:
- None required.

**Related articles**:
- Microsoft Copilot - broader Microsoft AI assistant context.
- AI agent - conceptual background for agent behavior.
- MCP - adjacent agent/tool connection pattern, if the reader compares Fara with tool-connected agents.
- Atlassian Rovo - another current AI agent/tool overview for comparison.
- Storybook MCP - example of AI agents using structured tool context in frontend workflows.

**Parent section**: Korean AI tools.

## Assumptions

- The first deliverable is a Korean page under `wiki/ko/microsoft-fara/`.
- English and Japanese parity remain deferred follow-up work; Microsoft Fara pages stay `draft` unless a human reviewer explicitly approves the documented Principle IV override or multilingual parity is implemented.
- The article should prioritize practical understanding and source-grounded explanation over implementation walkthroughs.
- Usage guidance should be a practical evaluation and pilot checklist, not a full installation or production deployment guide unless official sources provide enough stable detail.
- Microsoft Fara should be presented as fast-changing Microsoft Research computer-use-agent work, not as a broadly available business product unless current official sources support that claim.
- The implementation stage may use official web sources directly and must not modify `raw/`.
- Slack notification and `wiki/log.md` updates apply when wiki content is actually updated, not during this specification-only stage.
