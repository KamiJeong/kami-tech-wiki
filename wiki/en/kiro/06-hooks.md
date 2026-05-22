---
title: "Kiro Hooks Guide"
aliases: ["Kiro hooks", "Kiro automated actions", "Kiro file event triggers"]
tags: [kiro, tool, concept, beginner, hooks]
category: concept
tool: "Kiro"
language: en
date_created: 2026-05-19
date_modified: 2026-05-19
source_count: 2
related: ["Kiro Core Concepts: Workflow", "Kiro Steering Guide", "Kiro Best Practices"]
status: draft
review_cycle: fast-changing
freshness_date: 2026-05-19
---

# Kiro Hooks Guide

> Kiro hooks are automated AI actions triggered by file system events — they let the AI update related files automatically when something changes, reducing manual maintenance work.

## Who this page is for

This page is for developers who want to understand how to set up automated AI workflows in Kiro. Some familiarity with file systems and the idea of "triggers" (similar to how email filters work) is helpful.

## Why this matters

Software projects have a consistency maintenance problem. When one file changes, related files often need to change too. A developer updates an API endpoint — the tests should be updated. A developer adds a new component — the documentation should be updated. A developer changes a data model — the migration scripts should be updated.

Without automation, these updates depend on developer discipline. With developer discipline under time pressure, they frequently get missed. Tests drift out of sync with the code they are testing. Documentation describes features that no longer work the way described. The result is a codebase where trust in the tests and documentation erodes over time.

Kiro hooks automate this maintenance. By defining which AI action should run when a file matching a pattern changes, a team can keep related files in sync without manual effort.

## Plain-language explanation

A hook is a configuration file stored in `.kiro/hooks/`. It defines:
- **When**: Which file event triggers this hook (on save, on create, on delete, matching a file pattern)
- **What**: Which AI action to run when the event occurs

When a developer saves a file that matches the hook's pattern, Kiro's AI runs the defined action automatically. The developer reviews the AI's output before it is committed — the hook fires the action, but the developer still approves the result.

Hooks are defined in YAML or similar configuration format and stored in `.kiro/hooks/`. Like steering files, they are committed to git and shared across the team.

## Key concepts

### File event triggers

Hooks are triggered by file system events — specifically, changes to files that match a specified pattern. Common trigger events include on-save (a file is saved), on-create (a new file is created), and on-delete (a file is deleted).

**Why it matters**: Basing hooks on file events means they run in response to actual developer activity. The hook fires when relevant work is happening, not on a scheduled timer or when manually invoked.

**Example**: A hook configured to trigger on `api/**/*.ts` (any TypeScript file inside the `api/` directory) will fire whenever a developer saves a change to any API file.

### Scoped AI actions

Each hook defines a specific, bounded AI action — not an open-ended instruction. A well-written hook action is narrow: "update the tests for this file" rather than "fix any problems you find."

**Why it matters**: Scoped actions are predictable and reviewable. If a hook updates one specific test file in response to an API change, the developer knows exactly what to review. An open-ended hook action produces unpredictable output that is harder to evaluate and trust.

**Example action in a hook**: "Read the updated API file and the corresponding test file. Update the test file to reflect any new or changed API methods. Do not modify any tests that are not directly affected by the API change."

### Risks of poorly defined hooks

Hooks that are too broad, too loosely triggered, or that modify many files can create confusion. A hook that fires on every file save and touches dozens of files is noisy and hard to review.

**Why it matters**: The goal of a hook is to reduce maintenance burden, not to create a new review burden. Poorly designed hooks can produce AI changes that are harder to review than the manual updates they replaced.

**Example risk**: A hook that triggers on every file save and attempts to update all documentation simultaneously will fire constantly and produce large, hard-to-review diffs.

## Example or analogy

> Think of how a building's HVAC system works. The thermostat detects a temperature event (the room gets too cold) and triggers an automated response (the heater turns on). The response is scoped and specific — the heater, not the lights or the locks.

Kiro hooks work the same way. A file event (the API file was saved) triggers a specific AI action (update the corresponding tests). The response is scoped. The developer reviews the result before it is accepted.

## Practical applications

**Setting up a test-sync hook**:
1. Create `.kiro/hooks/sync-tests.yml` (or the appropriate format for your Kiro version).
2. Configure the trigger: files matching `src/**/*.ts`.
3. Configure the action: "When a source file changes, review the corresponding test file in `tests/` and update any tests that reference changed functions or types."
4. Test the hook by making a small change and reviewing the AI's proposed test update.

**Setting up a documentation hook**:
1. Create `.kiro/hooks/update-docs.yml`.
2. Configure the trigger: files matching `api/**/*.ts`.
3. Configure the action: "When an API file changes, review the corresponding entry in `docs/api/` and update it to reflect any changed endpoints, parameters, or return values."

**Reviewing hook output**:
When a hook fires, Kiro presents the proposed changes for developer review before applying them. Treat hook output the same as any other AI-generated code: read it, check it, and approve or reject it.

## Common misconceptions

1. **"Hooks run code automatically without review."** — Hooks trigger AI actions, not automatic code commits. The developer still reviews and approves the AI's proposed changes before they are applied.
2. **"Hooks replace tests."** — Hooks help keep tests up to date. They do not replace the need to write tests, define what correct behavior looks like, or review test coverage.
3. **"More hooks means more automation."** — Too many hooks create noise. Start with one or two high-value hooks (test sync, documentation sync) and evaluate whether they reduce or increase maintenance burden before adding more.

## Related terms

- [Kiro Core Concepts: Workflow](03-core-concepts.md) — Where hooks fit in the overall Kiro workflow
- [Kiro Steering Guide](05-steering.md) — Complementary persistent guidance mechanism
- [Kiro Best Practices](09-best-practices.md) — When to use hooks and when not to

## Further reading

- [Kiro official site — Hooks documentation](https://kiro.dev) — Official reference for hook configuration format. As of 2026-05-19.
- [AWS DevOps Blog](https://aws.amazon.com/blogs/devops/) — Background on automated AI workflows in development environments. As of 2026-05-19.

## Language notes

| English term | Korean | Japanese | Translation note |
|---|---|---|---|
| hooks | 훅 | フック | File event-triggered AI actions — "파일 변경 시 자동 실행되는 작업" / 「ファイル変更時に自動実行されるアクション」 |

## Advanced notes

> **For advanced readers only** — you do not need to read this section to understand Kiro hooks.

Kiro hooks are conceptually similar to git hooks (pre-commit, post-commit), but they trigger AI actions rather than shell scripts. Unlike git hooks, Kiro hooks fire on file save events rather than on git operations, which allows them to run mid-development rather than only at commit time. This means a team can get AI assistance in keeping files in sync before a commit is even staged — reducing the number of "forgot to update the tests" commits.
