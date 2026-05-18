# Contract: guard.sh stdout

**Feature**: 008-speckit-auto-workflow | **Version**: 1.0.0

## Command Signature

```bash
bash .claude/skills/speckit-guards/scripts/guard.sh \
  [--description "<feature description>"] \
  [--analysis <path-to-analysis.md>] \
  [--spec <path-to-spec.md>] \
  [--test]
```

**Flags**:
- `--description` — feature description string to scan for safety keywords
- `--analysis` — path to `analysis.md`; scanned for `SEVERITY: CRITICAL` lines
- `--spec` — path to `spec.md`; body also scanned for safety keywords
- `--test` — run built-in self-tests and exit; no other flags needed

## Output (stdout — single JSON line)

### PASS

```json
{ "result": "PASS" }
```

### BLOCKED — safety keyword

```json
{ "result": "BLOCKED", "reason": "safety_keyword", "matched": "auth" }
```

### BLOCKED — CRITICAL issue

```json
{ "result": "BLOCKED", "reason": "critical_issue", "line": "SEVERITY: CRITICAL — missing guard on delete path" }
```

## Exit Codes

| Code | Meaning |
|------|---------|
| 0 | PASS |
| 1 | BLOCKED |
| 2 | Script error (bad arguments, file not found) |

## Safety Keyword List

Defined canonically in `.claude/skills/speckit-guards/SKILL.md`. Current list:
`auth`, `authentication`, `payment`, `billing`, `security`, `migration`,
`data deletion`, `destructive operation`, `drop table`, `truncate`, `wipe`, `purge`

Matching is **case-insensitive substring** against:
1. The `--description` string
2. The body of the `--spec` file (if provided)

## CRITICAL Detection

Scans `--analysis` file for lines matching (case-insensitive):
```
SEVERITY: CRITICAL
```

First matching line is returned in the `line` field of the BLOCKED result.

## Orchestrator Usage

```bash
result=$(bash .claude/skills/speckit-guards/scripts/guard.sh \
  --description "$FEATURE_DESCRIPTION" \
  --spec "$FEATURE_DIR/spec.md" \
  --analysis "$FEATURE_DIR/analysis.md")
if [ "$(echo "$result" | jq -r '.result')" = "BLOCKED" ]; then
  # halt pipeline
fi
```
