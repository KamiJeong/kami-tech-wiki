# Conflict Matrix: gitbook-spec-kit

**Epic**: 현재 프로젝트의 문서 시스템을 최신 기준으로 재정비하고, 문서 구조와 노출 방식을 최적화하기 위한 명세 작성
**Created**: 2026-05-28T09:03:11+09:00

---

## Slice-Pair Conflicts

| Slice A | Slice B | Shared Resource | Resource Type | Resolvable Automatically? |
|---------|---------|----------------|---------------|--------------------------|
| inventory-status-slice | navigation-link-slice | Document inventory/status taxonomy | contract | Yes |
| inventory-status-slice | lifecycle-governance-slice | Document treatment taxonomy and spec-kit relevance classification | contract | Yes |
| navigation-link-slice | lifecycle-governance-slice | `wiki/index.md`, `wiki/*/SUMMARY.md`, `.gitbook.yaml`, `wiki/*/.gitbook.yaml` | file/config | Yes |

---

## Unresolvable Conflicts

No unresolvable conflicts detected between any slice pair.

---

## Notes

- `inventory-status-slice` produces the shared contract consumed by the other slices, so it is scheduled first instead of being parallelized.
- `navigation-link-slice` may propose changes to menu and discoverability surfaces; `lifecycle-governance-slice` may reference the same files for maintenance policy, but these affect different sections and are expected to merge cleanly.
- No TypeScript interfaces, API schemas, database migrations, or runtime data models are expected to be modified by this documentation-spec epic.
