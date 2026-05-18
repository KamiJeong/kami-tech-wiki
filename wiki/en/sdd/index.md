---
title: "Spec-Driven Development (SDD)"
aliases: ["SDD", "Spec-Driven Development"]
tags: [sdd, spec-driven-development, concept, methodology]
category: concept
language: en
date_created: 2026-05-18
date_modified: 2026-05-18
source_count: 0
related: ["Kiro", "Spec-Kit"]
status: active
---

# Spec-Driven Development (SDD)

> A software development methodology where a specification is written before any code, and that specification serves as the single source of truth for implementation, verification, and iteration.

---

## Overview

Spec-Driven Development (SDD) inverts the typical relationship between documentation and code. In traditional development, documentation is often an afterthought — written after the fact to describe what was built. In SDD, the specification is the first deliverable, written before a single line of implementation code exists.

The specification in SDD is not a static design document. It is a living artifact that evolves as understanding deepens: requirements become more precise, edge cases are surfaced during clarification, and implementation feedback is encoded back into the spec. This living quality keeps the spec and the code synchronized throughout the development lifecycle, eliminating the drift that makes stale documentation dangerous.

SDD is particularly powerful in AI-assisted development contexts. When an AI agent receives a structured, machine-readable specification instead of a vague natural language prompt, the accuracy and consistency of its output improves dramatically. Tools like [[Kiro]] and [[Spec-Kit]] are both built around this insight: give the AI agent a spec, not a wish.

---

## Core Principles

### 1. Spec-First

Every feature begins with a specification. The spec must answer three questions before implementation starts: What is being built? How will success be measured? What is explicitly out of scope? Only after these questions are answered in writing does implementation begin.

The spec-first principle separates "what to build" from "how to build it," giving teams a stable target to aim at and a basis for resolving disagreements before they become expensive to fix in code.

### 2. Living Specification

A spec in SDD is never frozen. As implementation reveals gaps — edge cases not considered, requirements that conflict, constraints imposed by the tech stack — the spec is updated first, and the implementation follows. This principle keeps the spec current and prevents the codebase from diverging from documented intent.

The living specification principle also means that reviewing a spec is always meaningful: it reflects the current agreed-upon design, not a historical snapshot.

### 3. Iterative Refinement

SDD does not demand a perfect spec on the first attempt. The methodology supports repeated cycles of specification → implementation → verification → specification update. Each iteration makes the spec more precise and the implementation more correct. Early iterations focus on the happy path; later iterations address edge cases, performance constraints, and failure modes.

### 4. Verifiability

Every requirement in an SDD spec is written in verifiable form. Acceptance criteria use measurable conditions: "the response time must be under 200ms," not "the response should be fast." This makes automated verification possible and gives both humans and AI agents clear criteria for determining whether an implementation is complete.

---

## Real-World Application Example

The following scenario illustrates SDD applied to a typical API feature.

```
Feature: Order Status Endpoint

[Step 1 — Specify]
FR-001: The system must expose a GET /orders/{id}/status endpoint.
FR-002: The endpoint must return the order status within 150ms for 95% of requests.
SC-001: A valid order ID returns HTTP 200 with a JSON body containing "status" field.
SC-002: An invalid or non-existent order ID returns HTTP 404 with a "not found" message.
SC-003: An unauthenticated request returns HTTP 401.

[Step 2 — Clarify]
Q: What are the valid status values?
A: pending, processing, shipped, delivered, cancelled

Q: Should cancelled orders still be retrievable?
A: Yes, for 90 days after cancellation.

[Step 3 — Plan]
- REST API endpoint, authentication via JWT middleware
- Database query with indexed order_id column
- Response caching with 30-second TTL

[Step 4 — Implement]
- Implement endpoint, middleware, and caching layer per plan

[Step 5 — Verify]
- SC-001: PASS (HTTP 200 with status field confirmed)
- SC-002: PASS (HTTP 404 returned for non-existent IDs)
- SC-003: PASS (HTTP 401 returned without token)
- FR-002: PASS (p95 latency measured at 87ms)
```

---

## Methodology Comparison

| Dimension | SDD | BDD (Behavior-Driven Development) | TDD (Test-Driven Development) | Ad-hoc Development |
|-----------|-----|----------------------------------|-------------------------------|--------------------|
| Starting point | Structured spec (spec.md) | User behavior scenarios (Gherkin) | Failing unit test | Verbal requirement or ticket |
| Primary artifact | Spec document → implementation → verification report | Feature files, step definitions, implementation | Test code, implementation code | Implementation code (docs optional) |
| AI agent compatibility | Very high — structured spec is a natural input | Medium — requires Gherkin parsing | Low — tests are the primary context | Low — ambiguous instructions |
| Documentation-code sync | Spec stays current by methodology design | Feature files serve as living documentation | Tests are the only documentation | Docs and code easily diverge |

---

## Connected Tools & Implementations

- [[Kiro]] — AWS's AI-powered IDE. Implements SDD through steering files and a three-document spec system (requirements.md, design.md, tasks.md). Autopilot mode executes the entire spec autonomously.
- [[Spec-Kit]] — Claude Code workflow tool. Implements SDD via the `specify → clarify → plan → tasks → implement → verify` pipeline with slash commands and extension hooks.

---

## References

- [Kiro official site](https://kiro.dev) — AWS Kiro IDE implementing SDD in an IDE context (2026-05-18)
- [Claude Code official docs](https://docs.anthropic.com/claude-code) — The Claude Code environment where Spec-Kit runs (2026-05-18)
