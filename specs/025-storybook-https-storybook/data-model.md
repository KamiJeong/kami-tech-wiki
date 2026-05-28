# Data Model: Storybook Overview

## WikiArticle

Represents a wiki page created or updated by this feature.

| Field | Type | Rules |
|-------|------|-------|
| path | string | Must be under `wiki/ko/storybook/` |
| title | string | Must match page frontmatter and H1 intent |
| language | enum | `ko` |
| category | enum | `tool` |
| status | enum | `draft` or `active`; new article starts as `draft` |
| review_cycle | enum | `fast-changing` |
| freshness_date | date | `2026-05-28` for fast-changing product claims |
| source_count | integer | Number of cited external sources used in the article |

## SourceReference

Represents a verifiable source used for factual claims.

| Field | Type | Rules |
|-------|------|-------|
| title | string | Human-readable source title |
| url | string | Must be an official Storybook, Figma, Anthropic, or OpenAI/OpenAI GitHub URL |
| publisher | enum | `Storybook`, `Figma`, `Anthropic`, `OpenAI` |
| checked_date | date | Must be `2026-05-28` |
| claim_scope | string | Short note on what claims this source supports |

## StorybookCapability

Represents a Storybook feature that must be explained.

| Field | Type | Rules |
|-------|------|-------|
| name | string | Examples: stories, docs, addons, interaction tests |
| explanation_level | enum | `beginner`, `practical`, `technical` |
| source_reference | SourceReference | Required for product capability claims |

## AIImplementationCase

Represents one of the three comparison cases requested by the issue.

| Field | Type | Rules |
|-------|------|-------|
| case_id | enum | `figma_only`, `figma_markdown`, `figma_storybook_mcp` |
| inputs | string | Design/code/documentation context available to the agent |
| agent_reasoning_pattern | string | How Claude Code/Codex CLI likely reasons through the task |
| likely_failure_modes | string | Missing context or quality risks |
| validation_strength | enum | `low`, `medium`, `high` |

## TokenEstimate

Represents relative expected token consumption for a case.

| Field | Type | Rules |
|-------|------|-------|
| case_id | AIImplementationCase.case_id | Required |
| estimate_range | string | Relative range such as `high`, `medium`, or explicit heuristic token band |
| assumptions | string | Must list page size, component count, and iteration assumptions |
| caveat | string | Must state "heuristic estimate, not benchmark" |

## AdoptionGuidance

Represents when Storybook should or should not be used.

| Field | Type | Rules |
|-------|------|-------|
| scenario | string | Practical team/project situation |
| recommendation | enum | `use`, `consider`, `skip_for_now` |
| rationale | string | Must be specific and non-promotional |

## NavigationUpdate

Represents required catalog/menu updates.

| Field | Type | Rules |
|-------|------|-------|
| path | string | `wiki/index.md` or `wiki/ko/SUMMARY.md` |
| change_type | enum | `add_section`, `add_link`, `add_index_entry` |
| target | string | Storybook README or article path |
