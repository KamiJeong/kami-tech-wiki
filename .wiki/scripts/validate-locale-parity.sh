#!/usr/bin/env bash
# Warns when an article in wiki/ko has no counterpart in wiki/en or wiki/ja.
# Usage: validate-locale-parity.sh <wiki-root>
# Always exits 0 (warnings only, not CI failures).

set -euo pipefail

WIKI_ROOT="${1:?Usage: $0 <wiki-root>}"
KO="$WIKI_ROOT/ko"
EN="$WIKI_ROOT/en"
JA="$WIKI_ROOT/ja"
WARNINGS=0

while IFS= read -r -d '' ko_file; do
  rel="${ko_file#$KO/}"

  # Skip SUMMARY.md, README.md, .gitkeep
  case "$rel" in
    SUMMARY.md|README.md|*/README.md|.gitbook.yaml) continue ;;
  esac
  [[ "$rel" == *.gitkeep ]] && continue

  for peer_dir in "$EN" "$JA"; do
    peer_locale="$(basename "$peer_dir")"
    if [ ! -f "$peer_dir/$rel" ]; then
      echo "WARNING: wiki/ko/$rel has no counterpart in wiki/$peer_locale/$rel"
      WARNINGS=$((WARNINGS + 1))
    fi
  done
done < <(find "$KO" -name "*.md" -not -name ".gitkeep" -print0 | sort -z)

if [ "$WARNINGS" -gt 0 ]; then
  echo "WARN: $WARNINGS article(s) missing locale counterparts"
else
  echo "OK: all articles have counterparts in en and ja"
fi

exit 0
