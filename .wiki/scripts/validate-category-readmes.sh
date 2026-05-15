#!/usr/bin/env bash
# Warns when a category folder with articles has no README.md.
# Usage: validate-category-readmes.sh <locale-path>
# Always exits 0 (warnings only, not CI failures).

set -euo pipefail

LOCALE_DIR="${1:?Usage: $0 <locale-path>}"
WARNINGS=0

while IFS= read -r -d '' dir; do
  # Count real .md articles (not README.md)
  article_count=$(find "$dir" -maxdepth 1 -name "*.md" ! -name "README.md" | wc -l)
  [ "$article_count" -eq 0 ] && continue

  if [ ! -f "$dir/README.md" ]; then
    echo "WARNING: $(basename "$dir")/ has $article_count article(s) but no README.md"
    WARNINGS=$((WARNINGS + 1))
  fi
done < <(find "$LOCALE_DIR" -mindepth 1 -maxdepth 1 -type d -print0 | sort -z)

if [ "$WARNINGS" -gt 0 ]; then
  echo "WARN: $WARNINGS category folder(s) missing README.md in $(basename "$LOCALE_DIR")"
else
  echo "OK: all category folders have README.md in $(basename "$LOCALE_DIR")"
fi

exit 0
