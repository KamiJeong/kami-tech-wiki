---
title: "OpenUI Introduction"
aliases: ["openui-intro", "generative-ui-framework"]
tags: [openui, generative-ui, introduction]
category: tool
language: en
date_created: 2026-05-15
date_modified: 2026-05-15
source_count: 0
related: [overview, quickstart, architecture]
status: active
---

# OpenUI Introduction

> A full-stack Generative UI framework designed for LLMs to generate UI directly. Renders streaming UI with up to 67% fewer tokens than JSON.

**Official Docs**: [https://www.openui.com/docs/openui-lang](https://www.openui.com/docs/openui-lang)

---

## Key Concepts

- **OpenUI Lang**: A compact, streaming-first language for LLMs to generate UI. Represents the same UI with far fewer tokens than JSON.
- **Streaming Rendering**: Progressively renders UI as model response tokens arrive — users don't wait for the full response.
- **Component Library**: A type-safe set of components defined with Zod schemas. Includes charts, forms, tables, layouts, and more out of the box.
- **Separation of Generation and Execution**: Once the LLM generates UI, data fetching, state management, and user event handling run independently without further LLM involvement.

---

## Use Cases

| Good fit | Not a good fit |
|----------|---------------|
| AI assistant dynamically generating UI | Static UI requirements |
| Displaying interactive cards/charts in chat | Non-React environments (Angular, Vue, etc.) |
| Rendering LLM responses as structured UI | Backend-only API servers |
| Rapidly building generative dashboards and CRUD interfaces | Complex custom animations |

---

## Package Structure

| Package | Role |
|---------|------|
| `@openuidev/react-lang` | Core runtime — component definitions, parser, renderer, prompt generation |
| `@openuidev/react-headless` | Headless chat state management and streaming adapters |
| `@openuidev/react-ui` | Pre-built chat layouts and component library |
| `@openuidev/cli` | App scaffolding and system prompt generation tool |

---

## Quick Start

```bash
npx @openuidev/cli@latest create --name my-genui-app
cd my-genui-app
echo "OPENAI_API_KEY=sk-your-key-here" > .env
npm run dev
```

**Result**: A GenUI chat app runs immediately at `http://localhost:3000`.

> [!tip] Getting Started
> You can use any OpenAI-compatible API service (OpenRouter, Azure OpenAI, etc.).

---

## Token Efficiency

Measured across 7 UI scenarios:

| Comparison | Token savings |
|-----------|--------------|
| vs Vercel JSON-Render | **-52.8%** |
| vs Thesys C1 JSON | **-51.7%** |

---

## Links & Integration

- **Understand the architecture**: Full pipeline flow → [[OpenUI Architecture]]
- **Get started in 1 minute**: [Quick Start](quickstart.md)
- **Core components**: [Overview](overview.md)
- **Build chat interfaces**: [Chat SDK Introduction](chat-introduction.md)

---

## Caveats & Limitations

> [!warning] Known Constraints
> Only works with React-based frameworks (Next.js, Remix, etc.). For React Native, see the separate example (`examples/openui-react-native`).

> [!note] Version Notes
> OpenUI Lang v0.5 is the latest version, supporting reactive state, queries, and mutations. (as of 2026-05-15)

---

## References

- [Official Docs: OpenUI Introduction](https://www.openui.com/docs/openui-lang) (2026-05-15)
- [GitHub: thesysdev/openui](https://github.com/thesysdev/openui) (2026-05-15)
- [thesys.dev Blog: Introducing OpenUI](https://www.thesys.dev/blogs/openui) (2026-05-15)
