# Lifecycle Governance: Documentation System Restructure

**Audit date**: 2026-05-28 09:56 Asia/Seoul
**Canonical location**: `specs/024-document-system-restructure/lifecycle-governance.md`

## Spec Kit Boundary Rule

| Rule ID | Condition | Classification | Examples |
|---------|-----------|----------------|----------|
| `sk-workflow` | Document explains Spec Kit workflow, commands, specs, plans, tasks, constitution, or SDD execution | `spec-kit` | `wiki/*/spec-kit/*.md`, `wiki/*/sdd/*.md`, `wiki/*/kiro-vs-spec-kit.md` |
| `sk-internal-artifact` | Document is generated or maintained under `specs/` for a feature | `internal-artifact` | `specs/*/{spec,plan,tasks,research}.md` |
| `general-topic` | Document explains a product, tool, concept, learner guide, or operational topic without Spec Kit workflow purpose | `general-project` | `wiki/*/openui/*.md`, `wiki/*/codex/*.md`, `wiki/*/kiro/*.md`, `docs/**/*.md` |
| `archive-review` | Generated artifact has no lasting maintainer value and has a replacement | `archive-candidate` | none applied in this feature |

Spec Kit relevance is semantic. A file is not Spec Kit related merely because the repository uses Spec Kit or the file was generated during a Spec Kit-managed workflow.

## Boundary Application

| Group | Classification | Rationale |
|-------|----------------|-----------|
| `specs/**/*.md` grouped entries | `internal-artifact` | Planning artifacts for maintainers; internal by default |
| `wiki/**/spec-kit/**/*.md` | `spec-kit` | Directly explains GitHub Spec Kit workflow and practices |
| `wiki/**/sdd/**/*.md` | `spec-kit` | Explains Spec-Driven Development context used with Spec Kit |
| `wiki/**/kiro-vs-spec-kit.md` | `spec-kit` | Direct comparison involving Spec Kit |
| `wiki/**/openui/**/*.md` | `general-project` | Product/tool docs, not Spec Kit workflow |
| `wiki/**/codex/**/*.md` and `wiki/**/codex-cli/**/*.md` | `general-project` | Tool docs, not Spec Kit workflow |
| `wiki/**/kiro/**/*.md` | `general-project` | Kiro topic docs; only comparison page is direct Spec Kit boundary content |
| `wiki/ko/claude/**/*.md` | `general-project` | Tool/topic docs; Korean-only parity candidate |
| `wiki/ko/atlassian-rovo/**/*.md` | `general-project` | Product/topic docs; Korean-only parity candidate |
| `docs/**/*.md` | `general-project` | Learner guide and templates, not Spec Kit workflow |

## Missing Document Candidates

| Candidate ID | Title | Expected path | Classification | Priority | Reason needed | Writing scope | Related existing docs | Impact if absent | Placeholder allowed |
|--------------|-------|---------------|----------------|----------|---------------|---------------|-----------------------|------------------|--------------------|
| `claude-en` | Claude overview English | `wiki/en/claude/index.md` | `future-update` | `P3` | Korean Claude topic has no English counterpart | Translate/localize overview after parity review | `wiki/ko/claude/*.md` | English readers lack topic parity | false |
| `claude-ja` | Claude overview Japanese | `wiki/ja/claude/index.md` | `future-update` | `P3` | Korean Claude topic has no Japanese counterpart | Translate/localize overview after parity review | `wiki/ko/claude/*.md` | Japanese readers lack topic parity | false |
| `rovo-en` | Atlassian Rovo overview English | `wiki/en/atlassian-rovo/index.md` | `future-update` | `P3` | Korean Rovo topic has no English counterpart | Translate/localize after source freshness review | `wiki/ko/atlassian-rovo/*.md` | English readers lack topic parity | false |
| `rovo-ja` | Atlassian Rovo overview Japanese | `wiki/ja/atlassian-rovo/index.md` | `future-update` | `P3` | Korean Rovo topic has no Japanese counterpart | Translate/localize after source freshness review | `wiki/ko/atlassian-rovo/*.md` | Japanese readers lack topic parity | false |
| `docs-canonical-set` | Canonical DocGuard docs | `docs-canonical/*.md` | `future-update` | `P4` | DocGuard reports missing canonical docs | Decide whether DocGuard canonical docs fit this wiki project | DocGuard diagnose output, `README.md` | DocGuard score remains low | false |
| `changelog` | Project changelog | `CHANGELOG.md` | `future-update` | `P4` | DocGuard reports missing changelog | Decide whether repository release history needs changelog | Git history, `wiki/log.md` | Release/change trace remains split | false |
| `drift-log` | Drift log | `DRIFT-LOG.md` | `future-update` | `P4` | DocGuard reports missing drift log | Decide if drift tracking is useful beyond wiki log | DocGuard diagnose output | CDD drift tracking remains absent | false |

No missing-document candidate currently blocks navigation clarity, so no placeholder or landing page is created in this pass.

## Latestness Checklist

Each document/group should be checked for:

- current implementation or repository state alignment
- stale commands
- stale paths
- stale settings
- stale environment variables
- removed or renamed features
- broken internal links
- duplicate content
- merge opportunities
- current reader value
- owner/reviewer clarity

## Stale and Update Candidates

| Candidate | Reason | Treatment | Follow-up |
|-----------|--------|-----------|-----------|
| `wiki/index.md` | Obsidian-style links conflict with portable Markdown principle | update | Convert to relative links in a low-risk portability task |
| `README.md` | DocGuard reports missing Installation, Usage, and License sections | update | Decide whether standard README sections apply to this wiki |
| `.env.example` documentation | DocGuard reports missing documentation reference | future-update | Add environment explanation if relevant to Slack notification workflow |
| `.gitbook.yaml` documentation | DocGuard reports missing documentation reference | future-update | Add concise maintainer note if needed |

## Duplicate and Merge Candidates

| Candidate | Canonical document | Replacement handling | Treatment |
|-----------|-------------------|----------------------|-----------|
| none confirmed | none | no replacement | hold |

No duplicate is confirmed strongly enough for merge/delete in this pass.

## Delete, Archive, and Hold Candidates

| Candidate | Reason | Replacement path | User impact if left visible | Reviewer required | Links update required | Treatment |
|-----------|--------|------------------|-----------------------------|-------------------|----------------------|-----------|
| `docs/*/templates/*.md` | Templates are useful but can confuse if treated as primary learner content | no replacement | Low if kept clearly under Templates | maintainer | no | hold |
| generated stale `specs/` artifacts | Some older generated artifacts may not have lasting value | no replacement identified | Low while internal-only | maintainer | yes before archive | hold |

No delete/archive action is applied in this feature.

## DocGuard Findings as Audit Inputs

Pre-plan DocGuard reported:

- missing `docs-canonical/ARCHITECTURE.md`
- missing `docs-canonical/DATA-MODEL.md`
- missing `docs-canonical/SECURITY.md`
- missing `docs-canonical/TEST-SPEC.md`
- missing `docs-canonical/ENVIRONMENT.md`
- missing `CHANGELOG.md`
- missing `DRIFT-LOG.md`
- README section gaps
- existing Spec Kit template warnings for older specs
- metrics consistency warnings

These are recorded as governance inputs. Automatic DocGuard generation is out of scope because it would exceed the clarified low-risk navigation scope.

## Maintenance Rules

| Rule ID | Trigger | Checklist items | Required output | Owner |
|---------|---------|-----------------|-----------------|-------|
| `quarterly-doc-review` | Every 3 months | inventory drift, link health, stale commands, parity gaps, menu noise | update audit or create follow-up tasks | wiki maintainer |
| `after-large-ingest` | New topic or locale series added | menu exposure, catalog entry, parity status, `wiki/log.md` | update navigation and log | wiki maintainer |
| `after-gitbook-change` | `.gitbook.yaml` or `SUMMARY.md` changed | menu coverage, broken links, root/locale distinction | update navigation audit | maintainer |
| `after-spec-feature` | New `specs/*` feature artifacts created | grouped artifact inventory, internal exposure default | update grouped specs count | maintainer |
| `before-delete-archive` | Any destructive doc action proposed | rationale, replacement, link updates, reviewer approval | human review record | human reviewer |
