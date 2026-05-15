---
title: "OpenUI アーキテクチャ"
aliases: ["openui-architecture", "openui-how-it-works", "openui-pipeline"]
tags: [openui, architecture, pipeline, streaming]
category: concept
language: ja
date_created: 2026-05-15
date_modified: 2026-05-15
source_count: 0
related: [overview, introduction, specification-v05]
status: active
---

# OpenUI アーキテクチャ

> OpenUIのコアパイプライン: Library → Prompt Generator → LLM → Parser → Renderer → Live UI

**公式ドキュメント**: [https://www.openui.com/docs/openui-lang/how-it-works](https://www.openui.com/docs/openui-lang/how-it-works)

![OpenUIデモ — Generative UIストリーミングレンダリング](https://raw.githubusercontent.com/thesysdev/openui/main/assets/demo.gif)

---

## 概要

OpenUIはLLMがUIを生成し、生成されたUIがその後**LLMなしに独立して実行される**アーキテクチャを採用しています。この分離がパフォーマンスとコスト効率を同時に達成するコア設計原則です。

---

## パイプラインダイアグラム

```
┌─────────────────┐
│  Component      │
│  Library        │  ← Zodスキーマ + Reactレンダラー
│  （定義フェーズ）  │
└────────┬────────┘
         │ library.prompt()
         ▼
┌─────────────────┐
│  System Prompt  │  ← 自動生成されたLLM指示文
│  Generation     │
└────────┬────────┘
         │ システムプロンプト + ユーザー入力
         ▼
┌─────────────────┐
│  LLM            │  ← GPT-4o、Claude、その他のOpenAI互換モデル
│  （生成フェーズ）  │
└────────┬────────┘
         │ OpenUI Langストリーム（ライン単位）
         ▼
┌─────────────────┐
│  Parser         │  ← ライン単位のストリーミング解析
│                 │
└────────┬────────┘
         │ 解析されたコンポーネントツリー
         ▼
┌─────────────────┐
│  Renderer       │  ← <Renderer /> Reactコンポーネント
│  （実行フェーズ）  │
└────────┬────────┘
         │ データフェッチ / 状態管理 / イベント処理
         ▼
┌─────────────────┐
│  Live UI        │  ← ユーザーに表示されるインタラクティブUI
└─────────────────┘
```

---

## コア原則

### 1. Library（ライブラリ — 定義フェーズ）

コンポーネントの「コントラクト」を定義します。

- **Zodスキーマ**: 各コンポーネントのprops型を定義します。
- **Reactレンダラー**: 各コンポーネントがどのようにレンダリングされるかを定義します。
- ライブラリは**単一の信頼できる情報源**: プロンプト生成とレンダリングの両方がこの定義から派生します。

### 2. Parser（パーサー — ストリーミング処理）

LLMストリームをリアルタイムで解析します。

- **ライン単位**: 完全なラインが届いた瞬間に解析します。レスポンス全体を待ちません。
- **堅牢性**: 無効な出力は自動的に除外し、有効な部分のみレンダリングします。
- **非同期**: 解析とレンダリングが同時に進行します。

### 3. Renderer（レンダラー — 実行フェーズ）

解析された結果をReact UIに変換します。

- `<Renderer library={library} stream={stream} />` の形式で使用します。
- **位置引数マッピング**: 解析された位置引数をZodスキーマのキー順序に従ってコンポーネントに渡します。
- **独立実行**: LLM生成完了後、UIは独立して動作します。
  - データフェッチ（クエリ実行）
  - リアクティブ状態管理
  - ユーザーイベント処理（クリック、入力など）

---

## 実装例

```tsx
import { createLibrary, openuiLibrary, Renderer } from "@openuidev/react-lang";
import { useOpenUIStream } from "@openuidev/react-headless";

const library = createLibrary(openuiLibrary);

function ChatMessage({ stream }) {
  const parsed = useOpenUIStream(stream);

  return (
    <Renderer
      library={library}
      stream={parsed}
      // UIがLLMなしに独立して実行される
    />
  );
}
```

---

## 関連コンセプト比較

| 項目 | OpenUIアーキテクチャ | 従来のサーバーレンダリング |
|------|-------------------|----------------------|
| UI生成者 | LLM | 開発者（コード） |
| ストリーミング | ライン単位の段階的レンダリング | 全体完了後に表示 |
| LLM依存性 | 生成フェーズのみ | なし |
| インタラクティビティ | 生成後に独立実行 | 常に独立 |

---

## 関連ドキュメント

- [[OpenUI 概要]] — 4つのコンポーネントの要約
- [仕様 v0.5](specification-v05.md) — OpenUI Lang文法（パーサーが解析する言語）
- [システムプロンプト](system-prompts.md) — プロンプトジェネレーターの詳細
- [[OpenUI API リファレンス]] — パッケージ別API

---

## 注意事項 & 制限

> [!warning] 既知の制約
> RendererはReact環境でのみ動作します。パーサー（`@openuidev/lang-core`）はReactなしで使用できますが、レンダリングにはReactが必須です。

---

## 参考リンク

- [公式ドキュメント: How It Works](https://www.openui.com/docs/openui-lang/how-it-works) (2026-05-15)
- [GitHub: thesysdev/openui](https://github.com/thesysdev/openui) (2026-05-15)
