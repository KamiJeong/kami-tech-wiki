---
title: "OpenUI Chat SDK 紹介"
aliases: ["openui-chat-sdk", "openui-chat"]
tags: [openui, chat-sdk, streaming, headless]
category: tool
language: ja
date_created: 2026-05-15
date_modified: 2026-05-15
source_count: 0
related: [chat-genui, api-reference-react-ui, introduction]
status: active
---

# OpenUI Chat SDK 紹介

> プロダクション対応のチャットUIビルディングブロック。ヘッドレス状態管理から完成されたレイアウトコンポーネントまで提供します。

**公式ドキュメント**: [https://www.openui.com/docs/chat](https://www.openui.com/docs/chat)

---

## 主要コンセプト

- **ヘッドレスチャット状態**: `@openuidev/react-headless`がUIなしでチャット状態、ストリーミング、スレッドを管理します。
- **ストリーミングアダプター**: OpenAIストリーミングプロトコルとAG-UIプロトコルの両方をサポートします。
- **レイアウトコンポーネント**: `@openuidev/react-ui`がFullScreen、Copilot、BottomTrayの3つのすぐに使えるレイアウトを提供します。
- **AG-UIプロトコル**: 自律エージェントとインタラクティブインターフェースを接続する拡張プロトコル。

---

## ユースケース

| 適している場合 | 適していない場合 |
|--------------|----------------|
| AIチャットインターフェースを素早く構築する場合 | 完全カスタムのチャットUIが必要な場合 |
| 既存アプリにコパイロットUIを追加する場合 | React以外のフレームワーク |
| ストリーミングレスポンスを含むチャットが必要な場合 | シンプルなQ&A（ストリーミング不要） |

---

## パッケージ構成

### @openuidev/react-headless

ヘッドレスチャット状態管理パッケージ：

| 機能 | 説明 |
|------|------|
| `ChatProvider` | コンテキストプロバイダー |
| `useThread` | 現在のスレッド状態フック |
| `useMessages` | メッセージリストフック |
| ストリーミングアダプター | OpenAI、AG-UIプロトコルサポート |
| メッセージフォーマットコンバーター | テキストデルタの自動処理 |

### @openuidev/react-ui

完成されたUIレイアウトパッケージ：

| レイアウト | 説明 |
|----------|------|
| `FullScreen` | スレッドサイドバー付きのフルページチャット |
| `Copilot` | メインアプリの横に表示されるサイドチャット |
| `BottomTray` | フローティング/折りたたみ可能なチャットトレイ |

---

## クイックスタート

```tsx
import { ChatProvider } from "@openuidev/react-headless";
import { FullScreen } from "@openuidev/react-ui";

function App() {
  return (
    <ChatProvider apiUrl="/api/chat">
      <FullScreen
        agentName="AIアシスタント"
        welcomeMessage="何かお手伝いできますか？"
      />
    </ChatProvider>
  );
}
```

**結果**: スレッドサイドバーを含むフルページのチャットインターフェースがすぐにレンダリングされます。

> [!tip] はじめての方へ
> `@openuidev/cli`でスキャフォールディングすると、Chat SDKが事前に統合されたアプリが生成されます。

---

## ストリーミング処理フロー

```
ユーザー入力
    ↓
ChatProvider（状態管理）
    ↓
ストリーミングアダプター（OpenAI/AG-UI）
    ↓
テキストデルタ受信 → 楽観的更新
    ↓
OpenUI Renderer（Generative UIレンダリング）
    ↓
メッセージ確定
```

---

## 統合 & 関連リンク

- [[Chat GenUI]] — `openuiChatLibrary`チャット最適化コンポーネント
- [APIリファレンス: react-ui](api-reference-react-ui.md) — レイアウトコンポーネントAPIの詳細
- [Vercel AI Chat サンプル](example-vercel-ai-chat.md) — 実際の統合サンプル
- [[OpenUI 紹介]] — フレームワーク全体の概要

---

## 注意事項 & 制限

> [!warning] 既知の制約
> AG-UIプロトコルはエージェントフレームワークとの統合が必要です。標準のOpenAIストリーミングはデフォルトアダプターですぐに使用できます。

> [!note] 更新履歴
> AG-UIプロトコルサポートが追加され、自律エージェントとの接続が可能になりました。（2026-05-15時点）

---

## 参考リンク

- [公式ドキュメント: Chat SDK](https://www.openui.com/docs/chat) (2026-05-15)
- [GitHub: thesysdev/openui](https://github.com/thesysdev/openui) (2026-05-15)
