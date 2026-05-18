---
title: "Spec-Kit"
aliases: ["speckit", "Spec Kit"]
tags: [spec-kit, claude-code, sdd, workflow, tool]
category: tool
tool: "Spec-Kit"
language: ko
date_created: 2026-05-18
date_modified: 2026-05-18
source_count: 8
related: ["Spec-Driven Development (SDD)", "Kiro"]
status: active
---

# Spec-Kit

> Claude Code 환경에서 Spec-Driven Development를 실천하는 6단계 워크플로우 도구. 명세 작성부터 구현 검증까지 전 과정을 슬래시 명령으로 체계화합니다.

---

## Spec-Kit이란?

Spec-Kit은 이 프로젝트의 `.claude/skills/` 디렉토리에 내장된 SDD 워크플로우 도구입니다. Claude Code의 슬래시 명령 시스템을 기반으로, Spec-Driven Development ([[Spec-Driven Development (SDD)|SDD]])의 6단계 파이프라인을 구조화된 명령어로 제공합니다.

Spec-Kit을 사용하면 "무엇을 만들 것인가"를 명세로 먼저 정의하고, AI 에이전트가 그 명세를 기반으로 계획을 세우고, 태스크를 생성하고, 구현을 실행하고, 결과를 검증하는 전 과정을 일관된 방식으로 관리할 수 있습니다.

---

## 핵심 개념

- **파이프라인 (Pipeline)**: `specify → clarify → plan → tasks → implement → verify` 6단계로 구성된 개발 흐름
- **슬래시 명령 (Slash Commands)**: Claude Code에서 `/speckit-specify` 형식으로 실행하는 워크플로우 트리거
- **익스텐션 훅 (Extension Hooks)**: 각 파이프라인 단계 전후에 실행되는 자동화 훅 시스템
- **파이프라인 상태 (Pipeline State)**: `pipeline-state.json`으로 각 단계의 완료 여부와 차단 상태를 추적

---

## 파이프라인 6단계

Spec-Kit의 핵심은 6단계 파이프라인입니다. 각 단계는 명확한 입력과 출력을 가집니다.

### 1단계: Specify (명세 작성)

**명령**: `/speckit-specify`

자연어로 기술된 기능 설명을 구조화된 `spec.md`로 변환합니다. 기능 요구사항(FR), 성공 기준(SC), 수락 시나리오, 비기능 요구사항이 포함된 완전한 명세 문서를 생성합니다.

**출력**: `specs/<feature>/spec.md`

### 2단계: Clarify (명세 명확화)

**명령**: `/speckit-clarify`

생성된 명세에서 모호하거나 불완전한 부분을 식별하고, 최대 5개의 핵심 질문으로 명확화를 요청합니다. 답변은 자동으로 `spec.md`에 반영됩니다.

**출력**: 업데이트된 `specs/<feature>/spec.md`

### 3단계: Plan (구현 계획 수립)

**명령**: `/speckit-plan`

명세를 기반으로 기술 스택, 아키텍처, 파일 구조, 구현 단계를 정의한 `plan.md`를 생성합니다. 이 단계에서 버전 가드 검사와 헌법(constitution) 검증이 실행됩니다.

**출력**: `specs/<feature>/plan.md`, `specs/<feature>/research.md`, `specs/<feature>/data-model.md`

### 4단계: Tasks (태스크 생성)

**명령**: `/speckit-tasks`

계획을 의존성 순서에 따라 정렬된 구체적인 태스크 목록(`tasks.md`)으로 변환합니다. 각 태스크는 병렬 실행 가능 여부(`[P]` 표시)와 파일 경로를 포함합니다.

**출력**: `specs/<feature>/tasks.md`

### 5단계: Implement (구현)

**명령**: `/speckit-implement`

`tasks.md`의 태스크를 순서대로 실행하여 실제 코드와 파일을 생성합니다. 병렬 태스크는 동시에 실행되며, 각 태스크 완료 시 `[X]`로 표시됩니다.

**출력**: `tasks.md`의 모든 태스크가 `[X]` 표시, 구현 파일들

### 6단계: Verify (검증)

**명령**: `/speckit-verify-run`

구현 결과를 `spec.md`, `plan.md`, `tasks.md`, `constitution.md`와 대조하여 검증합니다. 팬텀 완료(코드 없이 `[X]` 표시된 태스크)를 탐지하고, 미구현 요구사항을 보고합니다.

**출력**: 검증 보고서, 미완료 항목 목록

---

## 주요 명령

| 명령 | 단계 | 설명 |
|------|------|------|
| `/speckit-specify` | Specify | 자연어 설명을 spec.md로 변환 |
| `/speckit-clarify` | Clarify | 명세의 모호한 부분을 질문으로 명확화 |
| `/speckit-plan` | Plan | 기술 계획과 아키텍처 문서 생성 |
| `/speckit-tasks` | Tasks | 의존성 순서의 태스크 목록 생성 |
| `/speckit-implement` | Implement | tasks.md 기반 실제 구현 실행 |
| `/speckit-auto` | 전체 | 전체 파이프라인을 한 번에 실행 |
| `/speckit-analyze` | 분석 | spec.md, plan.md, tasks.md 일관성 검사 |
| `/speckit-verify-run` | Verify | 구현 결과를 명세와 대조 검증 |

---

## 빠른 시작

새 기능을 Spec-Kit으로 개발하는 가장 빠른 방법:

```bash
# Claude Code에서 실행

# 1. 기능 명세 생성
/speckit-specify
# 프롬프트: "사용자 인증 기능 추가 — 이메일/비밀번호 로그인, JWT 토큰 발급"

# 2. 명세 명확화 (선택)
/speckit-clarify

# 3. 구현 계획 수립
/speckit-plan

# 4. 태스크 생성
/speckit-tasks

# 5. 구현 실행
/speckit-implement

# 6. 검증
/speckit-verify-run
```

또는 전체 파이프라인을 한 번에 실행:

```bash
/speckit-auto
# 프롬프트: "사용자 인증 기능 추가 — 이메일/비밀번호 로그인, JWT 토큰 발급"
```

**결과**: `specs/<feature>/` 디렉토리에 spec.md, plan.md, tasks.md가 생성되고, 구현 파일이 작성되며, 검증 보고서가 출력됩니다.

> [!tip] 처음 시작할 때
> `/speckit-auto`는 전체 파이프라인을 자동으로 실행하지만, 처음에는 각 단계를 개별적으로 실행하며 각 단계의 출력을 확인하는 것을 권장합니다. 명세의 품질이 최종 구현의 품질을 결정합니다.

---

## 익스텐션 훅 시스템

Spec-Kit은 각 파이프라인 단계 전후에 자동으로 실행되는 훅 시스템을 지원합니다. 훅은 `.specify/extensions.yml`에 정의됩니다.

```yaml
hooks:
  before_implement:
    - extension: git
      command: speckit.git.commit
      enabled: true
      optional: false
      description: "구현 전 자동 커밋"

  after_implement:
    - extension: verify
      command: speckit.verify.run
      enabled: true
      optional: true
      description: "구현 후 자동 검증"
```

기본 제공 훅:

- **Git 훅**: 각 단계 전후 자동 커밋 (`speckit-git-commit`)
- **버전 가드**: 기술 스택 버전 검증 (`speckit-version-guard-check`)
- **DocGuard**: 문서 품질 검증 (`speckit-docguard-guard`)
- **토큰 분석기**: 토큰 사용량 추적 (`speckit-token-analyzer-baseline`)

---

## SDD와의 관계

Spec-Kit은 Spec-Driven Development ([[Spec-Driven Development (SDD)|SDD]])를 Claude Code 환경에서 실천하기 위한 구체적인 구현체입니다. SDD의 "명세 우선" 원칙은 `/speckit-specify`로, "살아있는 명세" 원칙은 `/speckit-clarify`와 각 단계의 명세 업데이트로, "반복적 정제" 원칙은 6단계 파이프라인의 사이클 구조로 구현됩니다.

Spec-Kit 없이도 SDD를 실천할 수 있지만, Spec-Kit은 이 방법론의 단계별 실행을 자동화하고 검증 가능한 형태로 만들어 줍니다.

---

## 통합 & 연결

- **SDD 방법론**: Spec-Kit이 구현하는 핵심 방법론 → [[Spec-Driven Development (SDD)]]
- **Kiro**: AWS 환경에서의 동일한 SDD 접근 → [[Kiro]]

---

## 주의사항 & 한계

> [!warning] 알려진 제약
> - **Claude Code 전용**: Spec-Kit은 Claude Code 환경에서만 동작합니다. 다른 AI 에이전트나 IDE에서는 사용할 수 없습니다.
> - **명세 품질 의존성**: 파이프라인의 출력 품질은 입력 명세의 품질에 크게 의존합니다. 모호한 명세는 모호한 구현으로 이어집니다.
> - **대규모 프로젝트**: 매우 복잡한 기능의 경우 태스크 수가 많아지면 단일 세션에서 전체 구현이 어려울 수 있습니다. 기능을 더 작은 단위로 분리하는 것을 권장합니다.

> [!note] 내부 도구
> Spec-Kit은 이 프로젝트에 특화된 내부 도구입니다. `.claude/skills/speckit-*` 파일들이 실제 구현입니다.

---

## 참고 링크

- [Claude Code 공식 문서](https://docs.anthropic.com/claude-code) — Spec-Kit이 동작하는 Claude Code 환경 (2026-05-18)
- [Kiro 공식 사이트](https://kiro.dev) — 유사한 SDD 접근의 AWS IDE (2026-05-18)
