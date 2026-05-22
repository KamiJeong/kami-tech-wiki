---
title: "Spec Kit Glossary"
aliases: ["Spec Kit terms", "Spec Kit terminology"]
tags: [spec-kit, glossary, reference]
category: reference
tool: "Spec-Kit"
language: en
date_created: 2026-05-19
date_modified: 2026-05-19
source_count: 0
related: ["Spec Kit Overview", "Spec Kit Core Concepts"]
status: draft
review_cycle: fast-changing
freshness_date: 2026-05-19
---

# Spec Kit Glossary

> Quick reference for terms used across the Spec Kit article series.

## How to use this glossary

This is a reference document, not reading material. Look up a specific term when you encounter it and want a plain-language definition. Each term links to the article where it is introduced in context.

---

## Constitution

**Definition**: The project-wide governance document that defines rules every feature must follow. Created with `/speckit-constitution`. Inherited by all feature specifications in the project.

**Also known as**: project constitution, governance document

**Used in**: [Spec Kit Core Concepts](03-core-concepts.md), [Spec Kit Command Guide](05-command-guide.md)

**Korean**: 프로젝트 규약
**Japanese**: プロジェクト憲章

---

## Feature Branch

**Definition**: A git branch created specifically for one feature's development. Spec Kit workflows typically run on a feature branch so the pipeline artifacts and implementation can be reviewed before being merged to the main branch.

**Also known as**: topic branch, development branch

**Used in**: [Spec Kit Workflow](04-workflow.md)

**Korean**: 기능 브랜치 (feature branch)
**Japanese**: フィーチャーブランチ (feature branch)

---

## Implementation Guard

**Definition**: A verification check that confirms completed tasks are backed by real implementation, not just marked done. Catches "phantom completions" — tasks marked `[X]` without corresponding code.

**Also known as**: verify-tasks, phantom completion check

**Used in**: [Spec Kit Risks and Limitations](08-risks.md)

**Korean**: 구현 검증 (implementation guard)
**Japanese**: 実装ガード (implementation guard)

---

## Pipeline Artifact

**Definition**: A Markdown file produced at a specific step of the Spec Kit workflow. The three primary artifacts are `spec.md`, `plan.md`, and `tasks.md`. Artifacts are committed to the repository and serve as the documented record of the feature's development.

**Also known as**: artifact, spec artifact, workflow output

**Used in**: [What Is GitHub Spec Kit?](01-what-is-spec-kit.md), [Spec Kit Core Concepts](03-core-concepts.md)

**Korean**: 파이프라인 아티팩트 (pipeline artifact)
**Japanese**: パイプラインアーティファクト (pipeline artifact)

---

## plan.md

**Definition**: The implementation plan document produced by `/speckit-plan`. Describes the technical approach, technology stack, file structure, and phased implementation sequence for a feature.

**Also known as**: implementation plan, technical plan

**Used in**: [Spec Kit Core Concepts](03-core-concepts.md), [Spec Kit Command Guide](05-command-guide.md)

**Korean**: 구현 계획서 (plan.md)
**Japanese**: 実装計画書 (plan.md)

---

## Quality Gate

**Definition**: A verification step that systematically checks whether the implementation satisfies the specification. Run with `/speckit-verify-run`. Identifies acceptance criteria that are not met and tasks that are marked complete but lack real implementation.

**Also known as**: verify, verification gate, quality check

**Used in**: [Spec Kit Core Concepts](03-core-concepts.md), [Spec Kit Command Guide](05-command-guide.md)

**Korean**: 품질 검증 (quality gate)
**Japanese**: 品質ゲート (quality gate)

---

## SDD (Spec-Driven Development)

**Definition**: The software development methodology that Spec Kit implements. In SDD, a specification is written before any code, and that specification serves as the single source of truth for implementation and verification.

**Also known as**: Spec-Driven Development, specification-first development

**Used in**: [What Is GitHub Spec Kit?](01-what-is-spec-kit.md), [Spec Kit Core Concepts](03-core-concepts.md)

**Korean**: 명세서 중심 개발 (SDD)
**Japanese**: 仕様駆動開発 (SDD)

---

## spec.md

**Definition**: The feature specification document produced by `/speckit-specify`. Contains user stories, acceptance criteria, out-of-scope items, edge cases, and dependencies. The primary input for all subsequent Spec Kit commands.

**Also known as**: spec, specification, feature specification

**Used in**: [Spec Kit Core Concepts](03-core-concepts.md), [Spec Kit Command Guide](05-command-guide.md)

**Korean**: 명세서 (spec.md)
**Japanese**: 仕様書 (spec.md)

---

## Spec Kit

**Definition**: An SDD toolkit implemented as Claude Code skills in a repository. Provides a sequence of commands that guide Claude Code through a structured specification-before-code workflow. Not an official GitHub product.

**Also known as**: GitHub Spec Kit, Spec-Kit

**Used in**: [What Is GitHub Spec Kit?](01-what-is-spec-kit.md)

**Korean**: Spec Kit (스펙킷)
**Japanese**: Spec Kit (スペックキット)

---

## tasks.md

**Definition**: The implementation task list produced by `/speckit-tasks`. An ordered checklist of specific, independently completable implementation steps derived from `plan.md`. Each task is marked `[X]` when completed during `/speckit-implement`.

**Also known as**: task list, implementation tasks, work breakdown

**Used in**: [Spec Kit Core Concepts](03-core-concepts.md), [Spec Kit Command Guide](05-command-guide.md)

**Korean**: 작업 목록 (tasks.md)
**Japanese**: タスクリスト (tasks.md)
