# Research: Microsoft Fara Overview

## Decision: Treat implementation research as live-source verification

**Rationale**: Microsoft Fara is fast-changing research and model availability may change after planning. Implementation must check primary sources live before drafting claims, then record publication dates or access dates in the article.

**Alternatives considered**:
- Freeze facts from the planning date. Rejected because the spec requires latest-document handling and dated claims.
- Use secondary news summaries. Rejected because the spec prioritizes official Microsoft, Microsoft Research, GitHub, arXiv, Foundry, and Hugging Face sources.

## Decision: Use official-source priority and source-role mapping

**Rationale**: Each major claim needs a source role so readers can see what verifies identity, model family relationship, availability, safety guidance, benchmarks, and visual provenance.

**Required source classes for implementation**:
- Microsoft Research or Microsoft official pages for Fara1.5 identity, announcement context, safety framing, and research-preview status.
- `microsoft/fara` GitHub repository for Fara-7B implementation context, demos, installation notes, benchmark notes, and repository freshness.
- arXiv paper for Fara-7B research framing, FaraGen, FaraEnvs, WebTailBench, benchmark methodology, and open-weight claims.
- Microsoft Foundry and Hugging Face model cards when availability, license, usage constraints, or hosted model claims appear.

**Alternatives considered**:
- Cite only one canonical source. Rejected because no single source is likely to cover identity, model cards, benchmark context, and safety constraints completely.

## Decision: Keep `source_count: 0` and cite web sources in body

**Rationale**: No `raw/` files are inputs for this feature, and project frontmatter rules require `source_count` to match actual referenced `raw/` files. Therefore both wiki pages must use `source_count: 0`, while official web references are listed in the article body.

**Alternatives considered**:
- Count web sources in `source_count`. Rejected because it would violate the repository's raw-source counting convention.
- Add official sources to `raw/` during implementation. Rejected because the user explicitly required no `raw/` modifications.

## Decision: Add a Microsoft Fara glossary record during implementation

**Rationale**: The spec introduces several product, model, benchmark, and computer-use-agent terms. Constitution Principle IX requires new terms to be governed through glossary updates before publication. The repository currently has topic-level glossaries and related-term sections, so this feature will add a dedicated Microsoft Fara terminology record at `wiki/glossary/microsoft-fara.md` with Korean, English, and Japanese equivalents or explicit pending markers.

**Alternatives considered**:
- Keep terminology only inside the article. Rejected because it would not satisfy glossary governance.
- Wait for a separate glossary feature. Rejected because new terms are introduced by this article and should be governed before review readiness.

## Decision: Use visuals only with defensible attribution and rights handling

**Rationale**: The article needs visuals, but unclear-rights images must not be copied into the repository. Implementation can use official remote visuals, linked visual references, locally captured screenshots, or original diagrams when each has alt text, source owner, URL or path, access date, and a reuse decision.

**Alternatives considered**:
- Copy images from search results. Rejected because rights and provenance may be unclear.
- Omit visuals. Rejected because the spec requires at least two visual assets or linked visual references.

## Decision: Scope the article as practical overview, not production setup guide

**Rationale**: The target reader needs a current understanding, use-case ideas, and safety boundaries. A full deployment guide would overstate maturity unless current official sources provide stable production guidance.

**Alternatives considered**:
- Write an installation-first technical guide. Rejected because the learning goal and clarifications prioritize practical evaluation and safety guidance.

## Decision: Defer wiki updates and Slack notification to implementation

**Rationale**: Planning artifacts should not modify reader-facing wiki pages. The implementation stage must update the Korean article files, navigation, log, and Slack notification after content changes.

**Alternatives considered**:
- Update wiki navigation during planning. Rejected because the article files do not exist yet and the user requested planning artifacts only.
