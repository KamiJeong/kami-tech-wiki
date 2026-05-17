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
