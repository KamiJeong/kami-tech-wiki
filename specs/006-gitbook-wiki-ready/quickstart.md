# Quickstart: Adding a New Wiki Article

This guide explains how to add a new article and keep GitBook in sync.

## Adding an Article to an Existing Category

1. **Create the file** in all three locales:
   ```
   wiki/ko/{category}/NNN-{slug}.md
   wiki/en/{category}/NNN-{slug}.md
   wiki/ja/{category}/NNN-{slug}.md
   ```
   Use the next available numeric prefix (`NNN`) in sequence.

2. **Add the entry to each locale's SUMMARY.md** in the correct category section, preserving numeric order:
   ```markdown
   * [{Human-Readable Label}]({category}/NNN-{slug}.md)
   ```

3. **Open a PR** — CI will verify:
   - All three locale files exist (locale-parity check)
   - All three SUMMARY.md files include the new entry (coverage check)
   - All SUMMARY.md links resolve to real files (link check)

## Adding a New Category

1. **Create the category folder** in all three locales:
   ```
   wiki/ko/{new-category}/
   wiki/en/{new-category}/
   wiki/ja/{new-category}/
   ```

2. **Add a category README** (optional but recommended):
   ```
   wiki/ko/{new-category}/README.md
   wiki/en/{new-category}/README.md
   wiki/ja/{new-category}/README.md
   ```

3. **Add the category section to each SUMMARY.md**:
   ```markdown
   ## {New Category Name}

   * [{New Category Name} Overview]({new-category}/README.md)
   ```

4. **Add articles** following the steps above.

## Running Validation Locally

```bash
bash .wiki/scripts/validate-wiki.sh
```

This runs all four checks (coverage, links, category READMEs, locale parity) and prints a summary.

## GitBook Sync

No manual action is needed. Once the PR is merged to `main`, GitBook Git Sync automatically picks up the changes from each locale directory and updates the corresponding Space.

GitHub is the source of truth — do not edit wiki content directly in GitBook.
