# Navigation Audit: Documentation System Restructure

**Audit date**: 2026-05-28 09:56 Asia/Seoul
**Canonical location**: `specs/024-document-system-restructure/navigation-audit.md`

## Low-Risk Navigation Rule

Allowed in this feature:

- additive menu link
- additive internal link
- label fix
- concise landing update

Not allowed in this feature:

- visibility removal
- file rename
- file move
- archive/delete action
- semantic rewrite
- broad article rewrite
- meaning change

No low-risk navigation changes are applied unless listed in this file with rationale and a risk check.

## Current Menu Coverage

| Surface | Menu file | Current coverage assessment | Treatment |
|---------|-----------|-----------------------------|-----------|
| `docs-root` | `docs/SUMMARY.md` | Covers root learner guide structure, locale sections, chapters, and templates | keep |
| `wiki-ko` | `wiki/ko/SUMMARY.md` | Covers Korean wiki topics including Korean-only Claude and Atlassian Rovo | keep |
| `wiki-en` | `wiki/en/SUMMARY.md` | Covers English wiki topics; no Claude/Rovo counterparts exist | keep |
| `wiki-ja` | `wiki/ja/SUMMARY.md` | Covers Japanese wiki topics; no Claude/Rovo counterparts exist | keep |

`SUMMARY.md` files are navigation metadata and are not themselves menu targets.

## Access Method and Target Exposure Rules

| Current access | Target exposure | Decision rule |
|----------------|-----------------|---------------|
| `menu` | `menu` | Keep when the document has clear reader or maintainer value |
| `internal-link` | `link-only` | Keep when the page supports a parent page but would add menu noise |
| `direct-path` | `internal-reference` | Keep internal when the audience is maintainers or agents only |
| `unclear` | `menu` or `link-only` | Promote only if reader value is clear and low-risk |
| `menu` + stale | `menu` + update treatment | Do not remove visibility solely because stale |
| delete/archive candidate | `archive` or `delete` recommendation | Do not apply during this feature |

## Menu Proposal

### Root `docs/`

| Proposed section | Included documents/groups | Purpose | Action |
|------------------|---------------------------|---------|--------|
| Start | `docs/README.md`, locale `index.md` pages | Entry into learner docs | keep existing |
| Curriculum | `curriculum.md`, `learner-guide.md`, chapters | Learning path and chapter content | keep existing |
| Safety & Privacy | `safety-and-privacy.md` | Cross-cutting learner guidance | keep existing |
| Glossary | `glossary.md` | Terminology reference | keep existing |
| Templates | `templates/*.md` | Reusable lesson/exercise templates | keep existing but classify as hold |

No forced sections are added for API, deployment, or architecture because those categories do not fit the current root learner docs.

### Locale Wiki Menus

| Locale | Proposed sections | Action |
|--------|-------------------|--------|
| `wiki/ko` | OpenUI, Codex, Codex CLI, SDD, Kiro, Spec Kit, Kiro vs Spec Kit, Claude, Atlassian Rovo | keep existing; mark Claude/Rovo as parity review candidates |
| `wiki/en` | OpenUI, Codex, Codex CLI, SDD, Kiro, Spec Kit, Kiro vs Spec Kit | keep existing; do not add missing Claude/Rovo placeholders until parity decision |
| `wiki/ja` | OpenUI, Codex, Codex CLI, SDD, Kiro, Spec Kit, Kiro vs Spec Kit | keep existing; do not add missing Claude/Rovo placeholders until parity decision |

## Link-Only and Direct-Only Treatment

| Document/group | Current access | Target exposure | Treatment | Rationale |
|----------------|----------------|-----------------|-----------|-----------|
| `wiki/index.md` | direct-path / internal-link | internal-reference | update | Global catalog is useful but not a locale menu page; portable link issue remains update candidate |
| `wiki/log.md` | direct-path | internal-reference | keep | Maintainer history, not reader navigation |
| `AGENTS.md` | direct-path | internal-reference | keep | Agent operating contract, not reader content |
| `CLAUDE.md` | direct-path | internal-reference | keep | Agent operating contract, not reader content |
| `specs/**/*.md` grouped entries | direct-path | internal-reference | keep | Internal Spec Kit artifacts by default |
| `docs/*/templates/*.md` | menu | menu | hold | Reader-visible templates are acceptable but should not be over-promoted |

## Low-Risk Navigation Changes

| Change ID | Change type | Target file | Affected document | Rationale | Risk check | Applied |
|-----------|-------------|-------------|-------------------|-----------|------------|---------|
| `none-current-pass` | none | none | none | Current menus already expose reader-facing docs; remaining issues require update or parity decisions, not additive links | No visibility removal, rename, move, archive/delete, semantic rewrite, or meaning change | no |

No docs/wiki menu file was changed by this implementation pass. This preserves the clarified scope while recording future decisions.

## Portable Link Issues

| File | Issue | Status | Treatment |
|------|-------|--------|-----------|
| `wiki/index.md` | Uses Obsidian-style `[[...]]` links | update-needed | Update in a follow-up low-risk portability task |

## Validation Notes

- No delete/archive candidate is proposed as menu-visible.
- No applied navigation change removes existing visibility.
- Full audit tables are not published into docs/wiki menus.
