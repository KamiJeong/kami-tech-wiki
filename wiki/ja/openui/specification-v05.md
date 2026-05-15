---
title: "OpenUI Lang 仕様 v0.5"
aliases: ["openui-spec", "openui-lang-spec", "openui-specification"]
tags: [openui, openui-lang, spec, specification, v0.5]
category: reference
language: ja
date_created: 2026-05-15
date_modified: 2026-05-15
source_count: 0
related: [overview, architecture, system-prompts]
status: active
---

# OpenUI Lang 仕様 v0.5

> OpenUI Langの最新公式言語仕様。リアクティブState、データフェッチ（Data）、アクション（Actions）を含みます。

**公式ドキュメント**: [https://www.openui.com/docs/openui-lang/specification-v05](https://www.openui.com/docs/openui-lang/specification-v05)
**公式仕様ミラー**: [https://openuispec.org/spec](https://openuispec.org/spec)

---

## 概要

OpenUI Lang v0.5はv0.1を拡張して**インタラクティブなデータ駆動アプリ**のための機能を追加します。v0.1が静的なUI生成に焦点を当てていたのに対し、v0.5はリアクティブな状態とサーバーデータの連携をサポートします。

---

## 基本構文

### 代入文

すべての文は`identifier = Expression`形式の単一代入です。

```
# 基本的なコンポーネントの代入
title = Text("Hello, World!", "h1")
container = Stack([title, content], "column", "m")
```

### 位置引数

コンポーネントのpropsはZodスキーマのキー順序に従って位置引数として渡されます。

```
# Stack(children, direction, gap) — Zodスキーマの順序
stack = Stack([child1, child2], "row", "l")

# Input(label, type, required)
email = Input("メール", "email", true)
```

---

## コア原則

### State（リアクティブ状態）

`$variable`プレフィックスでリアクティブな状態変数を宣言します。

```
$selectedCategory = "すべて"
$searchQuery = ""

# 状態変数はコンポーネントに直接使用可能
filter = Select($selectedCategory, ["すべて", "技術", "ビジネス"])
search = Input($searchQuery, "search")
```

状態値が変更されると、関連するクエリが**自動的に再実行**されます。

### Data（データフェッチ）

クエリ（Query）とミューテーション（Mutation）でサーバーデータを連携します。

**クエリ（読み取り）**:
```
# カテゴリと検索クエリでフィルタリングするクエリ
posts = @Query("getPosts", { category: $selectedCategory, q: $searchQuery })
postList = List(posts.data, PostCard)
```

**ミューテーション（書き込み）**:
```
# Action内の@Run(mutation)がトリガーされた時のみ実行
createPost = @Mutation("createPost")
```

ミューテーションの特性：
- 読み込み時に自動実行されない
- `@Run(mutation)`トリガー時のみ実行
- 失敗した場合、残りのActionステップはスキップ

### Actions（アクション）

ユーザーイベントに反応する動作シーケンスです。

```
submitAction = @Action([
  @Set($isLoading, true),
  @Run(createPost, { title: $title, content: $content }),
  @Set($isLoading, false),
  @Navigate("/posts"),
])

submitButton = Button("投稿する", submitAction, $isLoading)
```

---

## 実装例

リアクティブな検索インターフェースの例：

```
# 状態の宣言
$query = ""
$results = []

# UI構成
searchBox = Input($query, "search", false)
resultList = List(@Query("search", { q: $query }).data, ResultCard)

# $queryが変更されるたびにsearchクエリが自動再実行
layout = Stack([searchBox, resultList], "column", "l")
```

---

## v0.1 → v0.5 主な変更点

| 機能 | v0.1 | v0.5 |
|------|------|------|
| 状態管理 | なし | `$variable`リアクティブ状態 |
| データフェッチ | なし | `@Query`、`@Mutation` |
| イベント処理 | なし | `@Action`、`@Run`、`@Set`、`@Navigate` |
| UIインタラクティビティ | 静的 | 完全インタラクティブ |

---

## 関連ドキュメント

- [[OpenUI 概要]] — 仕様を使用するパイプライン
- [[OpenUI アーキテクチャ]] — Parserがこの仕様を解析する方法
- [システムプロンプト](system-prompts.md) — 仕様の内容がプロンプトに含まれる方法

---

## 参考リンク

- [公式ドキュメント: v0.5 Specification](https://www.openui.com/docs/openui-lang/specification-v05) (2026-05-15)
- [公式仕様ミラー: openuispec.org](https://openuispec.org/spec) (2026-05-15)
- [GitHub: thesysdev/openui](https://github.com/thesysdev/openui) (2026-05-15)
