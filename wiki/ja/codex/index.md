---
title: "Codexとは"
aliases: ["OpenAI Codex", "Codex 紹介"]
tags: [codex, openai, ai-coding, code-generation]
category: tool
tool: "OpenAI Codex"
language: ja
date_created: 2026-05-18
date_modified: 2026-05-18
source_count: 1
related: ["Codex CLI", "Codex 101"]
status: active
---

# OpenAI Codex

> OpenAIが開発したAIソフトウェアエンジニアリングツール。自然言語の指示でコードを生成・修正・実行する。クラウドベースの自律エージェントとローカルCLIの2形態で提供される。

---

## コアコンセプト

- **Codex（クラウドエージェント）**: ChatGPTおよびOpenAI APIに組み込まれたソフトウェアエンジニアリングエージェント。コード作成・デバッグ・PR生成をエンドツーエンドで処理する。各タスクは独立したクラウドサンドボックスで実行される。
- **Codex CLI**: ローカルターミナルで動作するAIコーディングエージェント。コードベースを直接読み書きし、承認モードで自律性レベルを調整できる。
- **サンドボックス分離**: クラウドエージェントはネットワークアクセスが制限されたコンテナで実行され、コード実行・テスト・反復が安全に行われる。
- **マルチタスク**: 複数のタスクを同時並列実行でき、従来のシングルエージェント方式と比べてスループットが高い。

---

## 使用シナリオ

| 適した場合 | 適さない場合 |
|-----------|------------|
| 機能実装・バグ修正・リファクタリングの自動化 | オフライン環境またはエアギャップ環境 |
| コードレビュー・PR作成の自動化 | 外部AIツールがポリシーで禁止されている環境 |
| テストコードの作成と実行 | 深いドメイン知識が必要なアーキテクチャ設計 |
| 大規模マイグレーション（言語・フレームワーク変換） | 単純なファイル閲覧・コピー作業 |
| 複数の独立タスクの並列処理 | OpenAIアカウントまたはAPIキーがない場合 |

---

## 2つの形態：クラウドエージェント vs CLI

| | Codex（クラウドエージェント） | Codex CLI |
|---|---|---|
| 実行環境 | OpenAIクラウドサンドボックス | ローカルターミナル |
| アクセス方法 | ChatGPTインターフェース / API | `npm install -g @openai/codex` |
| 自律性 | 完全自律（タスク単位） | 承認モードで調整可能 |
| 並列実行 | 複数タスクの同時実行が可能 | シングルセッション |
| 主な用途 | 複雑な多段階開発タスク | コードベース探索・編集・自動化 |

---

## クイックスタート

### ChatGPTでCodexエージェントを使う

```
1. ChatGPT（Pro/Plusプラン）を開く
2. サイドバーで[Codex]を選択
3. GitHubリポジトリを接続
4. タスクを入力: "src/api/user.tsの認証バグを修正して"
5. エージェントがサンドボックスでコードを分析し、PRを作成
```

### Codex CLIのインストール

```bash
# Node.js 22以上が必要
npm install -g @openai/codex

# 対話モード起動
codex

# 単一タスク実行
codex "このディレクトリのTypeScriptエラーをすべて修正して"
```

> [!tip] はじめての方へ
> ChatGPT Pro/Plusユーザーは追加設定なしにCodexエージェントをすぐ使える。CLIはOpenAI APIキーまたはChatGPTログインが必要。

---

## 統合・連携

- **GitHub**: Codexエージェントがリポジトリに直接接続してPRを作成 → [[GitHub Actions]]
- **Codex CLI**: ターミナルで同じAI機能を利用 → [[Codex CLI]]
- **Codex 101**: セットアップと使い方の完全実践ガイド → [[Codex 101]]
- **MCP**: Model Context Protocolで外部ツールをエージェントに接続

---

## 注意事項・制限事項

> [!warning] 既知の制約
> - Codexクラウドエージェントは ChatGPT Pro/Plus/Team/Enterpriseプランが必要。APIアクセスは別途課金。
> - クラウドサンドボックスはネットワークアクセスが制限されており、外部APIの直接呼び出しには制約がある。
> - 自律実行の結果は必ず人間がレビューする必要がある。複雑なドメインロジックは意図が誤解される場合がある。

> [!note] バージョン情報
> このページはOpenAI Codex公式ページ（https://openai.com/codex）を参照し、2026年5月時点で作成した。

---

## 参考リンク

- [OpenAI Codex公式ページ](https://openai.com/codex) — 概要と機能紹介 (2026-05-18)
- [Codex CLI GitHubリポジトリ](https://github.com/openai/codex) — ソースコード、Issue、リリースノート (2026-05-18)
- [OpenAI開発者ドキュメント](https://platform.openai.com/docs) — APIリファレンスと統合ガイド (2026-05-18)
