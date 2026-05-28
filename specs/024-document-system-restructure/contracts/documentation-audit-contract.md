# Contract: Documentation Audit and Treatment Outputs

## Inventory Output

The implementation MUST produce an inventory table or machine-readable equivalent that contains these columns:

| Column | Required | Allowed values / rule |
|--------|----------|-----------------------|
| `document_id` | yes | Stable lowercase slug |
| `title` | yes | Non-empty |
| `path` | yes | Existing path or explicit glob for grouped entries |
| `grouping_rule` | conditional | Required when `path` is a glob |
| `surface` | yes | `docs-root`, `wiki-ko`, `wiki-en`, `wiki-ja`, `specs-internal`, `project-root` |
| `menu_exposed` | yes | `true` or `false` |
| `access_method` | yes | `menu`, `internal-link`, `direct-path`, `unclear` |
| `purpose` | yes | One-sentence purpose |
| `current_status` | yes | `current`, `update-needed`, `delete-candidate`, `hold`, `new-write-needed`, `merge-candidate`, `archive-candidate`, `future-update` |
| `treatment` | yes | `keep`, `update`, `new-write`, `merge`, `delete`, `archive`, `future-update`, `hold` |
| `domain` | yes | Free text, normalized per topic |
| `direct_spec_kit_relevance` | yes | `true` or `false`; semantic relevance only |
| `keep_needed` | yes | `true` or `false` |
| `rationale` | yes | Reason for status/treatment |
| `replacement_path` | conditional | Required for `merge`, `delete`, and `archive` unless rationale says `no replacement` |

## Grouped Spec Artifact Output

All `specs/**/*.md` files MUST be covered by grouped inventory entries by feature and artifact type unless a specific artifact has exceptional reader-facing value.

Grouped entries MUST include:

- feature or feature-family identifier
- artifact type
- path glob
- default exposure
- treatment
- rationale

Rules:

- Default exposure for grouped `specs/` artifacts MUST be `internal-reference`.
- A grouped `specs/` entry MAY target `menu` or `link-only` only when the rationale explains the reader-facing value.
- A document MUST NOT be classified as Spec Kit related solely because it is under `specs/`.

## Exposure Output

Every inventory entry MUST have one target exposure:

- `menu`
- `link-only`
- `internal-reference`
- `archive`
- `delete`

If target exposure is `menu`, the entry MUST name the target menu section and surface.

If target exposure is `link-only`, the entry MUST name at least one parent document or section where it should be linked.

If target exposure is `internal-reference`, the entry MUST explain why a user-facing menu entry would create noise or confusion.

No entry with `treatment = delete` or `treatment = archive` may have `target_exposure = menu`.

## Low-Risk Navigation Change Output

Only these in-scope navigation changes may be applied during this feature:

- additive menu link
- additive internal link
- label fix
- concise landing update

Every applied navigation change MUST include:

- target file
- affected document or candidate
- rationale
- risk check confirming no visibility removal, file rename, file move, destructive archive/delete action, semantic rewrite, or meaning change

Out-of-scope navigation changes MUST be recorded as follow-up recommendations, not applied.

## Missing Document Output

Every missing-document candidate MUST include:

- title
- expected path
- classification
- priority
- reason needed
- writing scope
- related existing docs
- impact if absent
- whether a lightweight placeholder or landing page is allowed

Allowed classifications:

- `new-write-needed`
- `merge-into-existing`
- `future-update`
- `currently-not-written`
- `exclude-delete`

Placeholder or landing pages are allowed only when needed for navigation clarity. Full content writing remains follow-up work.

## Delete, Archive, and Hold Output

Every delete/archive/hold candidate MUST include:

- reason
- replacement path or `no replacement`
- user impact if left visible
- owner/reviewer required before action
- whether links must be updated before the action

Delete/archive actions are recommendations only in this feature.

## Publication Summary Output

Full audit outputs MUST remain under `specs/024-document-system-restructure/`.

Docs/wiki surfaces MAY receive concise summaries or landing updates only when they improve navigation or maintenance clarity.

Published summaries MUST NOT include full inventory or treatment tables unless a later review explicitly reclassifies those tables as reader-facing reference material.

## Validation Rules

- `SUMMARY.md` files are metadata and do not need to appear as menu targets.
- `README.md` files may be both menu entries and section landing pages.
- A document in `specs/` is not automatically user-facing.
- A document's Spec Kit classification must be based on content purpose.
- No entry may have both `treatment = delete` and `target_exposure = menu`.
- No menu-visible entry may have an empty purpose.
- No delete/archive/merge entry may omit replacement-path handling.
- No low-risk navigation update may remove visibility, rename files, move files, archive/delete files, or alter document meaning.
- Canonical full audit outputs must be traceable to `specs/024-document-system-restructure/`.
