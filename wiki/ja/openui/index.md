---
title: "OpenUI ドキュメント インデックス"
aliases: ["openui", "generative-ui"]
tags: [openui, generative-ui, index]
category: reference
language: ja
date_created: 2026-05-15
date_modified: 2026-05-15
source_count: 0
related: []
status: active
---

# OpenUI ドキュメント インデックス

> [OpenUI](https://www.openui.com/) の公式ドキュメントを日本語でまとめたウィキです。
> OpenUI は LLM が UI を生成できるように設計された、フルスタックの生成型 UI フレームワークです。

**公式サイト**: [https://www.openui.com/](https://www.openui.com/) | **GitHub**: [thesysdev/openui](https://github.com/thesysdev/openui)

---

## OpenUI Lang

OpenUI のコア — ストリーミング優先 UI 生成言語とランタイム。

| ページ | 説明 |
|--------|------|
| [紹介](introduction.md) | OpenUI とは何か、なぜ作られたか、パッケージ構成 |
| [概要](overview.md) | 4 つのコアコンポーネント: Library, Prompt Generator, Parser, Renderer |
| [クイックスタート](quickstart.md) | `npx @openuidev/cli` で 1 分以内に GenUI アプリを起動 |
| [システムプロンプト](system-prompts.md) | LLM システムプロンプトの自動生成の仕組み |
| [ベンチマーク](benchmarks.md) | JSON 比で最大 67% のトークン削減 — パフォーマンス比較 |
| [アーキテクチャ](architecture.md) | Library → Prompt → LLM → Parser → Renderer パイプライン |

---

## 言語仕様

| ページ | 説明 |
|--------|------|
| [仕様 v0.5（最新）](specification-v05.md) | リアクティブ状態、クエリ、ミューテーション、アクションの全仕様 |

---

## サンプル

| ページ | 説明 |
|--------|------|
| [Vercel AI Chat サンプル](example-vercel-ai-chat.md) | Next.js + Vercel AI SDK + OpenUI の完全なサンプルアプリ |

---

## Chat SDK

| ページ | 説明 |
|--------|------|
| [Chat SDK 紹介](chat-introduction.md) | ヘッドレスチャット状態管理、ストリーミングアダプター、レイアウトコンポーネント |
| [GenUI](chat-genui.md) | チャット最適化コンポーネントライブラリ（`openuiChatLibrary`） |

---

## API リファレンス

| ページ | 説明 |
|--------|------|
| [API リファレンス 概要](api-reference-overview.md) | パッケージ別 API 構造と CLI ツール |
| [@openuidev/react-ui](api-reference-react-ui.md) | レイアウトコンポーネント（FullScreen, Copilot, BottomTray）API |

---

## 関連リンク

- [[OpenUI 紹介]] — このウィキの出発点
- [Open UI（W3C 標準）](../open-ui/) — W3C Open UI ワーキンググループ（別プロジェクト）
