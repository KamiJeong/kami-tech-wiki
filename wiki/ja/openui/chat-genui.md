---
title: "OpenUI Chat GenUI"
aliases: ["openui-genui", "openui-chat-library", "openuiChatLibrary"]
tags: [openui, chat-sdk, genui, components]
category: concept
language: ja
date_created: 2026-05-15
date_modified: 2026-05-15
source_count: 0
related: [chat-introduction, api-reference-react-ui, overview]
status: active
---

# OpenUI Chat GenUI

> 会話型チャットに最適化されたコンポーネントライブラリ。すべてのレスポンスが`Card`でラップされ、フォローアップ質問パターンを自然にサポートします。

**公式ドキュメント**: [https://www.openui.com/docs/chat/genui](https://www.openui.com/docs/chat/genui)

---

## 概要

`openuiChatLibrary`はチャットインターフェース専用に設計されたOpenUIコンポーネントライブラリです。汎用の`openuiLibrary`と異なる点：

- すべてのレスポンスが**単一カード（`Card`）の垂直配置**で構成されます。
- `Stack`コンポーネントを含みません（チャットは常に縦方向）。
- フォローアップ質問ボタン（`FollowUpBlock`）が内蔵されています。

---

## コア原則

### チャット特化コンポーネント

| コンポーネント | 役割 |
|-------------|------|
| `Card` | すべてのレスポンスをラップするデフォルトラッパー |
| `FollowUpBlock` | フォローアップ質問ボタンブロック |
| `ListBlock` | アイテムリストの表示 |
| `SectionBlock` | レスポンス内のセクション区切り |
| `Button` | 単一アクションボタン |
| `Buttons` | ボタングループ |

### 汎用ライブラリとの違い

| 項目 | `openuiLibrary`（汎用） | `openuiChatLibrary`（チャット） |
|------|---------------------|----------------------------|
| レイアウト | `Stack`（自由方向） | 常に垂直カード |
| レスポンスラッパー | なし | 自動的に`Card`でラップ |
| フォローアップ質問 | なし | `FollowUpBlock`内蔵 |
| 使用コンテキスト | 汎用UI生成 | チャットインターフェース |

---

## 実装例

チャットでLLMが生成するOpenUI Langの例：

```
# 検索結果カード（openuiChatLibrary）
card = Card([
  results_section,
  follow_up
])
results_section = SectionBlock("検索結果", [
  result1,
  result2,
  result3
])
result1 = ListBlock("最初の結果", "説明テキスト")
follow_up = FollowUpBlock([
  Button("詳しく調べる"),
  Button("関連項目を検索"),
])
```

---

## Open WebUI 統合

`thesysdev/openwebui-plugin`を使用すると、Open WebUI環境でも`openuiChatLibrary`を使用できます：

```python
# Open WebUIプラグインのインストール後、自動的にGenUIレンダリングが有効化
# チャート、フォーム、テーブル、カードがチャットでインタラクティブに表示
```

---

## 関連コンセプト比較

| 項目 | チャットコンテキスト | 汎用アプリコンテキスト |
|------|------------------|------------------|
| ライブラリ | `openuiChatLibrary` | `openuiLibrary` |
| レイアウト | 垂直カードスタック | 自由レイアウト |
| フォローアップ質問 | FollowUpBlock | なし |
| 適している用途 | チャットアシスタント | ダッシュボード、CRUD |

---

## 関連ドキュメント

- [[OpenUI Chat SDK]] — ChatProviderとヘッドレス状態管理
- [APIリファレンス: react-ui](api-reference-react-ui.md) — レイアウトコンポーネント
- [[Vercel AI Chat サンプル]] — `openuiChatLibrary`の実際の使用例
- [[OpenUI 概要]] — コンポーネントライブラリの役割

---

## 参考リンク

- [公式ドキュメント: GenUI](https://www.openui.com/docs/chat/genui) (2026-05-15)
- [GitHub: thesysdev/openwebui-plugin](https://github.com/thesysdev/openwebui-plugin) (2026-05-15)
- [GitHub: thesysdev/openui](https://github.com/thesysdev/openui) (2026-05-15)
