---
title: "OpenUI Quick Start"
aliases: ["openui-quickstart", "openui-getting-started"]
tags: [openui, quickstart, getting-started]
category: tool
language: en
date_created: 2026-05-15
date_modified: 2026-05-15
source_count: 0
related: [introduction, overview, system-prompts]
status: active
---

# OpenUI Quick Start

> Run a GenUI chat app in under 1 minute with a single `npx @openuidev/cli@latest create` command.

**Official Docs**: [https://www.openui.com/docs/openui-lang/quickstart](https://www.openui.com/docs/openui-lang/quickstart)

---

## Key Concepts

- **CLI Scaffolding**: `@openuidev/cli` automatically generates the full structure of a Next.js-based GenUI app.
- **Ready to Run**: The generated app includes a chat layout, OpenAI backend route, and system prompt out of the box.
- **OpenAI Compatible**: Works with OpenAI API as well as compatible services like OpenRouter and Azure OpenAI.

---

## Use Cases

| Good fit | Not a good fit |
|----------|---------------|
| Quickly prototyping a GenUI app | Integrating into an existing Next.js app (manual install recommended) |
| First-time exploration of OpenUI features | Custom framework usage |
| When you need a demo app | Production builds already optimized |

---

## Quick Start

### Method 1: CLI Scaffolding (Recommended)

```bash
# 1. Create the app
npx @openuidev/cli@latest create --name genui-chat-app

# 2. Enter the directory
cd genui-chat-app

# 3. Set your API key
echo "OPENAI_API_KEY=sk-your-key-here" > .env

# 4. Start the dev server
npm run dev
```

**Result**: A ready-to-use GenUI chat app opens at `http://localhost:3000`.

### Method 2: Direct Package Install

To add OpenUI to an existing project:

```bash
npm install @openuidev/react-lang @openuidev/react-ui
```

---

## Generated App Structure

The default Next.js app structure created by the CLI:

```
genui-chat-app/
├── src/
│   ├── app/
│   │   ├── api/chat/route.ts   # OpenAI streaming backend
│   │   └── page.tsx            # Chat UI page
│   └── generated/
│       └── system-prompt.txt   # Auto-generated system prompt
├── .env                        # API key (OPENAI_API_KEY)
└── package.json
```

> [!tip] Getting Started
> Just set `OPENAI_API_KEY` in the `.env` file and it works immediately. When using OpenRouter, also set `OPENAI_BASE_URL`.

---

## Links & Integration

- **Framework overview**: [Introduction](introduction.md)
- **Customize system prompts**: [System Prompts](system-prompts.md)
- **Advanced chat UI**: [Chat SDK Introduction](chat-introduction.md)
- **Full example**: [[Vercel AI Chat Example]]

---

## Caveats & Limitations

> [!warning] Known Constraints
> CLI scaffolding only generates Next.js-based apps. For other frameworks, install packages manually and configure them yourself.

> [!note] Version Notes
> Always use `npx @openuidev/cli@latest` to get the latest CLI version. (2026-05-15)

---

## References

- [Official Docs: Quick Start](https://www.openui.com/docs/openui-lang/quickstart) (2026-05-15)
- [GitHub: openui-chat example](https://github.com/thesysdev/openui/tree/main/examples/openui-chat) (2026-05-15)
