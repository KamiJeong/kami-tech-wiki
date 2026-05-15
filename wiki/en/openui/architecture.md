---
title: "OpenUI Architecture"
aliases: ["openui-architecture", "openui-how-it-works", "openui-pipeline"]
tags: [openui, architecture, pipeline, streaming]
category: concept
language: en
date_created: 2026-05-15
date_modified: 2026-05-15
source_count: 0
related: [overview, introduction, specification-v05]
status: active
---

# OpenUI Architecture

> OpenUI's core pipeline: Library → Prompt Generator → LLM → Parser → Renderer → Live UI

**Official Docs**: [https://www.openui.com/docs/openui-lang/how-it-works](https://www.openui.com/docs/openui-lang/how-it-works)

![OpenUI Demo — Generative UI Streaming Rendering](https://raw.githubusercontent.com/thesysdev/openui/main/assets/demo.gif)

---

## Overview

OpenUI adopts an architecture where the LLM generates UI, and the generated UI then **runs independently without further LLM involvement**. This separation is the key design principle for achieving both performance and cost efficiency.

---

## Pipeline Diagram

```
┌─────────────────┐
│  Component      │
│  Library        │  ← Zod schemas + React renderers
│  (Definition)   │
└────────┬────────┘
         │ library.prompt()
         ▼
┌─────────────────┐
│  System Prompt  │  ← Auto-generated LLM instructions
│  Generation     │
└────────┬────────┘
         │ system prompt + user input
         ▼
┌─────────────────┐
│  LLM            │  ← GPT-4o, Claude, other OpenAI-compatible models
│  (Generation)   │
└────────┬────────┘
         │ OpenUI Lang stream (line by line)
         ▼
┌─────────────────┐
│  Parser         │  ← Line-by-line streaming parse
│                 │
└────────┬────────┘
         │ parsed component tree
         ▼
┌─────────────────┐
│  Renderer       │  ← <Renderer /> React component
│  (Execution)    │
└────────┬────────┘
         │ data fetching / state management / event handling
         ▼
┌─────────────────┐
│  Live UI        │  ← Interactive UI shown to the user
└─────────────────┘
```

---

## Core Principles

### 1. Library (Definition Phase)

Defines the "contract" for components.

- **Zod schemas**: Define props types for each component.
- **React renderers**: Define how each component renders.
- The library is the **single source of truth**: both prompt generation and rendering derive from these definitions.

### 2. Parser (Streaming Processing)

Parses the LLM stream in real time.

- **Line-by-line**: Parses immediately when a complete line arrives — no waiting for the full response.
- **Robustness**: Automatically excludes invalid output and renders only valid parts.
- **Async**: Parsing and rendering proceed simultaneously.

### 3. Renderer (Execution Phase)

Converts parsed results into React UI.

- Used as `<Renderer library={library} stream={stream} />`.
- **Positional argument mapping**: Maps parsed positional arguments to components following Zod schema key order.
- **Independent execution**: After LLM generation, the UI operates independently:
  - Data fetching (query execution)
  - Reactive state management
  - User event handling (clicks, inputs, etc.)

---

## Example Usage

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
      // UI runs independently without LLM
    />
  );
}
```

---

## Comparison

| Aspect | OpenUI Architecture | Traditional Server Rendering |
|--------|---------------------|------------------------------|
| UI generator | LLM | Developer (code) |
| Streaming | Line-by-line progressive rendering | Display after full completion |
| LLM dependency | Generation phase only | None |
| Interactivity | Runs independently after generation | Always independent |

---

## Links & Integration

- [[OpenUI Overview]] — Summary of 4 core components
- [Specification v0.5](specification-v05.md) — OpenUI Lang syntax (the language the parser parses)
- [System Prompts](system-prompts.md) — Prompt generator details
- [[OpenUI API Reference]] — Per-package API

---

## Caveats & Limitations

> [!warning] Known Constraints
> The Renderer only works in React environments. The parser (`@openuidev/lang-core`) can be used without React, but rendering requires React.

---

## References

- [Official Docs: How It Works](https://www.openui.com/docs/openui-lang/how-it-works) (2026-05-15)
- [GitHub: thesysdev/openui](https://github.com/thesysdev/openui) (2026-05-15)
