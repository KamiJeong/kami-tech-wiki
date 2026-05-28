# Document Inventory: Documentation System Restructure

**Audit date**: 2026-05-28 09:56 Asia/Seoul
**Branch**: `024-document-system-restructure`
**Canonical location**: `specs/024-document-system-restructure/document-inventory.md`

This inventory represents all current Markdown documentation directly or by explicit grouping rules. `SUMMARY.md` files are tracked as navigation metadata, not as reader-facing menu targets.

## Source Surfaces

| Surface ID | Root path | Menu file | GitBook config | Audience | Purpose |
|------------|-----------|-----------|----------------|----------|---------|
| `project-root` | `.` | none | `.gitbook.yaml` | maintainer | Project entry points and agent guidance |
| `docs-root` | `docs/` | `docs/SUMMARY.md` | `.gitbook.yaml` points to `./docs` | learner | Root GitBook learner documentation |
| `wiki-ko` | `wiki/ko/` | `wiki/ko/SUMMARY.md` | `wiki/ko/.gitbook.yaml` | wiki-reader | Korean wiki publication surface |
| `wiki-en` | `wiki/en/` | `wiki/en/SUMMARY.md` | `wiki/en/.gitbook.yaml` | wiki-reader | English wiki publication surface |
| `wiki-ja` | `wiki/ja/` | `wiki/ja/SUMMARY.md` | `wiki/ja/.gitbook.yaml` | wiki-reader | Japanese wiki publication surface |
| `specs-internal` | `specs/` | none | none | internal | Spec Kit feature artifacts and planning records |

## Taxonomy

| Type | Values |
|------|--------|
| Status | `current`, `update-needed`, `delete-candidate`, `hold`, `new-write-needed`, `merge-candidate`, `archive-candidate`, `future-update` |
| Treatment | `keep`, `update`, `new-write`, `merge`, `delete`, `archive`, `future-update`, `hold` |
| Access method | `menu`, `internal-link`, `direct-path`, `unclear` |
| Target exposure | `menu`, `link-only`, `internal-reference`, `archive`, `delete` |
| Priority | `P1`, `P2`, `P3`, `P4` |

## Coverage Summary

| Scope | Markdown count | Representation |
|-------|----------------|----------------|
| `docs/**/*.md` | 56 | Grouped by locale, chapter/template family, and metadata role |
| `wiki/**/*.md` | 147 | Grouped by locale/topic family, with root catalog/log tracked separately |
| `specs/**/*.md` | 115 | Grouped by feature/artifact type |
| Total | 318 | Covered by the tables below |

## Root and Metadata Entries

| Document ID | Title | Path | Surface | Menu exposed | Access method | Purpose | Status | Treatment | Domain | Direct Spec Kit relevance | Keep needed | Rationale |
|-------------|-------|------|---------|--------------|---------------|---------|--------|-----------|--------|---------------------------|-------------|-----------|
| `project-readme` | Project README | `README.md` | `project-root` | false | direct-path | Project overview and repository entry point | update-needed | update | project | false | true | DocGuard reported README section gaps; keep and update later rather than remove |
| `agents-guidance` | Agent Guidance | `AGENTS.md` | `project-root` | false | direct-path | LLM operating rules for this repository | current | keep | governance | true | true | Required operating contract for Codex/LLM maintenance |
| `claude-guidance` | Claude Guidance | `CLAUDE.md` | `project-root` | false | direct-path | Additional LLM operating rules | current | keep | governance | true | true | Existing agent context for legacy/current workflows |
| `root-gitbook-config` | Root GitBook Config | `.gitbook.yaml` | `project-root` | false | direct-path | Points root GitBook to `docs/` | current | keep | navigation | false | true | Required publication metadata |
| `wiki-catalog` | Wiki Catalog | `wiki/index.md` | `project-root` | false | internal-link | Global wiki catalog | update-needed | update | catalog | false | true | Uses Obsidian-style `[[...]]` links; keep but convert later to portable links |
| `wiki-log` | Wiki Log | `wiki/log.md` | `project-root` | false | direct-path | Append-only wiki work history | current | keep | governance | false | true | Required by project operating rules |

## Docs Root Inventory

| Document ID | Title | Path / Group | Surface | Count | Menu exposed | Access method | Purpose | Status | Treatment | Domain | Direct Spec Kit relevance | Keep needed | Rationale |
|-------------|-------|--------------|---------|-------|--------------|---------------|---------|--------|-----------|--------|---------------------------|-------------|-----------|
| `docs-summary` | Docs GitBook Menu | `docs/SUMMARY.md` | `docs-root` | 1 | false | direct-path | Root GitBook navigation metadata | current | keep | navigation | false | true | Metadata, not a menu target |
| `docs-readme` | Docs README | `docs/README.md` | `docs-root` | 1 | true | menu | Root docs landing page | current | keep | learner-guide | false | true | Reader-facing entry point |
| `docs-ko-core` | Korean Learner Core Docs | `docs/ko/{index,intro,curriculum,learner-guide,glossary,safety-and-privacy}.md` | `docs-root` | 6 | true | menu | Korean learner guide core pages | current | keep | learner-guide | false | true | Fits root GitBook learner path |
| `docs-en-core` | English Learner Core Docs | `docs/en/{index,intro,curriculum,learner-guide,glossary,safety-and-privacy}.md` | `docs-root` | 6 | true | menu | English learner guide core pages | current | keep | learner-guide | false | true | Multilingual counterpart of root learner guide |
| `docs-ja-core` | Japanese Learner Core Docs | `docs/ja/{index,intro,curriculum,learner-guide,glossary,safety-and-privacy}.md` | `docs-root` | 6 | true | menu | Japanese learner guide core pages | current | keep | learner-guide | false | true | Multilingual counterpart of root learner guide |
| `docs-ko-chapters` | Korean Chapter Docs | `docs/ko/chapters/{README.md,ch01/index.md,...,ch07/index.md}` | `docs-root` | 8 | true | menu | Korean chapter sequence | current | keep | learner-guide | false | true | Core learner content |
| `docs-en-chapters` | English Chapter Docs | `docs/en/chapters/{README.md,ch01/index.md,...,ch07/index.md}` | `docs-root` | 8 | true | menu | English chapter sequence | current | keep | learner-guide | false | true | Multilingual counterpart of learner chapters |
| `docs-ja-chapters` | Japanese Chapter Docs | `docs/ja/chapters/{README.md,ch01/index.md,...,ch07/index.md}` | `docs-root` | 8 | true | menu | Japanese chapter sequence | current | keep | learner-guide | false | true | Multilingual counterpart of learner chapters |
| `docs-ko-templates` | Korean Templates | `docs/ko/templates/*.md` | `docs-root` | 4 | true | menu | Korean exercise/lesson/question templates | hold | hold | template | false | true | Useful reference but should remain clearly marked as templates |
| `docs-en-templates` | English Templates | `docs/en/templates/*.md` | `docs-root` | 4 | true | menu | English exercise/lesson/question templates | hold | hold | template | false | true | Useful reference but should remain clearly marked as templates |
| `docs-ja-templates` | Japanese Templates | `docs/ja/templates/*.md` | `docs-root` | 4 | true | menu | Japanese exercise/lesson/question templates | hold | hold | template | false | true | Useful reference but should remain clearly marked as templates |

## Wiki Inventory

| Document ID | Title | Path / Group | Surface | Count | Menu exposed | Access method | Purpose | Status | Treatment | Domain | Direct Spec Kit relevance | Keep needed | Rationale |
|-------------|-------|--------------|---------|-------|--------------|---------------|---------|--------|-----------|--------|---------------------------|-------------|-----------|
| `wiki-ko-metadata` | Korean Wiki Metadata | `wiki/ko/{README.md,SUMMARY.md}` | `wiki-ko` | 2 | mixed | menu | Korean wiki landing and menu metadata | current | keep | navigation | false | true | Required locale publication surface |
| `wiki-en-metadata` | English Wiki Metadata | `wiki/en/{README.md,SUMMARY.md}` | `wiki-en` | 2 | mixed | menu | English wiki landing and menu metadata | current | keep | navigation | false | true | Required locale publication surface |
| `wiki-ja-metadata` | Japanese Wiki Metadata | `wiki/ja/{README.md,SUMMARY.md}` | `wiki-ja` | 2 | mixed | menu | Japanese wiki landing and menu metadata | current | keep | navigation | false | true | Required locale publication surface |
| `wiki-ko-openui` | Korean OpenUI Wiki | `wiki/ko/openui/*.md` | `wiki-ko` | 14 | true | menu | Korean OpenUI article series | current | keep | openui | false | true | User-facing wiki topic |
| `wiki-en-openui` | English OpenUI Wiki | `wiki/en/openui/*.md` | `wiki-en` | 14 | true | menu | English OpenUI article series | current | keep | openui | false | true | Multilingual counterpart |
| `wiki-ja-openui` | Japanese OpenUI Wiki | `wiki/ja/openui/*.md` | `wiki-ja` | 14 | true | menu | Japanese OpenUI article series | current | keep | openui | false | true | Multilingual counterpart |
| `wiki-ko-codex` | Korean Codex Wiki | `wiki/ko/codex/*.md` | `wiki-ko` | 2 | true | menu | Korean Codex overview | current | keep | codex | false | true | User-facing wiki topic |
| `wiki-en-codex` | English Codex Wiki | `wiki/en/codex/*.md` | `wiki-en` | 2 | true | menu | English Codex overview | current | keep | codex | false | true | Multilingual counterpart |
| `wiki-ja-codex` | Japanese Codex Wiki | `wiki/ja/codex/*.md` | `wiki-ja` | 2 | true | menu | Japanese Codex overview | current | keep | codex | false | true | Multilingual counterpart |
| `wiki-ko-codex-cli` | Korean Codex CLI Wiki | `wiki/ko/codex-cli/*.md` | `wiki-ko` | 2 | true | menu | Korean Codex CLI overview | current | keep | codex-cli | false | true | User-facing wiki topic |
| `wiki-en-codex-cli` | English Codex CLI Wiki | `wiki/en/codex-cli/*.md` | `wiki-en` | 2 | true | menu | English Codex CLI overview | current | keep | codex-cli | false | true | Multilingual counterpart |
| `wiki-ja-codex-cli` | Japanese Codex CLI Wiki | `wiki/ja/codex-cli/*.md` | `wiki-ja` | 2 | true | menu | Japanese Codex CLI overview | current | keep | codex-cli | false | true | Multilingual counterpart |
| `wiki-ko-sdd` | Korean SDD Wiki | `wiki/ko/sdd/*.md` | `wiki-ko` | 2 | true | menu | Korean Spec-Driven Development concept | current | keep | sdd | true | true | SDD concept directly supports Spec Kit context |
| `wiki-en-sdd` | English SDD Wiki | `wiki/en/sdd/*.md` | `wiki-en` | 2 | true | menu | English Spec-Driven Development concept | current | keep | sdd | true | true | Multilingual counterpart |
| `wiki-ja-sdd` | Japanese SDD Wiki | `wiki/ja/sdd/*.md` | `wiki-ja` | 2 | true | menu | Japanese Spec-Driven Development concept | current | keep | sdd | true | true | Multilingual counterpart |
| `wiki-ko-kiro` | Korean Kiro Series | `wiki/ko/kiro/*.md` | `wiki-ko` | 13 | true | menu | Korean Kiro article series | current | keep | kiro | false | true | General wiki content, not Spec Kit workflow docs |
| `wiki-en-kiro` | English Kiro Series | `wiki/en/kiro/*.md` | `wiki-en` | 13 | true | menu | English Kiro article series | current | keep | kiro | false | true | Multilingual counterpart |
| `wiki-ja-kiro` | Japanese Kiro Series | `wiki/ja/kiro/*.md` | `wiki-ja` | 13 | true | menu | Japanese Kiro article series | current | keep | kiro | false | true | Multilingual counterpart |
| `wiki-ko-spec-kit` | Korean Spec Kit Series | `wiki/ko/spec-kit/*.md` | `wiki-ko` | 11 | true | menu | Korean GitHub Spec Kit article series | current | keep | spec-kit | true | true | Directly about Spec Kit workflow and artifacts |
| `wiki-en-spec-kit` | English Spec Kit Series | `wiki/en/spec-kit/*.md` | `wiki-en` | 11 | true | menu | English GitHub Spec Kit article series | current | keep | spec-kit | true | true | Multilingual counterpart |
| `wiki-ja-spec-kit` | Japanese Spec Kit Series | `wiki/ja/spec-kit/*.md` | `wiki-ja` | 11 | true | menu | Japanese GitHub Spec Kit article series | current | keep | spec-kit | true | true | Multilingual counterpart |
| `wiki-ko-kiro-vs-spec-kit` | Korean Kiro vs Spec Kit | `wiki/ko/kiro-vs-spec-kit.md` | `wiki-ko` | 1 | true | menu | Korean comparison page | current | keep | comparison | true | true | Directly compares Kiro and Spec Kit |
| `wiki-en-kiro-vs-spec-kit` | English Kiro vs Spec Kit | `wiki/en/kiro-vs-spec-kit.md` | `wiki-en` | 1 | true | menu | English comparison page | current | keep | comparison | true | true | Multilingual counterpart |
| `wiki-ja-kiro-vs-spec-kit` | Japanese Kiro vs Spec Kit | `wiki/ja/kiro-vs-spec-kit.md` | `wiki-ja` | 1 | true | menu | Japanese comparison page | current | keep | comparison | true | true | Multilingual counterpart |
| `wiki-ko-claude` | Korean Claude Wiki | `wiki/ko/claude/*.md` | `wiki-ko` | 2 | true | menu | Korean Claude article section | future-update | future-update | claude | false | true | Korean-only topic; classify as parity gap before translation |
| `wiki-ko-atlassian-rovo` | Korean Atlassian Rovo Wiki | `wiki/ko/atlassian-rovo/*.md` | `wiki-ko` | 2 | true | menu | Korean Atlassian Rovo overview | future-update | future-update | atlassian-rovo | false | true | Korean-only topic; classify as parity gap before translation |

## Grouped Spec Kit Artifact Inventory

| Group ID | Feature / Family | Artifact type | Path glob | Count | Default exposure | Treatment | Rationale |
|----------|------------------|---------------|-----------|-------|------------------|-----------|-----------|
| `specs-specs` | all features | spec | `specs/*/spec.md` | 13 | internal-reference | keep | Durable feature requirements; internal by default |
| `specs-plans` | all features | plan | `specs/*/plan.md` | 12 | internal-reference | keep | Durable implementation planning records |
| `specs-tasks` | all features | tasks | `specs/*/tasks.md` | 12 | internal-reference | keep | Durable execution task records |
| `specs-research` | all features | research | `specs/*/research.md` | 11 | internal-reference | keep | Planning decisions; useful to maintainers |
| `specs-data-models` | all features | data-model | `specs/*/data-model.md` | 11 | internal-reference | keep | Internal modeling records |
| `specs-contracts` | all features | contract | `specs/*/contracts/*.md` | 14 | internal-reference | keep | Internal contracts for feature validation |
| `specs-checklists` | all features | checklist | `specs/*/checklists/*.md` | 14 | internal-reference | keep | Quality gates and review records |
| `specs-quickstarts` | all features | quickstart | `specs/*/quickstart.md` | 4 | internal-reference | keep | Implementation/reviewer guidance |
| `specs-analysis` | all features | analysis | `specs/*/analysis.md` | 5 | internal-reference | keep | Review and audit reports |
| `specs-review-reports` | all features | review-report | `specs/*/review-report.md` | 5 | internal-reference | keep | Review outputs |
| `specs-version-guard` | all features | version-guard-report | `specs/*/version-guard-report.md` | 10 | internal-reference | keep | Version-guard context for generated code/docs |
| `specs-audit-outputs` | `024-document-system-restructure` | audit-output | `specs/024-document-system-restructure/{document-inventory,navigation-audit,lifecycle-governance,validation-report}.md` | 4 | internal-reference | keep | Canonical outputs created by this implementation |

## Multilingual Parity Notes

| Topic | Current state | Status | Treatment | Rationale |
|-------|---------------|--------|-----------|-----------|
| OpenUI | ko/en/ja present | current | keep | No parity gap detected |
| Codex | ko/en/ja present | current | keep | No parity gap detected |
| Codex CLI | ko/en/ja present | current | keep | No parity gap detected |
| SDD | ko/en/ja present | current | keep | No parity gap detected |
| Kiro | ko/en/ja present | current | keep | No parity gap detected |
| Spec Kit | ko/en/ja present | current | keep | No parity gap detected |
| Kiro vs Spec Kit | ko/en/ja present | current | keep | No parity gap detected |
| Claude | ko only | future-update | future-update | Needs en/ja parity decision before translation work |
| Atlassian Rovo | ko only | future-update | future-update | Needs en/ja parity decision before translation work |

## Initial Candidate Summary

| Candidate type | Entries | Handling |
|----------------|---------|----------|
| Update-needed | `README.md`, `wiki/index.md` | Keep and schedule update |
| Hold | `docs/{ko,en,ja}/templates/*.md` | Keep as template references; avoid over-promoting |
| Future-update | `wiki/ko/claude/*.md`, `wiki/ko/atlassian-rovo/*.md` | Maintain Korean pages and plan parity review |
| Delete/archive | none applied | Destructive action requires later human review |
