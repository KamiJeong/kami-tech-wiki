# Data Model: Documentation System Restructure and Exposure Governance

## DocumentationSurface

Represents a publication, navigation, or internal documentation surface.

| Field | Type | Required | Notes |
|-------|------|----------|-------|
| `id` | string | yes | `docs-root`, `wiki-ko`, `wiki-en`, `wiki-ja`, `specs-internal`, `project-root` |
| `root_path` | path | yes | Surface root directory |
| `menu_file` | path/null | yes | `SUMMARY.md` path when applicable |
| `gitbook_config` | path/null | yes | `.gitbook.yaml` path when applicable |
| `audience` | enum | yes | `learner`, `wiki-reader`, `maintainer`, `internal` |
| `purpose` | text | yes | Why this surface exists |

## DocumentInventoryEntry

Represents an existing document or an explicitly grouped set of repeated documents.

| Field | Type | Required | Notes |
|-------|------|----------|-------|
| `document_id` | string | yes | Stable slug |
| `title` | string | yes | Human-readable document name or group name |
| `path` | path/glob | yes | Exact path or grouped glob |
| `surface_id` | string | yes | References DocumentationSurface |
| `grouping_rule` | text/null | no | Required when `path` is a glob |
| `menu_exposed` | boolean | yes | Whether listed in the relevant menu |
| `access_method` | enum | yes | `menu`, `internal-link`, `direct-path`, `unclear` |
| `purpose` | text | yes | Current or intended document purpose |
| `current_status` | enum | yes | See status enum below |
| `treatment` | enum | yes | See treatment enum below |
| `domain` | string | yes | Example: `openui`, `spec-kit`, `learner-guide`, `operations` |
| `direct_spec_kit_relevance` | boolean | yes | Semantic relevance only |
| `keep_needed` | boolean | yes | Whether current project docs need this item |
| `rationale` | text | yes | Why the treatment was chosen |
| `replacement_path` | path/null | no | Required for delete/archive/merge when applicable |
| `review_owner` | string/null | no | Human or role that should confirm destructive changes |

### Status Enum

- `current`
- `update-needed`
- `delete-candidate`
- `hold`
- `new-write-needed`
- `merge-candidate`
- `archive-candidate`
- `future-update`

### Treatment Enum

- `keep`
- `update`
- `new-write`
- `merge`
- `delete`
- `archive`
- `future-update`
- `hold`

## GroupedSpecArtifactEntry

Represents grouped `specs/**/*.md` artifacts by feature and artifact type.

| Field | Type | Required | Notes |
|-------|------|----------|-------|
| `group_id` | string | yes | Stable slug for the group |
| `feature_id` | string | yes | Feature directory name or grouped family |
| `artifact_type` | enum | yes | `spec`, `plan`, `tasks`, `research`, `data-model`, `contract`, `quickstart`, `checklist`, `analysis`, `report`, `other` |
| `path_glob` | glob | yes | Matching files |
| `default_exposure` | enum | yes | Must default to `internal-reference` unless justified otherwise |
| `reader_value_exception` | text/null | no | Required if target exposure is not internal |
| `treatment` | enum | yes | Uses DocumentInventoryEntry treatment enum |
| `rationale` | text | yes | Why grouped treatment is sufficient |

## ExposureDecision

Represents how a document should be discoverable.

| Field | Type | Required | Notes |
|-------|------|----------|-------|
| `document_id` | string | yes | References DocumentInventoryEntry or GroupedSpecArtifactEntry |
| `current_exposure` | enum | yes | `menu`, `link-only`, `internal-reference`, `direct-only`, `unclear` |
| `target_exposure` | enum | yes | `menu`, `link-only`, `internal-reference`, `archive`, `delete` |
| `menu_section` | string/null | no | Required when target is `menu` |
| `parent_link_target` | path/null | no | Required when target is `link-only` |
| `reason` | text | yes | Reader-value and maintenance rationale |

## LowRiskNavigationChange

Represents an allowed in-scope navigation change.

| Field | Type | Required | Notes |
|-------|------|----------|-------|
| `change_id` | string | yes | Stable slug |
| `change_type` | enum | yes | `add-menu-link`, `add-internal-link`, `fix-label`, `concise-landing-update` |
| `target_file` | path | yes | Menu, index, or landing page to update |
| `affected_document_id` | string | yes | Referenced inventory entry |
| `rationale` | text | yes | Why the change improves discovery |
| `risk_check` | text | yes | Must state no visibility removal, rename, move, or meaning change |

## MissingDocumentCandidate

Represents a needed but absent document.

| Field | Type | Required | Notes |
|-------|------|----------|-------|
| `candidate_id` | string | yes | Stable slug |
| `title` | string | yes | Proposed document name |
| `expected_path` | path | yes | Proposed location |
| `classification` | enum | yes | `new-write-needed`, `merge-into-existing`, `future-update`, `currently-not-written`, `exclude-delete` |
| `priority` | enum | yes | `P1`, `P2`, `P3`, `P4` |
| `reason_needed` | text | yes | Why it matters |
| `writing_scope` | text | yes | What the document should cover |
| `related_existing_docs` | path list | yes | Existing docs to reuse or link |
| `impact_if_absent` | text | yes | Reader or maintenance impact |
| `placeholder_allowed` | boolean | yes | True only when needed for navigation clarity |

## MenuSectionProposal

Represents the improved menu structure.

| Field | Type | Required | Notes |
|-------|------|----------|-------|
| `surface_id` | string | yes | Documentation surface |
| `section_label` | string | yes | Display name |
| `section_purpose` | text | yes | Why this section exists |
| `included_documents` | document_id list | yes | Ordered list |
| `excluded_candidate_categories` | string list | no | Categories intentionally omitted |

## AuditPublicationSummary

Represents the concise user/maintainer-facing summary that may be published outside the feature directory.

| Field | Type | Required | Notes |
|-------|------|----------|-------|
| `summary_id` | string | yes | Stable slug |
| `target_surface` | string | yes | `docs-root`, `wiki-ko`, `wiki-en`, `wiki-ja`, or `project-root` |
| `target_path` | path | yes | Summary or landing page location |
| `summary_scope` | text | yes | What is summarized |
| `excludes_full_tables` | boolean | yes | Must be true unless later review reclassifies audit tables |
| `rationale` | text | yes | Why publishing the summary improves navigation or maintenance clarity |

## SpecKitBoundaryRule

Represents a rule for distinguishing Spec Kit docs from general docs.

| Field | Type | Required | Notes |
|-------|------|----------|-------|
| `rule_id` | string | yes | Stable ID |
| `condition` | text | yes | What makes a doc Spec Kit related or not |
| `classification` | enum | yes | `spec-kit`, `general-project`, `internal-artifact`, `archive-candidate` |
| `examples` | path list | yes | Repository examples |

## MaintenanceRule

Represents reusable maintenance policy.

| Field | Type | Required | Notes |
|-------|------|----------|-------|
| `rule_id` | string | yes | Stable ID |
| `trigger` | text | yes | Time or event that triggers review |
| `checklist_items` | string list | yes | Required review checks |
| `required_output` | text | yes | What must be updated |
| `owner` | string | yes | Maintainer role |
