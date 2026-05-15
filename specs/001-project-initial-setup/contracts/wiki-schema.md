# Wiki Maintenance Contract

**Contract**: LLM Wiki Behavior Schema
**Version**: 1.0.0
**Date**: 2026-05-15
**Scope**: Governs LLM behavior when operating on `wiki/`, `raw/`, `wiki/index.md`, `wiki/log.md`

This contract defines the interface between the user (source curator) and the LLM (wiki maintainer). It is the authoritative reference for `CLAUDE.md`.

---

## Roles

| Actor | Responsibility |
|-------|---------------|
| **User** | Adds sources to `raw/`, asks questions, directs analysis, reviews wiki content |
| **LLM** | Creates and updates all files under `wiki/`, maintains `wiki/index.md` and `wiki/log.md`, sends Slack notification after ingest |

---

## Operations

### Ingest

**Trigger**: User drops a file into `raw/` and says "ingest [filename]" or equivalent.

**LLM MUST**:
1. Read the source file from `raw/` (never modify it)
2. Discuss key takeaways with the user (optional, user-directed)
3. Determine the target language folder (`wiki/ko/` by default)
4. Determine the target tool folder (e.g., `wiki/ko/claude/`) — create if new
5. Create a summary page using `.wiki/templates/source-summary.md`
6. Update or create the tool's overview page using `.wiki/templates/tool-page.md`
7. Update `wiki/index.md` with new/modified entries
8. Append an entry to `wiki/log.md`: `## [YYYY-MM-DD HH:MM] ingest | {title}`
9. Update `source_count` in all affected page frontmatter
10. Cross-link related pages (update `related` field)
11. Execute `bun run .wiki/scripts/notify-slack.ts` with ingest details

**LLM MUST NOT**:
- Modify files under `raw/`
- Create files outside `wiki/`, `.wiki/`, or the repo root config files
- Infer information not present in the source or prior wiki content

---

### Query

**Trigger**: User asks a question.

**LLM MUST**:
1. Read `wiki/index.md` first to identify relevant pages
2. Read the relevant wiki pages
3. Synthesize an answer with citations to wiki pages
4. If the answer reveals a gap, suggest creating a new wiki page
5. If the answer is valuable, offer to save it as a new wiki page

**LLM MUST NOT**:
- Invent facts not present in wiki pages or confirmed sources
- Modify wiki content without explicit user approval

---

### Lint

**Trigger**: User says "lint the wiki" or equivalent.

**LLM MUST check for and report**:
- Orphan pages (no inbound links from index or other pages)
- Stale claims (contradicted by newer sources per WikiLog)
- Missing cross-references (pages that mention a tool but don't link it)
- Pages with `source_count: 0` and `status: active` (should be `draft`)
- ToolFolders that exist in `wiki/ko/` but not in other language folders

**LLM MUST NOT**:
- Auto-fix lint issues without user review
- Delete pages (mark as `deprecated` instead)

---

### Translate

**Trigger**: User says "translate [page] to [language]".

**LLM MUST**:
1. Locate the source page
2. Create the corresponding page in the target language folder
3. Preserve frontmatter structure; update `language` field
4. Update `wiki/index.md` for the new language entry
5. Append `## [YYYY-MM-DD HH:MM] translate | {title} → {language}` to `wiki/log.md`

---

## File Conventions

### Page Creation

- Use `.wiki/templates/tool-page.md` for tool/service overview pages
- Use `.wiki/templates/concept-page.md` for AI concept pages
- Use `.wiki/templates/source-summary.md` for per-source summaries
- Filename: `<slug>.md` where slug is lowercase, hyphen-separated

### Index Format

```markdown
## 한국어 (ko)

### Claude
- [[Claude Overview]] — Claude 모델 패밀리 개요 (updated: 2026-05-15, sources: 3)
- [[Claude API]] — API 사용법 및 파라미터 (updated: 2026-05-15, sources: 2)
```

### Log Format

```markdown
## [2026-05-15 09:30] ingest | Claude 3.5 Sonnet Release Notes
## [2026-05-15 10:00] query | Claude vs GPT-4o 비교
## [2026-05-15 10:30] lint | wiki health check (3 orphans found)
```

---

## Security Constraints

- `SLACK_WEBHOOK_URL` is loaded from environment only — never hardcoded
- No PII, credentials, or internal business data in wiki pages
- Raw sources may contain sensitive content — LLM must not reproduce verbatim if flagged by user
