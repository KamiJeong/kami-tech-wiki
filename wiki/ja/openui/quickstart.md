---
title: "OpenUI クイックスタート"
aliases: ["openui-quickstart", "openui-getting-started"]
tags: [openui, quickstart, getting-started]
category: tool
language: ja
date_created: 2026-05-15
date_modified: 2026-05-15
source_count: 0
related: [introduction, overview, system-prompts]
status: active
---

# OpenUI クイックスタート

> `npx @openuidev/cli@latest create` コマンド一つで1分以内にGenUIチャットアプリを起動します。

**公式ドキュメント**: [https://www.openui.com/docs/openui-lang/quickstart](https://www.openui.com/docs/openui-lang/quickstart)

---

## 主要コンセプト

- **CLIスキャフォールディング**: `@openuidev/cli`がNext.jsベースのGenUIアプリ全体の構造を自動生成します。
- **即時実行可能**: 生成されたアプリにはチャットレイアウト、OpenAIバックエンドルート、システムプロンプトが含まれます。
- **OpenAI互換**: OpenAI APIだけでなく、OpenRouter、Azure OpenAIなどの互換サービスもすべてサポートします。

---

## ユースケース

| 適している場合 | 適していない場合 |
|--------------|----------------|
| GenUIプロトタイプを素早く作りたい場合 | 既存のNext.jsアプリに統合する場合（手動インストール推奨） |
| OpenUIの機能を初めて試す場合 | カスタムフレームワークを使用する場合 |
| デモアプリが必要な場合 | プロダクションビルドの最適化が完了したアプリ |

---

## クイックスタート

### 方法1: CLIスキャフォールディング（推奨）

```bash
# 1. アプリを作成
npx @openuidev/cli@latest create --name genui-chat-app

# 2. ディレクトリを移動
cd genui-chat-app

# 3. APIキーを設定
echo "OPENAI_API_KEY=sk-your-key-here" > .env

# 4. 開発サーバーを起動
npm run dev
```

**結果**: `http://localhost:3000` ですぐに実行できるGenUIチャットアプリが開きます。

### 方法2: パッケージの直接インストール

既存プロジェクトにOpenUIを追加する場合：

```bash
npm install @openuidev/react-lang @openuidev/react-ui
```

---

## 生成されたアプリの構造

CLIが生成するNext.jsアプリの基本構造：

```
genui-chat-app/
├── src/
│   ├── app/
│   │   ├── api/chat/route.ts   # OpenAI ストリーミングバックエンド
│   │   └── page.tsx            # チャットUIページ
│   └── generated/
│       └── system-prompt.txt   # 自動生成されたシステムプロンプト
├── .env                        # APIキー（OPENAI_API_KEY）
└── package.json
```

> [!tip] はじめての方へ
> `.env`ファイルの`OPENAI_API_KEY`を設定するだけですぐに動作します。OpenRouterを使用する場合は`OPENAI_BASE_URL`も一緒に設定してください。

---

## 統合 & 関連リンク

- **紹介**: OpenUI全体の概要 → [紹介](introduction.md)
- **システムプロンプトのカスタマイズ** → [システムプロンプト](system-prompts.md)
- **チャットUIの詳細** → [Chat SDK 紹介](chat-introduction.md)
- **サンプルアプリの詳細** → [[Vercel AI Chat サンプル]]

---

## 注意事項 & 制限

> [!warning] 既知の制約
> CLIスキャフォールディングはNext.jsベースのアプリのみ生成します。他のフレームワークはパッケージを直接インストールして手動で設定する必要があります。

> [!note] 更新履歴
> `@openuidev/cli`の最新バージョンを使用するには、常に`npx @openuidev/cli@latest`を使用してください。（2026-05-15）

---

## 参考リンク

- [公式ドキュメント: Quick Start](https://www.openui.com/docs/openui-lang/quickstart) (2026-05-15)
- [GitHub: openui-chat サンプル](https://github.com/thesysdev/openui/tree/main/examples/openui-chat) (2026-05-15)
