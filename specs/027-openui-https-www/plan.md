# Implementation Plan: OpenUI Personalization Case Reference

**Branch**: `027-openui-https-www` | **Date**: 2026-05-28 | **Spec**: [spec.md](spec.md)

**Input**: Feature specification from `specs/027-openui-https-www/spec.md`

## Summary

Create a decision-oriented OpenUI case-reference wiki article that helps non-developer product and business readers evaluate whether OpenUI is a plausible fit for real-time personalized screen generation. The later implementation will add one case-reference article per canonical language under `wiki/{ko,en,ja}/openui/`, update OpenUI navigation and the top-level wiki index, append `wiki/log.md`, and send the existing Slack notification only when `SLACK_WEBHOOK_URL` is present.

The article must clearly separate verified OpenUI evidence from comparable real-time personalization examples. Implementation must verify current web sources live before drafting claims about OpenUI capabilities, demos, public adoption, pricing, integrations, or example-site behavior. This plan intentionally does not freeze fast-changing case facts in advance.

## Technical Context

**Language/Version**: Portable Markdown wiki content in Korean, English, and Japanese; Spec Kit artifacts in Markdown.

**Primary Dependencies**: `.wiki/templates/tool-page.md`, existing OpenUI wiki pages under `wiki/{ko,en,ja}/openui/`, `wiki/index.md`, locale `SUMMARY.md` files, `wiki/log.md`, AGENTS.md wiki governance rules, and live web sources verified during implementation.

**Storage**: Git repository filesystem. Planning artifacts live under `specs/027-openui-https-www/`; later reader-facing content lives under `wiki/ko/openui/`, `wiki/en/openui/`, and `wiki/ja/openui/`.

**Testing**: Manual and scripted content checks: frontmatter completeness, `source_count: 0`, no `raw/` modifications, source coverage for every case row, evidence-status labeling, dated fast-changing claims, glossary/terminology consistency, multilingual parity, Markdown portability, internal relative links, navigation entries present, `wiki/log.md` appended, Slack notification attempted only when the environment variable exists, and evidence recorded for every Constitution Principle XII quality gate.

**Target Platform**: GitBook, GitHub Markdown, and Obsidian-compatible Markdown readers.

**Project Type**: Documentation and knowledge-wiki content feature.

**Performance Goals**: No runtime performance target. The article should remain scannable by a stakeholder in under 10 minutes while preserving enough cited evidence for deeper validation.

**Constraints**:
- Do not modify `raw/`.
- Do not draft reader-facing article prose in planning artifacts.
- Re-check current web sources during implementation before writing claims about OpenUI, selected examples, or personalization behavior.
- Do not state that a site uses OpenUI unless a reliable source directly supports that claim.
- Label comparable personalization examples as not verified as OpenUI in every language version.
- Keep `source_count: 0` because this feature uses live web sources and no `raw/` inputs; list web sources in the article body.
- Use portable Markdown only; avoid GitBook-only callouts, Obsidian wikilinks in article bodies, or platform-specific syntax.
- Add or update terminology coverage for OpenUI, generative UI, real-time personalization, adaptive screen, personalization, recommendation system, prompt, user interface, and large language model where missing.
- Use a one-article format unless the case evidence exceeds the scannability threshold defined in [research.md](research.md); if split, create a linked companion case-list article in all three languages.
- Slack notification must read `SLACK_WEBHOOK_URL` from the environment only and must not be hardcoded.

**Scale/Scope**:
- Three language versions of one case-reference article:
  - `wiki/ko/openui/personalization-case-reference.md`
  - `wiki/en/openui/personalization-case-reference.md`
  - `wiki/ja/openui/personalization-case-reference.md`
- Optional companion article in the same three folders only if the final case evidence exceeds the defined scannability threshold.
- Navigation updates in `wiki/index.md` and `wiki/{ko,en,ja}/SUMMARY.md`.
- OpenUI section index updates in `wiki/{ko,en,ja}/openui/index.md`.
- Review evidence artifact `specs/027-openui-https-www/review-gates.md` during implementation.

## Constitution Check

*GATE: Must pass before Phase 0 research. Re-check after Phase 1 design.*

Verified against `.specify/memory/constitution.md` v2.0.0.

| Principle | Gate question | Pass? |
|-----------|---------------|-------|
| I. Audience-First | Is the target reader non-developer friendly and clearly defined? | Yes |
| II. Accuracy | Are reliable current-source verification rules required? | Yes |
| III. Original Synthesis | Does the plan avoid copying source text and require synthesized explanation? | Yes |
| IV. Multilingual Parity | Are Korean, English, and Japanese in scope before the article can become active? | Yes |
| V. Portable Markdown | Does the plan require portable Markdown and relative internal links? | Yes |
| VI. Progressive Depth | Does the planned article structure include summary, beginner explanation, evidence table, misconceptions, practical guidance, and advanced notes? | Yes |
| VII. IA & Navigation | Are prerequisite, related, index, and SUMMARY updates required? | Yes |
| VIII. Article Template | Is the standard 13-section structure applied with a case-reference adaptation? | Yes |
| IX. Terminology | Are new terms, translation choices, and glossary checks carried into implementation requirements? | Yes |
| X. Reader Engagement | Are analogy, scenario framing, and practical takeaways required? | Yes |
| XI. Depth Without Overload | Is the article bounded by a scannability threshold and split rule? | Yes |
| XII. Quality Gates | Are all ten required quality gates assigned to later review tasks with evidence tracking? | Yes |
| XIII. Maintenance | Is the fast-changing review cycle and dated claims requirement preserved? | Yes |
| XIV. Separation | Does this plan avoid article prose and keep implementation content separate? | Yes |
| XV. Human Review | Is human editorial review required before marking the article active or merging to main? | Yes |

No unresolved constitution gates.

## Project Structure

### Documentation (this feature)

```text
specs/027-openui-https-www/
├── spec.md
├── plan.md
├── research.md
├── data-model.md
├── quickstart.md
├── review-gates.md              # Created during implementation/review
├── version-guard-report.md
├── contracts/
│   └── openui-personalization-wiki-contract.md
└── checklists/
    └── requirements.md
```

### Later Wiki Output Locations

```text
wiki/
├── index.md
├── log.md
├── ko/
│   ├── SUMMARY.md
│   └── openui/
│       ├── index.md
│       └── personalization-case-reference.md
├── en/
│   ├── SUMMARY.md
│   └── openui/
│       ├── index.md
│       └── personalization-case-reference.md
└── ja/
    ├── SUMMARY.md
    └── openui/
        ├── index.md
        └── personalization-case-reference.md
```

**Structure Decision**: Use the feature directory for planning, design, contracts, version-guard, and review-gate evidence artifacts. Reader-facing OpenUI case-reference content is added to the existing OpenUI folder in each locale, rather than creating a new top-level tool folder.

## Phase 0: Research

Research planning decisions are captured in [research.md](research.md). The key decision is that implementation must perform live source verification and classify every candidate example by evidence status before drafting the article.

## Phase 1: Design

### Data Model

See [data-model.md](data-model.md). Core entities include `WikiArticle`, `ArticleSection`, `CaseExample`, `EvidenceStatus`, `PersonalizationPattern`, `SourceReference`, `FeasibilityFinding`, `TermDecision`, `NavigationUpdate`, `WikiLogEntry`, `SlackNotification`, and `ReviewGateResult`.

### Contract

See [contracts/openui-personalization-wiki-contract.md](contracts/openui-personalization-wiki-contract.md). The contract defines required output files, frontmatter, section structure, case matrix fields, evidence labels, source-reference rules, navigation updates, log append format, Slack behavior, and validation checks.

### Quickstart

See [quickstart.md](quickstart.md) for the implementation and review workflow.

### Agent Context

`AGENTS.md` points to this plan inside the `SPECKIT` block so subsequent stages load the current feature context.

## Phase 2: Task Strategy

Tasks should be generated in this order:

1. Re-check the official OpenUI site/documentation and existing OpenUI wiki pages to confirm canonical identity, current positioning, and any public examples.
2. Research candidate examples live, targeting 10 useful cases and at least 12 verifiable sources total.
3. Classify each candidate with the evidence taxonomy from [research.md](research.md); reject or relabel any case lacking reliable support.
4. Confirm whether the case list fits the one-article scannability threshold; if not, create companion-article tasks for all three languages.
5. Inspect terminology surfaces and add/update glossary or terminology notes for introduced terms.
6. Draft the Korean article first using the contract structure, with original synthesis and dated source claims.
7. Translate/adapt the English and Japanese versions, preserving evidence labels, recommendations, and case classifications.
8. Update `wiki/{ko,en,ja}/openui/index.md`, `wiki/{ko,en,ja}/SUMMARY.md`, and `wiki/index.md`.
9. Append `wiki/log.md` with the required timestamped operation format.
10. Send Slack notification after wiki updates only when `SLACK_WEBHOOK_URL` exists.
11. Run content checks for source coverage, dated fast-changing claims, evidence labels, terminology consistency, multilingual parity, Markdown portability, internal links, no `raw/` modifications, navigation coverage, and human-review readiness.
12. Record all ten Constitution Principle XII review gates in `review-gates.md` with pass/fail/not-applicable status and evidence paths.

## Complexity Tracking

No unresolved complexity gates.

| Exception | Reason | Follow-up |
|-----------|--------|-----------|
| None | Standard multilingual article workflow applies | Not required |

## Hook Results

- DocGuard review ran before planning. It reported existing repository-wide documentation issues and warnings, including a warning that this feature spec does not match DocGuard's expected section naming. No DocGuard fixes were applied because they are outside this planning request.
- Version Guard ran before planning and wrote [version-guard-report.md](version-guard-report.md). Root npm dependencies are current; known-issue lookup is incomplete because this repository has no npm lockfile for `npm audit`.
