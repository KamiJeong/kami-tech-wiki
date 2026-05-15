---
title: "OpenUI APIリファレンス概要"
aliases: ["openui-api", "openui-api-reference"]
tags: [openui, api-reference, packages]
category: reference
language: ja
date_created: 2026-05-15
date_modified: 2026-05-15
source_count: 0
related: [api-reference-react-ui, chat-introduction, introduction]
status: active
---

# OpenUI APIリファレンス概要

> OpenUIの5つのnpmパッケージとCLIツールの完全なAPIリファレンスです。

**公式ドキュメント**: [https://www.openui.com/docs/api-reference](https://www.openui.com/docs/api-reference)

---

## パッケージ構成

OpenUIは役割別に分離された5つのパッケージで構成されます：

| パッケージ | 役割 | 環境 |
|-----------|------|------|
| `@openuidev/react-lang` | コアランタイム（コンポーネント定義、パーサー、レンダラー、プロンプト生成） | React |
| `@openuidev/lang-core` | Reactなしの軽量コア（プロンプト生成、パース） | Node/Edge/サーバーレス |
| `@openuidev/react-headless` | ヘッドレスチャット状態、ストリーミングアダプター | React |
| `@openuidev/react-ui` | 完成されたチャットレイアウトとコンポーネントライブラリ | React |
| `@openuidev/cli` | アプリのスキャフォールディングとシステムプロンプト生成ツール | CLI |

---

## @openuidev/react-lang（コアランタイム）

最も重要なパッケージ。コンポーネント定義、パース、レンダリングを担当します。

```ts
import {
  createLibrary,    // コンポーネントライブラリを作成
  Renderer,         // ストリーミングレンダリングコンポーネント
  openuiLibrary,    // 汎用内蔵ライブラリ
  openuiChatLibrary // チャット最適化内蔵ライブラリ
} from "@openuidev/react-lang";
```

**主要API**:
- `createLibrary(components)` — コンポーネント定義からライブラリを作成
- `library.prompt()` — システムプロンプトを自動生成
- `<Renderer library={lib} stream={stream} />` — ストリーミングレンダリング

---

## @openuidev/lang-core（軽量コア）

React依存なしにNode/Edge/サーバーレス環境で使用します。

```ts
import { generatePrompt } from "@openuidev/lang-core";

// バックエンドでReactなしにプロンプトを生成
const systemPrompt = generatePrompt(libraryDefinition);
```

---

## @openuidev/react-headless（ヘッドレスチャット）

```ts
import {
  ChatProvider,  // チャットコンテキストプロバイダー
  useThread,     // スレッド状態フック
  useMessages,   // メッセージリストフック
} from "@openuidev/react-headless";
```

**ストリーミングアダプター**:
- OpenAIストリーミングプロトコル
- AG-UIプロトコル（自律エージェント接続）

---

## @openuidev/cli（CLIツール）

```bash
# アプリのスキャフォールディング
npx @openuidev/cli@latest create --name my-app

# システムプロンプトの事前生成
npx @openuidev/cli generate-prompt --output src/generated/system-prompt.txt
```

---

## 統合 & 関連リンク

- [@openuidev/react-ui詳細](api-reference-react-ui.md) — レイアウトコンポーネントAPI
- [[OpenUI Chat SDK]] — react-headless使用ガイド
- [[OpenUI 概要]] — 各パッケージの役割と関係
- [システムプロンプト](system-prompts.md) — プロンプト生成API使用ガイド

---

## 注意事項 & 制限

> [!warning] 既知の制約
> `@openuidev/react-lang`と`@openuidev/react-ui`はReactが必須です。サーバーサイドでプロンプトのみ生成する場合は`@openuidev/lang-core`を使用してください。

---

## 参考リンク

- [公式ドキュメント: API Reference](https://www.openui.com/docs/api-reference) (2026-05-15)
- [npm: @openuidev](https://www.npmjs.com/search?q=%40openuidev) (2026-05-15)
- [GitHub: thesysdev/openui](https://github.com/thesysdev/openui) (2026-05-15)
