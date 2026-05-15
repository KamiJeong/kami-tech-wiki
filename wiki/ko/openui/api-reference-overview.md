---
title: "OpenUI API 레퍼런스 개요"
aliases: ["openui-api", "openui-api-reference"]
tags: [openui, api-reference, packages]
category: reference
language: ko
date_created: 2026-05-15
date_modified: 2026-05-15
source_count: 0
related: [api-reference-react-ui, chat-introduction, introduction]
status: active
---

# OpenUI API 레퍼런스 개요

> OpenUI의 5개 npm 패키지와 CLI 도구에 대한 전체 API 참조입니다.

**공식 문서**: [https://www.openui.com/docs/api-reference](https://www.openui.com/docs/api-reference)

---

## 패키지 구성

OpenUI는 역할별로 분리된 5개 패키지로 구성됩니다:

| 패키지 | 역할 | 환경 |
|--------|------|------|
| `@openuidev/react-lang` | 핵심 런타임 (컴포넌트 정의, 파서, 렌더러, 프롬프트 생성) | React |
| `@openuidev/lang-core` | React 없는 경량 코어 (프롬프트 생성, 파싱) | Node/Edge/서버리스 |
| `@openuidev/react-headless` | 헤드리스 채팅 상태, 스트리밍 어댑터 | React |
| `@openuidev/react-ui` | 완성된 채팅 레이아웃 및 컴포넌트 라이브러리 | React |
| `@openuidev/cli` | 앱 스캐폴딩 및 시스템 프롬프트 생성 도구 | CLI |

---

## @openuidev/react-lang (핵심 런타임)

가장 핵심적인 패키지. 컴포넌트 정의, 파싱, 렌더링을 담당합니다.

```ts
import {
  createLibrary,    // 컴포넌트 라이브러리 생성
  Renderer,         // 스트리밍 렌더링 컴포넌트
  openuiLibrary,    // 범용 내장 라이브러리
  openuiChatLibrary // 채팅 최적화 내장 라이브러리
} from "@openuidev/react-lang";
```

**주요 API**:
- `createLibrary(components)` — 컴포넌트 정의로 라이브러리 생성
- `library.prompt()` — 시스템 프롬프트 자동 생성
- `<Renderer library={lib} stream={stream} />` — 스트리밍 렌더링

---

## @openuidev/lang-core (경량 코어)

React 의존성 없이 Node/Edge/서버리스 환경에서 사용합니다.

```ts
import { generatePrompt } from "@openuidev/lang-core";

// 백엔드에서 React 없이 프롬프트 생성
const systemPrompt = generatePrompt(libraryDefinition);
```

---

## @openuidev/react-headless (헤드리스 채팅)

```ts
import {
  ChatProvider,  // 채팅 컨텍스트 공급자
  useThread,     // 스레드 상태 훅
  useMessages,   // 메시지 목록 훅
} from "@openuidev/react-headless";
```

**스트리밍 어댑터**:
- OpenAI 스트리밍 프로토콜
- AG-UI 프로토콜 (자율 에이전트 연결)

---

## @openuidev/cli (CLI 도구)

```bash
# 앱 스캐폴딩
npx @openuidev/cli@latest create --name my-app

# 시스템 프롬프트 사전 생성
npx @openuidev/cli generate-prompt --output src/generated/system-prompt.txt
```

---

## 통합 & 연결

- [@openuidev/react-ui 상세](api-reference-react-ui.md) — 레이아웃 컴포넌트 API
- [[OpenUI Chat SDK]] — react-headless 사용 가이드
- [[OpenUI 개요]] — 각 패키지의 역할 및 관계
- [시스템 프롬프트](system-prompts.md) — 프롬프트 생성 API 사용 가이드

---

## 주의사항 & 한계

> [!warning] 알려진 제약
> `@openuidev/react-lang`과 `@openuidev/react-ui`는 React 필수입니다. 서버사이드에서 프롬프트만 생성할 경우 `@openuidev/lang-core`를 사용하세요.

---

## 참고 링크

- [공식 문서: API Reference](https://www.openui.com/docs/api-reference) (2026-05-15)
- [npm: @openuidev](https://www.npmjs.com/search?q=%40openuidev) (2026-05-15)
- [GitHub: thesysdev/openui](https://github.com/thesysdev/openui) (2026-05-15)
