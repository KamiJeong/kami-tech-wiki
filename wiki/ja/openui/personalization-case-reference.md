---
title: "OpenUI リアルタイムパーソナライズ事例リファレンス"
tags: [openui, generative-ui, personalization]
category: tool
language: ja
date_created: 2026-05-28
date_modified: 2026-05-28
source_count: 0
status: draft
review_cycle: fast-changing
---

# OpenUI リアルタイムパーソナライズ事例リファレンス

## 一文サマリー

OpenUI は文脈に合う UI を生成してストリーミング表示する技術として有望だが、公開情報だけでは大規模な本番サイトが OpenUI でリアルタイムパーソナライズ画面を運用しているとは言えない。

## このページの対象読者

このドラフトは、OpenUI でユーザーごとに画面をリアルタイムに変えるサービスが可能かを検討するプロダクト企画者、サービス責任者、事業担当者向けである。

## なぜ重要か

パーソナライズ画面は、コンバージョン、継続率、学習成果、発見体験に影響する。ただし「そのサイトがパーソナライズしている」ことと「OpenUI を使っている」ことは別の主張である。このページは、OpenUI の根拠と比較可能なパーソナライズ事例を分けて整理する。

## やさしい説明

OpenUI は、AI がテキストだけでなくカード、表、グラフ、フォームなどの UI 部品を作れるようにする生成型 UI フレームワークである。公式ドキュメントでは、コンパクトなストリーミング優先言語、React ランタイム、組み込みコンポーネントライブラリ、チャットインターフェースを含むフルスタックフレームワークとして説明されている。

リアルタイムパーソナライズとは、最近の行動、プロフィール、現在の依頼、その他の文脈に応じて画面が変わることを指す。OpenUI は推薦モデルそのものではなく、選ばれた文脈を安全で構造化された画面に変換する表示レイヤーとして検討するのが自然である。

## 主要概念

| 用語 | 意味 |
|------|------|
| OpenUI | LLM の構造化出力を React でレンダリングするための生成型 UI フレームワーク。 |
| 生成型 UI | AI が現在の依頼に合わせ、許可されたコンポーネントから画面を構成する方式。 |
| リアルタイムパーソナライズ | 現在のユーザー文脈に基づき、内容、順序、レイアウト、フローを変えること。 |
| 適応型画面 | 順序、難易度、操作部品、内容が文脈に応じて変わる画面。 |
| 根拠ステータス | OpenUI 利用が確認済みか、比較事例にとどまるかを示すラベル。 |

## たとえ話

従来のウェブサイトは、全員に同じメニューを渡すレストランに近い。リアルタイムパーソナライズ画面は、来店者の好み、アレルギー、時間帯に応じてメニューの順番やおすすめを変えるスタッフに近い。OpenUI は、そのスタッフが決められた材料と形式の中で、読みやすいメニューをすばやく作るための道具に近い。

## 実務レビューと事例マトリクス

### この根拠の読み方

- **公式デモとサンプル**は OpenUI の可能性を示すが、大規模本番導入を証明しない。
- **公開本番サイト**は成熟したパーソナライズパターンを示すが、信頼できる情報源がなければ OpenUI 事例ではない。
- **ケーススタディやヘルプページ**は機能理解に役立つが、ログイン状態、地域、実験グループで画面が変わる可能性がある。
- **比較事例**は OpenUI 導入の証明ではなく、設計パターンを学ぶための参考である。

### 事例マトリクス

| サイト/サービス | URL | 短い紹介 | パーソナライズ/適応型パターン | OpenUI 根拠ステータス | 出典 | アクセス日 | 実務上の示唆 |
|-----------------|-----|----------|-------------------------------|-----------------------|------|------------|--------------|
| OpenUI Chat デモ | https://www.openui.com/docs/openui-lang | OpenUI 公式ドキュメントのライブチャットデモ。 | 文脈に合うカード、チャート、フォームなどをストリーミング表示。 | Verified OpenUI - 公式デモ、本番導入の証明ではない | [OpenUI Introduction](https://www.openui.com/docs/openui-lang), publication date not shown | 2026-05-28 | PoC の最初の基準にはなるが、運用事例とは扱わない。 |
| Vercel AI Chat サンプル | https://www.openui.com/docs/openui-lang/examples/vercel-ai-chat | Vercel AI SDK の転送層と OpenUI Renderer を組み合わせたサンプル。 | ツール呼び出し結果を OpenUI コンポーネントとして表示。 | Verified OpenUI - 公式サンプル、本番導入の証明ではない | [OpenUI Vercel AI Chat](https://www.openui.com/docs/openui-lang/examples/vercel-ai-chat), publication date not shown | 2026-05-28 | 既存チャット基盤に OpenUI 表示層を接続する検証に使える。 |
| Netflix | https://www.netflix.com/ | 動画ストリーミングサービス。 | ホーム画面の行、タイトル順序、推薦コンテンツを個別調整。 | OpenUI利用未確認 - 比較事例 | [Netflix Help: Recommendations](https://help.netflix.com/en/node/100639), publication date not shown | 2026-05-28 | 生成 UI の前に、ランキングと配置戦略の設計が必要。 |
| Spotify | https://www.spotify.com/ | 音楽とポッドキャストのサービス。 | Home、Search、個人向けプレイリストで内容を選択・並べ替え。 | OpenUI利用未確認 - 比較事例 | [Spotify Understanding Recommendations](https://www.spotify.com/au/safetyandprivacy/understanding-recommendations), publication date not shown | 2026-05-28 | 嗜好プロファイルと編集キュレーションは併用できる。 |
| TikTok For You | https://www.tiktok.com/ | ショート動画プラットフォーム。 | 行動とフィードバックで For You フィードを継続的に調整。 | OpenUI利用未確認 - 比較事例 | [TikTok Newsroom](https://newsroom.tiktok.com/how-tiktok-recommends-videos-for-you), published 2020-06-18 | 2026-05-28 | リアルタイムフィードには関連性だけでなく多様性と安全性の制御が必要。 |
| YouTube | https://www.youtube.com/ | 動画プラットフォーム。 | ホーム、Up Next、Shorts、一部の棚をパーソナライズ。 | OpenUI利用未確認 - 比較事例 | [YouTube Help: recommendations](https://support.google.com/youtube/answer/16089387), publication date not shown | 2026-05-28 | 履歴、低評価、興味なしなどのユーザー制御が重要。 |
| Amazon shopping | https://www.amazon.com/ | EC マーケットプレイス。 | ホーム、購入導線、商品説明、セール、メールで個別推薦。 | OpenUI利用未確認 - 比較事例 | [About Amazon](https://www.aboutamazon.com/news/retail/amazon-generative-ai-product-search-results-and-descriptions), publication date not shown | 2026-05-28 | 商品選択だけでなく説明文もパーソナライズ対象になる。 |
| Airbnb | https://www.airbnb.com/ | 宿泊、体験、サービス予約のマーケットプレイス。 | ホーム表示、検索、目的地提案、レビュー順序に推薦システムを使用。 | OpenUI利用未確認 - 比較事例 | [Airbnb recommendation systems](https://www.airbnb.com/help/article/4083), publication date not shown | 2026-05-28 | 検索型サービスではフィルター、季節性、位置、予約条件が重要な文脈になる。 |
| Duolingo | https://www.duolingo.com/ | 言語学習アプリ。 | 学習中の成績に応じて後半の問題難易度をリアルタイムに調整。 | OpenUI利用未確認 - 比較事例 | [Duolingo adaptive lessons](https://blog.duolingo.com/keeping-you-at-the-frontier-of-learning-with-adaptive-lessons/), publication date not shown | 2026-05-28 | 適応型 UI は推薦だけでなく難易度と学習フローにも使える。 |
| Stitch Fix Style Shuffle | https://www.stitchfix.com/ | パーソナルスタイリングとショッピングのサービス。 | 好き/嫌いの反応でスタイル嗜好と推薦をリアルタイム更新。 | OpenUI利用未確認 - 比較事例 | [Stitch Fix Newsroom](https://newsroom.stitchfix.com/blog/10-billion-interactions-and-counting-on-style-shuffle-the-data-powering-your-personalized-shopping-experience/), publication date not shown | 2026-05-28 | 短いフィードバックループは推薦品質と参加度を同時に高められる。 |

### 実現可能性の判断

| 区分 | 判断 |
|------|------|
| 確認済み事実 | OpenUI 公式情報は、ストリーミングレンダリング、コンポーネントライブラリ由来のプロンプト、ランタイムのクエリ/ミューテーション実行、チャット例を支持している。 |
| 合理的な解釈 | OpenUI は推薦モデルそのものではなく、生成された表示レイヤーとして評価するのが適切である。 |
| 仮定 | ユーザーデータ、権限、推薦ロジック、安全フィルターがあるなら、OpenUI を個別画面のレンダラーとして検証できる可能性がある。 |
| 未解決の問い | 公開情報だけでは、大規模本番サイトが OpenUI でリアルタイムパーソナライズ画面を提供しているとは確認できない。 |

### 推奨判断

OpenUI は即時の全社採用ではなく、2-4 週間の限定 PoC として検証するのが妥当である。新しい推薦モデルを作る前に、既存のセグメント、推薦結果、テストデータをカード、表、フォーム、ダッシュボードとして安全に表示できるかを確認する。

## よくある誤解

- **パーソナライズしていれば OpenUI を使っている**: 違う。Netflix、Spotify、TikTok などは比較用のパーソナライズ事例であり、OpenUI 利用の証拠ではない。
- **AI が UI を生成すれば自動的にリアルタイムになる**: 違う。最新データ、イベント処理、遅延、権限管理が必要である。
- **デモが動けば本番準備は完了している**: 違う。セキュリティ、監視、フォールバック、A/B テスト、コスト管理は別に検証する必要がある。

## 関連用語

- [OpenUI 紹介](introduction.md)
- [OpenUI アーキテクチャ](architecture.md)
- [OpenUI システムプロンプト](system-prompts.md)
- [OpenUI Personalization Terminology](../../glossary/openui-personalization-terms.md)

## さらに読む

- [OpenUI Introduction](https://www.openui.com/docs/openui-lang)
- [OpenUI Architecture](https://www.openui.com/docs/openui-lang/how-it-works)
- [OpenUI GitHub repository](https://github.com/thesysdev/openui)
- [Amazon Personalize real-time recommendations](https://docs.aws.amazon.com/personalize/latest/dg/recommendations.html)

## 言語メモ

"OpenUI" は固有名として翻訳しない。"Generative UI" は "生成型 UI" とし、初出では「AI が画面構成を文脈に合わせて組み立てる方式」と説明する。"Real-time personalization" は "リアルタイムパーソナライズ"、"Evidence status" は "根拠ステータス" に統一する。

## 高度なメモ

OpenUI の公式アーキテクチャは、生成と実行の分離を強調している。LLM が UI の配線を生成し、ランタイムがクエリ、ミューテーション、状態変化を実行する。PoC では、すべてのクリックを LLM に戻す設計と比べ、遅延とコストがどう変わるかを確認するべきである。
