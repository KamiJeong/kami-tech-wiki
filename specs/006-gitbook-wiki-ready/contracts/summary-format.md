# Contract: SUMMARY.md Format

Every locale root MUST contain a `SUMMARY.md` following this exact format.

## Structure

```markdown
# Summary

* [Introduction](README.md)

## {CategoryName}

* [{CategoryName} Overview]({category}/README.md)
* [{Article Label}]({category}/{filename}.md)
* [{Article Label}]({category}/{filename}.md)

## {NextCategoryName}

* [{Article Label}]({category}/{filename}.md)
```

## Rules

1. **First line**: `# Summary` (H1, exact text)
2. **Root link**: `* [Introduction](README.md)` — always first entry
3. **Category section headers**: `## {CategoryName}` — H2, title-cased folder name
4. **Category overview** (when `{category}/README.md` exists): listed as first item under section
5. **Article items**: `* [Label](relative/path.md)` — relative path from locale root
6. **Label**: Human-readable; strip `NNN-` prefix, replace `-` with space, title-case
7. **Order**: Articles sorted by numeric prefix ascending; non-prefixed articles sort after prefixed ones alphabetically
8. **Empty categories**: Folders with zero `.md` files (`.gitkeep` only) MUST NOT appear in `SUMMARY.md`
9. **Blank lines**: One blank line between the root link and the first section; one blank line between sections

## Example (Korean locale, current wiki state)

```markdown
# Summary

* [Introduction](README.md)

## Claude

* [Overview](claude/overview.md)

## OpenUI

* [OpenUI Overview](openui/README.md)
* [Introduction](openui/introduction.md)
* [Overview](openui/overview.md)
* [Architecture](openui/architecture.md)
* [Quickstart](openui/quickstart.md)
* [Chat Introduction](openui/chat-introduction.md)
* [Chat GenUI](openui/chat-genui.md)
* [Benchmarks](openui/benchmarks.md)
* [Example Vercel AI Chat](openui/example-vercel-ai-chat.md)
* [System Prompts](openui/system-prompts.md)
* [API Reference Overview](openui/api-reference-overview.md)
* [API Reference React UI](openui/api-reference-react-ui.md)
* [Specification V05](openui/specification-v05.md)
```

## Validation

`validate-summary-coverage.sh` verifies:
- Every `.md` file (excluding `README.md` at locale root, `SUMMARY.md` itself, and `.gitkeep`-only folders) appears in `SUMMARY.md`
- Every path in `SUMMARY.md` resolves to an existing file on disk
