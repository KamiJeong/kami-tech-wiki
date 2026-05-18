---
title: "Spec-Kit"
aliases: ["speckit", "Spec Kit"]
tags: [spec-kit, claude-code, sdd, workflow, tool]
category: tool
tool: "Spec-Kit"
language: ja
date_created: 2026-05-18
date_modified: 2026-05-18
source_count: 8
related: ["Spec-Driven Development (SDD)", "Kiro"]
status: active
---

# Spec-Kit

> Claude Code 環境で Spec-Driven Development を実践する6段階ワークフローツール。自然言語による機能説明を構造化された仕様、実装計画、タスクリスト、検証済みコードへと変換します。

---

## Spec-Kit とは？

Spec-Kit は、このプロジェクトの `.claude/skills/` ディレクトリに内蔵された SDD ワークフローツールチェーンです。Claude Code のスラッシュコマンドシステムを基盤として、Spec-Driven Development ([[Spec-Driven Development (SDD)|SDD]]) の6段階パイプラインを構造化されたコマンドとして提供します。

Spec-Kit を使用することで、「何を作るか」を仕様として先に定義し、AI エージェントがその仕様に基づいて計画を立て、タスクを生成し、実装を実行し、結果を検証する全プロセスを一貫した方法で管理できます。

---

## コア概念

- **パイプライン (Pipeline)**: `specify → clarify → plan → tasks → implement → verify` の6段階で構成される開発フロー
- **スラッシュコマンド (Slash Commands)**: Claude Code で `/speckit-specify` 形式で実行するワークフロートリガー
- **拡張フック (Extension Hooks)**: 各パイプライン段階の前後に実行される自動化フックシステム
- **パイプライン状態 (Pipeline State)**: `pipeline-state.json` で各段階の完了状況とブロック状態を追跡

---

## パイプライン6段階

### 第1段階: Specify (仕様作成)

**コマンド**: `/speckit-specify`

自然言語で記述された機能説明を、構造化された `spec.md` に変換します。機能要件 (FR)、成功基準 (SC)、受け入れシナリオ、非機能要件、明示的なスコープ外項目を含む完全な仕様文書を生成します。

**出力**: `specs/<feature>/spec.md`

### 第2段階: Clarify (仕様の明確化)

**コマンド**: `/speckit-clarify`

生成された仕様の中で不明確または不完全な部分を特定し、最大5つの重要な明確化質問を提示します。回答は自動的に `spec.md` に反映されます。

**出力**: 更新された `specs/<feature>/spec.md`

### 第3段階: Plan (実装計画の策定)

**コマンド**: `/speckit-plan`

仕様に基づいて技術スタック、アーキテクチャ、ファイル構造、段階的な実装アプローチを定義した `plan.md` を生成します。この段階でバージョンガードチェックとコンスティテューション検証が自動実行されます。

**出力**: `specs/<feature>/plan.md`、`specs/<feature>/research.md`、`specs/<feature>/data-model.md`

### 第4段階: Tasks (タスク生成)

**コマンド**: `/speckit-tasks`

計画を依存関係順に整理された実用的なタスクリストに変換します。各タスクには ID、説明、対象ファイルパス、並列実行可能フラグ (`[P]`) が含まれます。タスクは完全なトレーサビリティのために仕様要件に直接マッピングされます。

**出力**: `specs/<feature>/tasks.md`

### 第5段階: Implement (実装)

**コマンド**: `/speckit-implement`

`tasks.md` のタスクを依存関係順に実行し、指定されたすべてのファイルとコードを生成します。並列タスク (`[P]`) は同時に処理されます。各タスクの完了時に `tasks.md` で `[X]` とマークされます。

**出力**: `tasks.md` で指定されたすべてのファイル、すべてのタスクが `[X]` にマーク済み

### 第6段階: Verify (検証)

**コマンド**: `/speckit-verify-run`

非破壊的な検証ゲートを実行します。実装された結果を `spec.md`、`plan.md`、`tasks.md`、`constitution.md` と照合して検証します。ファントム完了（対応する実装なしに `[X]` とマークされたタスク）を検出し、未充足の要件を報告します。

**出力**: 合否ステータスと実用的な修正項目を含む検証レポート

---

## 主要コマンド

| コマンド | 段階 | 説明 |
|---------|------|------|
| `/speckit-specify` | Specify | 機能説明を spec.md に変換 |
| `/speckit-clarify` | Clarify | 不明確な部分を質問で明確化 |
| `/speckit-plan` | Plan | 技術計画とアーキテクチャドキュメントを生成 |
| `/speckit-tasks` | Tasks | 依存関係順のタスクリストを生成 |
| `/speckit-implement` | Implement | tasks.md に基づく実際の実装を実行 |
| `/speckit-auto` | 全パイプライン | パイプライン全体を一度に実行 |
| `/speckit-analyze` | 分析 | spec.md、plan.md、tasks.md の整合性チェック |
| `/speckit-verify-run` | Verify | 実装結果を仕様と照合して検証 |

---

## クイックスタート

Spec-Kit で初めての機能を6ステップで開発する方法:

```bash
# Claude Code で実行

# ステップ1: 仕様を作成する
/speckit-specify
# プロンプト: "ユーザー認証機能を追加 — メール/パスワードログイン、JWTトークン発行"

# ステップ2: 曖昧な部分を明確化する (推奨)
/speckit-clarify

# ステップ3: 実装計画を生成する
/speckit-plan

# ステップ4: タスクリストを生成する
/speckit-tasks

# ステップ5: 実装を実行する
/speckit-implement

# ステップ6: 結果を検証する
/speckit-verify-run
```

または、単一コマンドでパイプライン全体を実行:

```bash
/speckit-auto
# プロンプト: "ユーザー認証機能を追加 — メール/パスワードログイン、JWTトークン発行"
```

**結果**: `spec.md`、`plan.md`、`tasks.md` と実装ファイルが揃った `specs/<feature>/` ディレクトリが完成し、検証ステージがすべての要件の充足を確認します。

> [!tip] はじめる前に
> 最初の機能では各段階を個別に実行して、各ステップが何を生成するかを確認することをお勧めします。仕様の品質が実装の品質を決定します — `/speckit-clarify` に投資した時間は `/speckit-implement` で報われます。

---

## 拡張フックシステム

Spec-Kit は各パイプライン段階の前後にコマンドを実行する自動化フックシステムをサポートしています。フックは `.specify/extensions.yml` で定義されます:

```yaml
hooks:
  before_implement:
    - extension: git
      command: speckit.git.commit
      enabled: true
      optional: false
      description: "実装前の自動コミット"

  after_implement:
    - extension: verify
      command: speckit.verify.run
      enabled: true
      optional: true
      description: "実装後の自動検証"
```

組み込みフック:

- **Git フック**: 各段階の境界で自動コミット (`speckit-git-commit`)
- **バージョンガード**: ライブレジストリに対する技術スタックのバージョン検証 (`speckit-version-guard-check`)
- **DocGuard**: ドキュメント品質ゲート (`speckit-docguard-guard`)
- **トークンアナライザー**: パイプライン実行間のトークン消費追跡 (`speckit-token-analyzer-baseline`)

---

## SDD の実践としての Spec-Kit

Spec-Kit は Spec-Driven Development ([[Spec-Driven Development (SDD)|SDD]]) を Claude Code で実践するための具体的な実装です。各 SDD 原則はパイプラインの段階に直接対応しています:

- **仕様優先 (Spec-First)** → `/speckit-specify` により実装開始前に仕様が存在することを保証
- **生きた仕様 (Living Specification)** → `/speckit-clarify` と段階レベルの仕様更新により仕様を最新に維持
- **反復的精練 (Iterative Refinement)** → 要件の進化に合わせて6段階サイクルを繰り返し実行可能
- **検証可能性 (Verifiability)** → `/speckit-verify-run` により全要件チェックを自動化・追跡可能に

---

## 統合 & 連携

- **SDD 方法論**: Spec-Kit が実装する基盤的アプローチ → [[Spec-Driven Development (SDD)]]
- **Kiro**: AWS IDE 環境での並行した SDD アプローチ → [[Kiro]]

---

## 注意事項 & 制限

> [!warning] 既知の制約
> - **Claude Code 専用**: Spec-Kit は Claude Code のスラッシュコマンドシステムと密接に結合しており、他の AI エージェントや IDE では動作しません。
> - **仕様品質への依存**: 曖昧または不完全な仕様は曖昧な実装を生成します。パイプラインは最初の機能説明の品質（またはその欠如）を増幅します。
> - **大規模機能**: タスク数が非常に多い機能は、単一の Claude Code セッションでの完全な実装が困難な場合があります。大きな機能をより小さな独立して仕様化可能なインクリメントに分割することをお勧めします。

> [!note] 内部ツール
> Spec-Kit はこのプロジェクトに特化した内部ツールです。実装はこのリポジトリの `.claude/skills/speckit-*` ファイルにあります。

---

## 参考リンク

- [Claude Code 公式ドキュメント](https://docs.anthropic.com/claude-code) — Spec-Kit が動作する Claude Code 環境 (2026-05-18)
- [Kiro 公式サイト](https://kiro.dev) — AWS IDE 環境での並行した SDD アプローチ (2026-05-18)
