# Conflict Matrix: [EPIC-SLUG]

**Epic**: [Epic description]
**Created**: [DATE]

---

## Slice-Pair Conflicts

| Slice A | Slice B | Shared Resource | Resource Type | Resolvable Automatically? |
|---------|---------|----------------|---------------|--------------------------|
| [slice-id-a] | [slice-id-b] | [file or contract name] | file \| contract \| data-model \| config \| schema | Yes \| No |

*If no conflicts: "No conflicts detected between any slice pair."*

---

## Unresolvable Conflicts

List any conflicts marked "No" above with additional context:

- **[Slice A] ↔ [Slice B]**: [Explanation of why the conflict cannot be resolved automatically and what user decision is needed]

*If empty: all conflicts are resolvable automatically or no conflicts exist.*

---

## Notes

- Resource Type `contract` means a shared TypeScript interface, API schema, or data model definition
- Resource Type `config` means a shared configuration file (e.g., environment variables, build config)
- "Resolvable Automatically" means the slices modify different sections of the shared resource with no expected merge conflicts
