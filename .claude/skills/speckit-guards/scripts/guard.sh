#!/usr/bin/env bash
# guard.sh — Spec Kit safety guard
# Outputs single JSON line; exits 0=PASS, 1=BLOCKED, 2=error
#
# Usage:
#   guard.sh [--description "<text>"] [--spec <path>] [--analysis <path>]
#   guard.sh --test

set -euo pipefail

# ---------------------------------------------------------------------------
# Safety keywords (canonical list — keep in sync with speckit-guards/SKILL.md)
# ---------------------------------------------------------------------------
SAFETY_KEYWORDS=(
  "auth"
  "authentication"
  "payment"
  "billing"
  "security"
  "migration"
  "data deletion"
  "destructive operation"
  "drop table"
  "truncate"
  "wipe"
  "purge"
)

# ---------------------------------------------------------------------------
# Helpers
# ---------------------------------------------------------------------------
pass()    { echo '{"result":"PASS"}'; exit 0; }
blocked_keyword() { echo "{\"result\":\"BLOCKED\",\"reason\":\"safety_keyword\",\"matched\":\"$1\"}"; exit 1; }
blocked_critical() {
  local line
  line=$(echo "$1" | sed 's/"/\\"/g')
  echo "{\"result\":\"BLOCKED\",\"reason\":\"critical_issue\",\"line\":\"$line\"}"
  exit 1
}
error() { echo "{\"error\":\"$1\"}" >&2; exit 2; }

# ---------------------------------------------------------------------------
# Self-test suite
# ---------------------------------------------------------------------------
run_tests() {
  local pass=0 fail=0

  _assert() {
    local label="$1" expected="$2" actual="$3"
    if [ "$actual" = "$expected" ]; then
      echo "  PASS: $label"
      ((pass++)) || true
    else
      echo "  FAIL: $label (expected '$expected', got '$actual')"
      ((fail++)) || true
    fi
  }

  local script
  script="$(cd "$(dirname "$0")" && pwd)/guard.sh"

  echo "Running guard.sh self-tests..."

  # 1. Clean description → PASS
  result=$(bash "$script" --description "add a hello world page" 2>/dev/null || true)
  _assert "clean description → PASS" '{"result":"PASS"}' "$result"

  # 2–13. Each safety keyword triggers BLOCKED
  # Note: some keywords are substrings of others (e.g. "auth" ⊂ "authentication"),
  # so we only assert result=BLOCKED, not the exact matched keyword.
  for kw in "auth" "authentication" "payment" "billing" "security" "migration" \
            "data deletion" "destructive operation" "drop table" "truncate" "wipe" "purge"; do
    result=$(bash "$script" --description "feature involves $kw handling" 2>/dev/null || true)
    result_val=$(echo "$result" | grep -o '"result":"[^"]*"' | cut -d'"' -f4 || true)
    _assert "keyword '$kw' → BLOCKED" "BLOCKED" "$result_val"
  done

  # 14. Case-insensitive match (AUTH uppercase)
  result=$(bash "$script" --description "AUTH system required" 2>/dev/null || true)
  matched=$(echo "$result" | grep -o '"matched":"[^"]*"' | cut -d'"' -f4 || true)
  _assert "uppercase AUTH match" "auth" "$matched"

  # 15. Mixed case (Security)
  result=$(bash "$script" --description "Security hardening needed" 2>/dev/null || true)
  matched=$(echo "$result" | grep -o '"matched":"[^"]*"' | cut -d'"' -f4 || true)
  _assert "mixed-case Security match" "security" "$matched"

  # 16. CRITICAL detection via analysis file
  tmp_analysis=$(mktemp)
  echo "SEVERITY: CRITICAL — missing guard on delete path" > "$tmp_analysis"
  result=$(bash "$script" --description "safe feature" --analysis "$tmp_analysis" 2>/dev/null || true)
  reason=$(echo "$result" | grep -o '"reason":"[^"]*"' | cut -d'"' -f4 || true)
  _assert "CRITICAL in analysis → BLOCKED critical_issue" "critical_issue" "$reason"
  rm -f "$tmp_analysis"

  # 17. Analysis without CRITICAL → PASS
  tmp_analysis=$(mktemp)
  echo "SEVERITY: WARNING — minor issue" > "$tmp_analysis"
  result=$(bash "$script" --description "safe feature" --analysis "$tmp_analysis" 2>/dev/null || true)
  _assert "analysis without CRITICAL → PASS" '{"result":"PASS"}' "$result"
  rm -f "$tmp_analysis"

  # 18. Keyword in spec file body
  tmp_spec=$(mktemp)
  echo "This feature handles payment processing" > "$tmp_spec"
  result=$(bash "$script" --description "safe description" --spec "$tmp_spec" 2>/dev/null || true)
  matched=$(echo "$result" | grep -o '"matched":"[^"]*"' | cut -d'"' -f4 || true)
  _assert "keyword in --spec body" "payment" "$matched"
  rm -f "$tmp_spec"

  echo ""
  echo "Results: $pass passed, $fail failed"
  [ "$fail" -eq 0 ] && exit 0 || exit 1
}

# ---------------------------------------------------------------------------
# Argument parsing
# ---------------------------------------------------------------------------
DESCRIPTION=""
SPEC_FILE=""
ANALYSIS_FILE=""

while [[ $# -gt 0 ]]; do
  case "$1" in
    --test)        run_tests ;;
    --description) DESCRIPTION="$2"; shift 2 ;;
    --spec)        SPEC_FILE="$2"; shift 2 ;;
    --analysis)    ANALYSIS_FILE="$2"; shift 2 ;;
    *)             error "Unknown argument: $1" ;;
  esac
done

# ---------------------------------------------------------------------------
# Build combined text to scan for keywords
# ---------------------------------------------------------------------------
SCAN_TEXT="$DESCRIPTION"

if [[ -n "$SPEC_FILE" ]]; then
  [[ -f "$SPEC_FILE" ]] || error "Spec file not found: $SPEC_FILE"
  SCAN_TEXT="$SCAN_TEXT
$(cat "$SPEC_FILE")"
fi

# ---------------------------------------------------------------------------
# Safety keyword check
# ---------------------------------------------------------------------------
for kw in "${SAFETY_KEYWORDS[@]}"; do
  if echo "$SCAN_TEXT" | grep -qi "$kw"; then
    blocked_keyword "$kw"
  fi
done

# ---------------------------------------------------------------------------
# CRITICAL issue check
# ---------------------------------------------------------------------------
if [[ -n "$ANALYSIS_FILE" ]]; then
  [[ -f "$ANALYSIS_FILE" ]] || error "Analysis file not found: $ANALYSIS_FILE"
  critical_line=$(grep -im1 "SEVERITY: CRITICAL" "$ANALYSIS_FILE" || true)
  if [[ -n "$critical_line" ]]; then
    blocked_critical "$critical_line"
  fi
fi

pass
