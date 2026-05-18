---
name: "speckit-guards"
description: "Evaluate safety conditions before auto-implementation. Run guard.sh to detect safety keywords and CRITICAL analyze issues."
argument-hint: "Optional: --description '<text>' --spec <path> --analysis <path>"
compatibility: "Requires .claude/skills/speckit-guards/scripts/guard.sh"
metadata:
  author: "speckit-auto-workflow"
  source: "specs/008-speckit-auto-workflow"
user-invocable: true
disable-model-invocation: false
---

## Purpose

Evaluate whether a feature description and analysis output are safe for automatic implementation.
Returns PASS or BLOCKED with a structured reason.

## Safety Keyword List (Canonical — Single Source of Truth)

The following keywords, when found in a feature description or spec body, block `auto-implement` mode.
This list is the Single Source of Truth (Principle II). `guard.sh` uses this same list.

```
auth
authentication
payment
billing
security
migration
data deletion
destructive operation
drop table
truncate
wipe
purge
```

**Matching rules**: case-insensitive substring match against `--description` string and `--spec` file body.

## CRITICAL Issue Detection

A CRITICAL issue is any line in the analysis file (`analysis.md`) matching the pattern (case-insensitive):

```
SEVERITY: CRITICAL
```

The `speckit-analyzer` sub-agent is responsible for emitting this sentinel when it finds a critical flaw.

## Usage

Run the guard script directly:

```bash
bash .claude/skills/speckit-guards/scripts/guard.sh \
  --description "<feature description>" \
  --spec specs/<NNN>-<name>/spec.md \
  --analysis specs/<NNN>-<name>/analysis.md
```

Run self-tests:

```bash
bash .claude/skills/speckit-guards/scripts/guard.sh --test
```

## Output Contract

Single JSON line to stdout:

- PASS: `{"result":"PASS"}`
- BLOCKED (keyword): `{"result":"BLOCKED","reason":"safety_keyword","matched":"<keyword>"}`
- BLOCKED (critical): `{"result":"BLOCKED","reason":"critical_issue","line":"<matching line>"}`

Exit codes: `0` = PASS, `1` = BLOCKED, `2` = script error.

## When to Run

The `speckit-auto` orchestrator calls this automatically before invoking `speckit-implementer`.
It can also be invoked directly via `/speckit-guards` for manual inspection.
