---
title: "OpenUI 아키텍처"
aliases: ["openui-architecture", "openui-how-it-works", "openui-pipeline"]
tags: [openui, architecture, pipeline, streaming]
category: concept
language: ko
date_created: 2026-05-15
date_modified: 2026-05-15
source_count: 0
related: [overview, introduction, specification-v05]
status: active
---

# OpenUI 아키텍처

> OpenUI의 핵심 파이프라인: Library → Prompt Generator → LLM → Parser → Renderer → Live UI

**공식 문서**: [https://www.openui.com/docs/openui-lang/how-it-works](https://www.openui.com/docs/openui-lang/how-it-works)

![OpenUI 데모 — 생성형 UI 스트리밍 렌더링](https://raw.githubusercontent.com/thesysdev/openui/main/assets/demo.gif)

---

## 개요

OpenUI는 LLM이 UI를 생성하고, 생성된 UI가 이후 **LLM 없이 독립적으로 실행**되는 아키텍처를 채택합니다. 이 분리는 성능과 비용 효율성을 동시에 달성하는 핵심 설계 원칙입니다.

---

## 파이프라인 다이어그램

```
┌─────────────────┐
│  Component      │
│  Library        │  ← Zod 스키마 + React 렌더러
│  (정의 단계)     │
└────────┬────────┘
         │ library.prompt()
         ▼
┌─────────────────┐
│  System Prompt  │  ← 자동 생성된 LLM 지시문
│  Generation     │
└────────┬────────┘
         │ 시스템 프롬프트 + 사용자 입력
         ▼
┌─────────────────┐
│  LLM            │  ← GPT-4o, Claude, 기타 OpenAI 호환 모델
│  (생성 단계)     │
└────────┬────────┘
         │ OpenUI Lang 스트림 (라인 단위)
         ▼
┌─────────────────┐
│  Parser         │  ← 라인 단위 스트리밍 파싱
│                 │
└────────┬────────┘
         │ 파싱된 컴포넌트 트리
         ▼
┌─────────────────┐
│  Renderer       │  ← <Renderer /> React 컴포넌트
│  (실행 단계)     │
└────────┬────────┘
         │ 데이터 페칭 / 상태 관리 / 이벤트 처리
         ▼
┌─────────────────┐
│  Live UI        │  ← 사용자에게 표시되는 인터랙티브 UI
└─────────────────┘
```

---

## 핵심 원리

### 1. Library (라이브러리 — 정의 단계)

컴포넌트의 "계약(contract)"을 정의합니다.

- **Zod 스키마**: 각 컴포넌트의 props 타입을 정의합니다.
- **React 렌더러**: 각 컴포넌트가 어떻게 렌더링될지 정의합니다.
- 라이브러리는 **단일 소스 오브 트루스**: 프롬프트 생성과 렌더링이 모두 이 정의에서 파생됩니다.

### 2. Parser (파서 — 스트리밍 처리)

LLM 스트림을 실시간으로 파싱합니다.

- **라인 단위**: 완전한 라인이 도착하는 즉시 파싱합니다. 전체 응답을 기다리지 않습니다.
- **견고성**: 유효하지 않은 출력은 자동으로 제외하고 유효한 부분만 렌더링합니다.
- **비동기**: 파싱과 렌더링이 동시에 진행됩니다.

### 3. Renderer (렌더러 — 실행 단계)

파싱된 결과를 React UI로 변환합니다.

- `<Renderer library={library} stream={stream} />` 형태로 사용합니다.
- **위치 인수 매핑**: 파싱된 위치 인수를 Zod 스키마 키 순서에 따라 컴포넌트에 전달합니다.
- **독립 실행**: LLM 생성 완료 후 UI는 독립적으로 동작합니다.
  - 데이터 페칭 (쿼리 실행)
  - 반응형 상태 관리
  - 사용자 이벤트 처리 (클릭, 입력 등)

---

## 실제 적용 예시

```tsx
import { createLibrary, openuiLibrary, Renderer } from "@openuidev/react-lang";
import { useOpenUIStream } from "@openuidev/react-headless";

const library = createLibrary(openuiLibrary);

function ChatMessage({ stream }) {
  const parsed = useOpenUIStream(stream);

  return (
    <Renderer
      library={library}
      stream={parsed}
      // UI가 LLM 없이 독립 실행됨
    />
  );
}
```

---

## 관련 개념 비교

| 구분 | OpenUI 아키텍처 | 전통적 서버 렌더링 |
|------|----------------|-----------------|
| UI 생성자 | LLM | 개발자 (코드) |
| 스트리밍 | 라인 단위 점진적 렌더링 | 전체 완료 후 표시 |
| LLM 의존성 | 생성 단계만 | 없음 |
| 인터랙티비티 | 생성 후 독립 실행 | 항상 독립 |

---

## 연결된 도구 & 구현

- [[OpenUI 개요]] — 4가지 구성요소 요약
- [명세 v0.5](specification-v05.md) — OpenUI Lang 문법 (파서가 파싱하는 언어)
- [시스템 프롬프트](system-prompts.md) — 프롬프트 생성기 상세
- [[OpenUI API 레퍼런스]] — 패키지별 API

---

## 주의사항 & 한계

> [!warning] 알려진 제약
> Renderer는 React 환경에서만 동작합니다. 파서(`@openuidev/lang-core`)는 React 없이 사용 가능하지만, 렌더링은 React 필수입니다.

---

## 참고 링크

- [공식 문서: How It Works](https://www.openui.com/docs/openui-lang/how-it-works) (2026-05-15)
- [GitHub: thesysdev/openui](https://github.com/thesysdev/openui) (2026-05-15)
