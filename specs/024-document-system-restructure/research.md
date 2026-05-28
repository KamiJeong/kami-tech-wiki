# Research: Documentation System Restructure and Exposure Governance

## Decision: Keep full audit outputs in the feature directory

**Rationale**: The full inventory and treatment tables are maintainer-facing decision records. Keeping them under `specs/024-document-system-restructure/` preserves traceability without turning internal audit data into noisy user-facing navigation.

**Alternatives considered**:
- Publish full audit tables into docs/wiki: rejected because it would expose internal decision data as reader content.
- Keep no published summary at all: rejected because concise landing or maintenance summaries may be needed for navigation clarity.

## Decision: Represent `specs/**/*.md` as grouped internal inventory entries

**Rationale**: Spec Kit artifacts are numerous and often generated. Grouping by feature/artifact type keeps coverage complete while avoiding per-file noise unless an artifact has special reader or maintenance value.

**Alternatives considered**:
- Exclude most `specs/`: rejected because hidden internal artifacts can drift and affect maintainers.
- Inventory every `specs/**/*.md` file individually: rejected because it would overfit the audit to generated planning files and obscure more important docs/wiki decisions.

## Decision: Apply only low-risk navigation updates

**Rationale**: The feature is an audit and governance pass, not a destructive cleanup. Additive menu/link changes, label fixes, and concise landing updates can improve discoverability without invalidating existing paths or changing document meaning.

**Alternatives considered**:
- Proposal-only output: rejected because clearly justified additive navigation improvements would remain unresolved.
- Full navigation restructuring: rejected because removals, renames, moves, and semantic changes require human review and follow-up tasks.

## Decision: Missing documents are classified first; full writing is deferred

**Rationale**: Missing documents need consistent triage before writing. Lightweight placeholders or landing pages are allowed only when they prevent navigation gaps or unclear section context.

**Alternatives considered**:
- Do not create any pages: rejected because some navigation sections may need a minimal landing target.
- Fully write all P1 missing docs: rejected because that would turn the governance feature into broad content production.

## Decision: Treat Spec Kit relevance as semantic

**Rationale**: A document is Spec Kit related only when it explains Spec Kit workflows, artifacts, constitution, plans, tasks, or related maintenance practices. Feature docs, tool docs, operations docs, and wiki articles remain general project documentation unless their actual purpose is Spec Kit guidance.

**Alternatives considered**:
- Classify anything created by Spec Kit as Spec Kit documentation: rejected because provenance does not determine reader purpose.
- Ignore Spec Kit artifacts: rejected because maintainers still need an internal boundary rule.

## Decision: Use DocGuard findings as audit input, not automatic implementation scope

**Rationale**: Pre-plan DocGuard reported missing canonical docs and existing Spec Kit template warnings. These findings are relevant evidence for the documentation audit, but automatically generating all missing canonical docs would exceed the clarified scope.

**Alternatives considered**:
- Run automatic DocGuard fixes: rejected because it would create broad documentation changes outside this feature's low-risk navigation scope.
- Ignore DocGuard findings: rejected because they identify real documentation governance gaps.

## Decision: No external research required for initial planning

**Rationale**: The feature concerns repository-local documentation structure, menu exposure, link paths, and maintenance policy. External sources are only needed later when updating factual article content.

**Alternatives considered**:
- Verify all article claims externally during the audit: rejected as too broad for a governance planning feature.
