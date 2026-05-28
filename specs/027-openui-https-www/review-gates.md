# Review Gates: OpenUI Personalization Case Reference

Date: 2026-05-28
Reviewer: Codex implementer stage

## Implementation Notes

- Feature directory: `specs/027-openui-https-www`
- Checklist status: `requirements.md` had 46 items, 16 completed, 30 incomplete at implementation start. Auto-implement proceeded because analyze and guard had passed and the user explicitly instructed not to ask for confirmation.
- Version guard: `version-guard-report.md` loaded. No compatibility rules beyond current root npm package versions.
- Version guard validation: no compatibility rules to check; no critical/high CVE marker found in the report.
- `git status --short raw` before implementation: no output.
- `git status --short raw` after implementation: no output.
- Slack notification: skipped because `SLACK_WEBHOOK_URL` was absent from the environment. No webhook value was hardcoded or inspected.
- Split decision: no companion case-list pages created. The final article uses 10 case rows, short row-level takeaways, and a concise feasibility summary, so it stays within the one-article scannability threshold from `research.md`.

## Source Verification Summary

All live web sources were checked on 2026-05-28 before article drafting. Publication dates are recorded where visible or clearly available; otherwise the article records "publication date not shown" and the access date.

| Source | Owner | URL | Evidence role | Supported claim |
|--------|-------|-----|---------------|-----------------|
| OpenUI Introduction | OpenUI / Thesys | https://www.openui.com/docs/openui-lang | official_openui | OpenUI positioning, generative UI explanation, live chat demo, streaming rendering claim. |
| OpenUI GitHub repository | thesysdev | https://github.com/thesysdev/openui | official_openui | Package structure, examples, benchmarks, docs, repository evidence. |
| OpenUI Architecture | OpenUI / Thesys | https://www.openui.com/docs/openui-lang/how-it-works | official_openui | Generation/execution separation, runtime queries and mutations, dashboard/CRUD/monitoring examples. |
| OpenUI Vercel AI Chat example | OpenUI / Thesys | https://www.openui.com/docs/openui-lang/examples/vercel-ai-chat | case_evidence | Verified OpenUI example using Vercel AI SDK transport and OpenUI Renderer. |
| Netflix Recommendations Help | Netflix | https://help.netflix.com/en/node/100639 | case_evidence | Netflix homepage rows, rankings, and title representation are personalized. |
| Spotify Understanding Recommendations | Spotify | https://www.spotify.com/au/safetyandprivacy/understanding-recommendations | case_evidence | Spotify personalizes Home, Search, and playlists using taste/profile signals. |
| TikTok Newsroom For You | TikTok | https://newsroom.tiktok.com/how-tiktok-recommends-videos-for-you | case_evidence | For You feed recommendation factors, diversity and safety controls. |
| YouTube Recommendations Help | YouTube / Google | https://support.google.com/youtube/answer/16089387 | case_evidence | YouTube homepage, Up Next, Shorts, and shelf personalization signals. |
| About Amazon personalization article | Amazon | https://www.aboutamazon.com/news/retail/amazon-generative-ai-product-search-results-and-descriptions | case_evidence | Amazon shopping personalization across homepage, journey, recommendations, descriptions, deals, and emails. |
| Airbnb recommendation systems | Airbnb | https://www.airbnb.com/help/article/4083 | case_evidence | Airbnb recommendation systems for homepage, search, destination suggestions, and review ranking. |
| Duolingo adaptive lessons | Duolingo | https://blog.duolingo.com/keeping-you-at-the-frontier-of-learning-with-adaptive-lessons/ | case_evidence | Duolingo adapts lesson difficulty in real time based on learner performance. |
| Stitch Fix Style Shuffle | Stitch Fix | https://newsroom.stitchfix.com/blog/10-billion-interactions-and-counting-on-style-shuffle-the-data-powering-your-personalized-shopping-experience/ | case_evidence | Style Shuffle feedback updates style preferences and recommendations in real time. |
| Amazon Personalize documentation | AWS | https://docs.aws.amazon.com/personalize/latest/dg/recommendations.html | personalization_background | General background source for real-time item recommendations and recent interactions. |

## Case Classification

| Case | Classification | Rationale |
|------|----------------|-----------|
| OpenUI Chat demo | Verified OpenUI | Official OpenUI documentation presents the live demo as OpenUI. It is not treated as production adoption. |
| Vercel AI Chat example | Verified OpenUI | Official OpenUI documentation describes the example as using OpenUI Renderer. It is not treated as production adoption. |
| Thesys Agent Builder / OpenUI Cloud | Partially supported | Thesys positions OpenUI as a foundation for its products, but this was not included in the final matrix because it does not directly prove third-party production personalization behavior. |
| Netflix | Not verified as OpenUI, comparable | Reliable source supports personalization behavior but not OpenUI usage. |
| Spotify | Not verified as OpenUI, comparable | Reliable source supports personalization behavior but not OpenUI usage. |
| TikTok For You | Not verified as OpenUI, comparable | Reliable source supports personalization behavior but not OpenUI usage. |
| YouTube | Not verified as OpenUI, comparable | Reliable source supports personalization behavior but not OpenUI usage. |
| Amazon shopping | Not verified as OpenUI, comparable | Reliable source supports personalization behavior but not OpenUI usage. |
| Airbnb | Not verified as OpenUI, comparable | Reliable source supports recommendation systems but not OpenUI usage. |
| Duolingo | Not verified as OpenUI, comparable | Reliable source supports adaptive lesson behavior but not OpenUI usage. |
| Stitch Fix Style Shuffle | Not verified as OpenUI, comparable | Reliable source supports real-time recommendation updates but not OpenUI usage. |

## Terminology Decisions

| Term | Korean | English | Japanese | Action |
|------|--------|---------|----------|--------|
| OpenUI | OpenUI | OpenUI | OpenUI | Reused as untranslated tool/project name. |
| Generative UI | 생성형 UI | Generative UI | 生成型 UI | Added to `wiki/glossary/openui-personalization-terms.md`; explained in article language notes. |
| Real-time personalization | 실시간 개인화 | Real-time personalization | リアルタイムパーソナライズ | Added to glossary and used consistently in all articles. |
| Adaptive screen | 적응형 화면 | Adaptive screen | 適応型画面 | Added to glossary and used in key concepts. |
| Evidence status | 근거 상태 | Evidence status | 根拠ステータス | Added to glossary and used for classification labels. |
| AI tool | AI 도구 | AI tool | AIツール | Added to glossary because no project-wide glossary existed. |
| User interface | 사용자 인터페이스 | User interface | ユーザーインターフェース | Added to glossary because no project-wide glossary existed. |
| Personalization | 개인화 | Personalization | パーソナライズ | Added to glossary because no project-wide glossary existed. |
| Recommendation system | 추천 시스템 | Recommendation system | 推薦システム | Added to glossary because no project-wide glossary existed. |
| Prompt | 프롬프트 | Prompt | プロンプト | Added to glossary and reused from existing OpenUI prompt pages. |
| Large language model | 대규모 언어 모델 | Large language model | 大規模言語モデル | Added to glossary and reused from existing OpenUI pages. |

## Navigation Updates

- `wiki/ko/openui/index.md`
- `wiki/en/openui/index.md`
- `wiki/ja/openui/index.md`
- `wiki/ko/SUMMARY.md`
- `wiki/en/SUMMARY.md`
- `wiki/ja/SUMMARY.md`
- `wiki/index.md`

## Principle XII Quality Gates

| Gate | Status | Evidence | Human-review status |
|------|--------|----------|---------------------|
| Readability | pass | Articles start with summary, audience, plain-language explanation, analogy, and concise recommendation. | Human review still required before active status. |
| Factual accuracy | pass | Source verification table above; every OpenUI adoption claim limited to official demos/examples. | Human review still required before active status. |
| Source integrity | pass | Article text is original synthesis; no paragraph-length source text copied. | Human review still required before active status. |
| Multilingual consistency | pass | Korean, English, and Japanese files preserve the same cases, evidence labels, recommendation, and source set. | Human review still required before active status. |
| Markdown portability | pass | Article bodies use headings, paragraphs, lists, and Markdown tables only; no GitBook callouts or Obsidian wikilinks in article bodies. | Human review still required before active status. |
| Terminology consistency | pass | Terminology page created at `wiki/glossary/openui-personalization-terms.md`; language notes included in all articles. | Human review still required before active status. |
| Navigation | pass | Locale summaries, OpenUI indexes, and top-level catalog updated with relative links for the new article. | Human review still required before active status. |
| Copying/plagiarism risk | pass | Source claims are summarized in original wording; source links remain available for verification. | Human review still required before active status. |
| Template compliance | pass | All three articles include the 13-section structure required by the contract. | Human review still required before active status. |
| Learning goal | pass | Articles answer feasibility, evidence gaps, comparable examples, risks, and next PoC steps. | Human review still required before active status. |

## Final Article Status

- `wiki/ko/openui/personalization-case-reference.md`: `status: draft`, `source_count: 0`, `review_cycle: fast-changing`
- `wiki/en/openui/personalization-case-reference.md`: `status: draft`, `source_count: 0`, `review_cycle: fast-changing`
- `wiki/ja/openui/personalization-case-reference.md`: `status: draft`, `source_count: 0`, `review_cycle: fast-changing`
