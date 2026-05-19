# Wiki 작업 로그

> Append-only. 각 항목은 `## [YYYY-MM-DD HH:MM] {operation} | {title}` 형식으로 추가됩니다.
> 검색: `grep "^## \[" wiki/log.md | tail -10`

---

## [2026-05-15 00:00] init | Wiki 초기 구조 생성

## [2026-05-15 12:00] ingest | OpenUI 공식 문서 인제스트 (12페이지)

인제스트 범위: wiki/ko/openui/ — OpenUI Lang(소개·개요·빠른시작·시스템프롬프트·벤치마크·아키텍처·명세v0.5), Examples(Vercel AI Chat), Chat SDK(소개·GenUI), API Reference(개요·react-ui)
총 13개 파일 생성 (index.md 포함). wiki/index.md 업데이트 완료.

## [2026-05-15 17:00] setup | GitBook Wiki Ready — GitBook 연동 구조 추가

각 로케일 디렉토리에 `.gitbook.yaml`, `README.md`, `SUMMARY.md` 및 카테고리 개요 페이지 추가.
검증 스크립트(`.wiki/scripts/validate-wiki.sh`) 및 GitHub Actions 워크플로우(`.github/workflows/wiki-validation.yml`) 추가.
대상 파일: wiki/ko, wiki/en, wiki/ja 각각 `.gitbook.yaml`, `README.md`, `SUMMARY.md`, `openui/README.md`. wiki/ko/claude/README.md 추가.

## [2026-05-15 14:00] ingest | OpenUI 공식 문서 인제스트 — 영어·일본어 추가 (각 12페이지)

인제스트 범위:
- wiki/en/openui/ — OpenUI Lang(Introduction·Overview·QuickStart·SystemPrompts·Benchmarks·Architecture·Spec v0.5), Examples(Vercel AI Chat), Chat SDK(Introduction·GenUI), API Reference(Overview·react-ui)
- wiki/ja/openui/ — OpenUI Lang(紹介·概要·クイックスタート·システムプロンプト·ベンチマーク·アーキテクチャ·仕様v0.5), Examples(Vercel AI Chat), Chat SDK(紹介·GenUI), API Reference(概要·react-ui)
총 26개 파일 생성 (각 언어 index.md 포함). wiki/index.md에 English·日本語 섹션 추가 완료.

## [2026-05-15 00:00] ingest | Codex CLI

인제스트 범위:
- wiki/ko/codex-cli/index.md — OpenAI Codex CLI 한국어 문서 (source_count: 0)
- wiki/en/codex-cli/index.md — OpenAI Codex CLI English documentation (source_count: 0)
- wiki/ja/codex-cli/index.md — OpenAI Codex CLI 日本語ドキュメント (source_count: 0)
총 3개 파일 생성. wiki/index.md에 한국어·English·日本語 Codex CLI 섹션 추가 완료.

## [2026-05-18 10:00] ingest | Codex Overview Wiki — What is Codex (ko/en/ja)

인제스트 범위:
- wiki/ko/codex/README.md — Codex 섹션 개요 (한국어)
- wiki/ko/codex/index.md — Codex 소개: 클라우드 에이전트 vs CLI, 작동 방식, 빠른 시작 (source_count: 1)
- wiki/en/codex/README.md — Codex section overview (English)
- wiki/en/codex/index.md — What is Codex: cloud agent vs CLI, how it works, quick start (source_count: 1)
- wiki/ja/codex/README.md — Codexセクション概要（日本語）
- wiki/ja/codex/index.md — Codexとは：クラウドエージェント vs CLI、動作原理、クイックスタート (source_count: 1)
총 6개 파일 생성. wiki/index.md에 한국어·English·日本語 Codex 섹션 추가. 각 로케일 SUMMARY.md 업데이트 완료.
Source: https://openai.com/codex

## [2026-05-19 00:00] ingest | Spec-Driven Development (ko/en/ja) — 22-section full replacement

인제스트 범위:
- wiki/ko/sdd/index.md — SDD 완전 재작성. 22개 섹션: 비개발자 비유, AI 코딩 에이전트 정의, 6단계 워크플로우, 명세서/원칙 문서 정의, 방법론 비교표(SDD/전통/TDD/BDD/바이브코딩), 활용/비활용 시나리오, 오해 정정, 실제 예시, 바이브 코딩 정의, 장점, 위험/한계, 용어집, 관련 문서, 출처 포함 (source_count: 0)
- wiki/en/sdd/index.md — Full replacement with all 22 sections. Natural English translation with plain-language analogy, 6-stage workflow, comparison table, misconceptions, practical example, vibe coding contrast, glossary, references (source_count: 0)
- wiki/ja/sdd/index.md — 全22セクションを含む完全置き換え。自然な日本語翻訳。非エンジニア向けたとえ話、6段階ワークフロー、比較表、よくある誤解、実践例、バイブコーディングとの対比、用語集、参考資料を含む (source_count: 0)
既存ファイル上書き (CR-000). バックアップなし. wiki/index.md 3言語エントリ更新完了.
Sources: Kent Beck TDD (2002), Dan North BDD (dannorth.net), Anthropic Claude Code docs (2025-08), Kiro (kiro.dev)

## [2026-05-18 09:00] ingest | SDD Wiki — Spec-Driven Development, Kiro, and Spec-Kit

인제스트 범위:
- wiki/ko/sdd/ — Spec-Driven Development 한국어 개념 문서 (source_count: 0)
- wiki/en/sdd/ — Spec-Driven Development English concept article (source_count: 0)
- wiki/ja/sdd/ — Spec-Driven Development 日本語概念記事 (source_count: 0)
- wiki/ko/kiro/ — Kiro IDE 한국어 도구 문서 (source_count: 0)
- wiki/en/kiro/ — Kiro IDE English tool article (source_count: 0)
- wiki/ja/kiro/ — Kiro IDE 日本語ツール記事 (source_count: 0)
- wiki/ko/spec-kit/ — Spec-Kit 한국어 도구 문서 (source_count: 8)
- wiki/en/spec-kit/ — Spec-Kit English tool article (source_count: 8)
- wiki/ja/spec-kit/ — Spec-Kit 日本語ツール記事 (source_count: 8)
총 18개 파일 생성 (각 토픽별 README.md + index.md × 3언어). wiki/index.md에 한국어·English·日本語 SDD·Kiro·Spec-Kit 섹션 추가. 각 로케일 SUMMARY.md 업데이트 완료.
