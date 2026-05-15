---
title: "OpenUI 紹介"
aliases: ["openui-intro", "generative-ui-framework"]
tags: [openui, generative-ui, introduction]
category: tool
language: ja
date_created: 2026-05-15
date_modified: 2026-05-15
source_count: 0
related: [overview, quickstart, architecture]
status: active
---

# OpenUI 紹介

> LLMがUIを直接生成できるように設計されたフルスタック Generative UI フレームワーク。JSONと比べて最大67%少ないトークンでストリーミングUIをレンダリングします。

**公式ドキュメント**: [https://www.openui.com/docs/openui-lang](https://www.openui.com/docs/openui-lang)

---

## 主要コンセプト

- **OpenUI Lang**: LLMがUIを生成するためのコンパクトなストリーミングファーストの言語。JSONより大幅に少ないトークンで同等のUIを表現できます。
- **ストリーミングレンダリング**: モデルのレスポンストークンが届いた瞬間にUIを段階的にレンダリングします。ユーザーはレスポンス完了を待つ必要がありません。
- **コンポーネントライブラリ**: Zodスキーマで定義された型安全なコンポーネント群。チャート、フォーム、テーブル、レイアウトなどを標準提供します。
- **生成と実行の分離**: LLMがUIを一度生成すると、以降のデータフェッチ・状態管理・ユーザーイベント処理はLLMの介入なしに独立して実行されます。

---

## ユースケース

| 適している場合 | 適していない場合 |
|--------------|----------------|
| AIアシスタントが動的にUIを生成する必要がある場合 | 静的なUIが必要な場合 |
| チャットインターフェースにインタラクティブなカード・チャートを表示する場合 | React以外の環境（Angular、Vueなど） |
| LLMのレスポンスを構造化されたUIで表現する場合 | バックエンド専用のAPIサーバー |
| Generative ダッシュボード、CRUDインターフェースを素早く構築する場合 | 複雑なカスタムアニメーションが必要な場合 |

---

## パッケージ構成

| パッケージ | 役割 |
|-----------|------|
| `@openuidev/react-lang` | コアランタイム — コンポーネント定義、パーサー、レンダラー、プロンプト生成 |
| `@openuidev/react-headless` | ヘッドレスチャット状態管理とストリーミングアダプター |
| `@openuidev/react-ui` | 事前構築されたチャットレイアウトとコンポーネントライブラリ |
| `@openuidev/cli` | アプリのスキャフォールディングとシステムプロンプト生成ツール |

---

## クイックスタート

```bash
npx @openuidev/cli@latest create --name my-genui-app
cd my-genui-app
echo "OPENAI_API_KEY=sk-your-key-here" > .env
npm run dev
```

**結果**: `http://localhost:3000` でGenUIチャットアプリがすぐに起動します。

> [!tip] はじめての方へ
> OpenAI互換APIを提供するサービス（OpenRouter、Azure OpenAIなど）も使用できます。

---

## トークン効率

7つのUIシナリオに基づく測定結果：

| 比較対象 | トークン削減率 |
|---------|-------------|
| Vercel JSON-Render方式 | **-52.8%** |
| Thesys C1 JSON方式 | **-51.7%** |

---

## 統合 & 関連リンク

- **アーキテクチャ理解**: パイプライン全体の流れ → [[OpenUI アーキテクチャ]]
- **クイックスタート**: 1分で起動 → [クイックスタート](quickstart.md)
- **概要**: 4つのコアコンポーネント → [概要](overview.md)
- **Chat SDK**: チャットインターフェース構築 → [Chat SDK 紹介](chat-introduction.md)

---

## 注意事項 & 制限

> [!warning] 既知の制約
> Reactベースのフレームワーク（Next.js、Remixなど）でのみ動作します。React Nativeは別途サンプル（`examples/openui-react-native`）を参照してください。

> [!note] 更新履歴
> OpenUI Lang v0.5が最新バージョンで、リアクティブState、Query、Mutationをサポートしています。（2026-05-15時点）

---

## 参考リンク

- [公式ドキュメント: OpenUI 紹介](https://www.openui.com/docs/openui-lang) (2026-05-15)
- [GitHub: thesysdev/openui](https://github.com/thesysdev/openui) (2026-05-15)
- [thesys.dev ブログ: OpenUI 紹介](https://www.thesys.dev/blogs/openui) (2026-05-15)
