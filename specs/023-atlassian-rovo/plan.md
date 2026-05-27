# Implementation Plan: Atlassian Rovo Overview

**Branch**: `023-atlassian-rovo` | **Date**: 2026-05-28 | **Spec**: [spec.md](spec.md)

**Input**: Feature specification from `specs/023-atlassian-rovo/spec.md`

## Summary

Create a Korean Atlassian Rovo tool overview page that explains Rovo Search, Chat, Agents, Studio, MCP Server, Forge Rovo agents, and practical server-side usage patterns. Update wiki navigation and log artifacts.

## Technical Context

**Language/Version**: Markdown (GitHub-Flavored Markdown)

**Primary Dependencies**: N/A

**Storage**: Git repository filesystem

**Testing**: Markdown/schema review plus `.wiki/scripts/validate-wiki.sh` when available

**Target Platform**: GitHub, GitBook, Obsidian-compatible Markdown readers

**Project Type**: Knowledge wiki content publication

**Performance Goals**: N/A

**Constraints**: Do not edit `raw/`; no hardcoded secrets; dated claims for fast-changing product facts; Korean default language

**Scale/Scope**: 2 wiki files plus index, SUMMARY, log, and Spec Kit artifacts

## Constitution Check

| Principle | Gate question | Pass? |
|-----------|---------------|-------|
| I. Audience-First | Is the target reader clearly defined? | Yes |
| II. Accuracy | Are current official Atlassian sources identified? | Yes |
| IV. Multilingual Parity | Is scope documented? | Yes, Korean-only exception |
| V. Portable Markdown | Does the plan avoid platform-specific Markdown? | Yes |
| VI. Progressive Depth | Does the page move from plain overview to MCP/API detail? | Yes |
| VII. IA & Navigation | Are index and SUMMARY updates included? | Yes |
| VIII. Article Template | Is a standard wiki page structure used? | Yes |
| IX. Terminology | Are Rovo/MCP terms identified? | Yes |
| XII. Quality Gates | Are focused review tasks included in tasks.md? | Yes |
| XIII. Maintenance | Is review_cycle declared? | Yes |
| XIV. Separation | Does the plan contain no article prose? | Yes |
| XV. Human Review | Is draft status used for review? | Yes |

## Project Structure

```text
specs/023-atlassian-rovo/
├── spec.md
├── plan.md
├── research.md
├── data-model.md
├── contracts/
│   └── page-template-contract.md
├── tasks.md
├── analysis.md
└── review-report.md

wiki/
├── index.md
├── log.md
└── ko/
    ├── SUMMARY.md
    └── atlassian-rovo/
        ├── README.md
        └── index.md
```

**Structure Decision**: Use one flat tool folder under `wiki/ko/atlassian-rovo/` following existing Korean tool sections.

## Implementation Phases

1. Specify scope and acceptance criteria.
2. Research current Atlassian sources.
3. Write page and navigation updates.
4. Validate schema, links, and dated claims.
5. Review risks and create draft PR.

## Complexity Tracking

No constitution violations requiring complexity justification.
