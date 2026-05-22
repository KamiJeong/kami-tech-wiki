---
title: "Kiro用語集"
aliases: ["Kiro用語", "Kiro術語"]
tags: [kiro, glossary, reference]
category: reference
tool: "Kiro"
language: ja
date_created: 2026-05-19
date_modified: 2026-05-19
source_count: 0
related: ["Kiro概要", "Kiroコアコンセプト：ワークフロー"]
status: draft
review_cycle: fast-changing
freshness_date: 2026-05-19
---

# Kiro用語集

> Kiroアーティクルシリーズ全体で使用される用語のクイックリファレンス。

## この用語集の使い方

これは読み物ではなく参照ドキュメントです。特定の用語に出会ったとき、わかりやすい定義を確認するために調べてください。各用語はコンテキストの中で最初に紹介される記事にリンクしています。

---

## エージェンティックチャット（Agentic Chat）

**定義**: KiroのIDE内の会話AIインターフェース。テキストだけを出力する標準チャットツールとは異なり、エージェンティックチャットはプロジェクト内のファイルを読んで修正し、コマンドを実行し、複数ステップのタスクを実行できる。

**別名**: Kiroチャット、AIチャットパネル

**使用箇所**: [Kiroコアコンセプト：環境](03a-environment-overview.md)

**韓国語**: 에이전틱 챗 (Agentic Chat)
**英語**: Agentic Chat

---

## CLI（コマンドラインインターフェース）

**定義**: ターミナルウィンドウから呼び出すKiroのテキストベースインターフェース。グラフィカルインターフェースなしにIDEと同じAI機能を提供し、自動化とCI/CDパイプラインに便利。

**別名**: Kiro CLI、ターミナルインターフェース

**使用箇所**: [Kiroコアコンセプト：環境](03a-environment-overview.md)

**韓国語**: CLI (명령줄 인터페이스)
**英語**: CLI (Command-Line Interface)

---

## design.md

**定義**: Kiroの仕様書にある技術設計ドキュメント。機能をどのように作るかを説明する：コンポーネント、データ構造、アーキテクチャ。Kiroによって生成され、実装が始まる前に開発者がレビューする。

**別名**: 設計ドキュメント、技術設計

**使用箇所**: [Kiro仕様書の使い方](04-specs-workflow.md)

**韓国語**: 설계 문서 (design.md)
**英語**: design.md (technical design document)

---

## フック（Hooks）

**定義**: ファイルシステムイベントによってトリガーされる自動化されたAIアクション。`.kiro/hooks/`に定義され、パターンに一致するファイルが保存・作成・削除されたとき特定のAIアクションを実行するよう設定される。

**別名**: Kiroフック、ファイルフック、イベントフック

**使用箇所**: [Kiroフックガイド](06-hooks.md)、[Kiroコアコンセプト：ワークフロー](03-core-concepts.md)

**韓国語**: 훅
**英語**: Hooks

---

## IDE（統合開発環境）

**定義**: Kiroのコードを書いて実行するためのグラフィカルインターフェース。Visual Studio Codeをベースに構築されており、ファイルブラウザ、コードエディター、エージェンティックチャットパネル、仕様書ビューアが含まれる。

**別名**: Kiro IDE、Kiroエディター

**使用箇所**: [Kiroとは何か？](01-what-is-kiro.md)

**韓国語**: IDE (통합 개발 환경)
**英語**: IDE (Integrated Development Environment)

---

## Kiro

**定義**: AWSの製品 — エージェンティックIDEとCLI — 非公式なチャットプロンプトの代わりに構造化された仕様書（スペック）を使ってAIコーディングアシスタントを導く。kiro.devで入手可能。2026-05-19時点。

**別名**: AWS Kiro、Kiro IDE

**使用箇所**: [Kiroとは何か？](01-what-is-kiro.md)

**韓国語**: Kiro (키로)
**英語**: Kiro

---

## MCP（モデルコンテキストプロトコル）

**定義**: Kiroが外部ツール・データベース・API・ドキュメントソースに接続するためのオープンスタンダード。MCP（Model Context Protocol / モデルコンテキストプロトコル）により、AIはライブのデータベーススキーマや内部APIドキュメントなど、プロジェクトディレクトリ外の情報にアクセスできる。

**別名**: Model Context Protocol（モデルコンテキストプロトコル）

**使用箇所**: [Kiro MCPガイド](07-mcp.md)、[Kiroコアコンセプト：環境](03a-environment-overview.md)

**韓国語**: MCP (모델 컨텍스트 프로토콜)
**英語**: MCP (Model Context Protocol)

---

## requirements.md

**定義**: Kiroの仕様書にある要件ドキュメント。ユーザーができるべきことを定義するユーザーストーリーと受け入れ基準を含む。Kiroが初期機能説明から生成し、開発者がレビューする。

**別名**: 要件ドキュメント、ユーザーストーリードキュメント

**使用箇所**: [Kiro仕様書の使い方](04-specs-workflow.md)

**韓国語**: 요구사항 문서 (requirements.md)
**英語**: requirements.md (requirements document)

---

## 仕様書（Spec）

**定義**: Kiroにおける仕様書（スペック、Spec）とは、3つの構造化ドキュメントのセットです。requirements.md、design.md、tasks.md — 合わせて機能が何であるか、どのように作るか、どのステップに従うかを定義する。`.kiro/specs/[機能名]/`に保存される。

**別名**: Kiroスペック、仕様書、スペックドキュメント

**使用箇所**: [Kiro仕様書の使い方](04-specs-workflow.md)、[Kiroコアコンセプト：ワークフロー](03-core-concepts.md)

**韓国語**: 명세서 (스펙)
**英語**: Spec (Specification)

---

## ステアリング（Steering）

**定義**: `.kiro/steering/`に保存される持続的なプロジェクト全体の指示ファイル。1つの機能だけでなく、プロジェクト全体に適用される規約、アーキテクチャルール、命名規則、ライブラリの選択についてAIに指示する。

**別名**: ステアリングファイル、Kiroステアリング

**使用箇所**: [Kiroステアリングガイド](05-steering.md)、[Kiroコアコンセプト：ワークフロー](03-core-concepts.md)

**韓国語**: 스티어링 (steering)
**英語**: Steering

---

## tasks.md

**定義**: Kiroの仕様書にあるタスクリストドキュメント。design.mdから導き出された実装ステップの順序付きチェックリスト。各タスクは独立して完了可能で、requirements.mdの受け入れ基準に対して検証できる。

**別名**: タスクリスト、実装タスク

**使用箇所**: [Kiro仕様書の使い方](04-specs-workflow.md)

**韓国語**: 작업 목록 (tasks.md)
**英語**: tasks.md (task list)

---

## バイブコーディング（Vibe coding）

**定義**: 正式な仕様書や計画なしに非公式な会話的指示をAIツールに与える開発アプローチ。シンプルなタスクには速いが、プロジェクトの複雑さが増すにつれて一貫しない結果を生み出す。Kiroはその構造化された代替手段として設計されている。

**別名**: バイブ駆動開発、非公式プロンプティング

**使用箇所**: [Kiroとは何か？](01-what-is-kiro.md)、[Kiroがなぜ重要か](02-why-kiro-matters.md)

**韓国語**: 바이브 코딩 (vibe coding)
**英語**: Vibe coding
