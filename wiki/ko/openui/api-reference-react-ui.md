---
title: "@openuidev/react-ui API"
aliases: ["openui-react-ui", "openui-layout-components"]
tags: [openui, api-reference, react, ui-components, layout]
category: reference
language: ko
date_created: 2026-05-15
date_modified: 2026-05-15
source_count: 0
related: [api-reference-overview, chat-introduction, chat-genui]
status: active
---

# @openuidev/react-ui API

> 즉시 사용 가능한 3가지 채팅 레이아웃 컴포넌트와 내장 컴포넌트 라이브러리를 제공하는 패키지입니다.

**공식 문서**: [https://www.openui.com/docs/api-reference/react-ui](https://www.openui.com/docs/api-reference/react-ui)

---

## 설치

```bash
npm install @openuidev/react-ui @openuidev/react-headless @openuidev/react-lang
```

---

## 레이아웃 컴포넌트

### FullScreen (풀스크린 채팅)

스레드 사이드바가 포함된 풀페이지 채팅 레이아웃입니다.

```tsx
import { FullScreen } from "@openuidev/react-ui";
import { ChatProvider } from "@openuidev/react-headless";

<ChatProvider apiUrl="/api/chat">
  <FullScreen
    agentName="AI 어시스턴트"
    logoUrl="/logo.png"
    welcomeMessage="무엇을 도와드릴까요?"
    conversationStarters={[
      "최신 기술 트렌드를 알려줘",
      "코드 리뷰를 부탁해",
    ]}
  />
</ChatProvider>
```

### Copilot (코파일럿)

메인 앱 화면을 유지하면서 사이드에 채팅을 표시합니다.

```tsx
<ChatProvider apiUrl="/api/chat">
  <div style={{ display: "flex" }}>
    <MainContent />
    <Copilot agentName="AI 코파일럿" />
  </div>
</ChatProvider>
```

### BottomTray (하단 트레이)

플로팅/접을 수 있는 채팅 트레이입니다.

```tsx
const [isOpen, setIsOpen] = useState(false);

<ChatProvider apiUrl="/api/chat">
  <BottomTray
    isOpen={isOpen}
    onOpenChange={setIsOpen}
    defaultOpen={false}
    agentName="도움말"
  />
</ChatProvider>
```

---

## 공통 Props

모든 레이아웃 컴포넌트가 공유하는 props:

| Prop | 타입 | 설명 |
|------|------|------|
| `agentName` | `string` | 채팅 상단에 표시되는 에이전트 이름 |
| `logoUrl` | `string?` | 로고 이미지 URL |
| `welcomeMessage` | `string?` | 첫 화면 환영 메시지 |
| `conversationStarters` | `string[]?` | 시작 질문 버튼 목록 |
| `messageLoading` | `ReactNode?` | 로딩 상태 표시 커스텀 컴포넌트 |

---

## ChatProvider Props

```tsx
<ChatProvider
  apiUrl="/api/chat"          // 백엔드 API URL
  streamProtocol="openai"     // "openai" | "ag-ui"
  messageFormat="openai"      // 메시지 포맷
  processMessage={fn}         // 커스텀 메시지 처리 함수
/>
```

---

## 내장 컴포넌트 라이브러리

| 라이브러리 | 내보내기 이름 | 용도 |
|----------|-------------|------|
| 범용 | `openuiLibrary` | 대시보드, CRUD, 일반 UI |
| 채팅 최적화 | `openuiChatLibrary` | 채팅 인터페이스 |

```tsx
import {
  openuiLibrary,
  openuiChatLibrary
} from "@openuidev/react-ui";
```

---

## 통합 & 연결

- [[OpenUI Chat SDK 소개]] — ChatProvider 및 훅 상세
- [Chat GenUI](chat-genui.md) — `openuiChatLibrary` 컴포넌트 목록
- [API 레퍼런스 개요](api-reference-overview.md) — 전체 패키지 구조

---

## 주의사항 & 한계

> [!warning] 알려진 제약
> `ChatProvider`로 감싸지 않으면 레이아웃 컴포넌트가 동작하지 않습니다. 반드시 `ChatProvider`를 부모로 배치하세요.

> [!note] 업데이트 이력
> BottomTray 컴포넌트가 추가되어 세 가지 레이아웃 옵션을 제공합니다. (2026-05-15 기준)

---

## 참고 링크

- [공식 문서: @openuidev/react-ui](https://www.openui.com/docs/api-reference/react-ui) (2026-05-15)
- [GitHub: thesysdev/openui](https://github.com/thesysdev/openui) (2026-05-15)
