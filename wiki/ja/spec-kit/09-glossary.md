---
title: "Spec Kit用語集"
aliases: ["Spec Kit用語", "Spec Kit術語"]
tags: [spec-kit, glossary, reference]
category: reference
tool: "Spec-Kit"
language: ja
date_created: 2026-05-19
date_modified: 2026-05-19
source_count: 0
related: ["Spec Kit概要", "Spec Kitコアコンセプト"]
status: draft
review_cycle: fast-changing
freshness_date: 2026-05-19
---

# Spec Kit用語集

> Spec Kitアーティクルシリーズ全体で使用される用語のクイックリファレンス。

## この用語集の使い方

これは読み物ではなく参照ドキュメントです。特定の用語に出会ったとき、わかりやすい定義を確認するために調べてください。各用語はコンテキストの中で最初に紹介される記事にリンクしています。

---

## プロジェクト憲章（Constitution）

**定義**: すべての機能が従うべきルールを定義するプロジェクト全体のガバナンスドキュメント。`/speckit-constitution`で作成。プロジェクトのすべての機能仕様書に継承される。

**別名**: constitution、ガバナンスドキュメント

**使用箇所**: [Spec Kitコアコンセプト](03-core-concepts.md)、[Spec Kitコマンドガイド](05-command-guide.md)

**韓国語**: 프로젝트 규약
**英語**: Constitution

---

## フィーチャーブランチ（Feature Branch）

**定義**: 1つの機能の開発のために作られたgitブランチ。Spec Kitワークフローは通常フィーチャーブランチで実行され、パイプライン成果物と実装がメインブランチにマージされる前にレビューできるようにする。

**別名**: トピックブランチ、開発ブランチ

**使用箇所**: [Spec Kitワークフロー](04-workflow.md)

**韓国語**: 기능 브랜치 (feature branch)
**英語**: Feature Branch

---

## 実装ガード（Implementation Guard）

**定義**: 完了とマークされたタスクが実際の実装で裏付けられているかを確認する検証チェック。「ファントム完了」— 対応するコードなしに`[X]`とマークされたタスク — を発見する。

**別名**: verify-tasks、ファントム完了チェック

**使用箇所**: [Spec Kitのリスクと限界](08-risks.md)

**韓国語**: 구현 검증 (implementation guard)
**英語**: Implementation Guard

---

## パイプラインアーティファクト（Pipeline Artifact）

**定義**: Spec Kitワークフローの特定のステップで生成されたMarkdownファイル。3つの主要な成果物は`spec.md`、`plan.md`、`tasks.md`。リポジトリにコミットされ、機能の開発の文書化された記録として機能する。

**別名**: 成果物、仕様書成果物、ワークフロー出力

**使用箇所**: [GitHub Spec Kitとは何か？](01-what-is-spec-kit.md)、[Spec Kitコアコンセプト](03-core-concepts.md)

**韓国語**: 파이프라인 아티팩트 (pipeline artifact)
**英語**: Pipeline Artifact

---

## plan.md

**定義**: `/speckit-plan`が生成する実装計画ドキュメント。機能の技術的アプローチ、技術スタック、ファイル構造、段階的な実装順序を説明する。

**別名**: 実装計画書、技術計画

**使用箇所**: [Spec Kitコアコンセプト](03-core-concepts.md)、[Spec Kitコマンドガイド](05-command-guide.md)

**韓国語**: 구현 계획서 (plan.md)
**英語**: plan.md (implementation plan)

---

## 品質ゲート（Quality Gate）

**定義**: 実装が仕様書を満たしているかを体系的に確認する検証ステップ。`/speckit-verify-run`で実行。満たされていない受け入れ基準と、完了とマークされているが実際の実装がないタスクを特定する。

**別名**: 検証、検証ゲート、品質チェック

**使用箇所**: [Spec Kitコアコンセプト](03-core-concepts.md)、[Spec Kitコマンドガイド](05-command-guide.md)

**韓国語**: 품질 검증 (quality gate)
**英語**: Quality Gate

---

## 仕様駆動開発 SDD（Spec-Driven Development）

**定義**: Spec Kitが実装するソフトウェア開発方法論。SDDではコードを書く前に仕様書を書き、その仕様書が実装と検証の単一の真実の原源（single source of truth）として機能する。

**別名**: SDD、仕様書優先開発

**使用箇所**: [GitHub Spec Kitとは何か？](01-what-is-spec-kit.md)、[Spec Kitコアコンセプト](03-core-concepts.md)

**韓国語**: 명세서 중심 개발 (SDD)
**英語**: Spec-Driven Development (SDD)

---

## spec.md

**定義**: `/speckit-specify`が生成する機能仕様書ドキュメント。ユーザーストーリー、受け入れ基準、スコープ外項目、エッジケース、依存関係を含む。それ以降のすべてのSpec Kitコマンドへの基本的な入力。

**別名**: 仕様書、スペック、機能仕様書

**使用箇所**: [Spec Kitコアコンセプト](03-core-concepts.md)、[Spec Kitコマンドガイド](05-command-guide.md)

**韓国語**: 명세서 (spec.md)
**英語**: spec.md (specification)

---

## Spec Kit

**定義**: リポジトリでClaude Codeスキルとして実装されたSDDツールキット。仕様書優先ワークフローを通じてClaude Codeを導く一連のコマンドを提供する。GitHubの公式製品ではない。

**別名**: GitHub Spec Kit、スペックキット

**使用箇所**: [GitHub Spec Kitとは何か？](01-what-is-spec-kit.md)

**韓国語**: Spec Kit (스펙킷)
**英語**: Spec Kit

---

## tasks.md

**定義**: `/speckit-tasks`が生成する実装タスクリスト。`plan.md`から導き出された順序付きで独立して完了可能な実装ステップのチェックリスト。各タスクは`/speckit-implement`の実行中に完了すると`[X]`とマークされる。

**別名**: タスクリスト、実装タスク、作業分解

**使用箇所**: [Spec Kitコアコンセプト](03-core-concepts.md)、[Spec Kitコマンドガイド](05-command-guide.md)

**韓国語**: 작업 목록 (tasks.md)
**英語**: tasks.md (task list)
