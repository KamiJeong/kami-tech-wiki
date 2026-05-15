#!/usr/bin/env bash
# Checks every .md article in a locale is listed in SUMMARY.md.
# Usage: validate-summary-coverage.sh <locale-path>
# Exit 1 if any article is missing from SUMMARY.md.

set -euo pipefail

LOCALE_DIR="${1:?Usage: $0 <locale-path>}"
SUMMARY="$LOCALE_DIR/SUMMARY.md"
ERRORS=0

if [ ! -f "$SUMMARY" ]; then
  echo "ERROR: $SUMMARY not found" >&2
  exit 1
fi

while IFS= read -r -d '' md_file; do
  rel="${md_file#$LOCALE_DIR/}"

  # Skip SUMMARY.md, locale root README.md, and category README.md files
  case "$rel" in
    SUMMARY.md|README.md|*/README.md) continue ;;
  esac

  # Skip folders that contain only .gitkeep
  dir="$(dirname "$md_file")"
  real_articles=$(find "$dir" -maxdepth 1 -name "*.md" ! -name "README.md" | wc -l)
  if [ "$real_articles" -eq 0 ]; then
    continue
  fi

  if ! grep -qF "($rel)" "$SUMMARY"; then
    echo "MISSING FROM SUMMARY.md: $rel"
    ERRORS=$((ERRORS + 1))
  fi
done < <(find "$LOCALE_DIR" -name "*.md" -not -name ".gitkeep" -print0 | sort -z)

if [ "$ERRORS" -gt 0 ]; then
  echo "FAIL: $ERRORS article(s) missing from $SUMMARY" >&2
  exit 1
fi

echo "OK: all articles covered in $(basename "$LOCALE_DIR")/SUMMARY.md"
