#!/usr/bin/env bash
# Main wiki validation runner. Runs all checks for all three locales.
# Usage: validate-wiki.sh [wiki-root]
# Exit 1 if any hard check fails.

set -uo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
WIKI_ROOT="${1:-$(cd "$SCRIPT_DIR/../.." && pwd)/wiki}"

LOCALES=("ko" "en" "ja")
HARD_FAILURES=0
WARNINGS=0

echo "=== Wiki Validation: $WIKI_ROOT ==="
echo ""

for locale in "${LOCALES[@]}"; do
  locale_path="$WIKI_ROOT/$locale"
  echo "--- Locale: $locale ---"

  # Coverage check (hard failure)
  if ! bash "$SCRIPT_DIR/validate-summary-coverage.sh" "$locale_path"; then
    HARD_FAILURES=$((HARD_FAILURES + 1))
  fi

  # Link check (hard failure)
  if ! bash "$SCRIPT_DIR/validate-summary-links.sh" "$locale_path"; then
    HARD_FAILURES=$((HARD_FAILURES + 1))
  fi

  # Category README check (warning only)
  bash "$SCRIPT_DIR/validate-category-readmes.sh" "$locale_path" || true

  echo ""
done

# Locale parity check (warning only)
echo "--- Locale Parity ---"
bash "$SCRIPT_DIR/validate-locale-parity.sh" "$WIKI_ROOT" || true
echo ""

echo "=== Summary ==="
if [ "$HARD_FAILURES" -gt 0 ]; then
  echo "FAIL: $HARD_FAILURES hard check(s) failed. See errors above." >&2
  exit 1
fi

echo "PASS: all hard checks passed."
