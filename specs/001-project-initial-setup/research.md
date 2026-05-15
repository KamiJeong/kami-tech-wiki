# Research: Personal Tech Wiki Initial Setup

**Phase**: 0 — Outline & Research
**Date**: 2026-05-15
**Feature**: [spec.md](./spec.md)

---

## Decision 1: Multi-Platform Markdown Compatibility

**Decision**: Use standard markdown as the baseline. Obsidian-specific features (wikilinks, callouts) are the primary rendering target and degrade gracefully elsewhere.

**Rationale**: The wiki is maintained and read primarily in Obsidian. GitHub Wiki and Confluence are secondary export targets. Obsidian callouts (`> [!NOTE]`) render as styled blockquotes in GitHub (acceptable). YAML frontmatter is silently ignored by GitHub Wiki and can be synced to Confluence via the Obsidian-Confluence plugin. Mermaid diagrams render natively in Obsidian and GitHub; Confluence converts them to images.

**Compatibility matrix**:

| Feature | Obsidian | GitHub Wiki | Confluence |
|---------|----------|-------------|------------|
| YAML frontmatter | Native | Ignored (stored) | Plugin-synced |
| Tables | ✅ | ✅ | ✅ |
| Mermaid | ✅ | ✅ | Image fallback |
| Wikilinks `[[...]]` | ✅ Native | ❌ Broken | Plugin only |
| Callouts `> [!NOTE]` | ✅ Styled | Plain blockquote | Plain blockquote |
| Code blocks | ✅ | ✅ | ✅ |

**Alternatives considered**:
- HTML `<blockquote>` for callouts — compatible with GitHub but loses Obsidian graph links and visual styling. Rejected.
- Plain text admonitions (e.g., `**Note:**`) — universally compatible but loses visual hierarchy. Rejected.

---

## Decision 2: Wiki Page Frontmatter Schema

**Decision**: Standardize on the following YAML frontmatter for all wiki pages.

```yaml
---
title: "Tool or Topic Name"
aliases: []
tags: []                    # e.g., [ai-tool, llm, api]
category: tool              # tool | concept | process | reference
tool: ""                    # e.g., Claude, ChatGPT, Gemini
language: ""                # ko | en | ja
date_created: YYYY-MM-DD
date_modified: YYYY-MM-DD
source_count: 0             # number of ingested sources backing this page
related: []                 # e.g., ["[[Claude API]]", "[[OpenAI API]]"]
status: draft               # draft | active | deprecated
---
```

**Rationale**: Obsidian Dataview indexes all YAML fields automatically. `source_count` enables filtering by evidence density (e.g., "show me pages with 3+ sources"). `status` allows deprecating old pages without deleting them. Using plural forms (`tags`, `aliases`) per Obsidian 1.9+ convention.

**Alternatives considered**:
- `type` instead of `category` — identical semantics, but `category` is more legible in GitHub search. Rejected.
- Omitting frontmatter for simplicity — loses Dataview query capability. Rejected.

---

## Decision 3: Slack Notification Implementation

**Decision**: Pure `fetch` call (no external packages) posting a Slack Block Kit message to `SLACK_WEBHOOK_URL` environment variable.

**Rationale**: Bun provides native Web `fetch` API. The `@slack/webhook` npm package adds type safety but is unnecessary overhead for a single-purpose notification script. The webhook URL is loaded from environment — never committed.

**Pattern**:
```typescript
// .wiki/scripts/notify-slack.ts
interface NotifyOptions {
  pages: string[];
  operation: "ingest" | "update" | "lint";
  summary: string;
}

function buildPayload(opts: NotifyOptions) {
  return {
    blocks: [
      { type: "header", text: { type: "plain_text", text: "Wiki 업데이트" } },
      {
        type: "section",
        text: {
          type: "mrkdwn",
          text: `*작업*: ${opts.operation}\n*페이지*: ${opts.pages.join(", ")}\n*요약*: ${opts.summary}`
        }
      }
    ]
  };
}
```

**Alternatives considered**:
- `@slack/webhook` package — adds type safety but violates "minimum code" principle for this use case. Rejected.
- Slack MCP server — better for interactive use but not suitable for automated post-ingest notification. Deferred.

---

## Decision 4: Wiki Doc Template Design

**Decision**: Original 6-section template structure synthesized from Stripe, Tailwind CSS, Laravel, and Material for MkDocs patterns.

**Structure** (for tool-page template):
1. **One-line summary** — "What is it?" (Stripe: clarity first)
2. **핵심 개념 / Core Concepts** — Mental model + 2–4 key terms (Stripe: concept-first)
3. **사용 시나리오 / When to Use** — Use / Don't-use comparison table (Stripe: anti-pattern transparency)
4. **빠른 시작 / Quick Start** — Minimal working example with real output (Tailwind: example before explanation; Laravel: inline tutorial)
5. **통합 & 연결 / Integrations** — Related tools + wikilinks (Material: cross-referencing)
6. **주의사항 & 한계 / Caveats** — Callout admonitions for warnings, cost, limits (Material: admonitions for risk)
7. **참고 링크 / References** — Sources with dates (academic rigor)

**Key differentiators from copied docs**:
- "When to use / When NOT to use" table in every tool page — prevents misapplication
- `source_count` in frontmatter — tracks credibility of each page
- Wikilinks to related tools — builds the graph view in Obsidian
- All sections in both Korean header + English subheader — supports bilingual navigation

**Alternatives considered**:
- Feature-reference layout (like API docs) — better for libraries, not for tool overviews. Rejected for tool-page; adopted for concept-page.
- No template (free-form) — loses consistency across pages. Rejected.

---

## Decision 5: Slack Webhook Security

**Decision**: `SLACK_WEBHOOK_URL` is loaded from environment at runtime. A `.env.example` file documents the required variable without containing the actual URL. The actual URL is in the user's local `.env` file, which is git-ignored.

**Rationale**: Principle XII (Security) — secrets must never be committed. Slack webhook URLs are permanent revocation risks if exposed.

**Implementation**:
- Add `SLACK_WEBHOOK_URL=` line to `.env.example`
- Add `.env` to `.gitignore`
- Script exits with error if `SLACK_WEBHOOK_URL` is not set

**Alternatives considered**:
- Hardcode URL in script — violates Principle XII. Rejected.
- Bun secrets manager — overengineered for a personal project. Rejected.
