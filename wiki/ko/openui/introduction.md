---
title: "OpenUI 소개"
aliases: ["openui-intro", "generative-ui-framework"]
tags: [openui, generative-ui, introduction]
category: tool
language: ko
date_created: 2026-05-15
date_modified: 2026-05-15
source_count: 0
related: [overview, quickstart, architecture]
status: active
---

# OpenUI 소개

> LLM이 UI를 직접 생성할 수 있도록 설계된 풀스택 생성형 UI 프레임워크. JSON 대비 최대 67% 적은 토큰으로 스트리밍 UI를 렌더링합니다.

**공식 문서**: [https://www.openui.com/docs/openui-lang](https://www.openui.com/docs/openui-lang)

---

## 핵심 개념

- **OpenUI Lang**: LLM이 UI를 생성하기 위한 컴팩트한 스트리밍 우선 언어. JSON보다 훨씬 적은 토큰으로 동일한 UI를 표현합니다.
- **스트리밍 렌더링**: 모델 응답 토큰이 도착하는 즉시 UI를 점진적으로 렌더링합니다. 사용자는 응답 완료를 기다리지 않아도 됩니다.
- **컴포넌트 라이브러리**: Zod 스키마로 정의된 타입 안전한 컴포넌트 집합. 차트, 폼, 테이블, 레이아웃 등을 기본 제공합니다.
- **생성과 실행의 분리**: LLM이 UI를 한 번 생성하면, 이후 데이터 페칭·상태 관리·사용자 이벤트 처리는 LLM 개입 없이 독립적으로 실행됩니다.

---

## 사용 시나리오

| 적합한 경우 | 적합하지 않은 경우 |
|------------|-------------------|
| AI 어시스턴트가 동적으로 UI를 생성해야 하는 경우 | 정적인 UI가 필요한 경우 |
| 채팅 인터페이스에 인터랙티브 카드·차트를 표시할 때 | React 이외 환경(Angular, Vue 등) |
| LLM 응답을 구조화된 UI로 표현해야 할 때 | 백엔드 전용 API 서버 |
| 생성형 대시보드, CRUD 인터페이스를 빠르게 구축할 때 | 복잡한 커스텀 애니메이션이 필요한 경우 |

---

## 패키지 구조

| 패키지 | 역할 |
|--------|------|
| `@openuidev/react-lang` | 핵심 런타임 — 컴포넌트 정의, 파서, 렌더러, 프롬프트 생성 |
| `@openuidev/react-headless` | 헤드리스 채팅 상태 관리 및 스트리밍 어댑터 |
| `@openuidev/react-ui` | 사전 빌드된 채팅 레이아웃 및 컴포넌트 라이브러리 |
| `@openuidev/cli` | 앱 스캐폴딩 및 시스템 프롬프트 생성 도구 |

---

## 빠른 시작

```bash
npx @openuidev/cli@latest create --name my-genui-app
cd my-genui-app
echo "OPENAI_API_KEY=sk-your-key-here" > .env
npm run dev
```

**결과**: `http://localhost:3000`에서 GenUI 채팅 앱이 즉시 실행됩니다.

> [!tip] 처음 시작할 때
> OpenAI 호환 API를 제공하는 서비스(OpenRouter, Azure OpenAI 등)를 사용할 수 있습니다.

---

## 토큰 효율성

7가지 UI 시나리오 기준 측정 결과:

| 비교 대상 | 토큰 절감률 |
|-----------|------------|
| Vercel JSON-Render 방식 | **-52.8%** |
| Thesys C1 JSON 방식 | **-51.7%** |

---

## 통합 & 연결

- **아키텍처 이해**: 파이프라인 전체 흐름 → [[OpenUI 아키텍처]]
- **빠른 시작**: 1분 안에 실행 → [빠른 시작](quickstart.md)
- **개요**: 4가지 핵심 구성요소 → [개요](overview.md)
- **Chat SDK**: 채팅 인터페이스 구축 → [Chat SDK 소개](chat-introduction.md)

---

## 주의사항 & 한계

> [!warning] 알려진 제약
> React 기반 프레임워크(Next.js, Remix 등)에서만 동작합니다. React Native는 별도 예제(`examples/openui-react-native`)를 참고하세요.

> [!note] 업데이트 이력
> OpenUI Lang v0.5가 최신 버전으로 반응형 상태(State), 쿼리(Query), 뮤테이션(Mutation)을 지원합니다. (2026-05-15 기준)

---

## 참고 링크

- [공식 문서: OpenUI 소개](https://www.openui.com/docs/openui-lang) (2026-05-15)
- [GitHub: thesysdev/openui](https://github.com/thesysdev/openui) (2026-05-15)
- [thesys.dev 블로그: OpenUI 소개](https://www.thesys.dev/blogs/openui) (2026-05-15)
