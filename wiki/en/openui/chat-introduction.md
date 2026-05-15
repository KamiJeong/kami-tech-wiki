---
title: "OpenUI Chat SDK Introduction"
aliases: ["openui-chat-sdk", "openui-chat"]
tags: [openui, chat-sdk, streaming, headless]
category: tool
language: en
date_created: 2026-05-15
date_modified: 2026-05-15
source_count: 0
related: [chat-genui, api-reference-react-ui, introduction]
status: active
---

# OpenUI Chat SDK Introduction

> Production-ready chat UI building blocks — from headless state management to complete layout components.

**Official Docs**: [https://www.openui.com/docs/chat](https://www.openui.com/docs/chat)

---

## Key Concepts

- **Headless chat state**: `@openuidev/react-headless` manages chat state, streaming, and threads without any UI.
- **Streaming adapters**: Supports both the OpenAI streaming protocol and AG-UI protocol.
- **Layout components**: `@openuidev/react-ui` provides three ready-to-use layouts: FullScreen, Copilot, and BottomTray.
- **AG-UI protocol**: An extended protocol connecting autonomous agents with interactive interfaces.

---

## Use Cases

| Good fit | Not a good fit |
|----------|---------------|
| Quickly building an AI chat interface | When fully custom chat UI is needed |
| Adding a copilot UI to an existing app | Non-React frameworks |
| Chat with streaming responses | Simple Q&A (no streaming needed) |

---

## Package Structure

### @openuidev/react-headless

Headless chat state management package:

| Feature | Description |
|---------|-------------|
| `ChatProvider` | Context provider |
| `useThread` | Current thread state hook |
| `useMessages` | Message list hook |
| Streaming adapters | OpenAI and AG-UI protocol support |
| Message format converters | Automatic text delta processing |

### @openuidev/react-ui

Complete UI layout package:

| Layout | Description |
|--------|-------------|
| `FullScreen` | Full-page chat with thread sidebar |
| `Copilot` | Side chat displayed beside the main app |
| `BottomTray` | Floating / collapsible chat tray |

---

## Quick Start

```tsx
import { ChatProvider } from "@openuidev/react-headless";
import { FullScreen } from "@openuidev/react-ui";

function App() {
  return (
    <ChatProvider apiUrl="/api/chat">
      <FullScreen
        agentName="AI Assistant"
        welcomeMessage="How can I help you?"
      />
    </ChatProvider>
  );
}
```

**Result**: A full-page chat interface with a thread sidebar renders immediately.

> [!tip] Getting Started
> Scaffolding with `@openuidev/cli` creates an app with the Chat SDK pre-integrated.

---

## Streaming Flow

```
User input
    ↓
ChatProvider (state management)
    ↓
Streaming adapter (OpenAI/AG-UI)
    ↓
Text delta received → optimistic update
    ↓
OpenUI Renderer (generative UI rendering)
    ↓
Message finalized
```

---

## Links & Integration

- [[Chat GenUI]] — `openuiChatLibrary` chat-optimized components
- [API Reference: react-ui](api-reference-react-ui.md) — Layout component API details
- [Vercel AI Chat Example](example-vercel-ai-chat.md) — Real integration example
- [[OpenUI Introduction]] — Full framework overview

---

## Caveats & Limitations

> [!warning] Known Constraints
> The AG-UI protocol requires integration with an agent framework. Standard OpenAI streaming works out of the box with the default adapter.

> [!note] Version Notes
> AG-UI protocol support has been added, enabling connections to autonomous agents. (as of 2026-05-15)

---

## References

- [Official Docs: Chat SDK](https://www.openui.com/docs/chat) (2026-05-15)
- [GitHub: thesysdev/openui](https://github.com/thesysdev/openui) (2026-05-15)
