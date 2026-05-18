# .specify/intake/

Runtime directory for multi-slice epic orchestration state. Created and managed by `speckit-scheduler` and `speckit-integrator` agents.

## Directory Structure

```
.specify/intake/
└── <epic-slug>/
    ├── slice-state.json          # Epic + slice lifecycle state (see schema below)
    ├── execution-plan.md         # Chosen strategy, batch assignments, parallelization plan
    ├── conflict-matrix.md        # Slice-pair conflict analysis
    ├── slice-dependency-graph.md # Directed dependency graph
    └── <slice-id>/
        └── test-results.txt      # Captured test runner output for the slice
```

## Epic Slug Naming Convention

The epic slug is auto-generated from the first 3–4 meaningful words of the feature description using the same heuristic as Spec Kit branch naming (`generate_branch_name()` in `.specify/scripts/bash/create-new-feature.sh`). Stop words are filtered; acronyms and technical terms are preserved.

**Example**: `"Add authentication, notification system, and user profile"` → `auth-notification-user-profile`

## slice-state.json Schema

```json
{
  "slug": "string",
  "description": "string",
  "strategy": "single-spec | sequential | foundation-first-then-parallel | parallel-safe | stop-and-ask",
  "created_at": "ISO 8601",
  "updated_at": "ISO 8601",
  "slices": {
    "<slice-id>": {
      "id": "string",
      "name": "string",
      "description": "string",
      "feature_dir": "specs/<NNN>-<slug>",
      "branch": "<NNN>-<slug>",
      "state": "pending | running | completed | failed | skipped | blocked",
      "pipeline_stage": "specify | clarify | checklist | plan | tasks | analyze | implement | review | done",
      "depends_on": ["<slice-id>"],
      "conflicts_with": ["<slice-id>"],
      "is_safety_sensitive": false,
      "pr_url": null,
      "pr_base_branch": null,
      "test_results_path": null,
      "commit_sha": null
    }
  },
  "batches": [
    {
      "batch_number": 1,
      "slice_ids": ["<slice-id>"],
      "is_parallel": false
    }
  ],
  "dirty_files_baseline": ["path/to/file"]
}
```

## State Transitions

```
pending → running → completed
                 → failed      (pipeline error or validation failure)
                 → blocked     (guard check returned BLOCKED)
pending → skipped              (a direct dependency reached "failed")
```

Note: `blocked` does NOT cascade to dependents automatically. The orchestrator evaluates each dependent independently.

## Notes

- This directory is runtime state; consider adding it to `.gitignore` if epic state should not be committed.
- On session resume, `speckit-integrator` reads `slice-state.json` and skips slices with `state = "completed"`.
- Slices with `state = "running"` when interrupted are re-run from the beginning of their current `pipeline_stage`.
