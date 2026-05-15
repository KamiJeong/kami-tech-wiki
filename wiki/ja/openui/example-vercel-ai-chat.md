---
title: "サンプル: Vercel AI Chat"
aliases: ["openui-vercel-example", "openui-nextjs-example"]
tags: [openui, example, vercel, nextjs, ai-sdk]
category: tool
language: ja
date_created: 2026-05-15
date_modified: 2026-05-15
source_count: 0
related: [quickstart, chat-introduction, chat-genui]
status: active
---

# サンプル: Vercel AI Chat

> Vercel AI SDKをトランスポート層として、OpenUIをプレゼンテーション層として使用する完全なNext.jsチャットアプリのサンプルです。

**公式ドキュメント**: [https://www.openui.com/docs/openui-lang/examples/vercel-ai-chat](https://www.openui.com/docs/openui-lang/examples/vercel-ai-chat)
**GitHub**: [examples/openui-chat](https://github.com/thesysdev/openui/tree/main/examples/openui-chat)

---

## 主要コンセプト

- **Vercel AI SDK**: ストリーミングトランスポート層。`ai`、`@ai-sdk/react`、`@ai-sdk/openai`パッケージを使用。
- **OpenUI**: プレゼンテーション層。LLMのレスポンスを構造化されたUIコンポーネントとしてレンダリング。
- **マルチステップツール呼び出し**: 複雑なタスクを複数ステップのツール呼び出しで処理。
- **会話スレッディング**: localStorageベースのマルチスレッド会話管理。

---

## ユースケース

| 適している場合 | 適していない場合 |
|--------------|----------------|
| Vercel AI SDKとOpenUIを一緒に使う場合 | Vercel AI SDKなしでOpenAIを直接連携する場合 |
| Next.jsアプリでチャットUIを実装する場合 | React以外のフレームワーク |
| マルチスレッド会話が必要な場合 | シンプルな単一レスポンスUI |

---

## プロジェクト構成

```
examples/openui-chat/
├── src/
│   ├── app/
│   │   ├── api/chat/route.ts      # OpenAI ストリーミングバックエンド
│   │   └── page.tsx               # チャットUIページ
│   ├── components/
│   │   └── chat/                  # チャットUIコンポーネント
│   ├── hooks/
│   │   ├── useTheme.ts            # ライト/ダークテーマ検出
│   │   └── useThread.ts           # スレッド管理
│   ├── lib/
│   │   ├── tools.ts               # ツール定義
│   │   └── store.ts               # localStorageスレッドストア
│   └── generated/
│       └── system-prompt.txt      # 自動生成されたシステムプロンプト
└── package.json
```

---

## コア統合コード

```tsx
// app/api/chat/route.ts
import { createLibrary, openuiChatLibrary } from "@openuidev/react-lang";
import { streamText } from "ai";
import { openai } from "@ai-sdk/openai";

const library = createLibrary(openuiChatLibrary);

export async function POST(req: Request) {
  const { messages } = await req.json();

  const result = await streamText({
    model: openai("gpt-4o"),
    system: library.prompt(),
    messages,
    maxSteps: 5, // マルチステップツール呼び出し
  });

  return result.toDataStreamResponse();
}
```

---

## 主要機能

- **自動ライト/ダークテーマ**: システム設定を検出して自動切替
- **会話スレッディング**: localStorageに複数の会話を保存して切り替え
- **マルチステップツール呼び出し**: `maxSteps: 5`の設定で複雑なタスクを処理
- **OpenUIレンダリング**: LLMのレスポンスがOpenUI Langの場合、インタラクティブなカード/チャート/フォームとして表示

---

## その他のサンプル

| サンプル | 説明 |
|---------|------|
| `examples/openui-chat` | このドキュメントのVercel AIベースの完全なサンプル |
| `examples/shadcn-chat` | shadcn/ui統合サンプル |
| `examples/openui-react-native` | React Native（Expo）+ Next.js APIサンプル |

---

## 統合 & 関連リンク

- [[OpenUI クイックスタート]] — CLIスキャフォールディングで類似アプリを作成
- [Chat SDK 紹介](chat-introduction.md) — `@openuidev/react-headless`の詳細
- [Chat GenUI](chat-genui.md) — `openuiChatLibrary`コンポーネントの詳細

---

## 参考リンク

- [公式ドキュメント: Vercel AI Chat Example](https://www.openui.com/docs/openui-lang/examples/vercel-ai-chat) (2026-05-15)
- [GitHub: examples/openui-chat](https://github.com/thesysdev/openui/tree/main/examples/openui-chat) (2026-05-15)
- [Vercel AI SDK ドキュメント](https://sdk.vercel.ai/docs) (2026-05-15)
