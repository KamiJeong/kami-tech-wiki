# Feature Specification: Documentation System Restructure and Exposure Governance

**Feature Branch**: `024-document-system-restructure`

**Created**: 2026-05-28

**Status**: Draft

**Input**: User description: "현재 프로젝트의 문서 시스템을 최신 기준으로 재정비하고, 문서 구조와 노출 방식을 최적화하기 위한 명세를 작성한다. 기존 문서 인벤토리, 문서별 처리 방침, 개선된 메뉴 구조, 링크 전용 문서 처리, Spec Kit/일반 문서 분리 기준, 누락 문서 처리 계획, 삭제/보류 사유, 최신화 체크리스트, 향후 유지보수 기준을 정의한다."

## Content Overview *(mandatory)*

This specification defines how the repository's documentation system will be audited, classified, exposed in GitBook/navigation surfaces, and maintained after the audit. It covers documentation governance and IA decisions only; it does not rewrite article prose, change runtime code, or replace the documentation toolchain.

**Article type**: process

**Primary learning goal**: A maintainer can decide where every existing or missing document belongs, whether it should be exposed, updated, archived, deleted, or deferred, and how to keep that decision traceable.

**Target reader**: Wiki maintainer, documentation reviewer, and project contributor who needs to understand the documentation structure without reading every file first.

**Languages in scope**: Korean (`wiki/ko/`) | English (`wiki/en/`) | Japanese (`wiki/ja/`) | cross-project docs (`docs/`) | Spec Kit artifacts (`specs/`)

**Review cycle**: periodic
- Review every 3 months for navigation and project-structure drift.
- Review immediately after large wiki ingestion, new locale creation, or GitBook configuration changes.

## Clarifications

### Session 2026-05-28

- Q: How should Spec Kit artifacts under `specs/**/*.md` be represented in the documentation inventory? → A: Inventory all `specs/**/*.md` as grouped entries by feature/artifact type, with `specs/` treated as internal by default unless reader value justifies exposure.
- Q: How far should this feature go in applying menu and navigation changes? → A: Produce audit artifacts and proposals, then apply only low-risk menu/link updates with clear rationale; defer delete/archive and major rewrites.
- Q: How should missing documents be handled during this feature? → A: Classify all missing documents, and create only lightweight placeholder or landing pages when needed for navigation clarity; defer full content writing.
- Q: Where should canonical audit outputs live, and what should be exposed to docs/wiki readers? → A: Keep full audit outputs under `specs/024-document-system-restructure/`, and publish only concise summary or landing updates when navigation/maintenance clarity requires it.
- Q: What qualifies as a low-risk navigation update? → A: Additive menu/link changes, label fixes, and concise landing updates that do not remove visibility, rename files, move files, or change document meaning.

## Reader Scenarios *(mandatory)*

### Reader Scenario 1 - Audit Every Document (Priority: P1)

A maintainer needs a complete inventory of the current documentation surface and a documented treatment decision for each document or document group.

**Why this priority**: No menu or maintenance decision is defensible until the current document set is known.

**Completion check**: Every Markdown document under `docs/`, `wiki/`, and relevant `specs/` directories is represented directly or by an explicit grouping rule, with path, current exposure, access method, purpose, status, domain, spec-kit relevance, and keep/drop rationale.

**Acceptance scenarios**:

1. **Given** a document under `wiki/ko/openui/`, **when** the inventory is reviewed, **then** the document has a row or grouped entry with menu exposure, purpose, status, and treatment.
2. **Given** a document under `docs/ko/templates/`, **when** the inventory is reviewed, **then** the document is classified as menu content, link-only support content, internal reference, archive/delete candidate, or deferred-update candidate.
3. **Given** Spec Kit artifacts under `specs/`, **when** the inventory is reviewed, **then** they are represented as grouped entries by feature/artifact type and treated as internal by default unless their purpose and audience justify user-facing exposure.

---

### Reader Scenario 2 - Improve GitBook and Navigation Exposure (Priority: P2)

A documentation user needs important documents to be discoverable through GitBook menus or obvious navigation paths, while internal or low-value documents remain out of the primary menu.

**Why this priority**: Hidden important pages and noisy menus both reduce document usability.

**Completion check**: The deliverable includes a proposed menu structure and an exposure decision for menu-visible, link-only, internal-reference, archive/delete, and future-update documents.

**Acceptance scenarios**:

1. **Given** a document currently reachable only through another document's link, **when** it is classified as important for users or developers, **then** the proposed navigation places it in the appropriate menu section or explains why link-only access is sufficient.
2. **Given** a document that is a template, generated artifact, or low-value internal reference, **when** menu exposure is evaluated, **then** it is not added to the primary menu unless it has a clear reader-facing purpose.
3. **Given** the existing GitBook root points to `docs/`, **when** wiki locale menus are evaluated, **then** the specification distinguishes root GitBook exposure from locale-specific `wiki/*/SUMMARY.md` exposure.
4. **Given** a menu or link update is low risk and has clear rationale, **when** the audit identifies it as needed, **then** the feature may apply the navigation change while deferring delete/archive actions and major article rewrites.

---

### Reader Scenario 3 - Separate Spec Kit Docs from General Project Docs (Priority: P3)

A maintainer needs to know which documents should be managed as Spec Kit workflow documentation and which should remain general project, wiki, API, or operations documentation.

**Why this priority**: The current project uses Spec Kit, but not every document should be rewritten, classified, or updated as a Spec Kit document.

**Completion check**: The deliverable defines a boundary rule and applies it consistently to current and missing documents.

**Acceptance scenarios**:

1. **Given** a document about `spec.md`, `plan.md`, `tasks.md`, constitution, or Spec Kit workflow, **when** it is classified, **then** it is treated as Spec Kit related.
2. **Given** a document about OpenUI, Codex, Rovo, Kiro, or learner curriculum, **when** it is classified, **then** it is treated as project/wiki content unless its actual purpose is Spec Kit workflow guidance.
3. **Given** a document exists only because a Spec Kit feature generated it, **when** it has no lasting user or maintainer value, **then** it is marked delete, archive, or internal-reference rather than automatically updated.

---

### Reader Scenario 4 - Handle Missing, Stale, Duplicate, and Low-Value Docs (Priority: P4)

A maintainer needs a repeatable way to decide whether missing or outdated documents should be newly written, merged, deferred, archived, deleted, or excluded.

**Why this priority**: Without a decision policy, the documentation set will drift again after the audit.

**Completion check**: Missing-document candidates include reason, expected path, priority, scope, related existing docs, and impact if not written. Delete/archive/hold candidates include reason and replacement path when applicable.

**Acceptance scenarios**:

1. **Given** a missing English or Japanese counterpart for a Korean-only topic, **when** multilingual parity is evaluated, **then** the missing page is classified as new-write, defer, or currently-not-written with a reason.
2. **Given** two documents explain the same purpose, **when** they are audited, **then** one is selected as canonical and the other is marked merge, archive, or delete.
3. **Given** an outdated document contains incorrect commands, paths, settings, or environment variables, **when** it is audited, **then** it is marked update or delete/archive depending on current value and replacement availability.
4. **Given** a missing document blocks clear navigation or section context, **when** the audit classifies it as needed, **then** the feature may create a lightweight placeholder or landing page while deferring full content writing.

### Edge cases

- `SUMMARY.md` itself appears in filesystem inventory but should not be treated as a missing menu entry.
- `README.md` may be both a section landing page and a GitBook entry; the inventory must record both roles.
- `wiki/index.md` uses Obsidian-style links today, while the constitution requires portable relative links. This must be classified as a portability/update issue, not silently ignored.
- Generated Spec Kit artifacts can be useful during implementation but not appropriate for end-user GitBook menus.
- A document can be retained while intentionally not exposed in a menu if its only valid use is internal reference or template reuse.

## Content Requirements *(mandatory)*

### Structural requirements

- **CR-001**: The audit deliverable MUST include a current document inventory covering `docs/**/*.md`, `wiki/**/*.md`, and all `specs/**/*.md` represented as grouped entries by feature/artifact type.
- **CR-002**: The inventory MUST include: document name, file path, GitBook/menu exposure, access method, purpose, current status, related feature/domain, direct Spec Kit relevance, and keep/drop rationale.
- **CR-003**: The status taxonomy MUST include at least: current, update-needed, delete-candidate, hold, new-write-needed, merge-candidate, archive-candidate, future-update.
- **CR-004**: The treatment taxonomy MUST include at least: keep, update, new-write, merge, delete, archive, future-update, hold.
- **CR-005**: The navigation proposal MUST distinguish menu-visible documents, link-only documents, internal reference documents, archive/delete candidates, and future-update candidates.
- **CR-006**: The improved menu proposal MUST consider starting, project overview, installation/run, development guide, architecture, feature documentation, operations/deployment, API/interface, Spec Kit, and reference/archive categories, but MUST omit categories that do not fit the actual project.
- **CR-007**: Link-only documents MUST receive an explicit exposure decision: add to menu, keep link-only, convert to internal reference, merge, archive, or delete.
- **CR-008**: The latestness checklist MUST evaluate code/implementation alignment, stale commands, stale paths, stale settings, stale environment variables, removed features, broken links, duplication, merge opportunities, and reader value.
- **CR-009**: Spec Kit relevance MUST be determined by document purpose, not by the fact that the repository uses Spec Kit.
- **CR-010**: Missing-document handling MUST classify each candidate as new-write-needed, merge-into-existing, future-update, currently-not-written, or exclude/delete.
- **CR-011**: Delete, hold, and archive decisions MUST include reason, replacement path when available, and risk if the document remains visible.
- **CR-012**: The output MUST include a reusable documentation maintenance policy and checklist.
- **CR-013**: The work MUST NOT modify `raw/` files.
- **CR-014**: The work MUST NOT perform broad article rewrites as part of this feature; actual content updates are follow-up tasks unless needed to record the audit.
- **CR-015**: Any eventual wiki-content update MUST update `wiki/log.md` and attempt Slack notification using `SLACK_WEBHOOK_URL` from the environment only.
- **CR-016**: Each document treatment decision MUST explain why the document should be retained, updated, merged, archived, deleted, deferred, or newly written.
- **CR-017**: No document may be promoted to a menu solely because it exists; menu exposure MUST be justified by reader need, navigation value, and maintenance ownership.
- **CR-018**: No document may be removed or hidden solely because it is stale; removal decisions MUST compare current value, risk of misinformation, duplication, and replacement availability.
- **CR-019**: The feature MAY apply low-risk menu or link updates when the audit records clear rationale, but MUST defer destructive delete/archive actions and broad content rewrites to follow-up work.
- **CR-020**: The feature MAY create lightweight placeholder or landing pages for missing documents only when needed for navigation clarity; full missing-document content writing MUST remain follow-up work.
- **CR-021**: Low-risk navigation updates MUST be limited to additive menu/link changes, label fixes, and concise landing updates that do not remove visibility, rename files, move files, or change document meaning.

### Current repository observations

- **OBS-001**: Current Markdown count is 203 files across `docs/` and `wiki/`: `docs` 56, `wiki/ko` 51, `wiki/en` 47, `wiki/ja` 47, plus `wiki/index.md` and `wiki/log.md`.
- **OBS-002**: Existing `SUMMARY.md` files cover the visible Markdown pages in each menu except the `SUMMARY.md` files themselves, which are navigation metadata rather than menu targets.
- **OBS-003**: Korean wiki currently has Korean-only `claude/` and `atlassian-rovo/` sections that do not yet have English/Japanese counterparts.
- **OBS-004**: Root `.gitbook.yaml` points GitBook at `./docs`; each locale wiki also has its own `.gitbook.yaml`, `README.md`, and `SUMMARY.md`.
- **OBS-005**: `wiki/index.md` is a catalog but currently uses `[[...]]` link syntax, which conflicts with the portable Markdown principle for canonical content.

### Terminology requirements

- **TR-001**: Standard terms MUST include: document inventory, menu exposure, access method, link-only document, internal reference, archive candidate, delete candidate, hold, future-update, Spec Kit related, general project documentation.
- **TR-002**: Korean terminology MUST distinguish `보류` from `차후 업데이트`; `보류` means no action until a decision trigger, while `차후 업데이트` means accepted work scheduled later.
- **TR-003**: "Spec Kit related" MUST mean directly about Spec Kit workflows/artifacts, not merely created during a Spec Kit-managed project.

### Source requirements

- **SR-001**: The audit MUST use repository files as primary sources: `docs/SUMMARY.md`, `wiki/*/SUMMARY.md`, `.gitbook.yaml`, `wiki/index.md`, `wiki/log.md`, project root README/AGENTS/CLAUDE guidance, and selected durable `specs/**` artifacts.
- **SR-002**: External sources are not required unless a document's content claims need current factual verification during a later update task.
- **SR-003**: Claims about current file counts, paths, and menu exposure MUST be generated from the repository state at audit time and dated.

### Deliverable requirements

- **DR-001**: The final audit MUST include the current document inventory with the fields required by CR-002.
- **DR-002**: The final audit MUST include one treatment decision for each document or explicitly grouped document set: keep, update, new-write, merge, delete, archive, future-update, or hold.
- **DR-003**: The final audit MUST include an improved GitBook or documentation menu proposal, including categories that fit the actual project and excluding categories that do not.
- **DR-004**: The final audit MUST include a specific decision for documents currently reachable only by internal links, direct paths, or unclear access paths.
- **DR-005**: The final audit MUST include the boundary rule that separates Spec Kit workflow documentation from general project, feature, operations, API, and wiki documentation.
- **DR-006**: The final audit MUST include missing-document candidates with reason, expected location, priority, writing scope, related existing documents, and impact if omitted.
- **DR-007**: The final audit MUST include delete, archive, and hold candidates with rationale, replacement path when available, and risk if left visible.
- **DR-008**: The final audit MUST include a reusable documentation latestness checklist.
- **DR-009**: The final audit MUST include future maintenance rules for menu updates, link checks, stale-content review, multilingual parity review, and decision traceability.
- **DR-010**: Canonical full audit outputs MUST live under `specs/024-document-system-restructure/`; docs/wiki surfaces MAY receive only concise summaries or landing updates required for navigation or maintenance clarity.

### Scope boundaries

- **SB-001**: Included scope covers current project documentation, GitBook or documentation menu structure, cross-document links, Spec Kit document classification, latestness criteria, missing-document triage, and delete/archive criteria.
- **SB-002**: Excluded scope covers runtime code refactoring, product feature behavior changes, Spec Kit tool structure changes, documentation tool replacement, and broad article rewrites that are not needed to record audit decisions.
- **SB-003**: The audit may recommend later content work, but the recommendation MUST preserve a distinction between audit decisions and actual article rewriting.
- **SB-004**: In-scope navigation changes are limited to low-risk menu and link updates justified by the audit; visibility removals, file renames, file moves, destructive removals, archives, semantic rewrites, and major content rewrites remain out of scope for this feature.
- **SB-005**: In-scope new pages are limited to lightweight placeholder or landing pages required for navigation clarity; full article creation remains out of scope.
- **SB-006**: Publishing full audit tables into user-facing docs/wiki navigation is out of scope unless a later review explicitly reclassifies them as reader-facing reference material.

### Exception documentation *(if any standard sections are omitted)*

| Omitted section | Reason | Approver |
|-----------------|--------|----------|
| Article prose sections | This is a process/governance feature spec, not an end-user article. | User review |

## Constitution Check *(mandatory)*

| Principle | Requirement | Met? |
|-----------|-------------|------|
| I. Audience-First | Target readers are maintainers/contributors; decisions must be understandable without hidden context. | Yes |
| II. Accuracy | Repository file state is the primary source and must be dated. | Yes |
| III. Original Synthesis | No article prose is copied from source docs. | Yes |
| IV. Multilingual Parity | Locale-specific wiki exposure and missing counterparts are in scope. | Yes |
| V. Portable Markdown First | Portable-link issues are explicitly part of the audit. | Yes |
| VI. Progressive Depth | Governance deliverables separate overview, taxonomy, checklist, and task plan. | Yes |
| VII. IA & Navigation | Navigation optimization is a primary objective. | Yes |
| VIII. Consistent Article Template | Standard article template is not applicable; exception documented. | Yes |
| IX. Terminology | Taxonomy and term boundary are required deliverables. | Yes |
| XII. Review and Quality Gates | Tasks include inventory, link, and classification validation. | Yes |
| XIII. Maintenance | Review cycle and maintenance policy are required. | Yes |
| XIV. Separation | This spec defines audit work, not article prose. | Yes |
| XV. Human Editorial Judgment | Delete/archive decisions require recorded rationale before removal. | Yes |

## Prerequisites and Navigation

**Prerequisite documents**:
- `README.md` — current repository purpose and wiki model
- `AGENTS.md` / `CLAUDE.md` — LLM wiki maintenance rules
- `docs/SUMMARY.md` — root GitBook menu
- `wiki/{ko,en,ja}/SUMMARY.md` — locale GitBook menus
- `specs/001-project-initial-setup/contracts/wiki-schema.md` — original wiki schema contract

**Related documents**:
- `specs/006-gitbook-wiki-ready/` — GitBook readiness and validation history
- `specs/021-create-replace-multilingual/` — recent multilingual wiki-series structure
- `.specify/intake/gitbook-spec-kit/` — multi-slice intake artifacts for this request

**Parent section**: Documentation governance / project maintenance

## Assumptions

- The audit may group repetitive article-series pages when the grouping rule preserves path-level traceability.
- Existing generated Spec Kit artifacts remain in `specs/` unless the audit later marks them archive/delete candidates with rationale.
- The first implementation pass should produce audit and planning artifacts, not rewrite every stale document.
- GitBook root exposure and per-locale wiki exposure are separate navigation surfaces.
- `raw/` is immutable and out of scope except as a read-only source reference if a later content-update task needs it.
- When a document's current value is uncertain, the default treatment is hold or future-update with a decision trigger, not silent deletion or automatic menu promotion.

## Success Criteria *(mandatory)*

- **SC-001**: 100% of current `docs/**/*.md` and `wiki/**/*.md` files are represented in the inventory directly or by an explicit grouping rule.
- **SC-002**: 100% of inventory entries have one treatment decision and one exposure decision.
- **SC-003**: All menu-visible documents have a documented purpose and target reader.
- **SC-004**: All link-only documents classified as important are either proposed for menu exposure or have a written reason to remain link-only.
- **SC-005**: Every delete/archive/hold candidate includes rationale and replacement path or "no replacement" statement.
- **SC-006**: All Korean-only user-facing wiki topics are classified as multilingual parity gaps, intentional locale-only content, or deferred translation candidates.
- **SC-007**: The Spec Kit/general-document boundary is documented and applied to every relevant document group.
- **SC-008**: The final checklist can be reused for future quarterly documentation reviews without rewriting the policy.
- **SC-009**: 100% of missing-document candidates have a treatment classification, expected location, priority, related existing document reference, and omission impact.
- **SC-010**: 100% of proposed menu sections include only documents with a documented reader-facing purpose or a documented maintainer-facing purpose.
- **SC-011**: 0 documents are classified as Spec Kit related solely because the repository uses Spec Kit or because the file was generated during a Spec Kit-managed workflow.
