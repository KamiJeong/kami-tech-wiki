#!/usr/bin/env bash
# Checks every link in SUMMARY.md resolves to an existing file.
# Usage: validate-summary-links.sh <locale-path>
# Exit 1 if any link is broken.

set -euo pipefail

LOCALE_DIR="${1:?Usage: $0 <locale-path>}"
SUMMARY="$LOCALE_DIR/SUMMARY.md"
ERRORS=0

if [ ! -f "$SUMMARY" ]; then
  echo "ERROR: $SUMMARY not found" >&2
  exit 1
fi

while IFS= read -r link; do
  target="$LOCALE_DIR/$link"
  if [ ! -f "$target" ]; then
    echo "BROKEN LINK: ($link) -> $target does not exist"
    ERRORS=$((ERRORS + 1))
  fi
done < <(grep -oE '\([^)]+\.md\)' "$SUMMARY" | tr -d '()')

if [ "$ERRORS" -gt 0 ]; then
  echo "FAIL: $ERRORS broken link(s) in $SUMMARY" >&2
  exit 1
fi

echo "OK: all links valid in $(basename "$LOCALE_DIR")/SUMMARY.md"
