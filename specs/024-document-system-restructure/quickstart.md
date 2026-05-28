# Quickstart: Documentation System Restructure Review

Use this guide to review or continue the documentation audit feature.

## 1. Confirm Active Feature

```bash
rtk cat .specify/feature.json
```

Expected feature directory:

```json
{"feature_directory":"specs/024-document-system-restructure"}
```

## 2. Read Canonical Planning Artifacts

Read in this order:

1. [spec.md](spec.md)
2. [plan.md](plan.md)
3. [research.md](research.md)
4. [data-model.md](data-model.md)
5. [contracts/documentation-audit-contract.md](contracts/documentation-audit-contract.md)

## 3. Validate Scope Before Editing

Allowed during this feature:

- Create canonical audit outputs under `specs/024-document-system-restructure/`.
- Classify all current and missing documents.
- Represent `specs/**/*.md` as grouped entries by feature/artifact type.
- Apply additive menu/link changes, label fixes, or concise landing updates when the audit gives clear rationale.
- Create lightweight placeholder or landing pages only when needed for navigation clarity.

Not allowed during this feature:

- Modify `raw/`.
- Perform broad article rewrites.
- Delete or archive documents.
- Rename or move files.
- Remove visibility from menus.
- Change document meaning.
- Publish full audit tables into user-facing docs/wiki navigation.

## 4. Run Repository-Local Checks

Use repository state as the source of truth:

```bash
rtk rg --files -g '*.md' docs wiki specs
rtk rg --files -g 'SUMMARY.md' docs wiki
rtk rg --files -g '.gitbook.yaml' .
```

Check for links and menu coverage using project-appropriate scripts if available. Record any manual validation limits in the final audit output.

## 5. Produce Audit Outputs

Canonical outputs should be placed under `specs/024-document-system-restructure/`.

Required outputs:

- current document inventory
- grouped Spec Kit artifact inventory
- treatment decision table
- exposure decision table
- missing-document candidate table
- delete/archive/hold candidate list
- menu proposal
- low-risk navigation change list
- latestness checklist
- maintenance policy

## 6. Apply Only Low-Risk Navigation Changes

Before applying any docs/wiki change, confirm it is one of:

- additive menu link
- additive internal link
- label fix
- concise landing update

Each applied change must record:

- target file
- affected document
- rationale
- risk check confirming no removal, rename, move, archive/delete action, semantic rewrite, or meaning change

## 7. Record Wiki Work Log When Applicable

If wiki content or wiki navigation changes are made, append to `wiki/log.md` using the project format:

```markdown
## [YYYY-MM-DD HH:MM] operation | title
```

Slack notification applies to eventual wiki-content updates and must use `SLACK_WEBHOOK_URL` from the environment only.

## 8. Reviewer Acceptance

The feature is ready for implementation review when:

- 100% of `docs/**/*.md` and `wiki/**/*.md` files are represented.
- 100% of `specs/**/*.md` files are covered by grouped artifact entries.
- Every inventory entry has treatment and exposure decisions.
- Every delete/archive/hold candidate has rationale and replacement handling.
- All applied navigation changes satisfy the low-risk contract.
- Full audit outputs remain under the feature directory.
