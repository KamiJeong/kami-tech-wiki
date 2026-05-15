---
title: "OpenUI Chat SDK 소개"
aliases: ["openui-chat-sdk", "openui-chat"]
tags: [openui, chat-sdk, streaming, headless]
category: tool
language: ko
date_created: 2026-05-15
date_modified: 2026-05-15
source_count: 0
related: [chat-genui, api-reference-react-ui, introduction]
status: active
---

# OpenUI Chat SDK 소개

> 프로덕션 준비가 완료된 채팅 UI 빌딩 블록. 헤드리스 상태 관리부터 완성된 레이아웃 컴포넌트까지 제공합니다.

**공식 문서**: [https://www.openui.com/docs/chat](https://www.openui.com/docs/chat)

---

## 핵심 개념

- **헤드리스 채팅 상태**: `@openuidev/react-headless`가 UI 없이 채팅 상태, 스트리밍, 스레드를 관리합니다.
- **스트리밍 어댑터**: OpenAI 스트리밍 프로토콜과 AG-UI 프로토콜 모두 지원합니다.
- **레이아웃 컴포넌트**: `@openuidev/react-ui`가 FullScreen, Copilot, BottomTray 세 가지 즉시 사용 가능한 레이아웃을 제공합니다.
- **AG-UI 프로토콜**: 자율 에이전트와 인터랙티브 인터페이스를 연결하는 확장 프로토콜.

---

## 사용 시나리오

| 적합한 경우 | 적합하지 않은 경우 |
|------------|-------------------|
| AI 채팅 인터페이스를 빠르게 구축할 때 | 완전 커스텀 채팅 UI가 필요할 때 |
| 기존 앱에 코파일럿 UI를 추가할 때 | React 이외 프레임워크 |
| 스트리밍 응답이 포함된 채팅이 필요할 때 | 단순 Q&A (스트리밍 불필요) |

---

## 패키지 구조

### @openuidev/react-headless

헤드리스 채팅 상태 관리 패키지:

| 기능 | 설명 |
|------|------|
| `ChatProvider` | 컨텍스트 공급자 |
| `useThread` | 현재 스레드 상태 훅 |
| `useMessages` | 메시지 목록 훅 |
| 스트리밍 어댑터 | OpenAI, AG-UI 프로토콜 지원 |
| 메시지 포맷 변환기 | 텍스트 델타 자동 처리 |

### @openuidev/react-ui

완성된 UI 레이아웃 패키지:

| 레이아웃 | 설명 |
|----------|------|
| `FullScreen` | 스레드 사이드바가 있는 풀페이지 채팅 |
| `Copilot` | 메인 앱 옆에 표시되는 사이드 채팅 |
| `BottomTray` | 플로팅/접을 수 있는 채팅 트레이 |

---

## 빠른 시작

```tsx
import { ChatProvider } from "@openuidev/react-headless";
import { FullScreen } from "@openuidev/react-ui";

function App() {
  return (
    <ChatProvider apiUrl="/api/chat">
      <FullScreen
        agentName="AI 어시스턴트"
        welcomeMessage="무엇을 도와드릴까요?"
      />
    </ChatProvider>
  );
}
```

**결과**: 스레드 사이드바가 포함된 풀페이지 채팅 인터페이스가 즉시 렌더링됩니다.

> [!tip] 처음 시작할 때
> `@openuidev/cli`로 스캐폴딩하면 Chat SDK가 미리 통합된 앱이 생성됩니다.

---

## 스트리밍 처리 흐름

```
사용자 입력
    ↓
ChatProvider (상태 관리)
    ↓
스트리밍 어댑터 (OpenAI/AG-UI)
    ↓
텍스트 델타 수신 → 낙관적 업데이트
    ↓
OpenUI Renderer (생성형 UI 렌더링)
    ↓
완료 메시지 확정
```

---

## 통합 & 연결

- [[Chat GenUI]] — `openuiChatLibrary` 채팅 최적화 컴포넌트
- [API 레퍼런스: react-ui](api-reference-react-ui.md) — 레이아웃 컴포넌트 API 상세
- [Vercel AI Chat 예제](example-vercel-ai-chat.md) — 실제 통합 예제
- [[OpenUI 소개]] — 전체 프레임워크 개요

---

## 주의사항 & 한계

> [!warning] 알려진 제약
> AG-UI 프로토콜은 에이전트 프레임워크 통합이 필요합니다. 일반 OpenAI 스트리밍은 기본 어댑터로 즉시 사용 가능합니다.

> [!note] 업데이트 이력
> AG-UI 프로토콜 지원이 추가되어 자율 에이전트와의 연결이 가능해졌습니다. (2026-05-15 기준)

---

## 참고 링크

- [공식 문서: Chat SDK](https://www.openui.com/docs/chat) (2026-05-15)
- [GitHub: thesysdev/openui](https://github.com/thesysdev/openui) (2026-05-15)
