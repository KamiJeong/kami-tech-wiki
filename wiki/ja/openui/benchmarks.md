---
title: "OpenUI ベンチマーク"
aliases: ["openui-benchmarks", "openui-token-efficiency"]
tags: [openui, benchmark, token, performance]
category: concept
language: ja
date_created: 2026-05-15
date_modified: 2026-05-15
source_count: 0
related: [introduction, overview, specification-v05]
status: active
---

# OpenUI ベンチマーク

> `tiktoken`（GPT-5エンコーダー）基準の7つのUIシナリオで、OpenUI LangはJSONベースの方式と比べて最大67%少ないトークンを使用します。

**公式ドキュメント**: [https://www.openui.com/docs/openui-lang/benchmarks](https://www.openui.com/docs/openui-lang/benchmarks)

![OpenUIバナー — Generative UI オープンスタンダード](https://raw.githubusercontent.com/thesysdev/openui/main/assets/banner.png)

---

## 概要

OpenUI Langは位置引数とライン指向構造でトークン数を大幅に削減します。以下のベンチマークは同じUIを3つの方式で生成した場合のトークン数を比較します。

- **Vercel JSON-Render**: VercelのJSONベースのUI生成方式
- **Thesys C1 JSON**: ThesysのC1 JSON方式
- **OpenUI Lang**: このフレームワークの方式

---

## トークン数比較表

| シナリオ | Vercel JSON | C1 JSON | OpenUI Lang | Vercel比 | C1比 |
|---------|-------------|---------|-------------|---------|------|
| simple-table | 340 | 357 | 148 | -56.5% | -58.5% |
| chart-with-data | 520 | 516 | 231 | -55.6% | -55.2% |
| contact-form | 893 | 849 | 294 | **-67.1%** | **-65.4%** |
| dashboard | 2247 | 2261 | 1226 | -45.4% | -45.8% |
| pricing-page | 2487 | 2379 | 1195 | -52.0% | -49.8% |
| settings-panel | 1244 | 1205 | 540 | -56.6% | -55.2% |
| e-commerce-product | 2449 | 2381 | 1166 | -52.4% | -51.0% |
| **合計** | **10,180** | **9,948** | **4,800** | **-52.8%** | **-51.7%** |

---

## コア原則

### トークン削減の理由

1. **位置引数**: キー名を繰り返しません。
   ```
   # OpenUI Lang（コンパクト）
   stack = Stack([child1], "row", "l")

   # JSON（冗長）
   {"type":"Stack","direction":"row","gap":"l","children":[...]}
   ```

2. **ライン指向構造**: 中括弧、引用符などのJSON構造文字を最小化
3. **短縮識別子**: 長い属性名の代わりに短い位置引数を使用

### レンダリング速度の比較

| 方式 | 平均レンダリング時間 |
|------|------------------|
| JSONベース | 14.2秒 |
| OpenUI Lang | 4.9秒（**-65%**） |

ストリーミングレンダリングにより、最初のUI要素がはるかに速く表示されます。

---

## 実装例

トークン削減が最大のシナリオは**contact-form**（-67.1%）です。フォーム要素のように繰り返し属性（label、placeholder、requiredなど）が多いほど効果が大きくなります。

```
# OpenUI Langで表現したcontact form（簡潔）
form = Form([name_field, email_field, message_field, submit], "contact")
name_field = Input("名前", "text", true)
email_field = Input("メール", "email", true)
message_field = Textarea("メッセージ", 4, false)
submit = Button("送信", "submit")
```

---

## 関連コンセプト比較

| 項目 | トークン効率が重要な理由 | 影響 |
|------|----------------------|------|
| コスト | トークンごとに課金されるLLM API | 運用コストの削減 |
| 速度 | トークン数 = 生成時間 | ユーザー体験の向上 |
| コンテキスト | 長い会話でコンテキスト制限に達する | より多くの会話履歴を保持 |

---

## 関連ドキュメント

- [[OpenUI 概要]] — トークン効率化の技術的背景
- [仕様 v0.5](specification-v05.md) — OpenUI Lang文法の詳細
- [[OpenUI 紹介]] — フレームワーク全体の概要

---

## 参考リンク

- [公式ドキュメント: Benchmarks](https://www.openui.com/docs/openui-lang/benchmarks) (2026-05-15)
- [GitHub: thesysdev/openui](https://github.com/thesysdev/openui) (2026-05-15)
