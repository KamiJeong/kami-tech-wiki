---
title: "OpenUI 概要"
aliases: ["openui-overview", "openui-architecture-overview"]
tags: [openui, openui-lang, overview, architecture]
category: concept
language: ja
date_created: 2026-05-15
date_modified: 2026-05-15
source_count: 0
related: [introduction, architecture, specification-v05]
status: active
---

# OpenUI 概要

> OpenUI Langパイプラインの4つのコアコンポーネントと動作の仕組みを説明します。

**公式ドキュメント**: [https://www.openui.com/docs/openui-lang/overview](https://www.openui.com/docs/openui-lang/overview)

![OpenUIバナー — Generative UIフレームワーク](https://raw.githubusercontent.com/thesysdev/openui/main/assets/banner.png)

---

## 概要

OpenUIはLLMが生成したテキストをリアルタイムで構造化されたUIに変換します。コアのアイデアは**モデルの出力を単なるテキストではなく、構造化されたUI仕様**として扱うことです。

パイプラインは4つのステップで構成されます：

```
Library → Prompt Generator → LLM → Parser → Renderer → Live UI
```

---

## コア原則

### 1. Library（ライブラリ）

ZodスキーマとReactレンダラーで定義されたコンポーネント群です。

- 各コンポーネントはZodスキーマでpropsを定義し、Reactコンポーネントでレンダリング方法を指定します。
- ライブラリがコンポーネントの「コントラクト」を定義し、これがプロンプト生成とレンダリングの単一のソースとなります。
- 標準提供ライブラリ：`openuiLibrary`（汎用）、`openuiChatLibrary`（チャット最適化）

### 2. Prompt Generator（プロンプトジェネレーター）

ライブラリからLLMシステムプロンプトを自動生成します。

- `library.prompt()`を呼び出すと、許可されたコンポーネントのリスト、props、OpenUI Lang構文ルールを含むシステムプロンプトが生成されます。
- コンポーネントライブラリを変更するとプロンプトも自動的に更新されます。
- 静的生成（`@openuidev/cli`）と動的生成（`generatePrompt`）の両方の方式をサポートします。

### 3. Parser（パーサー）

LLMがストリーミングするOpenUI Langをリアルタイムで解析します。

- **ライン単位の解析**: トークンが届いた瞬間にラインごとに解析してストリーミングレンダリングをサポートします。
- 無効な出力は自動的に除外し、有効な部分のみレンダリングします。
- `identifier = Expression`形式のシンプルな文法でトークン数を最小化します。

### 4. Renderer（レンダラー）

解析した要素をReactコンポーネントにマッピングしてUIをレンダリングします。

- `<Renderer />` Reactコンポーネントが解析結果を受け取ってリアルタイムでUIを構成します。
- 位置引数（positional arguments）を使用して追加の解析オーバーヘッドなしにコンポーネントにマッピングします。
- LLMの生成が完了した後、UIは独立して実行されます（データフェッチ、状態管理、イベント処理）。

---

## OpenUI Lang 構文の要点

OpenUI Langはライン指向（line-oriented）構造で、トークン効率を最大化します。

```
# 位置引数（コンパクト）
stack = Stack([child1, child2], "row", "l")

# JSON方式との比較（冗長）
# { "type": "Stack", "direction": "row", "gap": "l", "children": [...] }
```

位置引数はZodスキーマのキー順序に従って自動的にマッピングされます。

---

## 実装例

```tsx
import { createLibrary, Renderer } from "@openuidev/react-lang";

// 1. ライブラリを定義
const library = createLibrary({ /* コンポーネント定義 */ });

// 2. システムプロンプトを生成
const systemPrompt = library.prompt();

// 3. LLMストリーミング + レンダリング
<Renderer library={library} stream={llmStream} />
```

---

## 関連コンセプト比較

| 項目 | OpenUI Lang | JSONベースのUI生成 |
|------|------------|-----------------|
| トークン効率 | 高い（位置引数、ライン指向） | 低い（キーと値の繰り返し） |
| ストリーミング | ライン単位で即時レンダリング | 全体解析後レンダリング |
| 型安全性 | Zodスキーマ | なし |
| 拡張性 | カスタムコンポーネント追加可能 | 制限あり |

---

## 関連ドキュメント

- [[OpenUI 紹介]] — OpenUI フレームワーク全体の概要
- [[OpenUI アーキテクチャ]] — パイプラインの詳細な動作原理
- [仕様 v0.5](specification-v05.md) — OpenUI Lang の完全な言語仕様
- [システムプロンプト](system-prompts.md) — プロンプト生成の詳細ガイド

---

## 参考リンク

- [公式ドキュメント: OpenUI 概要](https://www.openui.com/docs/openui-lang/overview) (2026-05-15)
- [GitHub: thesysdev/openui](https://github.com/thesysdev/openui) (2026-05-15)
