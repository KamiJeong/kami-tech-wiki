---
title: "OpenUI API Reference Overview"
aliases: ["openui-api", "openui-api-reference"]
tags: [openui, api-reference, packages]
category: reference
language: en
date_created: 2026-05-15
date_modified: 2026-05-15
source_count: 0
related: [api-reference-react-ui, chat-introduction, introduction]
status: active
---

# OpenUI API Reference Overview

> Complete API reference for OpenUI's 5 npm packages and CLI tool.

**Official Docs**: [https://www.openui.com/docs/api-reference](https://www.openui.com/docs/api-reference)

---

## Package Structure

OpenUI is composed of 5 packages separated by role:

| Package | Role | Environment |
|---------|------|-------------|
| `@openuidev/react-lang` | Core runtime (component definitions, parser, renderer, prompt generation) | React |
| `@openuidev/lang-core` | Lightweight core without React (prompt generation, parsing) | Node/Edge/Serverless |
| `@openuidev/react-headless` | Headless chat state, streaming adapters | React |
| `@openuidev/react-ui` | Complete chat layouts and component library | React |
| `@openuidev/cli` | App scaffolding and system prompt generation tool | CLI |

---

## @openuidev/react-lang (Core Runtime)

The most essential package. Handles component definitions, parsing, and rendering.

```ts
import {
  createLibrary,    // Create a component library
  Renderer,         // Streaming rendering component
  openuiLibrary,    // General-purpose built-in library
  openuiChatLibrary // Chat-optimized built-in library
} from "@openuidev/react-lang";
```

**Key APIs**:
- `createLibrary(components)` — Create a library from component definitions
- `library.prompt()` — Auto-generate a system prompt
- `<Renderer library={lib} stream={stream} />` — Streaming rendering

---

## @openuidev/lang-core (Lightweight Core)

Use in Node/Edge/serverless environments without React dependency.

```ts
import { generatePrompt } from "@openuidev/lang-core";

// Generate prompt in backend without React
const systemPrompt = generatePrompt(libraryDefinition);
```

---

## @openuidev/react-headless (Headless Chat)

```ts
import {
  ChatProvider,  // Chat context provider
  useThread,     // Thread state hook
  useMessages,   // Message list hook
} from "@openuidev/react-headless";
```

**Streaming adapters**:
- OpenAI streaming protocol
- AG-UI protocol (autonomous agent connection)

---

## @openuidev/cli (CLI Tool)

```bash
# App scaffolding
npx @openuidev/cli@latest create --name my-app

# Pre-generate system prompt
npx @openuidev/cli generate-prompt --output src/generated/system-prompt.txt
```

---

## Links & Integration

- [@openuidev/react-ui details](api-reference-react-ui.md) — Layout component API
- [[OpenUI Chat SDK]] — react-headless usage guide
- [[OpenUI Overview]] — Role and relationship of each package
- [System Prompts](system-prompts.md) — Prompt generation API guide

---

## Caveats & Limitations

> [!warning] Known Constraints
> `@openuidev/react-lang` and `@openuidev/react-ui` require React. Use `@openuidev/lang-core` when only generating prompts on the server side.

---

## References

- [Official Docs: API Reference](https://www.openui.com/docs/api-reference) (2026-05-15)
- [npm: @openuidev](https://www.npmjs.com/search?q=%40openuidev) (2026-05-15)
- [GitHub: thesysdev/openui](https://github.com/thesysdev/openui) (2026-05-15)
