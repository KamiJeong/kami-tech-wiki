---
title: "OpenUI Benchmarks"
aliases: ["openui-benchmarks", "openui-token-efficiency"]
tags: [openui, benchmark, token, performance]
category: concept
language: en
date_created: 2026-05-15
date_modified: 2026-05-15
source_count: 0
related: [introduction, overview, specification-v05]
status: active
---

# OpenUI Benchmarks

> Based on `tiktoken` (GPT-5 encoder), OpenUI Lang uses up to 67% fewer tokens than JSON-based approaches across 7 UI scenarios.

**Official Docs**: [https://www.openui.com/docs/openui-lang/benchmarks](https://www.openui.com/docs/openui-lang/benchmarks)

![OpenUI Banner — Generative UI Open Standard](https://raw.githubusercontent.com/thesysdev/openui/main/assets/banner.png)

---

## Overview

OpenUI Lang uses positional arguments and a line-oriented structure to dramatically reduce token count. The benchmarks below compare the number of tokens when generating the same UI with three different approaches.

- **Vercel JSON-Render**: Vercel's JSON-based UI generation
- **Thesys C1 JSON**: Thesys's C1 JSON approach
- **OpenUI Lang**: This framework's approach

---

## Token Count Comparison

| Scenario | Vercel JSON | C1 JSON | OpenUI Lang | vs Vercel | vs C1 |
|----------|-------------|---------|-------------|-----------|-------|
| simple-table | 340 | 357 | 148 | -56.5% | -58.5% |
| chart-with-data | 520 | 516 | 231 | -55.6% | -55.2% |
| contact-form | 893 | 849 | 294 | **-67.1%** | **-65.4%** |
| dashboard | 2247 | 2261 | 1226 | -45.4% | -45.8% |
| pricing-page | 2487 | 2379 | 1195 | -52.0% | -49.8% |
| settings-panel | 1244 | 1205 | 540 | -56.6% | -55.2% |
| e-commerce-product | 2449 | 2381 | 1166 | -52.4% | -51.0% |
| **Total** | **10,180** | **9,948** | **4,800** | **-52.8%** | **-51.7%** |

---

## Core Principles

### Why Fewer Tokens

1. **Positional arguments**: No repeated key names.
   ```
   # OpenUI Lang (compact)
   stack = Stack([child1], "row", "l")

   # JSON (verbose)
   {"type":"Stack","direction":"row","gap":"l","children":[...]}
   ```

2. **Line-oriented structure**: Minimal JSON structural characters (braces, quotes, etc.)
3. **Short identifiers**: Short positional arguments instead of long property names

### Rendering Speed Comparison

| Approach | Average render time |
|----------|-------------------|
| JSON-based | 14.2s |
| OpenUI Lang | 4.9s (**-65%**) |

Streaming rendering means the first UI element appears much faster.

---

## Real-World Example

The scenario with the greatest token savings is **contact-form (-67.1%)**. The more repetitive properties there are (label, placeholder, required, etc.), the greater the benefit.

```
# Contact form in OpenUI Lang (concise)
form = Form([name_field, email_field, message_field, submit], "contact")
name_field = Input("Name", "text", true)
email_field = Input("Email", "email", true)
message_field = Textarea("Message", 4, false)
submit = Button("Send", "submit")
```

---

## Why Token Efficiency Matters

| Dimension | Why it matters | Impact |
|-----------|---------------|--------|
| Cost | LLM APIs charge per token | Lower operating costs |
| Speed | Token count = generation time | Better user experience |
| Context | Long conversations hit context limits | More conversation history maintained |

---

## Links & Integration

- [[OpenUI Overview]] — Technical background of token efficiency
- [Specification v0.5](specification-v05.md) — OpenUI Lang syntax details
- [[OpenUI Introduction]] — Full framework overview

---

## References

- [Official Docs: Benchmarks](https://www.openui.com/docs/openui-lang/benchmarks) (2026-05-15)
- [GitHub: thesysdev/openui](https://github.com/thesysdev/openui) (2026-05-15)
