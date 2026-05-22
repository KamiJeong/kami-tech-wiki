---
title: "Kiro vs GitHub Spec Kit: 何が違うのか？"
aliases: ["Kiro vs Spec Kit", "KiroとSpec Kitの比較", "KiroかSpec Kitか"]
tags: [kiro, spec-kit, comparison, tool]
category: concept
language: ja
date_created: 2026-05-19
date_modified: 2026-05-19
source_count: 2
related: ["Kiro", "Spec-Kit", "仕様駆動開発 (SDD)"]
status: draft
review_cycle: fast-changing
freshness_date: 2026-05-19
---

# Kiro vs GitHub Spec Kit: 何が違うのか？

> Kiroは仕様駆動開発を基盤とするAWSのエージェンティックIDE。Spec KitはClaude Codeに同じSDD規律をもたらすツールキット — 2つのツール、1つの方法論。

## このページの対象読者

このページは、KiroとSpec Kit両方について聞いたことがあり、違い、共通点、いつどちらを使うかを理解したい開発者とプロダクトマネージャーを対象としています。どちらのツールについても深い事前知識は不要です。

## なぜこの比較が重要か

KiroもSpec Kitも仕様駆動開発（SDD、Spec-Driven Development）を実装しています。どちらも実装前に仕様書ドキュメントを生成します。どちらも非公式なプロンプトではなく構造化された仕様書をもとにAIコーディングエージェントを導きます。この共通点から、2つは同じものかと疑問に思うのは合理的です。答えはノーです — 2つのツールは異なる環境で、異なるワークフローで、異なるレベルの統合で同じ問題を解決します。

違いを理解することで、チームの既存ツールに基づいて選択が既に明確な場合に、2つのツールを交換可能なものや競合する代替案として誤って扱う間違いを防げます。

## クイック比較

| 項目 | Kiro | GitHub Spec Kit |
|---|---|---|
| 主な目的 | 仕様駆動開発が内蔵されたエージェンティックIDE | Claude Code向けSDDワークフローツールキット |
| 開発元 | Amazon Web Services (AWS) | このリポジトリ（内部ツールキット、公式製品ではない） |
| 対象ユーザー | SDD専用IDEを望む開発者 | 構造化ワークフローコマンドを望むClaude Codeユーザー |
| インターフェース | IDE（VS Codeベース）+ CLI | Claude Codeスキル（スラッシュコマンド） |
| ワークフロースタイル | 仕様書 → 実装（IDE内部で） | 仕様書作成 → 明確化 → 計画 → タスク → 実装（コマンド順序） |
| 仕様書サポート | requirements.md + design.md + tasks.md | spec.md + plan.md + tasks.md |
| AIエージェント統合 | Kiro自体のエージェンティックAI（AWSホスト） | Claude（Anthropic）via Claude Code |
| 開始の難しさ | KiroのインストールとセットアップSTEP | Claude CodeとリポジトリのSpec Kitスキルが必要 |
| 最適な用途 | SDD内蔵の統合IDEを望むチーム | 構造化ワークフローを望むClaude Code使用チーム |
| 限界 | AWS製品（アカウント/アクセス必要）、IDEロックイン | Claude Code依存、内部ツールキット（商業的配布なし） |

## 詳細比較

### 目的

両ツールとも仕様駆動開発を実装しますが、レベルが異なります。KiroはIDE自体にSDDが組み込まれた完全な開発環境です。仕様書ワークフローは製品の中核機能で、IDEインターフェースがそれを表面化し、管理し、実行します。Spec Kitはすでに使っているClaude Code環境の上に追加されたワークフロー層です。構造化されたワークフローを提供しますが、Claude Code環境の中でです。

実用的に説明すると：Kiroは環境自体です。Spec KitはClaude Code内で実行されるワークフローパターンです。

### インターフェース

Kiroはグラフィカルないde（VS Codeベース）とCLIを提供します。IDEにはファイルブラウザ、統合エージェンティックチャット（Agentic Chat）パネル、仕様書ドキュメント管理が組み込まれています。Kiroを開けば仕様書ワークフローに即座にアクセスできます。

Spec KitはClaude Codeコマンドを通じて動作します。別のアプリケーションはありません — Claude CodeインターフェースでSpec Kitコマンドを実行すると、アウトプット（Markdownファイル）がプロジェクトディレクトリに現れます。体験はよりテキストベースで視覚的な統合が低いです。

### ワークフロー

Kiroのワークフローは、IDE内で生成された3つの仕様書ドキュメント（requirements.md、design.md、tasks.md）を中心にします。ワークフローはKiro主導です。機能を説明すると、Kiroが仕様書を生成し、レビュー後、Kiroが実装します。

Spec Kitのワークフローはコマンド主導です。それぞれのコマンドをレビュー後に実行するコマンド順序（`/speckit-specify`、`/speckit-plan`、`/speckit-tasks`、`/speckit-implement`）を実行します。ワークフローがより明示的でステップごとで、開発者に各ステージへのより多くのコントロールを与えます。

### AI統合

KiroはAWS独自のAIモデルをIDEに直接統合して使います。モデルはKiro専用 — どのAIが実行されるかは選べません。

Spec KitはClaude Codeを通じてClaude（AnthropicのAIモデル）を使います。チームがすでにClaude Codeを使っているなら、Spec Kitは新しいAI依存なしに構造化されたワークフローコマンドで拡張します。

## 両方を使えますか？

はい。KiroとSpec Kitは相互排他的ではありません。チームはKiro IDEで維持されるコードベースの機能開発にKiroを使い、Claude Code環境でのリポジトリのドキュメント化、仕様書作成、またはワークフローステップにSpec Kitを使えます。各ツールが生成する仕様書成果物は普通のMarkdownファイルで、特定のツールエコシステムにロックされていません。

しかし、ほとんどのチームは主な開発環境に基づいてどちらかを使うことになります。VS Codeベースのツールを使い統合されたSDD体験を望むならKiroが自然な選択です。AI支援開発にClaude Codeを使うならSpec Kitが自然な選択です。

## よくある誤解

1. **「Spec KitはClaude CodeバージョンのKiroだ。」** — どちらもSDDを実装しますが、異なる形で構築され、異なるAIモデルを使い、異なるレベルのIDE統合があります。方法論は共有しますが、ツールは同等ではありません。
2. **「どちらかを選ばなければならない。」** — 2つのツールは異なる環境で動作し、共存できます。選択はどちらが客観的に優れているかではなく、開発環境によります。
3. **「Kiroは完全なIDEだからより強力だ。」** — 強力さは適合性にかかっています。チームがClaude Codeで作業しているなら、KiroのIDEを追加すると新たに学んで管理するツールが増えます。Spec Kitはすでに使っているツールに構造を追加します。絶対的な能力よりも適合性が重要です。

## 関連用語

- [Kiroとは何か？](kiro/01-what-is-kiro.md) — Kiroの全体概要
- [GitHub Spec Kitとは何か？](spec-kit/01-what-is-spec-kit.md) — Spec Kitの全体概要
- [仕様駆動開発 (SDD)](sdd/index.md) — 2つのツールが実装する共通の方法論

## 参考資料

- [Kiro公式サイト](https://kiro.dev) — Kiro製品ドキュメントとダウンロード。2026-05-19時点。
- [Claude Code公式ドキュメント](https://docs.anthropic.com/claude-code) — スキル/コマンドを含むClaude Codeドキュメント。2026-05-19時点。
