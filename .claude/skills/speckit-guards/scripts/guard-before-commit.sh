#!/usr/bin/env bash
# guard-before-commit.sh — Pre-commit safety guard for multi-slice orchestration
#
# Checks: protected branch, test suite, selective staging against dirty-files baseline
#
# Usage:
#   guard-before-commit.sh --slice-id <id> --epic-slug <slug> --feature-dir <dir>
#
# Output: single JSON line to stdout
#   {"result":"PASS|FAIL","reason":"...","test_results_path":"..."}

set -euo pipefail

SLICE_ID=""
EPIC_SLUG=""
FEATURE_DIR=""

while [[ $# -gt 0 ]]; do
    case "$1" in
        --slice-id)   SLICE_ID="$2";   shift 2 ;;
        --epic-slug)  EPIC_SLUG="$2";  shift 2 ;;
        --feature-dir) FEATURE_DIR="$2"; shift 2 ;;
        *) echo "Unknown argument: $1" >&2; exit 2 ;;
    esac
done

if [[ -z "$SLICE_ID" || -z "$EPIC_SLUG" || -z "$FEATURE_DIR" ]]; then
    printf '{"result":"FAIL","reason":"Missing required arguments: --slice-id, --epic-slug, --feature-dir","test_results_path":null}\n'
    exit 1
fi

EPIC_DIR=".specify/intake/${EPIC_SLUG}"
TEST_RESULTS_DIR="${EPIC_DIR}/${SLICE_ID}"
TEST_RESULTS_PATH="${TEST_RESULTS_DIR}/test-results.txt"
SLICE_STATE_FILE="${EPIC_DIR}/slice-state.json"

# ---------------------------------------------------------------------------
# Check 1: Protected branch guard (FR-014)
# ---------------------------------------------------------------------------
CURRENT_BRANCH="$(git rev-parse --abbrev-ref HEAD 2>/dev/null || echo "unknown")"
if [[ "$CURRENT_BRANCH" == "main" || "$CURRENT_BRANCH" == "master" || "$CURRENT_BRANCH" == "develop" ]]; then
    printf '{"result":"FAIL","reason":"Cannot commit on protected branch: %s","test_results_path":null}\n' "$CURRENT_BRANCH"
    exit 1
fi

# ---------------------------------------------------------------------------
# Check 2: Run test suite (FR-012)
# ---------------------------------------------------------------------------
mkdir -p "$TEST_RESULTS_DIR"

TEST_CMD=""
if command -v bun >/dev/null 2>&1 && [[ -f "package.json" ]]; then
    TEST_CMD="bun test"
elif command -v npm >/dev/null 2>&1 && [[ -f "package.json" ]]; then
    TEST_CMD="npm test"
elif command -v pytest >/dev/null 2>&1; then
    TEST_CMD="pytest"
fi

if [[ -z "$TEST_CMD" ]]; then
    echo "[guard-before-commit] No test runner found — skipping test execution" >&2
    echo "No test runner found. Skipping." > "$TEST_RESULTS_PATH"
else
    echo "[guard-before-commit] Running: $TEST_CMD" >&2
    if ! $TEST_CMD > "$TEST_RESULTS_PATH" 2>&1; then
        printf '{"result":"FAIL","reason":"Tests failed — see %s","test_results_path":"%s"}\n' \
            "$TEST_RESULTS_PATH" "$TEST_RESULTS_PATH"
        exit 1
    fi
fi

# ---------------------------------------------------------------------------
# Check 3: Selective staging — exclude pre-existing dirty files (FR-013)
# ---------------------------------------------------------------------------
if [[ -f "$SLICE_STATE_FILE" ]] && command -v jq >/dev/null 2>&1; then
    mapfile -t BASELINE_FILES < <(jq -r '.dirty_files_baseline[]? // empty' "$SLICE_STATE_FILE" 2>/dev/null || true)

    if [[ ${#BASELINE_FILES[@]} -gt 0 ]]; then
        CURRENT_DIRTY="$(git status --porcelain 2>/dev/null | awk '{print $2}' || true)"
        for f in "${BASELINE_FILES[@]}"; do
            if echo "$CURRENT_DIRTY" | grep -qF "$f"; then
                echo "[guard-before-commit] WARNING: Excluding pre-existing dirty file from staging: $f" >&2
                git restore --staged -- "$f" 2>/dev/null || true
            fi
        done
    fi
else
    echo "[guard-before-commit] No baseline or jq unavailable — skipping selective staging check" >&2
fi

printf '{"result":"PASS","reason":"All checks passed","test_results_path":"%s"}\n' "$TEST_RESULTS_PATH"
