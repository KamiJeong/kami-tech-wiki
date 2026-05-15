# Contract: .gitbook.yaml

Every locale root directory MUST contain exactly this file with exactly this content.

## File Path

- `wiki/ko/.gitbook.yaml`
- `wiki/en/.gitbook.yaml`
- `wiki/ja/.gitbook.yaml`

## Required Content

```yaml
root: ./

structure:
  readme: README.md
  summary: SUMMARY.md
```

## Rules

- `root: ./` — tells GitBook the project root is this directory, not the repository root.
- `structure.readme: README.md` — the GitBook Space home page.
- `structure.summary: SUMMARY.md` — the GitBook sidebar navigation source.
- No other keys are required or permitted for the initial setup.
- This file MUST NOT be modified by GitBook Git Sync (GitHub is source of truth).
