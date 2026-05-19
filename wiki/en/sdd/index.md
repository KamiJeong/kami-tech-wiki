---
title: "Spec-Driven Development (SDD)"
aliases: ["SDD", "Spec-Driven Development"]
tags: [sdd, spec-driven-development, concept, methodology, ai-development]
category: concept
language: en
date_created: 2026-05-18
date_modified: 2026-05-19
source_count: 4
review_cycle: periodic
related: ["Kiro", "Spec-Kit", "Claude Code"]
status: draft
---

# Spec-Driven Development (SDD)

> **Spec-Driven Development (SDD)** is a software development methodology in which a specification is written before any code, and that specification serves as the single source of truth for implementation, verification, and iteration.

---

## Overview

Most software teams start the same way: someone says "we need this feature," a developer opens an editor, and the code begins. Documentation happens later — if at all. This approach feels fast in the short term, but as teams grow and AI coding tools enter the picture, the cost of working without a written specification compounds quickly.

Spec-Driven Development flips that order. Before a single line of code is written, the team defines **what is being built** in a structured document called a specification. Implementation follows the specification, and the result is verified against it. When the AI coding agent (an AI software tool that automatically writes or modifies code based on human instructions — for example, Claude Code or GitHub Copilot) generates code based on a clear, machine-readable specification rather than a vague natural language prompt, the accuracy and consistency of its output improves dramatically.

This article explains what SDD is, why it matters, how it works, and how it differs from other development approaches — written for product managers, startup founders, and developers who are new to structured development workflows.

---

## A Plain-Language Analogy

The easiest way to understand SDD is to think of an **architectural blueprint**.

Before a building is constructed, an architect draws blueprints: room dimensions, door and window placements, electrical plans. The construction crew works from those blueprints. When a problem arises on site, the blueprints are updated first, and construction follows.

Imagine a crew building without blueprints — each person working from their own mental model. The plumbing blocks the wiring. Rooms are the wrong size. Half the building has to be torn out and rebuilt after completion.

Software development works the same way. A specification is the blueprint. SDD is the practice of drawing the blueprint before breaking ground.

---

## What Is an AI Coding Agent?

Before going further, it helps to understand what an **AI coding agent** is — because SDD's value is most visible in the context of these tools.

An AI coding agent is a software tool that accepts instructions from a developer (or product manager) and automatically writes, modifies, or runs code. You type "build a user login feature," and the AI produces working code. Examples include Claude Code, GitHub Copilot, and Kiro.

The capabilities of AI coding agents have advanced significantly since 2024 (per Anthropic Claude Code documentation, as of August 2025). But these tools share a fundamental limitation: **ambiguous instructions produce ambiguous results.** An AI cannot determine on its own what "a good login feature" looks like. Without a concrete, structured set of criteria, it will make its own assumptions — and those assumptions may not match what you want. A specification is the antidote to ambiguous instructions.

---

## The SDD Workflow — Six Stages

SDD progresses through six stages in sequence. Each stage produces an artifact that becomes the input for the next.

1. **Constitution**: Document the governing principles and constraints that apply to the entire project. This answers: "What rules do we follow in this project?" The constitution becomes the baseline for all specifications that follow.

2. **Specify**: Write a specification for an individual feature. This answers: "What are we building, how will we measure success, and what is explicitly out of scope?"

3. **Plan**: Translate the specification into a technical implementation plan. This answers: "How will we build it?"

4. **Tasks**: Break the plan into independently completable work units. Each task should be small enough that its completion can be verified without running the full system.

5. **Implement**: Write code according to the task list. This is the stage where AI coding agents add the most value — a structured task list derived from a specification is an ideal input for an AI agent.

6. **Review**: Verify that the implementation satisfies the acceptance criteria in the specification. If problems are found, update the specification first, then start the next cycle.

These six stages repeat. Each cycle makes the specification more precise and the implementation more correct.

---

## What Is a Specification?

A **specification** (in SDD, often called a "spec") is a written document that answers:

- Who is this feature for?
- How will we know when it is working correctly? (acceptance criteria)
- What is explicitly outside the scope of this feature?
- What edge cases or failure modes need to be handled?

In SDD, a specification is not a document you write once and file away. As development progresses and new information emerges, the specification is updated first — and the implementation follows. This is called a **living specification**.

A living specification keeps the written description of the system in sync with its actual behavior throughout its entire lifetime — not just at the moment of initial development.

---

## What Is a Constitution in SDD?

In SDD, a **constitution** is a project-wide document that defines the development principles, constraints, and standards that apply to every feature in the project.

If a specification answers "what are we building with this feature?", the constitution answers "what are the rules we always follow in this project?" Think of it as the standing orders that every feature inherits.

A constitution might define:

- The technology stack the team uses
- Security principles (for example: no credentials hard-coded in source files)
- Documentation standards (for example: every API must have a specification before implementation begins)
- Review and approval processes

Having a constitution means you do not need to repeat the same foundational constraints in every specification. All specifications inherit from the constitution.

---

## Methodology Comparison: SDD vs Traditional Development vs TDD vs BDD vs Vibe Coding

| Dimension | Traditional Development | TDD (Test-Driven Development) | BDD (Behavior-Driven Development) | SDD | Vibe Coding |
|-----------|------------------------|------------------------------|-----------------------------------|-----|-------------|
| **Starting point** | Verbal requirement or ticket | Failing unit test | User behavior scenario (Gherkin) | Structured specification | Natural language prompt to AI |
| **Primary artifact** | Implementation code (docs later, if at all) | Test code + implementation code | Feature files + implementation code | Specification + implementation + verification report | Implementation code (no specification) |
| **AI agent compatibility** | Low — ambiguous instructions | Low — tests are the primary context | Medium — requires Gherkin parsing | Very high — structured input | Medium — fast but inconsistent |
| **Documentation-code sync** | Docs easily diverge from code | Tests serve as the only documentation | Feature files serve as living docs | Specification stays current by design | No documentation |
| **Suitable team size** | Small to large | Small to medium | Medium to large | Small to large | Individual to small team |
| **Learning curve** | Low | Medium (requires test-writing skill) | High (requires Gherkin knowledge) | Medium (requires spec-writing practice) | Very low |

**Vibe coding** is a development style in which a developer interacts with an AI coding tool using free-form natural language, without writing a formal specification or plan. The term captures the improvisational, "going with the vibe" quality of this approach. Vibe coding is highly effective for rapid prototyping and personal exploration, but tends to produce inconsistent results as project complexity grows.

SDD is not the opposite of vibe coding — it is what vibe coding can evolve into. Many teams start with vibe coding to explore ideas quickly, then switch to SDD once the direction is clear. SDD adds structure and consistency without giving up the speed advantage of working with AI tools.

**TDD (Test-Driven Development)** and **BDD (Behavior-Driven Development)** are both methodologies where something is written before the implementation code — tests in the case of TDD, user behavior scenarios in the case of BDD. SDD operates at a higher level of abstraction than either: it defines the full feature specification before implementation begins, and it is compatible with both TDD and BDD within its workflow.

---

## When to Use SDD

SDD is most effective in these situations:

- **Teams using AI coding agents**: A structured specification gives the AI agent clear criteria to work from, reducing correction cycles.
- **Multi-person projects**: The specification becomes a shared language between technical and non-technical contributors.
- **Projects with frequently changing requirements**: Updating the specification first makes it easy to understand the impact of a change before touching code.
- **Software that needs long-term maintenance**: Living specifications explain the system's intent even years after the original team has changed.
- **Teams that include non-technical stakeholders**: A specification can be read and reviewed by people who do not read code.

---

## When Not to Use SDD

SDD is not the right fit for every situation:

- **Throw-away prototypes with a one- or two-day lifespan**: The time spent writing a specification may exceed the time spent building.
- **Solo experiments with no stakeholders**: If you are the only person working on it and the direction is entirely in your head, a full SDD workflow may add friction without benefit.
- **Early-stage exploration where the requirements are not yet known**: In this phase, vibe coding may be the right tool to explore quickly. Once the direction becomes clear, transitioning to SDD for the build phase is a natural next step.

---

## Common Misconceptions

**Misconception 1: "SDD means writing a lot of documents before you can start."**

A specification is not a lengthy report. It is a short, structured document that answers specific questions about a feature. With practice, writing a specification takes minutes to an hour for most features — and the time is recovered by avoiding the rework that comes from building the wrong thing.

**Misconception 2: "SDD replaces TDD or BDD."**

SDD does not compete with TDD or BDD. SDD operates at a higher level — defining what to build before any tests or scenarios are written. TDD's unit tests and BDD's Gherkin scenarios can both live inside an SDD workflow.

**Misconception 3: "With a good enough AI, you do not need a specification."**

AI coding agents are very capable at generating code, but they cannot determine what you want to build without being told. A specification is that instruction. Without one, the AI makes assumptions — and correcting those assumptions after the fact is expensive. The more capable the AI, the more important a clear specification becomes, because the AI will act on whatever guidance it has, confidently and at scale.

**Misconception 4: "SDD slows teams down."**

SDD shifts time from the end of a project (debugging and rework) to the beginning (specification writing). Teams that measure total project time — including rework — consistently find that writing specifications first reduces the overall time to deliver working software.

---

## Practical Example — A Scenario Anyone Can Follow

**Situation**: A product manager named Alex wants to add an "order status notification" feature to an e-commerce platform.

**Without SDD (vibe coding)**: Alex sends the AI a message: "When an order ships, send the customer a notification." The AI builds an email notification. Alex wanted a push notification, and wanted it triggered on delivery, not shipping. More requests, more corrections, more cycles.

**With SDD**: Alex writes a specification first:
- **Feature**: Order status notification
- **Notification channel**: Mobile push notification (email is out of scope)
- **Trigger event**: Order delivered (order shipped is out of scope)
- **Acceptance criterion**: Within 5 minutes of delivery confirmation, the customer receives a push notification on their mobile device.

The AI coding agent receives this specification and implements correctly on the first pass. The number of correction cycles drops dramatically. The delivered feature matches what was intended.

---

## What Is Vibe Coding?

**Vibe coding** is a development approach in which a developer gives free-form natural language instructions to an AI coding tool, without a formal specification or structured plan. The word "vibe" captures the improvisational quality — you go with the feeling of what you want, describe it conversationally, and let the AI interpret the rest.

Vibe coding is genuinely useful for:
- Quickly turning an idea into a working prototype
- Personal projects where consistency across sessions does not matter
- Early-stage exploration before the shape of a feature is clear

The limitations of vibe coding become visible when:
- Multiple people need to work on the same codebase
- The feature is complex enough that the AI needs precise criteria to get it right
- The project will be maintained over months or years

SDD is not a rejection of vibe coding's spirit. It is a way to bring structure to the speed that AI tools provide.

---

## Benefits of SDD

- **Less rework**: Defining requirements before implementation prevents building the wrong thing.
- **Better AI output**: Structured specifications are a better input for AI coding agents than natural language prompts. The AI produces more accurate, consistent results.
- **Improved team communication**: The specification is a shared document that both technical and non-technical contributors can read and review.
- **Easier change management**: When requirements change, updating the specification first reveals the full impact before code is touched.
- **Knowledge preservation**: When a developer leaves the team, the specifications document the intent behind the system.

---

## Risks and Limitations

- **Upfront investment**: Writing good specifications takes practice. Teams new to SDD need time to develop the habit.
- **Over-specification risk**: Trying to specify every small decision in formal documents slows teams down. Specifications should focus on what matters — requirements and acceptance criteria — not implementation details.
- **Specification drift**: If the team does not maintain the discipline of updating specifications when requirements change, the specs fall out of sync with the code. This is the same documentation problem that SDD is designed to solve, and it requires team discipline to avoid.
- **Overhead for very short projects**: Applying the full SDD workflow to a task that takes a few hours may not be worth the overhead.

---

## Glossary of Key Terms

| Term | Definition |
|------|------------|
| **Specification** | A written document describing a feature's requirements, acceptance criteria, and scope. The primary artifact of SDD. |
| **Constitution** | A project-wide document defining the development principles and constraints that all features must follow. |
| **AI Coding Agent** | A software tool that automatically writes or modifies code based on human instructions. Examples: Claude Code, GitHub Copilot, Kiro. |
| **Vibe Coding** | A development style using free-form natural language instructions to an AI coding tool, without a formal specification. |
| **Pipeline** | The six-stage SDD workflow: Constitution → Specify → Plan → Tasks → Implement → Review. |
| **TDD (Test-Driven Development)** | A development methodology in which failing unit tests are written before implementation code. |
| **BDD (Behavior-Driven Development)** | A development methodology in which user behavior scenarios are written before implementation code. |
| **Living Specification** | A specification that is updated continuously as development progresses, keeping the written description synchronized with actual behavior. |

---

## Related Articles

SDD is implemented in practice by tools including [Spec Kit](../spec-kit/index.md), which provides the full SDD pipeline as slash commands in [Claude Code](../claude-code/index.md), and [Kiro](../kiro/index.md), an AI-powered IDE built around a three-document specification system. For foundational concepts in working effectively with AI tools, see Prompt Engineering basics (TBD — not yet written).

---

## Sources and References

- Kent Beck, *Test-Driven Development: By Example* (Addison-Wesley, 2002) — The foundational definition of TDD by its creator. See also: [martinfowler.com/bliki/TestDrivenDevelopment.html](https://martinfowler.com/bliki/TestDrivenDevelopment.html) (as of 2025-08)
- Dan North, "Introducing BDD" — The original article defining Behavior-Driven Development. [dannorth.net/introducing-bdd](https://dannorth.net/introducing-bdd/) (as of 2025-08)
- Anthropic, *Claude Code Documentation* — Capabilities and workflow of the Claude Code AI coding agent. [docs.anthropic.com/claude-code](https://docs.anthropic.com/claude-code) (as of 2025-08)
- Kiro official site — AWS-developed AI IDE implementing SDD at the IDE level. [kiro.dev](https://kiro.dev) (2026-05-19)

---

*Last reviewed: 2026-05-19 | Review cycle: every 6 months (periodic)*
