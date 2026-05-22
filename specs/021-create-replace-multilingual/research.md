# Research: Multilingual Wiki Series — Kiro & GitHub Spec Kit

**Date**: 2026-05-19
**Branch**: `021-create-replace-multilingual`

---

## Decision 1: Kiro Feature Set (as of 2026-05-19)

**Decision**: Cover Kiro as an agentic IDE + CLI product with five core feature areas: Specs, Steering, Hooks, MCP, and Agentic Chat. Mark all capability claims with "As of 2026-05-19".

**Rationale**: Kiro is an AWS product available at kiro.dev. Based on publicly available information as of the research date, Kiro's feature set includes:
- **Specs**: Structured development artifacts (requirements.md, design.md, tasks.md) generated from a feature description. Kiro uses a spec-driven workflow where the AI generates and executes tasks against the spec.
- **Steering**: Project-specific guidance files (`.kiro/steering/`) that provide persistent context to the AI agent — coding conventions, architecture rules, folder structure, preferred libraries.
- **Hooks**: Automated AI actions triggered by file system events (e.g., on save, on create). Defined in `.kiro/hooks/`.
- **Agentic Chat**: Conversational AI interface that can read and modify files, run commands, and use MCP tools — within the context of the project.
- **MCP (Model Context Protocol)**: Allows Kiro to connect to external tools, services, databases, and documentation sources via the MCP standard.
- **IDE**: Kiro has a VS Code-based IDE interface.
- **CLI**: Kiro can be invoked from the command line.

**Alternatives considered**: Covering Kiro only as an IDE (not CLI) — rejected because the spec explicitly requires both to be covered.

**Source requirement**: SR-001 requires minimum 2 verifiable sources. Primary source: kiro.dev official site. Secondary source: AWS announcement blog or developer documentation.

**Freshness warning**: Kiro was in preview/beta as of early 2026. Feature availability, pricing, and regional access may have changed. All articles must include a freshness notice dated 2026-05-19 and flag the fast-changing review cycle.

---

## Decision 2: GitHub Spec Kit Feature Set (as of 2026-05-19)

**Decision**: Cover GitHub Spec Kit as the SDD toolkit implemented in this repository as Claude Code skills. Name the commands as they are actually used in this project (`/speckit-specify`, `/speckit-clarify`, etc.) and note the "skills mode" variant where applicable.

**Rationale**: Spec Kit in this repository is implemented as a set of Claude Code skills (not slash commands in the traditional sense). The full workflow is:
1. `/speckit-constitution` — Create project constitution
2. `/speckit-specify` — Create feature spec
3. `/speckit-clarify` — Resolve ambiguities
4. `/speckit-checklist` — Generate requirements quality checklist
5. `/speckit-plan` — Generate implementation plan + research + data model + contracts
6. `/speckit-tasks` — Generate task list
7. `/speckit-analyze` — Cross-artifact consistency check
8. `/speckit-implement` — Execute tasks

Artifacts produced: spec.md, plan.md, research.md, data-model.md, contracts/, tasks.md, analysis.md, review-report.md.

The constitution is the governance document that all other Spec Kit commands respect.

**Alternatives considered**: Covering Spec Kit as a generic SDD methodology without tying it to this repository's implementation — rejected because the issue brief is specific to the Spec Kit toolkit as it exists in practice.

**Source requirement**: Primary source: this repository's `.claude/skills/` and `.specify/` directories. Secondary source: Claude Code documentation for skills/commands. No external citations required for a tool documented in the same repo.

---

## Decision 3: Translation Precedents for Key Terms

**Decision**: Use the following translation strategy for problematic terms.

| English term | Korean | Japanese | Strategy |
|---|---|---|---|
| vibe coding | 바이브 코딩 (vibe coding) | バイブコーディング (vibe coding) | Retain English with local transliteration + note |
| steering | 스티어링 (steering) | ステアリング (steering) | Retain English with transliteration; add note: "AI에게 주는 지속적 가이드라인" / 「AIへの継続的なガイドライン」 |
| hooks | 훅 | フック | Transliteration; add note: "파일 변경 시 자동 실행되는 작업" / 「ファイル変更時に自動実行されるアクション」 |
| spec(s) | 명세 / 스펙 | 仕様書 / スペック | Use Korean: 명세서(스펙); Japanese: 仕様書（スペック） |
| constitution | 헌법/규약 → 프로젝트 헌법 | プロジェクト憲章 (project charter) | Korean: 프로젝트 규약; Japanese: プロジェクト憲章 (closest to "foundational document") |
| agentic | 에이전틱 | エージェンティック | Transliteration with note |
| MCP | MCP (Model Context Protocol) | MCP (Model Context Protocol) | Expand on first use in all languages |
| vibe | 바이브 | バイブ | Retain with note that the connotation is "intuition-driven, informal" |

**Rationale**: Korean and Japanese tech writing communities typically retain English technical terms as transliterations for new concepts that lack established equivalents. Forcing literal translations ("갈고리" for "hook") would confuse readers who encounter the English term in tools and documentation.

**Alternatives considered**: Full translation into conceptual equivalents — rejected as it would create terminology mismatches when readers consult official tool documentation.

---

## Decision 4: Existing Wiki Page Authorship

**Decision**: All existing pages under `wiki/*/kiro/`, `wiki/*/spec-kit/` are AI-generated (created 2026-05-18 via previous pipeline run). They are safe to replace.

**Evidence**: All existing Kiro and Spec Kit pages have `date_created: 2026-05-18` and were created by the Spec Kit pipeline (prior issue #22 run, branch `019-create-replace-multilingual`). No hand-authored content exists in these directories.

The `wiki/*/sdd/` pages have `status: draft` and some are dated 2026-05-19, indicating active editing. These are NOT to be replaced — only cross-references will be added.

---

## Decision 5: 13-Section Article Template (Resolved from Constitution)

**Decision**: The standard 13-section template from Constitution Principle VIII is the canonical structure. All non-glossary article pages must follow this order:

1. Title
2. One-sentence summary
3. Who this page is for
4. Why this matters
5. Plain-language explanation
6. Key concepts
7. Example or analogy
8. Practical applications
9. Common misconceptions
10. Related terms (linked)
11. Further reading (cited sources)
12. Language notes (when a term does not translate cleanly)
13. Advanced notes (optional, clearly marked)

Tutorial pages (Kiro p08, Spec Kit p06) extend section 8 with a full step-by-step guide and troubleshooting checklist. Glossary pages (Kiro p10, Spec Kit p09) are structured differently (alphabetical term entries) and document this exception in the spec.

---

## Unresolved items

None. All NEEDS CLARIFICATION markers from the planning phase have been resolved.
