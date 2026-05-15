---
title: "OpenUI System Prompts"
aliases: ["openui-system-prompts", "openui-prompt-generation"]
tags: [openui, system-prompt, llm, prompt-engineering]
category: concept
language: en
date_created: 2026-05-15
date_modified: 2026-05-15
source_count: 0
related: [overview, quickstart, specification-v05]
status: active
---

# OpenUI System Prompts

> OpenUI automatically generates LLM system prompts from the component library, constraining model output to use only allowed components.

**Official Docs**: [https://www.openui.com/docs/openui-lang/system-prompts](https://www.openui.com/docs/openui-lang/system-prompts)

---

## Overview

OpenUI system prompts are not written manually. They are **automatically generated from the component library definition**. This means:

1. The model is constrained to use only the allowed components.
2. When the library changes, the prompt is updated automatically.
3. Developers don't need to maintain prompts separately.

---

## Core Principles

### Automatic Prompt Generation

Call `library.prompt()` to automatically generate the system prompt:

```ts
import { createLibrary, openuiLibrary } from "@openuidev/react-lang";

const library = createLibrary(openuiLibrary);
const systemPrompt = library.prompt();
// → Prompt containing allowed components, props, and OpenUI Lang syntax rules
```

### Two Generation Modes

| Mode | When to use | Tool |
|------|------------|------|
| **Dynamic** | Generated server-side per request | `generatePrompt` from `@openuidev/lang-core` |
| **Static** | Pre-generated at build time as a file | `@openuidev/cli` |

### Dynamic Generation for Serverless/Edge

Available in Node/Edge/serverless environments without React dependency:

```ts
import { generatePrompt } from "@openuidev/lang-core";

const systemPrompt = generatePrompt(libraryDefinition);
```

### Static Generation via CLI

```bash
npx @openuidev/cli generate-prompt --output src/generated/system-prompt.txt
```

Load the generated file statically in your backend.

---

## Example Usage

```ts
// app/api/chat/route.ts (Next.js)
import { createLibrary, openuiChatLibrary } from "@openuidev/react-lang";

const library = createLibrary(openuiChatLibrary);

export async function POST(req: Request) {
  const { messages } = await req.json();

  const response = await openai.chat.completions.create({
    model: "gpt-4o",
    messages: [
      { role: "system", content: library.prompt() }, // ← auto-generated prompt
      ...messages,
    ],
    stream: true,
  });

  return new Response(response.toReadableStream());
}
```

---

## Comparison

| Aspect | OpenUI Auto-generated | Manually Written |
|--------|----------------------|-----------------|
| Maintenance | Auto-reflected on library changes | Manual updates needed |
| Consistency | Always in sync with code | Risk of divergence |
| Token efficiency | Optimized | Depends on author |
| Customization | Limited | Fully flexible |

---

## Links & Integration

- [[OpenUI Overview]] — Prompt Generator stage explained
- [Specification v0.5](specification-v05.md) — OpenUI Lang syntax (rules included in the prompt)
- [Quick Start](quickstart.md) — Real usage examples

---

## References

- [Official Docs: System Prompts](https://www.openui.com/docs/openui-lang/system-prompts) (2026-05-15)
- [GitHub: thesysdev/openui](https://github.com/thesysdev/openui) (2026-05-15)
