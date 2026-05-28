#!/usr/bin/env bash
# guard-before-pr.sh — Pre-PR safety guard for multi-slice orchestration
#
# Checks: commit_sha present, branch push, gh CLI availability and auth
#
# Usage:
#   guard-before-pr.sh --slice-id <id> --epic-slug <slug> --base-branch <branch>
#
# Output: single JSON line to stdout
#   {"result":"PASS|FAIL","reason":"...","branch_pushed":true|false}

set -euo pipefail

SLICE_ID=""
EPIC_SLUG=""
BASE_BRANCH=""

while [[ $# -gt 0 ]]; do
    case "$1" in
        --slice-id)    SLICE_ID="$2";    shift 2 ;;
        --epic-slug)   EPIC_SLUG="$2";   shift 2 ;;
        --base-branch) BASE_BRANCH="$2"; shift 2 ;;
        *) echo "Unknown argument: $1" >&2; exit 2 ;;
    esac
done

if [[ -z "$SLICE_ID" || -z "$EPIC_SLUG" ]]; then
    printf '{"result":"FAIL","reason":"Missing required arguments: --slice-id, --epic-slug","branch_pushed":false}\n'
    exit 1
fi

EPIC_DIR=".specify/intake/${EPIC_SLUG}"
SLICE_STATE_FILE="${EPIC_DIR}/slice-state.json"

# ---------------------------------------------------------------------------
# Check 1: commit_sha must be present in slice-state.json
# ---------------------------------------------------------------------------
if [[ ! -f "$SLICE_STATE_FILE" ]]; then
    printf '{"result":"FAIL","reason":"slice-state.json not found at %s","branch_pushed":false}\n' "$SLICE_STATE_FILE"
    exit 1
fi

if command -v jq >/dev/null 2>&1; then
    COMMIT_SHA="$(jq -r --arg id "$SLICE_ID" '.slices[$id].commit_sha // empty' "$SLICE_STATE_FILE" 2>/dev/null || true)"
else
    COMMIT_SHA="$(grep -o '"commit_sha":[^,}]*' "$SLICE_STATE_FILE" | grep -v 'null' | head -1 || true)"
fi

if [[ -z "$COMMIT_SHA" ]]; then
    printf '{"result":"FAIL","reason":"commit_sha is null or missing for slice %s — run speckit-committer first","branch_pushed":false}\n' "$SLICE_ID"
    exit 1
fi

# ---------------------------------------------------------------------------
# Check 2: Push branch to remote (FR-014)
# ---------------------------------------------------------------------------
CURRENT_BRANCH="$(git rev-parse --abbrev-ref HEAD 2>/dev/null || echo "unknown")"

if git push -u origin "$CURRENT_BRANCH" 2>/tmp/push_error; then
    BRANCH_PUSHED=true
else
    PUSH_ERROR="$(cat /tmp/push_error || echo "unknown push error")"
    printf '{"result":"FAIL","reason":"git push failed: %s","branch_pushed":false}\n' \
        "$(echo "$PUSH_ERROR" | tr '"' "'" | tr '\n' ' ')"
    exit 1
fi

# ---------------------------------------------------------------------------
# Check 3: gh CLI availability (graceful degradation)
# ---------------------------------------------------------------------------
if ! command -v gh >/dev/null 2>&1; then
    printf '{"result":"FAIL","reason":"GitHub CLI (gh) not found — PR creation skipped. Commits are preserved on branch %s","branch_pushed":%s}\n' \
        "$CURRENT_BRANCH" "$BRANCH_PUSHED"
    exit 1
fi

# ---------------------------------------------------------------------------
# Check 4: gh authentication
# ---------------------------------------------------------------------------
if ! gh auth status >/dev/null 2>&1; then
    printf '{"result":"FAIL","reason":"GitHub CLI is not authenticated (run: gh auth login) — PR creation skipped. Commits are preserved on branch %s","branch_pushed":%s}\n' \
        "$CURRENT_BRANCH" "$BRANCH_PUSHED"
    exit 1
fi

printf '{"result":"PASS","reason":"All checks passed","branch_pushed":%s}\n' "$BRANCH_PUSHED"
