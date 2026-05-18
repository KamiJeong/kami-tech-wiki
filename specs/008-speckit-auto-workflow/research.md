# Research: Spec Kit Automated Workflow Orchestration

**Feature**: 008-speckit-auto-workflow | **Date**: 2026-05-18

---

## R-001: Claude Code Agent Definition File Format

**Decision**: Agent definitions live at `.claude/agents/<name>.md`. The file uses a YAML frontmatter block followed by the agent's system prompt (markdown body). Required frontmatter fields: `name`, `description`. Optional: `model` (defaults to project model), `tools` (comma-separated list or array of allowed tools).

**Rationale**: This is the native Claude Code convention for sub-agent definitions, validated by the existing project's skills structure and Claude Code documentation. The `subagent_type` parameter in the `Agent` tool invocation matches the `name` field in the frontmatter.

**Format**:
```yaml
---
name: "speckit-specifier"
description: "Runs /speckit-specify for the current feature description"
tools: Read, Write, Edit, Bash, Skill
---

## Agent Instructions
...system prompt content...
```

**Alternatives considered**:
- Skills instead of agents: Skills are user-invocable slash commands; agents are orchestrator-invocable sub-processes. The spec requires independent invokability (FR-010) AND orchestrator invocation (FR-003) — agents satisfy both (a user can invoke an agent directly; the orchestrator uses the Agent tool).

---

## R-002: Claude Code `settings.json` Hook Format

**Decision**: `.claude/settings.json` supports a `hooks` key where each hook entry specifies an event, a list of commands, and whether it blocks. For the `speckit-auto` orchestrator, hooks are not needed at the settings.json level — the orchestrator handles stage transitions inline. However, `settings.json` is needed for permissions (allowed tools) for the sub-agents.

**Format** (permissions):
```json
{
  "permissions": {
    "allow": [
      "Bash(.specify/**)",
      "Write(specs/**)",
      "Write(.claude/**)"
    ]
  }
}
```

**Hooks format** (for any CI/automated triggers):
```json
{
  "hooks": {
    "PostToolUse": [
      {
        "matcher": "Write",
        "hooks": [{ "type": "command", "command": "echo 'file written'" }]
      }
    ]
  }
}
```

**Rationale**: FR-013 requires inline hook execution — the orchestrator skill explicitly calls git commit / token baseline steps as Agent tool invocations within the same turn, not as external hooks triggered by settings.json. This eliminates the re-invocation problem identified in the spec clarification.

**Alternatives considered**:
- settings.json `PostToolUse` hooks for auto-commit: This is the current Spec Kit pattern and is the root cause of the mid-flow stop problem. The orchestrator bypasses this by handling hooks as explicit Agent calls.

---

## R-003: Guard Script Design (Bash + Structured JSON Output)

**Decision**: Guard script (`guard.sh`) accepts two inputs: (1) feature description string via `--description` flag, (2) analysis file path via `--analysis` flag. It outputs a single JSON object to stdout and exits 0 for PASS, 1 for BLOCKED.

**Output contract**:
```json
{ "result": "PASS" }
{ "result": "BLOCKED", "reason": "safety_keyword", "matched": "auth" }
{ "result": "BLOCKED", "reason": "critical_issue", "line": "SEVERITY: CRITICAL — missing guard check" }
```

**Safety keyword list** (canonical, defined once in `speckit-guards/SKILL.md` and referenced by `guard.sh`):
```
auth authentication payment billing security migration
data_deletion destructive_operation drop_table truncate wipe purge
```

**Detection logic**:
1. Case-insensitive substring match of description against each keyword
2. Case-insensitive `grep -i "SEVERITY: CRITICAL"` on the analysis file (if provided)
3. First match wins; if multiple matches, report the first

**Rationale**: Simple grep-based detection is transparent, auditable, and requires no dependencies. JSON output enables the orchestrator to parse the result without string matching on human-readable text.

**Test flag**: `guard.sh --test` runs built-in test cases and exits 0 on all pass, 1 on any failure. This keeps the script self-contained and satisfies Principle VII without a separate test file.

---

## R-004: `pipeline-state.json` Schema Design

**Decision**: State file written after every stage transition. Fields: `feature_dir`, `mode`, `stage`, `status`, `blocked_reason`, `timestamp`, `stages_completed`.

**Schema**:
```json
{
  "feature_dir": "specs/008-speckit-auto-workflow",
  "mode": "gated | plan-only | auto-implement",
  "stage": "specify | clarify | checklist | plan | tasks | analyze | implement | review | done",
  "status": "running | paused | blocked | done",
  "blocked_reason": null,
  "timestamp": "2026-05-18T10:00:00Z",
  "stages_completed": ["specify", "clarify", "checklist", "plan", "tasks"]
}
```

**Rationale**: The `stages_completed` array allows the orchestrator to detect a resume scenario (e.g., `plan` is in the list → skip to the next stage). The `status: paused` value is used in `gated` mode waiting for approval.

**Alternatives considered**:
- Inferring state from artifact file existence: Simpler but ambiguous — a `plan.md` could be from a previous run. Explicit state file is unambiguous.

---

## R-005: Inline Hook Execution (FR-013 Implementation)

**Decision**: The `speckit-auto` orchestrator explicitly invokes hooks (git commit, token baseline) as Agent tool calls within the orchestrator's own turn, immediately after each stage completes. The orchestrator does NOT rely on settings.json hooks or Skill invocations that would require user re-invocation.

**Implementation pattern** (within orchestrator SKILL.md):
```
After each stage completion:
1. Invoke Agent(subagent_type: "speckit-git-commit") if git commit is configured
2. Invoke Agent(subagent_type: "speckit-token-analyzer-baseline") if token tracking is on
3. Write/update pipeline-state.json
4. Proceed to next stage or halt per mode/guard result
```

**Rationale**: The root cause of mid-flow stops in existing skills is that hook execution (`EXECUTE_COMMAND: speckit-git-commit`) creates a new turn that cannot automatically resume the parent skill. By making hook calls explicit Agent invocations within the orchestrator's own logic, the flow never leaves the orchestrator's control.

**Alternatives considered**:
- settings.json hooks: Existing mechanism; causes the re-invocation problem this feature is designed to solve.
- Skill invocations for hooks: `Skill()` calls are also user-turn-based and suffer the same issue.
