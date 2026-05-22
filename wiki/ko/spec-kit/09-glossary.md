---
title: "Spec Kit 용어집"
aliases: ["Spec Kit 용어", "Spec Kit 술어"]
tags: [spec-kit, glossary, reference]
category: reference
tool: "Spec-Kit"
language: ko
date_created: 2026-05-19
date_modified: 2026-05-19
source_count: 0
related: ["Spec Kit 개요", "Spec Kit 핵심 개념"]
status: draft
review_cycle: fast-changing
freshness_date: 2026-05-19
---

# Spec Kit 용어집

> Spec Kit 아티클 시리즈 전반에서 사용되는 용어의 빠른 참조 자료.

## 이 용어집 활용 방법

이 문서는 읽기용이 아닌 참조용입니다. 특정 용어를 찾을 때 조회하여 평문 정의를 확인하세요. 각 용어는 맥락 속에서 처음 소개되는 아티클로 연결됩니다.

---

## 프로젝트 규약 (Constitution)

**정의**: 모든 기능이 따라야 할 규칙을 정의하는 프로젝트 전반의 거버넌스 문서. `/speckit-constitution`으로 생성. 프로젝트의 모든 기능 명세서에 상속됨.

**다른 이름**: constitution, 거버넌스 문서

**사용 위치**: [Spec Kit 핵심 개념](03-core-concepts.md), [Spec Kit 명령어 가이드](05-command-guide.md)

**영어**: Constitution
**일본어**: プロジェクト憲章

---

## 기능 브랜치 (Feature Branch)

**정의**: 하나의 기능 개발을 위해 생성된 git 브랜치. Spec Kit 워크플로는 일반적으로 기능 브랜치에서 실행되어, 파이프라인 산출물과 구현이 메인 브랜치에 병합되기 전에 검토될 수 있도록 함.

**다른 이름**: 토픽 브랜치, 개발 브랜치

**사용 위치**: [Spec Kit 워크플로](04-workflow.md)

**영어**: Feature Branch
**일본어**: フィーチャーブランチ (feature branch)

---

## 구현 검증 (Implementation Guard)

**정의**: 완료로 표시된 작업이 실제 구현으로 뒷받침되는지 확인하는 검증 점검. "유령 완료" — 해당 코드 없이 `[X]`로 표시된 작업 — 를 발견함.

**다른 이름**: verify-tasks, 유령 완료 점검

**사용 위치**: [Spec Kit 위험과 한계](08-risks.md)

**영어**: Implementation Guard
**일본어**: 実装ガード (implementation guard)

---

## 파이프라인 아티팩트 (Pipeline Artifact)

**정의**: Spec Kit 워크플로의 특정 단계에서 생성된 마크다운 파일. 세 가지 주요 산출물은 `spec.md`, `plan.md`, `tasks.md`. 저장소에 커밋되어 기능 개발의 문서화된 기록으로 기능함.

**다른 이름**: 산출물, 명세서 산출물, 워크플로 출력

**사용 위치**: [GitHub Spec Kit이란 무엇인가?](01-what-is-spec-kit.md), [Spec Kit 핵심 개념](03-core-concepts.md)

**영어**: Pipeline Artifact
**일본어**: パイプラインアーティファクト (pipeline artifact)

---

## plan.md

**정의**: `/speckit-plan`이 생성하는 구현 계획 문서. 기능의 기술 접근법, 기술 스택, 파일 구조, 단계적 구현 순서를 설명함.

**다른 이름**: 구현 계획서, 기술 계획

**사용 위치**: [Spec Kit 핵심 개념](03-core-concepts.md), [Spec Kit 명령어 가이드](05-command-guide.md)

**영어**: plan.md (implementation plan)
**일본어**: 実装計画書 (plan.md)

---

## 품질 검증 (Quality Gate)

**정의**: 구현이 명세서를 충족하는지 체계적으로 확인하는 검증 단계. `/speckit-verify-run`으로 실행. 충족되지 않은 인수 기준과 완료로 표시됐지만 실제 구현이 없는 작업을 식별함.

**다른 이름**: 검증, 검증 게이트, 품질 점검

**사용 위치**: [Spec Kit 핵심 개념](03-core-concepts.md), [Spec Kit 명령어 가이드](05-command-guide.md)

**영어**: Quality Gate
**일본어**: 品質ゲート (quality gate)

---

## 명세서 중심 개발 SDD (Spec-Driven Development)

**정의**: Spec Kit이 구현하는 소프트웨어 개발 방법론. SDD에서는 코드 작성 전에 명세서를 먼저 작성하고, 그 명세서가 구현과 검증의 단일 진실 원천(single source of truth) 역할을 함.

**다른 이름**: SDD, 명세서 우선 개발

**사용 위치**: [GitHub Spec Kit이란 무엇인가?](01-what-is-spec-kit.md), [Spec Kit 핵심 개념](03-core-concepts.md)

**영어**: Spec-Driven Development (SDD)
**일본어**: 仕様駆動開発 (SDD)

---

## spec.md

**정의**: `/speckit-specify`가 생성하는 기능 명세서 문서. 사용자 스토리, 인수 기준, 범위 외 항목, 엣지 케이스, 의존성을 포함함. 이후의 모든 Spec Kit 명령어의 기본 입력.

**다른 이름**: 명세서, 스펙, 기능 명세서

**사용 위치**: [Spec Kit 핵심 개념](03-core-concepts.md), [Spec Kit 명령어 가이드](05-command-guide.md)

**영어**: spec.md (specification)
**일본어**: 仕様書 (spec.md)

---

## Spec Kit

**정의**: 저장소에서 Claude Code 스킬로 구현된 SDD 툴킷. 명세서 우선 워크플로를 통해 Claude Code를 안내하는 일련의 명령어를 제공함. GitHub의 공식 제품이 아님.

**다른 이름**: GitHub Spec Kit, 스펙킷

**사용 위치**: [GitHub Spec Kit이란 무엇인가?](01-what-is-spec-kit.md)

**영어**: Spec Kit
**일본어**: Spec Kit (スペックキット)

---

## tasks.md

**정의**: `/speckit-tasks`가 생성하는 구현 작업 목록. `plan.md`에서 도출된 순서가 있고 독립적으로 완료 가능한 구현 단계의 체크리스트. 각 작업은 `/speckit-implement` 실행 중 완료 시 `[X]`로 표시됨.

**다른 이름**: 작업 목록, 구현 작업, 작업 분류

**사용 위치**: [Spec Kit 핵심 개념](03-core-concepts.md), [Spec Kit 명령어 가이드](05-command-guide.md)

**영어**: tasks.md (task list)
**일본어**: タスクリスト (tasks.md)
