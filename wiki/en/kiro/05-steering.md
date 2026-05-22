---
title: "Kiro Steering Guide"
aliases: ["Kiro steering files", "Kiro persistent guidance"]
tags: [kiro, tool, concept, beginner, steering]
category: concept
tool: "Kiro"
language: en
date_created: 2026-05-19
date_modified: 2026-05-19
source_count: 2
related: ["Kiro Core Concepts: Workflow", "Kiro Hooks Guide", "How Kiro Specs Work"]
status: draft
review_cycle: fast-changing
freshness_date: 2026-05-19
---

# Kiro Steering Guide

> Steering files are Markdown documents in `.kiro/steering/` that give the AI agent persistent, project-wide rules to follow across every session and every team member.

## Who this page is for

This page is for developers and team leads who want to understand how to give Kiro consistent, reliable guidance that applies to the entire project — not just a single feature. Some familiarity with the concept of coding conventions is helpful.

## Why this matters

One of the biggest frustrations with AI coding tools is inconsistency. The AI generates code in one style on Monday and a different style on Wednesday. One developer's AI-generated code follows camelCase; another's uses snake_case. The AI uses one library for HTTP requests in one file and a different library in another.

Steering files solve this problem. They are the mechanism by which a team's conventions, architecture rules, and project-specific constraints become persistent inputs to the AI — applied automatically, every time, for every team member.

Teams that invest time in good steering files report significantly more consistent AI output. Teams that skip steering files spend more time correcting AI inconsistencies.

## Plain-language explanation

A steering file is a Markdown file stored in `.kiro/steering/` in your project. You write it like a set of standing instructions for the AI: "always use this naming convention," "never use this library," "when building an API, always follow this response structure."

Kiro reads the steering files at the start of every AI session. Every time it generates code, answers a question, or runs a task, it applies the rules in the steering files. Because the steering files are committed to the project's git repository, they are shared by all team members and versioned alongside the code.

You can have multiple steering files. A common approach is to organize them by concern: one for coding conventions, one for architecture rules, one for security requirements.

## Key concepts

### What goes in a steering file

Steering files are most useful for rules that:
- Apply to the entire project (not just one feature)
- Would be tedious to repeat in every spec or prompt
- Should be followed consistently by every team member

**Why it matters**: If a rule only applies to one feature, it belongs in that feature's spec. If a rule applies everywhere, it belongs in a steering file.

**Example contents of a steering file**:
```markdown
# Project Conventions

## Naming
- Variable names: camelCase (JavaScript/TypeScript)
- File names: kebab-case
- Database columns: snake_case

## API responses
All API responses must use the following envelope:
{
  "status": "success" | "error",
  "data": <payload>,
  "error": null | { "code": string, "message": string }
}

## Dependencies
- HTTP requests: use the `fetch` API — do not add axios
- Date handling: use date-fns — do not use moment.js
```

### How Kiro reads steering files

Kiro reads all files in `.kiro/steering/` at the start of every session. The rules are applied as persistent context for the AI model — they inform every code generation, review, and suggestion the AI makes during that session.

**Why it matters**: Unlike a prompt you type once and forget, steering files are always present. They do not need to be repeated. The AI carries them as background context for everything it does.

**Example**: Even if a developer working on a completely different feature than the one that established the API response envelope convention, the AI will still follow that convention — because the steering file is always read.

## Example or analogy

> Think of a franchise restaurant chain. Every location follows the same operations manual: how to prepare each dish, what ingredients to use, how to plate it. The manual is not rewritten for each shift — it is the standing instruction set that applies to everyone, always.

Kiro's steering files are your project's operations manual. Every AI action follows the manual. New team members, new features, new sessions — the manual applies to all of them.

## Practical applications

**Setting up steering for a new project**:

1. Create `.kiro/steering/` in your project root.
2. Create `conventions.md` — document naming conventions, code style preferences, and library choices.
3. Create `architecture.md` — document how the project is structured: what goes where, how layers communicate, what patterns to follow.
4. Create `security.md` (if relevant) — document security requirements: no hard-coded credentials, required input validation, authentication approach.
5. Commit all steering files to git.

**Maintaining steering files**:
- Update steering files when the team makes a new architectural decision.
- Treat steering files with the same care as code: review changes in pull requests.
- When the AI produces output that breaks a convention, check whether the convention is documented in the steering files. If not, add it.

**Checking steering file coverage**:
If you find the AI repeatedly breaking the same rule, that rule probably needs to be in a steering file. Use AI errors as a signal for gaps in your steering documentation.

## Common misconceptions

1. **"Steering files are the same as a README."** — A README explains the project to a human reader. Steering files instruct the AI agent. They are written to produce specific AI behavior, not to be read by new team members on their first day (though they can serve that purpose secondarily).
2. **"More steering is always better."** — Overly long or contradictory steering files degrade AI performance. Keep each rule clear and unambiguous. If two rules conflict, resolve the conflict in the document.
3. **"Steering files replace per-feature specs."** — Steering files and specs serve different purposes. Steering covers what is always true. Specs cover what is true for one specific feature. Both are needed.

## Related terms

- [Kiro Core Concepts: Workflow](03-core-concepts.md) — Where steering fits in the overall Kiro workflow
- [Kiro Hooks Guide](06-hooks.md) — Event-triggered AI automation that complements steering
- [Kiro Best Practices](09-best-practices.md) — Advice for getting the most from steering files

## Further reading

- [Kiro official site — Steering documentation](https://kiro.dev) — Official reference for steering file format and usage. As of 2026-05-19.
- [AWS DevOps Blog](https://aws.amazon.com/blogs/devops/) — AWS perspective on team consistency in AI-assisted development. As of 2026-05-19.

## Language notes

| English term | Korean | Japanese | Translation note |
|---|---|---|---|
| steering | 스티어링 (steering) | ステアリング | Persistent AI guidance — "AI에게 주는 지속적 가이드라인" / 「AIへの継続的なガイドライン」 |

## Advanced notes

> **For advanced readers only** — you do not need to read this section to understand Kiro steering.

Steering files function as a form of system prompt injection — they are inserted into the AI model's context at the start of every session before any user input is processed. This makes them effective for establishing behavioral defaults, but it also means very long steering files consume context tokens that could otherwise be used for project-specific content. Aim for clarity and conciseness in steering files: specific, unambiguous rules are more effective than long explanatory prose.
