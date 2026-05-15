---
title: "@openuidev/react-ui API"
aliases: ["openui-react-ui", "openui-layout-components"]
tags: [openui, api-reference, react, ui-components, layout]
category: reference
language: ja
date_created: 2026-05-15
date_modified: 2026-05-15
source_count: 0
related: [api-reference-overview, chat-introduction, chat-genui]
status: active
---

# @openuidev/react-ui API

> すぐに使える3つのチャットレイアウトコンポーネントと内蔵コンポーネントライブラリを提供するパッケージです。

**公式ドキュメント**: [https://www.openui.com/docs/api-reference/react-ui](https://www.openui.com/docs/api-reference/react-ui)

---

## インストール

```bash
npm install @openuidev/react-ui @openuidev/react-headless @openuidev/react-lang
```

---

## レイアウトコンポーネント

### FullScreen（フルスクリーンチャット）

スレッドサイドバーを含むフルページのチャットレイアウトです。

```tsx
import { FullScreen } from "@openuidev/react-ui";
import { ChatProvider } from "@openuidev/react-headless";

<ChatProvider apiUrl="/api/chat">
  <FullScreen
    agentName="AIアシスタント"
    logoUrl="/logo.png"
    welcomeMessage="何かお手伝いできますか？"
    conversationStarters={[
      "最新の技術トレンドを教えて",
      "コードをレビューしてください",
    ]}
  />
</ChatProvider>
```

### Copilot（コパイロット）

メインアプリ画面を維持しながらサイドにチャットを表示します。

```tsx
<ChatProvider apiUrl="/api/chat">
  <div style={{ display: "flex" }}>
    <MainContent />
    <Copilot agentName="AIコパイロット" />
  </div>
</ChatProvider>
```

### BottomTray（ボトムトレイ）

フローティング/折りたたみ可能なチャットトレイです。

```tsx
const [isOpen, setIsOpen] = useState(false);

<ChatProvider apiUrl="/api/chat">
  <BottomTray
    isOpen={isOpen}
    onOpenChange={setIsOpen}
    defaultOpen={false}
    agentName="ヘルプ"
  />
</ChatProvider>
```

---

## 共通Props

すべてのレイアウトコンポーネントが共有するprops：

| Prop | 型 | 説明 |
|------|----|------|
| `agentName` | `string` | チャット上部に表示されるエージェント名 |
| `logoUrl` | `string?` | ロゴ画像のURL |
| `welcomeMessage` | `string?` | 最初の画面のウェルカムメッセージ |
| `conversationStarters` | `string[]?` | スタート質問ボタンのリスト |
| `messageLoading` | `ReactNode?` | ローディング状態表示のカスタムコンポーネント |

---

## ChatProvider Props

```tsx
<ChatProvider
  apiUrl="/api/chat"          // バックエンドAPIのURL
  streamProtocol="openai"     // "openai" | "ag-ui"
  messageFormat="openai"      // メッセージフォーマット
  processMessage={fn}         // カスタムメッセージ処理関数
/>
```

---

## 内蔵コンポーネントライブラリ

| ライブラリ | エクスポート名 | 用途 |
|----------|-------------|------|
| 汎用 | `openuiLibrary` | ダッシュボード、CRUD、汎用UI |
| チャット最適化 | `openuiChatLibrary` | チャットインターフェース |

```tsx
import {
  openuiLibrary,
  openuiChatLibrary
} from "@openuidev/react-ui";
```

---

## 統合 & 関連リンク

- [[OpenUI Chat SDK 紹介]] — ChatProviderとフックの詳細
- [Chat GenUI](chat-genui.md) — `openuiChatLibrary`コンポーネント一覧
- [APIリファレンス概要](api-reference-overview.md) — 全パッケージ構造

---

## 注意事項 & 制限

> [!warning] 既知の制約
> `ChatProvider`でラップしないとレイアウトコンポーネントが動作しません。必ず`ChatProvider`を親として配置してください。

> [!note] 更新履歴
> BottomTrayコンポーネントが追加され、3つのレイアウトオプションを提供します。（2026-05-15時点）

---

## 参考リンク

- [公式ドキュメント: @openuidev/react-ui](https://www.openui.com/docs/api-reference/react-ui) (2026-05-15)
- [GitHub: thesysdev/openui](https://github.com/thesysdev/openui) (2026-05-15)
