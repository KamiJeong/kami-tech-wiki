---
title: "OpenUI システムプロンプト"
aliases: ["openui-system-prompts", "openui-prompt-generation"]
tags: [openui, system-prompt, llm, prompt-engineering]
category: concept
language: ja
date_created: 2026-05-15
date_modified: 2026-05-15
source_count: 0
related: [overview, quickstart, specification-v05]
status: active
---

# OpenUI システムプロンプト

> OpenUIはコンポーネントライブラリからLLMシステムプロンプトを自動生成し、モデルが許可されたコンポーネントのみを使用するよう出力を制御します。

**公式ドキュメント**: [https://www.openui.com/docs/openui-lang/system-prompts](https://www.openui.com/docs/openui-lang/system-prompts)

---

## 概要

OpenUIのシステムプロンプトは手動で作成しません。**コンポーネントライブラリの定義から自動生成**されます。これにより：

1. モデルが許可されたコンポーネントのみを使用するよう出力を制約します。
2. ライブラリが変更されるとプロンプトも自動的に更新されます。
3. 開発者がプロンプトを別途メンテナンスする必要がありません。

---

## コア原則

### 自動プロンプト生成

`library.prompt()`を呼び出すとシステムプロンプトが自動生成されます：

```ts
import { createLibrary, openuiLibrary } from "@openuidev/react-lang";

const library = createLibrary(openuiLibrary);
const systemPrompt = library.prompt();
// → 許可コンポーネントのリスト + props + OpenUI Lang構文ルールを含むプロンプト
```

### 2つの生成方式

| 方式 | 使用タイミング | ツール |
|------|-------------|-------|
| **動的生成** | サーバーサイドでリクエストごとに生成 | `@openuidev/lang-core`の`generatePrompt` |
| **静的生成** | ビルド時にファイルとして事前生成 | `@openuidev/cli` |

### サーバーレス/Edge環境での動的生成

React依存なしにNode/Edge/サーバーレス環境で使用できます：

```ts
import { generatePrompt } from "@openuidev/lang-core";

const systemPrompt = generatePrompt(libraryDefinition);
```

### CLIを使った静的生成

```bash
npx @openuidev/cli generate-prompt --output src/generated/system-prompt.txt
```

生成されたファイルをバックエンドから静的に読み込んで使用します。

---

## 実装例

```ts
// app/api/chat/route.ts (Next.js)
import { createLibrary, openuiChatLibrary } from "@openuidev/react-lang";

const library = createLibrary(openuiChatLibrary);

export async function POST(req: Request) {
  const { messages } = await req.json();

  const response = await openai.chat.completions.create({
    model: "gpt-4o",
    messages: [
      { role: "system", content: library.prompt() }, // ← 自動生成されたプロンプト
      ...messages,
    ],
    stream: true,
  });

  return new Response(response.toReadableStream());
}
```

---

## 関連コンセプト比較

| 項目 | OpenUI自動生成プロンプト | 手動作成プロンプト |
|------|------------------------|-----------------|
| メンテナンス | ライブラリ変更時に自動反映 | 手動更新が必要 |
| 一貫性 | コードと常に同期 | 不一致のリスクあり |
| トークン効率 | 最適化済み | 作成者によって異なる |
| カスタマイズ | 制限あり | 完全自由 |

---

## 関連ドキュメント

- [[OpenUI 概要]] — Prompt Generatorステップの詳細説明
- [仕様 v0.5](specification-v05.md) — OpenUI Lang構文仕様（プロンプトに含まれるルール）
- [クイックスタート](quickstart.md) — 実際の使用例

---

## 参考リンク

- [公式ドキュメント: System Prompts](https://www.openui.com/docs/openui-lang/system-prompts) (2026-05-15)
- [GitHub: thesysdev/openui](https://github.com/thesysdev/openui) (2026-05-15)
