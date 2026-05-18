---
title: "Kiro"
aliases: ["Kiro IDE", "AWS Kiro"]
tags: [kiro, aws, ai-ide, tool]
category: tool
tool: "Kiro"
language: ko
date_created: 2026-05-18
date_modified: 2026-05-18
source_count: 0
related: ["Spec-Driven Development (SDD)", "Spec-Kit"]
status: active
---

# Kiro

> **최신 정보 주의**: 이 페이지의 정보는 2026-05-18 기준입니다. Kiro는 현재 활발히 개발 중이므로 기능과 인터페이스가 변경될 수 있습니다. 최신 정보는 공식 사이트 [https://kiro.dev](https://kiro.dev)를 확인하세요.

---

## Kiro란?

Kiro는 AWS가 개발한 AI 기반 통합 개발 환경(IDE)입니다. VS Code를 기반으로 구축되어 기존 VS Code 익스텐션과 설정을 그대로 활용할 수 있으며, 여기에 스펙 주도 개발([[Spec-Driven Development (SDD)|SDD]])을 위한 전용 워크플로우가 추가되어 있습니다.

Kiro의 핵심 철학은 "명세가 코드보다 먼저"입니다. 개발자가 요구사항을 자연어로 입력하면, Kiro의 AI 에이전트가 구조화된 스펙 문서를 자동 생성하고, 그 스펙에 기반하여 구현 태스크를 분해하고, 코드를 작성합니다.

---

## 핵심 개념

### 스티어링 파일 (Steering Files)

스티어링 파일은 Kiro 에이전트의 행동 방식을 정의하는 마크다운 파일입니다. 프로젝트의 코딩 컨벤션, 아키텍처 원칙, 금지 패턴 등을 명시하여 에이전트가 일관된 방식으로 코드를 생성하도록 안내합니다. `.kiro/steering/` 디렉토리 아래에 위치하며, 에이전트는 모든 세션에서 이 파일을 참조합니다.

예를 들어, "모든 API 응답은 공통 래퍼 형식을 사용한다"는 규칙을 스티어링 파일에 정의하면, Kiro가 API를 생성할 때마다 이 규칙을 자동으로 적용합니다.

### 스펙 문서 (Spec Documents)

Kiro의 스펙 문서는 세 가지 파일로 구성됩니다.

- **requirements.md**: 사용자 스토리와 기능 요구사항을 정의합니다. "사용자로서 나는 ~을 할 수 있어야 한다" 형식의 수락 기준이 포함됩니다.
- **design.md**: 기술적 아키텍처, 데이터 모델, API 설계, 컴포넌트 구조를 정의합니다. 구현 전에 "어떻게 만들 것인가"를 명확히 합니다.
- **tasks.md**: 구현 작업을 개별 태스크로 분해한 목록입니다. 각 태스크는 독립적으로 완료 가능하며, 의존성 순서에 따라 정렬됩니다.

### 에이전트 태스크 (Agent Tasks)

Kiro의 에이전트 태스크는 스펙에서 파생된 구체적인 구현 단위입니다. 개발자는 태스크를 선택하여 Kiro 에이전트에게 할당하면, 에이전트가 스펙과 스티어링 파일을 참조하여 해당 태스크를 구현합니다. 태스크 완료 후 에이전트는 자체 검증을 수행하여 스펙 기준에 부합하는지 확인합니다.

### 오토파일럿 모드 (Autopilot Mode)

오토파일럿 모드는 Kiro가 사람의 개입 없이 스펙에 정의된 모든 태스크를 순차적으로 완료하는 자율 실행 모드입니다. 개발자는 스펙을 정의한 후 오토파일럿을 활성화하고, 에이전트가 전체 구현을 완료한 후 결과를 검토합니다. 복잡한 기능의 초기 스캐폴딩이나 반복적인 구현 작업에 특히 유용합니다.

---

## 사용 시나리오

| 적합한 경우 | 적합하지 않은 경우 |
|------------|-------------------|
| 새 기능의 스펙을 먼저 정의하고 AI가 구현하게 할 때 | 이미 완성된 코드베이스를 단순히 편집할 때 |
| 팀 전체가 동일한 코딩 컨벤션을 유지해야 할 때 | 스펙 없이 빠르게 프로토타입을 만들어야 할 때 |
| 복잡한 기능을 여러 태스크로 분해하여 단계별로 구현할 때 | Kiro가 지원하지 않는 언어나 프레임워크를 사용할 때 |

---

## 빠른 시작

다음은 Kiro로 새 기능을 개발하는 기본 흐름입니다.

```bash
# 1. Kiro를 설치하고 프로젝트를 열기
#    (kiro.dev에서 설치 파일 다운로드)

# 2. 새 스펙 생성
#    Command Palette → "Kiro: New Spec"
#    또는 .kiro/specs/ 디렉토리에 새 폴더 생성

# 3. requirements.md에 요구사항 작성
# 예시:
# ## User Stories
# - As a user, I want to log in with email and password
#   - Acceptance: Login completes within 2 seconds
#   - Acceptance: Invalid credentials show an error message

# 4. Kiro에게 design.md 생성 요청
#    "Based on requirements.md, generate design.md"

# 5. Kiro에게 tasks.md 생성 요청
#    "Break down the design into implementation tasks"

# 6. 태스크 실행
#    각 태스크를 선택 → "Run with Kiro Agent"
#    또는 오토파일럿 모드 활성화:
#    Command Palette → "Kiro: Run Autopilot"
```

**결과**: Kiro 에이전트가 스펙 문서를 참조하여 코드를 생성하고, 완료 후 스펙 기준에 따라 자체 검증합니다.

> [!tip] 처음 시작할 때
> 스티어링 파일부터 작성하세요. 프로젝트의 기술 스택, 네이밍 컨벤션, 금지 패턴을 `.kiro/steering/conventions.md`에 정의하면 이후 모든 에이전트 작업에 일관성이 생깁니다.

---

## SDD와의 관계

Kiro는 Spec-Driven Development ([[Spec-Driven Development (SDD)|SDD]])의 IDE 수준 구현체입니다. SDD의 핵심 원칙인 "명세 우선(Spec-First)"을 Kiro는 스펙 문서(requirements.md, design.md, tasks.md) 시스템으로 구현합니다. "살아있는 명세(Living Specification)" 원칙은 Kiro가 구현 중 스펙을 자동으로 업데이트하는 방식으로 구현됩니다. "반복적 정제(Iterative Refinement)"는 태스크 단위 실행과 검증 사이클로 구현됩니다.

즉, Kiro를 사용한다는 것은 SDD 방법론을 IDE 워크플로우로서 실천하는 것입니다.

---

## 통합 & 연결

- **SDD 방법론**: Kiro가 구현하는 핵심 방법론 → [[Spec-Driven Development (SDD)]]
- **Spec-Kit**: Claude Code 환경에서의 동일한 SDD 접근 → [[Spec-Kit]]

---

## 주의사항 & 한계

> [!warning] 알려진 제약
> - **플랫폼 지원**: 2026-05-18 기준, Kiro는 macOS와 Windows를 지원하며 Linux 지원은 제한적일 수 있습니다. 최신 지원 현황은 공식 사이트를 확인하세요.
> - **언어/프레임워크**: 모든 언어와 프레임워크가 동일한 수준으로 지원되지 않을 수 있습니다. 오토파일럿의 정확도는 스펙의 상세도에 크게 의존합니다.

> [!note] 활발한 개발 중
> Kiro는 2026년 현재 활발히 개발 중인 제품입니다. 기능, UI, API가 업데이트에 따라 변경될 수 있습니다. 이 페이지의 정보는 2026-05-18 기준이며, 최신 정보는 공식 문서를 참조하세요.

---

## 참고 링크

- [Kiro 공식 사이트](https://kiro.dev) — AWS Kiro IDE 공식 문서 및 다운로드 (2026-05-18)
