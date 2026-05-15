---
title: "OpenUI 개요"
aliases: ["openui-overview", "openui-architecture-overview"]
tags: [openui, openui-lang, overview, architecture]
category: concept
language: ko
date_created: 2026-05-15
date_modified: 2026-05-15
source_count: 0
related: [introduction, architecture, specification-v05]
status: active
---

# OpenUI 개요

> OpenUI Lang 파이프라인의 4가지 핵심 구성요소와 작동 방식을 설명합니다.

**공식 문서**: [https://www.openui.com/docs/openui-lang/overview](https://www.openui.com/docs/openui-lang/overview)

![OpenUI 배너 — Generative UI 프레임워크](https://raw.githubusercontent.com/thesysdev/openui/main/assets/banner.png)

---

## 개요

OpenUI는 LLM이 생성한 텍스트를 실시간으로 구조화된 UI로 변환합니다. 핵심 아이디어는 **모델 출력을 단순 텍스트가 아닌 구조화된 UI 명세**로 취급하는 것입니다.

파이프라인은 4단계로 구성됩니다:

```
Library → Prompt Generator → LLM → Parser → Renderer → Live UI
```

---

## 핵심 원리

### 1. Library (라이브러리)

Zod 스키마와 React 렌더러로 정의된 컴포넌트 집합입니다.

- 각 컴포넌트는 Zod 스키마로 props를 정의하고, React 컴포넌트로 렌더링 방식을 지정합니다.
- 라이브러리가 컴포넌트의 "계약(contract)"을 정의하며, 이것이 프롬프트 생성과 렌더링의 단일 소스가 됩니다.
- 기본 제공 라이브러리: `openuiLibrary`(범용), `openuiChatLibrary`(채팅 최적화)

### 2. Prompt Generator (프롬프트 생성기)

라이브러리로부터 LLM 시스템 프롬프트를 자동 생성합니다.

- `library.prompt()`를 호출하면 허용된 컴포넌트 목록, props, OpenUI Lang 구문 규칙이 포함된 시스템 프롬프트가 생성됩니다.
- 컴포넌트 라이브러리를 변경하면 프롬프트도 자동으로 업데이트됩니다.
- 정적 생성(`@openuidev/cli`)과 동적 생성(`generatePrompt`) 두 방식을 지원합니다.

### 3. Parser (파서)

LLM이 스트리밍하는 OpenUI Lang을 실시간으로 파싱합니다.

- **라인 단위 파싱**: 토큰이 도착하는 즉시 라인별로 파싱하여 스트리밍 렌더링을 지원합니다.
- 유효하지 않은 출력은 자동으로 제외하고 유효한 부분만 렌더링합니다.
- `identifier = Expression` 형태의 단순한 문법으로 토큰 수를 최소화합니다.

### 4. Renderer (렌더러)

파싱된 요소를 React 컴포넌트로 매핑하여 UI를 렌더링합니다.

- `<Renderer />` React 컴포넌트가 파싱 결과를 받아 실시간으로 UI를 구성합니다.
- 위치 기반 인수(positional arguments)를 사용하여 추가 파싱 오버헤드 없이 컴포넌트에 매핑합니다.
- LLM 생성이 완료된 후 UI는 독립적으로 실행됩니다(데이터 페칭, 상태 관리, 이벤트 처리).

---

## OpenUI Lang 문법 핵심

OpenUI Lang은 라인 지향(line-oriented) 구조로, 토큰 효율을 극대화합니다.

```
# 위치 기반 인수 (컴팩트)
stack = Stack([child1, child2], "row", "l")

# JSON 방식과 비교 (장황함)
# { "type": "Stack", "direction": "row", "gap": "l", "children": [...] }
```

위치 인수는 Zod 스키마의 키 순서에 따라 자동으로 매핑됩니다.

---

## 실제 적용 예시

```tsx
import { createLibrary, Renderer } from "@openuidev/react-lang";

// 1. 라이브러리 정의
const library = createLibrary({ /* 컴포넌트 정의 */ });

// 2. 시스템 프롬프트 생성
const systemPrompt = library.prompt();

// 3. LLM 스트리밍 + 렌더링
<Renderer library={library} stream={llmStream} />
```

---

## 관련 개념 비교

| 구분 | OpenUI Lang | JSON 기반 UI 생성 |
|------|------------|-----------------|
| 토큰 효율 | 높음 (위치 인수, 라인 지향) | 낮음 (키-값 반복) |
| 스트리밍 | 라인 단위 즉시 렌더링 | 전체 파싱 후 렌더링 |
| 타입 안전성 | Zod 스키마 | 없음 |
| 확장성 | 커스텀 컴포넌트 추가 | 제한적 |

---

## 연결된 도구 & 구현

- [[OpenUI 소개]] — OpenUI 전체 프레임워크 개요
- [[OpenUI 아키텍처]] — 파이프라인 상세 동작 원리
- [명세 v0.5](specification-v05.md) — OpenUI Lang 전체 언어 명세
- [시스템 프롬프트](system-prompts.md) — 프롬프트 생성 상세 가이드

---

## 참고 링크

- [공식 문서: OpenUI 개요](https://www.openui.com/docs/openui-lang/overview) (2026-05-15)
- [GitHub: thesysdev/openui](https://github.com/thesysdev/openui) (2026-05-15)
