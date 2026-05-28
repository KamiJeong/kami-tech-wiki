# Conflict Matrix: make-wiki-what

**Epic**: make Wiki, What is Codex and how to use it with document('https://openai.com/codex') and make wiki for codex 101
**Created**: 2026-05-18

---

## Slice-Pair Conflicts

| Slice A | Slice B | Shared Resource | Resource Type | Resolvable Automatically? |
|---------|---------|----------------|---------------|--------------------------|
| codex-overview-slice | codex-101-slice | wiki/index.md | file | Yes |
| codex-overview-slice | codex-101-slice | wiki/log.md | file | Yes |
| codex-overview-slice | codex-101-slice | wiki/ko/codex/ | file | Yes |
| codex-overview-slice | codex-101-slice | wiki/en/codex/ | file | Yes |

---

## Unresolvable Conflicts

No conflicts detected between any slice pair.

All shared resources are resolvable automatically:

- **wiki/index.md**: Batch 1 adds the top-level Codex entry; Batch 2 adds sub-page links within that entry. Because Batch 2 runs after Batch 1 completes (sequential, dependency enforced), there is no concurrent modification.
- **wiki/log.md**: Append-only file. Both slices append new log lines without modifying existing content; no merge conflict expected.
- **wiki/ko/codex/** and **wiki/en/codex/**: Batch 1 creates the folder and overview page (`index.md`); Batch 2 creates tutorial sub-pages. Different files, no overlap.

---

## Notes

- Resource Type `contract` means a shared TypeScript interface, API schema, or data model definition
- Resource Type `config` means a shared configuration file (e.g., environment variables, build config)
- "Resolvable Automatically" means the slices modify different sections of the shared resource with no expected merge conflicts
