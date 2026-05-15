---
title: "@openuidev/react-ui API"
aliases: ["openui-react-ui", "openui-layout-components"]
tags: [openui, api-reference, react, ui-components, layout]
category: reference
language: en
date_created: 2026-05-15
date_modified: 2026-05-15
source_count: 0
related: [api-reference-overview, chat-introduction, chat-genui]
status: active
---

# @openuidev/react-ui API

> A package providing 3 ready-to-use chat layout components and a built-in component library.

**Official Docs**: [https://www.openui.com/docs/api-reference/react-ui](https://www.openui.com/docs/api-reference/react-ui)

---

## Installation

```bash
npm install @openuidev/react-ui @openuidev/react-headless @openuidev/react-lang
```

---

## Layout Components

### FullScreen (Full-Screen Chat)

A full-page chat layout with a thread sidebar.

```tsx
import { FullScreen } from "@openuidev/react-ui";
import { ChatProvider } from "@openuidev/react-headless";

<ChatProvider apiUrl="/api/chat">
  <FullScreen
    agentName="AI Assistant"
    logoUrl="/logo.png"
    welcomeMessage="How can I help you?"
    conversationStarters={[
      "What are the latest tech trends?",
      "Please review my code",
    ]}
  />
</ChatProvider>
```

### Copilot

Displays chat on the side while keeping the main app visible.

```tsx
<ChatProvider apiUrl="/api/chat">
  <div style={{ display: "flex" }}>
    <MainContent />
    <Copilot agentName="AI Copilot" />
  </div>
</ChatProvider>
```

### BottomTray

A floating/collapsible chat tray.

```tsx
const [isOpen, setIsOpen] = useState(false);

<ChatProvider apiUrl="/api/chat">
  <BottomTray
    isOpen={isOpen}
    onOpenChange={setIsOpen}
    defaultOpen={false}
    agentName="Help"
  />
</ChatProvider>
```

---

## Common Props

Props shared by all layout components:

| Prop | Type | Description |
|------|------|-------------|
| `agentName` | `string` | Agent name displayed at the top of chat |
| `logoUrl` | `string?` | Logo image URL |
| `welcomeMessage` | `string?` | Welcome message on the first screen |
| `conversationStarters` | `string[]?` | Starter question button list |
| `messageLoading` | `ReactNode?` | Custom component for loading state |

---

## ChatProvider Props

```tsx
<ChatProvider
  apiUrl="/api/chat"          // Backend API URL
  streamProtocol="openai"     // "openai" | "ag-ui"
  messageFormat="openai"      // Message format
  processMessage={fn}         // Custom message processing function
/>
```

---

## Built-in Component Libraries

| Library | Export name | Use |
|---------|------------|-----|
| General-purpose | `openuiLibrary` | Dashboards, CRUD, general UI |
| Chat-optimized | `openuiChatLibrary` | Chat interfaces |

```tsx
import {
  openuiLibrary,
  openuiChatLibrary
} from "@openuidev/react-ui";
```

---

## Links & Integration

- [[OpenUI Chat SDK Introduction]] — ChatProvider and hooks details
- [Chat GenUI](chat-genui.md) — `openuiChatLibrary` component list
- [API Reference Overview](api-reference-overview.md) — Full package structure

---

## Caveats & Limitations

> [!warning] Known Constraints
> Layout components will not work unless wrapped with `ChatProvider`. Always place `ChatProvider` as the parent.

> [!note] Version Notes
> The BottomTray component has been added, providing three layout options. (as of 2026-05-15)

---

## References

- [Official Docs: @openuidev/react-ui](https://www.openui.com/docs/api-reference/react-ui) (2026-05-15)
- [GitHub: thesysdev/openui](https://github.com/thesysdev/openui) (2026-05-15)
