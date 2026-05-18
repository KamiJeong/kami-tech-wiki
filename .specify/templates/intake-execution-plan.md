# Execution Plan: [EPIC-SLUG]

**Epic**: [Epic description]
**Strategy**: [single-spec | sequential | foundation-first-then-parallel | parallel-safe | stop-and-ask]
**Created**: [DATE]
**Slices**: [N]

---

## Strategy Rationale

[Explain why this strategy was chosen. Reference specific dependencies, conflicts, or safety-sensitive slices that drove the decision.]

---

## Batch Execution Plan

| Batch | Slices | Mode | Dependencies |
|-------|--------|------|-------------|
| 1 | [slice-id-a], [slice-id-b] | parallel | none |
| 2 | [slice-id-c] | sequential | Batch 1 complete |

**Max parallel per batch**: 3

---

## Safety-Sensitive Slices

The following slices are classified as safety-sensitive and will NEVER be auto-parallelized:

| Slice ID | Slice Name | Matched Keyword |
|----------|-----------|----------------|
| [slice-id] | [name] | [keyword] |

*If empty: no safety-sensitive slices detected.*

---

## Resumability

On session resume, slices with `state = "completed"` in `slice-state.json` are skipped. Slices with `state = "running"` re-run from the beginning of their current `pipeline_stage`. Slices with `state = "skipped"` or `state = "blocked"` are not retried automatically.
