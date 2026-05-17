---
title: "Codex CLI"
aliases: []
tags: [codex-cli, openai, ai-coding, cli]
category: tool
tool: "Codex CLI"
language: ja
date_created: 2026-05-15
date_modified: 2026-05-15
source_count: 0
related: []
status: active
---

# Codex CLI

> OpenAIが開発したターミナルベースのAIコーディングエージェント。プロジェクトのコードを読み込み、編集し、実行する機能をターミナル上で直接提供します。承認モード、スラッシュコマンド、画像解析をサポートしています。（v0.130.0、Apache 2.0）

---

## 主な概念

- **承認モード（Approval Mode）**: エージェントがファイルシステムやシェルをどの程度自律的に操作できるかを決める権限レベル。Auto（自動）、Read-Only（読み取り専用）、Full Access（フルアクセス）の3種類があります。
- **スラッシュコマンド（Slash Commands）**: 対話セッション中に入力するコマンド。`/new`、`/resume`、`/plan`、`/review`、`/diff`、`/permissions`、`/status` などでワークフローを切り替えられます。
- **非対話型モード（Non-Interactive Mode）**: `codex exec` コマンドを使うと、フルスクリーンUIなしでエージェントを実行できます。CI/CDパイプラインでの自動化に適しています。
- **MCP（Model Context Protocol）**: サードパーティツールや追加のコンテキストをCodex CLIエージェントに統合するための拡張プロトコルです。

---

## 使用シナリオ

| 適している場合 | 適していない場合 |
|--------------|----------------|
| コード開発・デバッグ・リファクタリング | 単純なファイル参照やコピー作業 |
| テストコードの作成と実行 | OpenAIアカウントまたはAPIキーがない場合 |
| 大規模なコードベースの移行 | Windowsネイティブ環境での本番利用（WSL2推奨） |
| CI/CD自動化（PRレビュー、リリースノート生成） | macOS Homebrewインストールでのコンピューター使用機能 |
| データ分析・可視化の自動化 | オフライン環境 |

---

## クイックスタート

### システム要件

| 項目 | 要件 |
|------|------|
| 対応OS | macOS、Linux、Windows（WSL2推奨） |
| RAM | 最小2 GB、推奨4 GB |
| Node.js | 22以上（npmインストール方式の場合） |
| 認証 | ChatGPT Plus/Pro/Business/Edu/Enterpriseアカウント、またはOpenAI APIキー |

### インストール

```bash
# npmでインストール（推奨）
npm install -g @openai/codex

# Homebrewでインストール（macOS）
brew install --cask codex
```

> [!warning] 注意
> スコープなしの `codex` npmパッケージは2012年の無関係なツールです。必ず `@openai/codex` を使用してください。

### 基本的な使い方

```bash
# 対話モードを起動（カレントディレクトリ基準）
codex

# 単一タスクの実行
codex "支払いモジュールのバグを見つけて修正して"

# 非対話型の自動化
codex exec "最近のコミットからリリースノートを生成して"

# 画像を添付して分析
codex --image before.png,after.png "2つのスクリーンショットを比較して"
```

**結果**: エージェントがリクエストを分析し、承認モードに応じてファイルの読み込み・編集・コマンド実行を行います。

> [!tip] はじめての方へ
> `codex` を実行するとフルスクリーンのターミナルUIが開きます。まずは Read-Only モード（`/permissions`）でエージェントの動作を確認してから、フルアクセスに切り替えることをお勧めします。

---

## 統合・連携

- **GitHub Actions**: `openai/codex-action` ワークフローを使って、CI/CDパイプラインでCodex CLIを実行できます。
- **MCPツール**: Model Context Protocolを通じてサードパーティツールをエージェントに接続できます。
- **サブエージェント**: 大規模または並列処理可能なタスクを複数のCodexエージェントに委任できます。

---

## 注意事項・制限

> [!warning] 既知の制約

| 項目 | 内容 |
|------|------|
| 使用量制限 | 5時間のローリングウィンドウ＋週間クォータ制限。クォータはChatGPTプランにより異なります |
| Windowsサポート | ネイティブWindowsは実験的サポート段階。本番環境ではWSL2の使用を推奨します |
| macOS Homebrew | Homebrewでインストールした場合、コンピューター使用機能は利用不可。Codex.appバンドルCLIが必要です |
| 週間クォータ・ドリフトバグ | 使用しなくてもクォータの割合が約1%ずつ減少する既知のバグがあります |
| `/status` コマンドの遅延 | 初回起動時は使用量セクションが空白です。最初のメッセージ送信後にデータが読み込まれます |
| コンテキストウィンドウ | コンテキスト圧縮のしきい値はコンテキストウィンドウの90%を超えられません |

> [!note] バージョン情報
> このドキュメントはCodex CLI **v0.130.0**（2026-05-08リリース）を基に作成されています。プロジェクトは頻繁に更新されるため、最新の変更点は公式チェンジログをご確認ください。

---

## 参考リンク

- [Codex CLI 公式ドキュメント](https://developers.openai.com/codex/cli) — CLIリファレンスおよび機能ガイド全体 (2026-05-15)
- [クイックスタートガイド](https://developers.openai.com/codex/quickstart) — 5分で始めるCodex CLI (2026-05-15)
- [GitHubリポジトリ — openai/codex](https://github.com/openai/codex) — ソースコード、Issue、リリースノート (2026-05-15)
- [npmパッケージ @openai/codex](https://www.npmjs.com/package/@openai/codex) — インストール情報とバージョン履歴 (2026-05-15)
- [スラッシュコマンドリファレンス](https://developers.openai.com/codex/cli/slash-commands) — スラッシュコマンドの完全一覧 (2026-05-15)
- [チェンジログ（Changelog）](https://developers.openai.com/codex/changelog) — バージョンごとの変更点 (2026-05-15)
