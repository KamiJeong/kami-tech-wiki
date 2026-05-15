# Implementation Plan: Personal Tech Wiki Initial Setup

**Branch**: `001-project-initial-setup` | **Date**: 2026-05-15 | **Spec**: [spec.md](./spec.md)

**Input**: Feature specification from `specs/001-project-initial-setup/spec.md`

## Summary

Set up a personal tech wiki following the LLM wiki pattern: a persistent, compounding knowledge base organized by AI tool/service (ChatGPT, Claude, Gemini, etc.) across three languages (KO/EN/JA). The LLM owns all wiki content; the user curates raw sources. Configuration tasks (extensions.yml, README.md, package.json) are complete; this plan covers wiki structure, doc templates, Slack notification, and CLAUDE.md schema.

## Technical Context

**Language/Version**: TypeScript 6.0.3 (Bun 1.2.22 runtime)

**Primary Dependencies**: `@types/bun@1.3.14`, `typescript@6.0.3` — no additional runtime deps required (Bun provides native `fetch`)

**Storage**: File system only — markdown files, no database. `wiki/` for LLM-maintained content, `raw/` for immutable sources.

**Testing**: Bun test runner (`bun test`) for scripts only; wiki templates are validated manually by inspecting generated output.

**Target Platform**: Desktop-local (Obsidian primary reader, GitHub Wiki / Confluence secondary). No server deployment.

**Project Type**: Personal knowledge base — markdown wiki + LLM maintenance scripts

**Performance Goals**:
- Slack notification delivered within 60 seconds of wiki generation (SC-002)
- New source ingested and reflected in wiki within one LLM session (SC-005)
- Token usage captured automatically, zero manual invocations (SC-001)

**Constraints**:
- All markdown must render correctly in Obsidian (primary) and degrade gracefully in GitHub Wiki and Confluence
- No secrets committed to git — Slack webhook URL loaded from `SLACK_WEBHOOK_URL` env var (Principle XII)
- Bun-only runtime — no npm/pnpm/yarn (Assumption: Bun runtime)

**Scale/Scope**: Single user, expected growth to ~1,000 wiki pages over 12+ months. Index-file navigation sufficient at this scale (no search engine required initially).

## Constitution Check

*GATE: Pre-Phase 0 assessment. Re-checked post-design.*

| Principle | Status | Notes |
|-----------|--------|-------|
| I. Spec Before Code | ✅ Pass | `spec.md` exists with numbered requirements |
| II. Single Source of Truth | ✅ Pass | Wiki templates are the single source; generated pages derive from them |
| III. Explicit Overrides | ✅ Pass | No deviations required |
| IV. Version-Pinned Stack | ✅ Pass | `@types/bun@1.3.14`, `typescript@6.0.3` — exact pins, no ranges |
| V. Type Safety | ✅ Pass | Slack script: fully typed TypeScript, schema-validated env input |
| VI. Code Quality | ✅ Pass | Scripts are small, single-responsibility |
| VII. Testing Standards | ⚠️ Partial | Wiki templates validated manually; Slack script should have a unit test for payload builder |
| VIII-X. UX/A11y | N/A | No UI surface |
| XI. Performance Budgets | ✅ Pass | SC-002 (60s Slack), SC-005 (1 session ingest) declared in spec |
| XII. Security | ✅ Pass | Slack webhook URL in env var, not committed; no PII in wiki content |
| XIII. Module Boundaries | ✅ Pass | `.wiki/scripts/` is isolated from wiki content |
| XIV. Local-First | ✅ Pass | Full dev loop (templates, scripts, wiki browsing) runs offline except Slack send |
| XV. AI Agent Governance | ✅ Pass | CLAUDE.md schema will bind LLM behavior |
| XVI. Definition of Done | ✅ Pass | DoD criteria listed per task in tasks.md |

**Post-design re-check**: No new violations introduced by design decisions.

## Project Structure

### Documentation (this feature)

```text
specs/001-project-initial-setup/
├── plan.md              # This file
├── research.md          # Phase 0 research findings
├── data-model.md        # Wiki page entity schema
├── quickstart.md        # Getting started guide
├── contracts/           # LLM behavior contracts
│   └── wiki-schema.md   # CLAUDE.md wiki maintenance contract
├── tasks.md             # Phase 2 output (via /speckit-tasks)
└── token-reports/       # Token usage baselines per workflow phase
```

### Source Code & Wiki Structure (repository root)

```text
wiki/                         # LLM-maintained wiki content
├── index.md                  # Content catalog (all languages, all tools)
├── log.md                    # Append-only operation log
├── ko/                       # 한국어 위키
│   ├── chatgpt/
│   ├── claude/
│   ├── gemini/
│   ├── open-ui/
│   └── graphify/
├── en/                       # English wiki
│   └── [same tool folders]
└── ja/                       # 日本語ウィキ
    └── [same tool folders]

raw/                          # Immutable source documents
├── articles/
├── papers/
└── notes/

.wiki/                        # Wiki tooling (not content)
├── templates/
│   ├── tool-page.md          # Template: AI tool/service pages
│   ├── concept-page.md       # Template: AI concept pages
│   ├── source-summary.md     # Template: Source ingest summaries
│   └── index-entry.md        # Template: Wiki index entries
└── scripts/
    ├── notify-slack.ts       # Slack Block Kit notification script
    └── notify-slack.test.ts  # Unit test for payload builder

CLAUDE.md                     # LLM schema (wiki conventions & workflows)
README.md                     # Project description (updated ✅)
package.json                  # Bun project manifest (initialized ✅)
```

**Structure Decision**: `.wiki/` (hidden directory) separates tooling from wiki content. This prevents the LLM from confusing templates with actual wiki pages during ingest operations. All scripts are co-located with templates for discoverability.

## Complexity Tracking

No constitution violations requiring justification.
