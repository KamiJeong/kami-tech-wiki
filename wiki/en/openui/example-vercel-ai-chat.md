---
title: "Example: Vercel AI Chat"
aliases: ["openui-vercel-example", "openui-nextjs-example"]
tags: [openui, example, vercel, nextjs, ai-sdk]
category: tool
language: en
date_created: 2026-05-15
date_modified: 2026-05-15
source_count: 0
related: [quickstart, chat-introduction, chat-genui]
status: active
---

# Example: Vercel AI Chat

> A complete Next.js chat app example using Vercel AI SDK as the transport layer and OpenUI as the presentation layer.

**Official Docs**: [https://www.openui.com/docs/openui-lang/examples/vercel-ai-chat](https://www.openui.com/docs/openui-lang/examples/vercel-ai-chat)
**GitHub**: [examples/openui-chat](https://github.com/thesysdev/openui/tree/main/examples/openui-chat)

---

## Key Concepts

- **Vercel AI SDK**: Streaming transport layer using `ai`, `@ai-sdk/react`, `@ai-sdk/openai` packages.
- **OpenUI**: Presentation layer. Renders LLM responses as structured UI components.
- **Multi-step tool calls**: Handles complex tasks through multi-step tool calls.
- **Conversation threading**: localStorage-based multi-thread conversation management.

---

## Use Cases

| Good fit | Not a good fit |
|----------|---------------|
| Using Vercel AI SDK and OpenUI together | Direct OpenAI integration without Vercel AI SDK |
| Building chat UI in a Next.js app | Non-React frameworks |
| When multi-thread conversations are needed | Simple single-response UI |

---

## Project Structure

```
examples/openui-chat/
├── src/
│   ├── app/
│   │   ├── api/chat/route.ts      # OpenAI streaming backend
│   │   └── page.tsx               # Chat UI page
│   ├── components/
│   │   └── chat/                  # Chat UI components
│   ├── hooks/
│   │   ├── useTheme.ts            # Light/dark theme detection
│   │   └── useThread.ts           # Thread management
│   ├── lib/
│   │   ├── tools.ts               # Tool definitions
│   │   └── store.ts               # localStorage thread store
│   └── generated/
│       └── system-prompt.txt      # Auto-generated system prompt
└── package.json
```

---

## Core Integration Code

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
    maxSteps: 5, // multi-step tool calls
  });

  return result.toDataStreamResponse();
}
```

---

## Key Features

- **Auto light/dark theme**: Detects system settings and switches automatically
- **Conversation threading**: Saves multiple conversations in localStorage and switches between them
- **Multi-step tool calls**: Handles complex tasks with `maxSteps: 5`
- **OpenUI rendering**: When LLM responses contain OpenUI Lang, displays as interactive cards/charts/forms

---

## Other Examples

| Example | Description |
|---------|-------------|
| `examples/openui-chat` | Full Vercel AI-based example (this document) |
| `examples/shadcn-chat` | shadcn/ui integration example |
| `examples/openui-react-native` | React Native (Expo) + Next.js API example |

---

## Links & Integration

- [[OpenUI Quick Start]] — Create a similar app with CLI scaffolding
- [Chat SDK Introduction](chat-introduction.md) — `@openuidev/react-headless` details
- [Chat GenUI](chat-genui.md) — `openuiChatLibrary` component details

---

## References

- [Official Docs: Vercel AI Chat Example](https://www.openui.com/docs/openui-lang/examples/vercel-ai-chat) (2026-05-15)
- [GitHub: examples/openui-chat](https://github.com/thesysdev/openui/tree/main/examples/openui-chat) (2026-05-15)
- [Vercel AI SDK Docs](https://sdk.vercel.ai/docs) (2026-05-15)
