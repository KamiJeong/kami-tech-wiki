---
title: "예제: Vercel AI Chat"
aliases: ["openui-vercel-example", "openui-nextjs-example"]
tags: [openui, example, vercel, nextjs, ai-sdk]
category: tool
language: ko
date_created: 2026-05-15
date_modified: 2026-05-15
source_count: 0
related: [quickstart, chat-introduction, chat-genui]
status: active
---

# 예제: Vercel AI Chat

> Vercel AI SDK를 전송 계층으로, OpenUI를 프레젠테이션 계층으로 사용하는 완전한 Next.js 채팅 앱 예제입니다.

**공식 문서**: [https://www.openui.com/docs/openui-lang/examples/vercel-ai-chat](https://www.openui.com/docs/openui-lang/examples/vercel-ai-chat)
**GitHub**: [examples/openui-chat](https://github.com/thesysdev/openui/tree/main/examples/openui-chat)

---

## 핵심 개념

- **Vercel AI SDK**: 스트리밍 전송 계층. `ai`, `@ai-sdk/react`, `@ai-sdk/openai` 패키지 사용.
- **OpenUI**: 프레젠테이션 계층. LLM 응답을 구조화된 UI 컴포넌트로 렌더링.
- **멀티 스텝 도구 호출**: 복잡한 작업을 여러 단계 도구 호출로 처리.
- **대화 스레딩**: localStorage 기반 멀티 스레드 대화 관리.

---

## 사용 시나리오

| 적합한 경우 | 적합하지 않은 경우 |
|------------|-------------------|
| Vercel AI SDK와 OpenUI를 함께 사용할 때 | Vercel AI SDK 없이 OpenAI 직접 연동 시 |
| Next.js 앱에서 채팅 UI를 구현할 때 | React 이외 프레임워크 |
| 멀티 스레드 대화가 필요할 때 | 단순 단일 응답 UI |

---

## 프로젝트 구조

```
examples/openui-chat/
├── src/
│   ├── app/
│   │   ├── api/chat/route.ts      # OpenAI 스트리밍 백엔드
│   │   └── page.tsx               # 채팅 UI 페이지
│   ├── components/
│   │   └── chat/                  # 채팅 UI 컴포넌트
│   ├── hooks/
│   │   ├── useTheme.ts            # 라이트/다크 테마 감지
│   │   └── useThread.ts           # 스레드 관리
│   ├── lib/
│   │   ├── tools.ts               # 도구 정의
│   │   └── store.ts               # localStorage 스레드 스토어
│   └── generated/
│       └── system-prompt.txt      # 자동 생성된 시스템 프롬프트
└── package.json
```

---

## 핵심 통합 코드

```tsx
// app/api/chat/route.ts
import { createLibrary, openuiChatLibrary } from "@openuidev/react-lang";
import { streamText } from "ai";
import { openai } from "@ai-sdk/openai";

const library = createLibrary(openuiChatLibrary);

export async function POST(req: Request) {
  const { messages } = await req.json();

  const result = await streamText({
    model: openai("gpt-4o"),
    system: library.prompt(),
    messages,
    maxSteps: 5, // 멀티 스텝 도구 호출
  });

  return result.toDataStreamResponse();
}
```

---

## 주요 기능

- **자동 라이트/다크 테마**: 시스템 설정을 감지하여 자동 전환
- **대화 스레딩**: localStorage에 여러 대화를 저장하고 전환
- **멀티 스텝 도구 호출**: `maxSteps: 5` 설정으로 복잡한 작업 처리
- **OpenUI 렌더링**: LLM 응답이 OpenUI Lang이면 인터랙티브 카드/차트/폼으로 표시

---

## 다른 예제들

| 예제 | 설명 |
|------|------|
| `examples/openui-chat` | 이 문서의 Vercel AI 기반 전체 예제 |
| `examples/shadcn-chat` | shadcn/ui 통합 예제 |
| `examples/openui-react-native` | React Native (Expo) + Next.js API 예제 |

---

## 통합 & 연결

- [[OpenUI 빠른 시작]] — CLI 스캐폴딩으로 유사 앱 생성
- [Chat SDK 소개](chat-introduction.md) — `@openuidev/react-headless` 상세
- [Chat GenUI](chat-genui.md) — `openuiChatLibrary` 컴포넌트 상세

---

## 참고 링크

- [공식 문서: Vercel AI Chat Example](https://www.openui.com/docs/openui-lang/examples/vercel-ai-chat) (2026-05-15)
- [GitHub: examples/openui-chat](https://github.com/thesysdev/openui/tree/main/examples/openui-chat) (2026-05-15)
- [Vercel AI SDK 문서](https://sdk.vercel.ai/docs) (2026-05-15)
