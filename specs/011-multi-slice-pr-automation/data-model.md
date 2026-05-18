# Data Model: Spec Kit Multi-Slice Orchestration and PR Automation

**Branch**: `011-multi-slice-pr-automation` | **Date**: 2026-05-18

All models are persisted as JSON files on disk. No external database is used.

---

## Epic

Represents a large user-submitted feature request decomposed into slices.

**File**: `.specify/intake/<slug>/slice-state.json`

```json
{
  "slug": "string",
  "description": "string",
  "strategy": "single-spec | sequential | foundation-first-then-parallel | parallel-safe | stop-and-ask",
  "created_at": "ISO 8601",
  "updated_at": "ISO 8601",
  "slices": ["<slice-id>", "..."],
  "batches": [
    {
      "batch_number": 1,
      "slice_ids": ["<slice-id>"],
      "is_parallel": false
    }
  ],
  "dirty_files_baseline": ["path/to/file", "..."]
}
```

**Fields**:
- `slug`: Auto-generated from first 3–4 meaningful words of the description (same heuristic as Spec Kit branch naming).
- `strategy`: Selected by `speckit-scheduler` based on dependency and conflict analysis.
- `dirty_files_baseline`: Snapshot of `git status --porcelain` output at epic start time, used by commit guard to exclude pre-existing changes.
- `batches`: Ordered list of execution batches. Each batch may be parallel (≤ 3 slices) or sequential (1 slice).

---

## Slice

Represents one independently specifiable sub-feature.

**Embedded in** `slice-state.json` under `slices` key (keyed by slice ID):

```json
{
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
  "pr_url": "string | null",
  "pr_base_branch": "string | null",
  "test_results_path": "string | null",
  "commit_sha": "string | null"
}
```

**State transitions**:
```
pending → running → completed
                 → failed
                 → blocked   (guard check returned BLOCKED)
pending → skipped            (a dependency is in failed state)
```

**Validation rules**:
- `depends_on` must reference valid slice IDs within the same epic.
- `is_safety_sensitive = true` prevents parallel scheduling (FR-007).
- `state = "skipped"` is set automatically when any direct dependency reaches `"failed"`.
- `state = "blocked"` is set when the guard check returns `BLOCKED`; this does NOT cascade to dependents automatically — the orchestrator evaluates whether to `skip` dependents.

---

## Intake Artifacts

### slice-dependency-graph.md

**File**: `.specify/intake/<slug>/slice-dependency-graph.md`

Markdown document describing the directed dependency graph between slices.

Required sections:
- Summary table: Slice ID | Slice Name | Depends On | Safety Sensitive
- Mermaid graph diagram (optional but recommended)
- Batch assignment: Batch N | Slice IDs | Parallel?

### conflict-matrix.md

**File**: `.specify/intake/<slug>/conflict-matrix.md`

Markdown table listing potential conflicts between slice pairs.

Required columns: Slice A | Slice B | Shared Resource | Resource Type | Resolvable Automatically?

Resource types: `file`, `contract`, `data-model`, `config`, `schema`

### execution-plan.md

**File**: `.specify/intake/<slug>/execution-plan.md`

Markdown document describing the full execution strategy.

Required sections:
- Chosen strategy (one of the five strategy values)
- Rationale for the strategy choice
- Batch execution table: Batch | Slices | Mode (parallel/sequential) | Dependencies
- Safety-sensitive slices list
- Resumability note (which slices can be skipped on re-run)

---

## Test Results

**File**: `.specify/intake/<slug>/<slice-id>/test-results.txt`

Plain text capture of test runner output after implementation. Created by `guard-before-commit.sh`.

Format: raw stdout/stderr from the test command. Presence of this file with exit code 0 is required for commit creation.

---

## Agent Communication Contracts

Agents communicate exclusively through files (no inter-agent RPC). The orchestrator reads/writes `slice-state.json`; slice pipeline agents read/write their own `pipeline-state.json` and spec artifacts.
