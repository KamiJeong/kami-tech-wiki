---
title: "Storybook이란 무엇인가?"
aliases: ["Storybook", "스토리북", "Storybook MCP", "Component Story Format"]
tags: [storybook, design-system, frontend, mcp, figma, ai-native-development]
category: tool
tool: "Storybook"
language: ko
date_created: 2026-05-28
date_modified: 2026-05-28
source_count: 15
related: ["Codex CLI", "Kiro MCP 가이드", "OpenUI", "Spec-Driven Development (SDD)"]
status: draft
review_cycle: fast-changing
freshness_date: 2026-05-28
---

# Storybook이란 무엇인가?

> Storybook은 UI 컴포넌트와 페이지를 실제 앱 실행 흐름에서 분리해 만들고, 상태별 예시를 스토리로 저장하며, 문서화와 테스트까지 이어 주는 프론트엔드 워크숍입니다.

## 이 페이지의 대상 독자

이 페이지는 Figma로 화면을 설계하고 Claude Code, Codex CLI 같은 AI 코딩 에이전트로 프론트엔드를 구현하려는 디자이너, PM, 프론트엔드 개발자, 창업자를 위한 한국어 개요입니다. 2026-05-28 기준 공식 Storybook, Figma, Anthropic, OpenAI 자료를 바탕으로 작성했습니다.

## 왜 중요한가

AI 코딩 에이전트는 화면을 만들 때 "무엇을 만들지"뿐 아니라 "이미 팀에 어떤 컴포넌트가 있고, 각 컴포넌트를 어떻게 써야 하는지"를 알아야 합니다. Figma는 디자인 의도를 전달하는 데 강하지만, 실제 코드 컴포넌트의 props, 상태, 접근성 테스트, 상호작용 테스트까지 자동으로 보장하지는 않습니다.

Storybook은 이 빈틈을 채웁니다. 팀의 버튼, 입력창, 카드, 모달 같은 UI를 실행 가능한 예시로 모아 두고, 그 예시를 문서와 테스트의 기준으로 삼습니다. Storybook MCP를 연결하면 AI 에이전트가 이 실행 가능한 컴포넌트 지식을 직접 조회하고, 스토리를 만들고, 테스트를 실행하는 흐름까지 사용할 수 있습니다.

## 쉽게 이해하는 설명

Figma가 제품 UI의 "설계도"라면 Storybook은 실제 부품이 꽂혀 있는 "작업대"에 가깝습니다.

- 설계도에는 버튼의 위치, 크기, 색, 흐름이 보입니다.
- 작업대에는 실제 버튼 컴포넌트가 있고, `primary`, `disabled`, `loading`, `error` 같은 상태를 바로 켜 볼 수 있습니다.
- AI 에이전트가 작업대에 접근할 수 있으면 "버튼이 이렇게 생겼을 것"이라고 추측하지 않고, 실제 버튼의 사용법을 확인한 뒤 화면을 조립할 수 있습니다.

## 핵심 개념

| 용어 | 뜻 |
|------|----|
| Storybook | UI 컴포넌트와 페이지를 앱과 분리해 개발, 문서화, 테스트하는 도구 |
| 스토리 | 특정 컴포넌트가 특정 props, 데이터, 상태에서 어떻게 렌더링되는지 저장한 예시 |
| CSF | Component Story Format. JavaScript/TypeScript 모듈로 스토리를 작성하는 Storybook 표준 형식 |
| 디자인 시스템 | 색, 타이포그래피, 간격, 컴포넌트, 사용 규칙을 모아 제품 UI 일관성을 유지하는 체계 |
| Storybook MCP | AI 에이전트가 Storybook의 컴포넌트 문서, 스토리 작성 지침, 프리뷰, 테스트 실행 기능을 도구처럼 호출하게 하는 MCP 서버 |
| Manifest | Storybook MCP가 컴포넌트 문서와 스토리 지식을 에이전트에게 제공하기 위해 사용하는 메타데이터 |

## Storybook과 디자인 시스템의 관계

디자인 시스템은 "우리 제품 UI는 어떤 원칙과 부품으로 만들어지는가"에 대한 체계입니다. Storybook은 그 디자인 시스템을 실제 코드 관점에서 보여 주는 실행 가능한 문서가 될 수 있습니다.

| 구분 | Figma | Storybook |
|------|-------|-----------|
| 주 역할 | 디자인 의도, 레이아웃, 시각 규칙, 디자이너 협업 | 실제 코드 컴포넌트, 상태별 예시, 개발자 문서, UI 테스트 |
| 강점 | 빠른 시안, 흐름 설계, 디자인 리뷰, 변수/토큰 관리 | props와 상태 확인, 접근성/상호작용/시각 테스트, 코드 재사용 |
| AI에게 주는 맥락 | "무엇처럼 보여야 하는가" | "이미 있는 컴포넌트를 어떻게 사용해야 하는가" |
| 빈틈 | 실제 컴포넌트 API와 동작은 별도 확인 필요 | 디자인 의도와 최신 시안은 Figma와 연결해 확인 필요 |

좋은 팀에서는 Figma와 Storybook이 경쟁하지 않습니다. Figma는 의도와 시각 설계를 잡고, Storybook은 그 의도가 코드 컴포넌트로 어떻게 구현되어 재사용되는지 보여 줍니다.

## Storybook에서 제공하는 주요 기능

| 기능 | 설명 | AI Native Development에서의 의미 |
|------|------|----------------------------------|
| 컴포넌트 격리 개발 | 앱 전체를 띄우지 않고 특정 UI 조각을 독립적으로 렌더링 | 에이전트가 전체 앱 라우팅이나 서버 상태를 몰라도 작은 단위부터 수정 가능 |
| 스토리 | 기본, 오류, 로딩, 빈 상태처럼 중요한 UI 변형을 저장 | 에이전트가 "이 컴포넌트의 사용 가능한 상태"를 예시로 학습 |
| 자동 문서화 | 스토리와 컴포넌트 정보를 바탕으로 문서를 생성 | 팀의 UI 사용 규칙을 사람이 읽고 AI도 참조 가능 |
| Addons | Controls, Actions, Viewport, A11y, Visual Tests 등 확장 | 디자인 검토, 접근성 확인, 반응형 확인 같은 반복 작업을 도구화 |
| Interaction tests | `play` 함수로 클릭, 입력, 제출 같은 사용자 행동을 검증 | 에이전트가 만든 UI를 스토리 단위로 검증 가능 |
| Visual tests | 스토리 스크린샷을 이전 기준과 비교 | 레이아웃, 색, 간격 회귀를 찾는 데 유용 |
| Accessibility tests | 렌더링된 DOM을 접근성 규칙으로 검사 | 색 대비, 레이블, 키보드 접근성 문제를 초기에 발견 |
| 공유와 CI | Storybook을 배포하거나 CI에서 테스트 실행 | 디자이너, PM, QA가 앱 배포 전 UI 상태를 확인 |

## Storybook MCP란

MCP(Model Context Protocol)는 AI 클라이언트가 외부 도구와 데이터를 사용할 수 있게 해 주는 연결 규격입니다. Storybook MCP는 로컬 또는 공유된 Storybook을 MCP 서버처럼 노출해, Claude Code, Codex CLI, Copilot류 에이전트가 UI 컴포넌트 정보를 직접 조회하도록 돕습니다.

2026-05-28 기준 공식 Storybook 문서에서 Storybook AI 기능과 MCP 서버는 preview이며, 특히 manifest와 MCP 서버는 React 프로젝트 중심으로 지원된다고 설명합니다. API는 바뀔 수 있으므로 운영 도입 전 공식 문서를 다시 확인해야 합니다.

### Storybook MCP의 세 가지 툴셋

| 툴셋 | 대표 도구 | 에이전트가 할 수 있는 일 |
|------|-----------|--------------------------|
| Development | `get-storybook-story-instructions`, `preview-stories` | 새 스토리 작성 지침을 받고, 스토리 프리뷰나 링크를 사용자에게 보여 줌 |
| Docs | `list-all-documentation`, `get-documentation`, `get-documentation-for-story` | 컴포넌트 목록, props, 예시 스토리, 문서 내용을 조회 |
| Testing | `run-story-tests` | 특정 스토리의 컴포넌트 테스트와 접근성 결과를 실행하고 해석 |

### 기본 연결 흐름

```bash
npm create storybook@latest --features docs test a11y
npx storybook add @storybook/addon-mcp
npx mcp-add --type http --url "http://localhost:6006/mcp" --scope project
```

**기대 동작**: Storybook 개발 서버가 실행 중이면 에이전트는 MCP 도구를 통해 컴포넌트 문서와 스토리 지식을 조회하고, 스토리 작성과 테스트 실행을 워크플로우에 포함할 수 있습니다.

## Figma 기반 AI 구현 3가지 케이스 비교

아래 비교는 "중간 복잡도의 제품 화면 1개, 8-12개 UI 컴포넌트, 기존 프론트엔드 코드베이스가 있음"을 가정한 실무적 추정입니다. 토큰 숫자는 벤치마크가 아니라 상대적 비용을 이해하기 위한 휴리스틱입니다.

| 케이스 | 에이전트가 받는 맥락 | 구현 과정 | 강점 | 주요 위험 |
|--------|----------------------|-----------|------|-----------|
| 1. Figma만 사용 | 디자인 이미지, 레이어, 스타일, 변수 등 디자인 중심 정보 | 화면 구조를 해석하고, 코드베이스에서 비슷한 컴포넌트를 검색하고, props와 상태를 추측해 구현 | 빠르게 시작 가능. 별도 문서화 비용이 낮음 | 실제 컴포넌트 API를 잘못 추측하기 쉬움. 접근성/상호작용/빈 상태가 빠질 수 있음 |
| 2. Figma + Markdown 설명 | Figma 맥락 + 컴포넌트 사용 규칙, 예외 상태, UX 의도 설명 | Markdown으로 누락된 의도를 보강하고, 에이전트가 코드 탐색과 추론을 병행 | PM/디자이너 의도를 더 잘 전달. Figma만 쓸 때보다 재작업 감소 | Markdown이 최신 코드와 어긋날 수 있음. 실제 컴포넌트 동작 검증은 별도 필요 |
| 3. Figma + Storybook MCP | Figma 디자인 맥락 + Storybook의 실제 컴포넌트 문서, 스토리, 테스트 | 에이전트가 Figma로 목표 화면을 이해하고, Storybook MCP로 기존 컴포넌트 사용법을 조회한 뒤, 스토리와 테스트로 검증 | 컴포넌트 재사용과 일관성이 가장 강함. 에이전트의 추측을 줄이고 테스트 루프를 만들 수 있음 | Storybook 구축과 관리 비용이 있음. MCP preview/React 중심 제한을 고려해야 함 |

## Claude Code와 Codex CLI에서 추론 흐름이 어떻게 달라지는가

사용자가 말한 "Claude CLI"는 보통 `claude` 명령으로 사용하는 Claude Code를 뜻하는 경우가 많습니다. Codex CLI는 OpenAI의 로컬 코딩 에이전트입니다. 두 도구 모두 MCP 서버를 연결할 수 있는 에이전트형 개발 환경으로 볼 수 있습니다.

| 흐름 | Figma만 있을 때 | Figma + Markdown일 때 | Figma + Storybook MCP일 때 |
|------|----------------|----------------------|----------------------------|
| 화면 이해 | 레이아웃, 색, 계층, 간격을 해석 | 디자인 의도와 상태 설명을 함께 읽음 | Figma로 목표 화면을 이해하고 Storybook으로 구현 가능한 부품을 확인 |
| 컴포넌트 선택 | 코드베이스 검색과 이름 추론에 의존 | Markdown에서 지정한 컴포넌트 후보를 참고 | `list-all-documentation`, `get-documentation`으로 실제 컴포넌트와 props 확인 |
| 구현 | 유사 컴포넌트 복사, props 추측, 스타일 조정 | 설명을 바탕으로 더 좁은 범위에서 구현 | 문서화된 props와 예시 스토리를 기준으로 조립 |
| 검증 | 앱 실행, 스크린샷, 수동 확인 중심 | 수동 확인 + 설명과 비교 | 스토리 프리뷰, interaction/a11y 테스트, 필요 시 재실행 |
| 실패 패턴 | "그럴듯하지만 팀 컴포넌트 규칙과 다른 UI" | "문서 설명은 맞지만 코드 현실과 다른 UI" | "Storybook 문서가 오래되었거나 MCP 출력이 너무 큰 경우" |

## 예상 토큰 소비량 비교

다시 강조하면, 아래 숫자는 측정 벤치마크가 아닙니다. 같은 도구라도 모델, 프롬프트 길이, MCP 출력 크기, 리포지토리 규모, 실패 후 반복 횟수에 따라 크게 달라집니다.

| 케이스 | 예상 토큰 소비 | 이유 |
|--------|----------------|------|
| Figma만 사용 | 높음: 약 30k-80k+ | 에이전트가 디자인 해석, 컴포넌트 탐색, props 추측, 오류 수정까지 넓게 추론해야 함 |
| Figma + Markdown 설명 | 중간-높음: 약 20k-55k | 의도와 예외 상태 설명이 줄어든 추론을 보완하지만, 실제 컴포넌트 API 확인은 여전히 코드 탐색에 의존 |
| Figma + Storybook MCP | 중간: 약 15k-45k | MCP 도구 호출 결과가 토큰을 쓰지만, 컴포넌트 추측과 재작업이 줄어 전체 반복 비용이 낮아질 가능성이 큼 |

Storybook MCP가 항상 토큰을 적게 쓰는 것은 아닙니다. 컴포넌트 문서가 매우 크거나 에이전트가 너무 많은 MCP 결과를 한 번에 가져오면 오히려 컨텍스트가 커질 수 있습니다. 장점은 "첫 응답 토큰 절약"보다 "잘못된 추측과 재작업 감소"에 있습니다.

## 언제 Storybook을 쓰면 좋은가

| 상황 | 판단 |
|------|------|
| 버튼, 폼, 테이블, 카드, 모달처럼 재사용 컴포넌트가 많다 | Storybook 도입 가치가 큼 |
| 디자이너와 개발자가 같은 UI 상태를 반복해서 확인한다 | Storybook이 공통 확인 장소가 됨 |
| 접근성, 시각 회귀, 상호작용 테스트가 중요하다 | Storybook 테스트 워크플로우가 유용 |
| AI 에이전트가 자주 UI를 구현하고 컴포넌트 사용법을 헷갈린다 | Storybook MCP 가치가 큼 |
| 단발성 프로토타입이나 랜딩 페이지를 빠르게 만든다 | 처음부터 Storybook을 강제하지 않아도 됨 |
| 디자인 시스템이 아직 없고 컴포넌트가 계속 바뀐다 | 핵심 컴포넌트가 안정된 뒤 점진 도입이 더 현실적 |

## Storybook MCP 활용 사례

1. **로그인 화면 구현**: 에이전트가 Storybook에서 `TextInput`, `PasswordInput`, `Button`, `Alert` 문서를 확인하고, Figma 레이아웃에 맞춰 조립한 뒤 로딩/오류/성공 스토리를 생성합니다.
2. **디자인 시스템 마이그레이션**: 예전 버튼 사용처를 찾고, Storybook 문서에 맞는 새 버튼 props로 바꾸며, 변경된 스토리를 실행해 접근성 문제를 확인합니다.
3. **PM 리뷰용 UI 프리뷰**: 에이전트가 새 화면의 스토리를 만들고 Storybook 프리뷰 링크를 공유해, 앱 배포 전 상태별 UI를 검토하게 합니다.
4. **AI 구현 품질 루프**: 에이전트가 구현 후 `run-story-tests`를 실행하고, 실패한 접근성 또는 interaction 결과를 고친 뒤 다시 테스트합니다.

## 흔한 오해

1. **"Storybook은 디자이너용 문서 사이트다."** Storybook은 문서 사이트가 될 수 있지만 핵심은 실행 가능한 UI 상태를 스토리로 관리하는 개발 워크숍입니다.
2. **"Figma MCP가 있으면 Storybook MCP는 필요 없다."** Figma MCP는 디자인 맥락을 주고, Storybook MCP는 코드 컴포넌트 사용법과 테스트 루프를 줍니다. 서로 다른 문제를 풉니다.
3. **"Storybook MCP를 켜면 AI가 항상 정확한 UI를 만든다."** MCP는 추측을 줄이지만, Storybook 문서가 낡았거나 컴포넌트 스토리가 부족하면 결과도 제한됩니다.
4. **"Storybook은 큰 조직만 쓴다."** 작은 팀도 재사용 컴포넌트가 늘고 AI 구현이 반복되면 Storybook의 문서화/테스트 효과를 빠르게 얻을 수 있습니다.

## 실무 도입 체크리스트

- 핵심 컴포넌트 5-10개부터 스토리를 만든다.
- `Default`, `Disabled`, `Loading`, `Error`, `Empty`처럼 구현 중 자주 빠지는 상태를 우선 등록한다.
- 문서화보다 "AI가 실제로 조회할 props와 사용 예시"를 먼저 정리한다.
- Storybook MCP를 연결한 뒤 에이전트 지침에 "컴포넌트 props를 추측하지 말고 Storybook 문서를 먼저 조회하라"고 명시한다.
- 접근성 테스트와 interaction test는 핵심 폼/버튼/탐색 컴포넌트부터 시작한다.
- Storybook 문서와 실제 코드가 어긋나지 않도록 PR 체크나 리뷰 기준에 스토리 업데이트를 포함한다.

## 관련 용어

| 용어 | 뜻 |
|------|----|
| MCP | AI 클라이언트가 외부 도구, 문서, 데이터에 접근하기 위한 연결 프로토콜 |
| Figma Dev Mode | 개발자가 디자인을 검사하고 코드 구현에 필요한 정보를 확인하는 Figma 모드 |
| Figma MCP Server | Figma 디자인 맥락을 에이전트형 코딩 도구로 가져오기 위한 Figma의 MCP 서버 |
| Interaction test | 스토리 안에서 클릭, 입력, 제출 같은 사용자 행동을 시뮬레이션하는 테스트 |
| Visual test | 스토리 화면을 스크린샷 기준으로 비교해 시각 회귀를 찾는 테스트 |
| Accessibility test | 렌더링된 DOM을 접근성 규칙으로 검사하는 테스트 |

## 참고 자료

- [Storybook docs](https://storybook.js.org/docs) — Storybook 기본 개념, stories, docs, testing, sharing. 2026-05-28 확인.
- [Why Storybook?](https://storybook.js.org/docs/get-started/why-storybook) — isolated UI development, stories, docs, testing, sharing 설명. 2026-05-28 확인.
- [Install Storybook](https://storybook.js.org/docs/get-started/install) — 설치와 `--features docs test a11y` 옵션. 2026-05-28 확인.
- [Interaction tests](https://storybook.js.org/docs/writing-tests/interaction-testing) — `play` 함수와 사용자 행동 테스트. 2026-05-28 확인.
- [Visual tests](https://storybook.js.org/docs/writing-tests/visual-testing) — 스토리 기반 시각 회귀 테스트. 2026-05-28 확인.
- [Accessibility tests](https://storybook.js.org/docs/writing-tests/accessibility-testing) — a11y addon과 접근성 검사. 2026-05-28 확인.
- [Storybook MCP server](https://storybook.js.org/docs/ai/mcp/overview) — MCP 서버 개요, 툴셋, 설치, preview/React 제한. 2026-05-28 확인.
- [Sharing your MCP server](https://storybook.js.org/docs/ai/mcp/sharing) — Storybook MCP 공유와 docs toolset. 2026-05-28 확인.
- [Storybook 10.3](https://storybook.js.org/blog/storybook-10-3/) — Storybook MCP for React 발표와 AI workflow 개선. 2026-05-28 확인.
- [Figma Dev Mode](https://www.figma.com/dev-mode/) — Figma Dev Mode와 MCP 서버 소개. 2026-05-28 확인.
- [Guide to the Figma MCP server](https://help.figma.com/hc/en-us/articles/32132100833559-Guide-to-the-Figma-MCP-server) — Figma MCP 서버 설정과 사용 범위. 2026-05-28 확인.
- [Introducing Figma's Dev Mode MCP server](https://www.figma.com/blog/introducing-figmas-dev-mode-mcp-server/) — Figma MCP beta 발표와 design-informed code generation 설명. 2026-05-28 확인.
- [Connect Claude Code to tools via MCP](https://docs.anthropic.com/en/docs/claude-code/mcp) — Claude Code MCP 설정과 사용 예시. 2026-05-28 확인.
- [OpenAI Codex GitHub repository](https://github.com/openai/codex) — Codex CLI 설치, 로컬 코딩 에이전트, MCP 지원. 2026-05-28 확인.
- [OpenAI Codex CLI getting started](https://help.openai.com/en/articles/11096431) — Codex CLI 개요와 기능. 2026-05-28 확인.
