# Conflict Matrix: gitbook-documentation-tech-bridge

**Epic**: Create the initial GitBook documentation structure for Tech Bridge Book (multilingual ko/en/ja, information architecture, folder structure, and template files only).
**Created**: 2026-05-18

---

## Slice-Pair Conflicts

| Slice A | Slice B | Shared Resource | Resource Type | Resolvable Automatically? |
|---------|---------|----------------|---------------|--------------------------|
| core-pages | template-files | SUMMARY.md | file | Yes |
| core-pages | safety-privacy-guide | SUMMARY.md | file | Yes |
| core-pages | chapter-structure | SUMMARY.md | file | Yes |
| template-files | safety-privacy-guide | SUMMARY.md | file | Yes |
| template-files | chapter-structure | SUMMARY.md | file | Yes |
| safety-privacy-guide | chapter-structure | SUMMARY.md | file | Yes |

---

## Unresolvable Conflicts

No conflicts detected between any slice pair.

All six SUMMARY.md conflicts are resolvable automatically: each slice appends entries to a distinct section of the file (core pages section, templates appendix section, safety guide section, and chapter sections respectively) with no overlapping line ranges expected.

---

## Notes

- Resource Type `contract` means a shared TypeScript interface, API schema, or data model definition
- Resource Type `config` means a shared configuration file (e.g., environment variables, build config)
- "Resolvable Automatically" means the slices modify different sections of the shared resource with no expected merge conflicts
- SUMMARY.md is GitBook's table of contents file; each slice writes to its own dedicated section within the file
