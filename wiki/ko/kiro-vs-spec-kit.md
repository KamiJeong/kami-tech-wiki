---
title: "Kiro vs GitHub Spec Kit: 무엇이 다른가?"
aliases: ["Kiro vs Spec Kit", "Kiro와 Spec Kit 비교", "Kiro 또는 Spec Kit"]
tags: [kiro, spec-kit, comparison, tool]
category: concept
language: ko
date_created: 2026-05-19
date_modified: 2026-05-19
source_count: 2
related: ["Kiro", "Spec-Kit", "명세서 중심 개발 (SDD)"]
status: draft
review_cycle: fast-changing
freshness_date: 2026-05-19
---

# Kiro vs GitHub Spec Kit: 무엇이 다른가?

> Kiro는 명세서 중심 개발을 기반으로 구축된 AWS의 에이전틱(agentic) IDE이고, Spec Kit은 기존 AI 코딩 워크플로에 동일한 SDD 규율을 더하는 Claude Code 툴킷입니다 — 두 가지 도구, 하나의 방법론.

## 이 페이지의 대상 독자

이 페이지는 Kiro와 Spec Kit 모두에 대해 들어보고 차이점, 공통점, 언제 어느 것을 사용해야 하는지 이해하고 싶은 개발자와 제품 관리자를 위한 글입니다. 어느 도구에 대해서도 깊은 사전 지식이 없어도 됩니다.

## 왜 이 비교가 중요한가

Kiro와 Spec Kit은 모두 명세서 중심 개발(SDD, Spec-Driven Development)을 구현합니다. 둘 다 구현 전에 명세서 문서를 생성합니다. 둘 다 비공식 프롬프트가 아닌 구조화된 명세서를 기반으로 AI 코딩 에이전트를 안내합니다. 이 공통점 때문에 두 가지가 같은 것인가 하는 의문이 드는 것은 합리적입니다. 답은 아닙니다 — 두 도구는 다른 환경에서, 다른 워크플로로, 다른 통합 수준으로 같은 문제를 해결합니다.

차이점을 이해하면 팀의 기존 도구에 따라 선택이 이미 명확한 경우에 두 도구를 상호 교환 가능한 것이나 경쟁하는 대안으로 잘못 취급하는 실수를 방지할 수 있습니다.

## 빠른 비교

| 항목 | Kiro | GitHub Spec Kit |
|---|---|---|
| 주요 목적 | 명세서 중심 개발이 내장된 에이전틱 IDE | Claude Code를 위한 SDD 워크플로 툴킷 |
| 제작자 | Amazon Web Services (AWS) | 이 저장소 (내부 툴킷, 공식 제품 아님) |
| 대상 사용자 | SDD 전용 IDE를 원하는 개발자 | 구조화된 워크플로 명령어를 원하는 Claude Code 사용자 |
| 인터페이스 | IDE (VS Code 기반) + CLI | Claude Code 스킬 (슬래시 명령어) |
| 워크플로 방식 | 명세서 → 구현 (IDE 내부에서) | 명세서 작성 → 명확화 → 계획 → 작업 → 구현 (명령어 순서) |
| 명세서 지원 | requirements.md + design.md + tasks.md | spec.md + plan.md + tasks.md |
| AI 에이전트 통합 | Kiro 자체 에이전틱 AI (AWS 호스팅) | Claude (Anthropic) via Claude Code |
| 시작 난이도 | Kiro 설치 및 설정 필요 | Claude Code와 저장소의 Spec Kit 스킬 필요 |
| 최적 사용 사례 | SDD가 내장된 통합 IDE를 원하는 팀 | 구조화된 워크플로를 원하는 Claude Code 사용 팀 |
| 한계 | AWS 제품 (계정/접근 필요), IDE 종속 | Claude Code 의존, 내부 툴킷 (상업적 배포 없음) |

## 상세 비교

### 목적

두 도구 모두 명세서 중심 개발을 구현하지만, 수준이 다릅니다. Kiro는 IDE 자체에 SDD가 내장된 완전한 개발 환경입니다. 명세서 워크플로는 제품의 핵심 기능으로, IDE 인터페이스가 이를 표면화하고, 관리하고, 실행합니다. Spec Kit은 이미 사용 중인 Claude Code 환경 위에 추가된 워크플로 레이어입니다. 구조화된 워크플로를 제공하지만 Claude Code 환경 내에서입니다.

실용적으로 설명하면: Kiro는 환경 자체입니다. Spec Kit은 Claude Code 내에서 실행되는 워크플로 패턴입니다.

### 인터페이스

Kiro는 그래픽 IDE(VS Code 기반)와 CLI를 제공합니다. IDE에는 파일 브라우저, 통합 에이전틱 챗(Agentic Chat) 패널, 명세서 문서 관리가 내장되어 있습니다. Kiro를 열면 명세서 워크플로에 즉시 접근할 수 있습니다.

Spec Kit은 Claude Code 명령어를 통해 작동합니다. 별도의 애플리케이션이 없습니다 — Claude Code 인터페이스에서 Spec Kit 명령어를 실행하면 출력(마크다운 파일)이 프로젝트 디렉토리에 나타납니다. 경험이 더 텍스트 기반이고 시각적 통합도가 낮습니다.

### 워크플로

Kiro의 워크플로는 IDE 내에서 생성된 세 가지 명세서 문서(requirements.md, design.md, tasks.md)를 중심으로 합니다. 워크플로는 Kiro 주도입니다: 기능을 설명하면, Kiro가 명세서를 생성하고, 검토 후, Kiro가 구현합니다.

Spec Kit의 워크플로는 명령어 중심입니다: 각각 검토 후 다음 명령어를 실행하는 명령어 순서(`/speckit-specify`, `/speckit-plan`, `/speckit-tasks`, `/speckit-implement`)를 실행합니다. 워크플로가 더 명시적이고 단계적이어서 개발자에게 각 단계에 대한 더 많은 제어권을 줍니다.

### AI 통합

Kiro는 AWS 자체 AI 모델을 IDE에 직접 통합해 사용합니다. 모델은 Kiro 전용으로, 어떤 AI가 실행되는지 선택할 수 없습니다.

Spec Kit은 Claude Code를 통해 Claude(Anthropic의 AI 모델)를 사용합니다. 팀이 이미 Claude Code를 사용하고 있다면, Spec Kit은 새로운 AI 의존성 없이 구조화된 워크플로 명령어로 확장합니다.

## 두 도구를 함께 사용할 수 있나요?

네. Kiro와 Spec Kit은 상호 배타적이지 않습니다. 팀은 Kiro IDE로 유지 관리되는 코드베이스의 기능 개발에 Kiro를 사용하고, Claude Code 환경에서의 저장소 문서화, 명세서 작성, 또는 워크플로 단계에 Spec Kit을 사용할 수 있습니다. 각 도구가 생성하는 명세서 산출물은 일반 마크다운 파일로, 특정 도구 생태계에 종속되지 않습니다.

하지만 대부분의 팀은 주요 개발 환경에 따라 하나를 사용하게 됩니다. VS Code 기반 도구를 사용하고 통합된 SDD 경험을 원한다면 Kiro가 자연스러운 선택입니다. AI 보조 개발에 Claude Code를 사용한다면 Spec Kit이 자연스러운 선택입니다.

## 흔한 오해

1. **"Spec Kit은 Claude Code 버전의 Kiro다."** — 두 도구 모두 SDD를 구현하지만, 다르게 구축되고, 다른 AI 모델을 사용하며, 다른 수준의 IDE 통합을 갖습니다. 방법론은 공유하지만 도구는 동등하지 않습니다.
2. **"둘 중 하나를 선택해야 한다."** — 두 도구는 다른 환경에서 작동하며 공존할 수 있습니다. 선택은 어느 것이 객관적으로 더 나은지가 아니라 개발 환경에 따라 달라집니다.
3. **"Kiro가 완전한 IDE이기 때문에 더 강력하다."** — 강력함은 적합성에 달려 있습니다. 팀이 Claude Code에서 작업한다면, Kiro의 IDE를 추가하면 새로 배우고 관리해야 할 도구가 생깁니다. Spec Kit은 이미 사용 중인 도구에 구조를 더합니다. 절대적인 기능보다 적합성이 더 중요합니다.

## 관련 용어

- [Kiro란 무엇인가?](kiro/01-what-is-kiro.md) — Kiro 전체 개요
- [GitHub Spec Kit이란 무엇인가?](spec-kit/01-what-is-spec-kit.md) — Spec Kit 전체 개요
- [명세서 중심 개발 (SDD)](sdd/index.md) — 두 도구가 구현하는 공통 방법론

## 참고 자료

- [Kiro 공식 사이트](https://kiro.dev) — Kiro 제품 문서 및 다운로드. 2026-05-19 기준.
- [Claude Code 공식 문서](https://docs.anthropic.com/claude-code) — 스킬/명령어를 포함한 Claude Code 문서. 2026-05-19 기준.
