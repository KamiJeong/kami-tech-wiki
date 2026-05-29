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

## [2026-05-22 14:09] create | Multilingual Wiki Series — Kiro & GitHub Spec Kit

생성 범위:
- wiki/en/kiro/, wiki/ko/kiro/, wiki/ja/kiro/ — Kiro 시리즈 11페이지 × 3언어
- wiki/en/spec-kit/, wiki/ko/spec-kit/, wiki/ja/spec-kit/ — GitHub Spec Kit 시리즈 10페이지 × 3언어
- wiki/en/kiro-vs-spec-kit.md, wiki/ko/kiro-vs-spec-kit.md, wiki/ja/kiro-vs-spec-kit.md — 비교 페이지 × 3언어
총 69개 시리즈 페이지 생성. wiki/index.md 및 각 로케일 SUMMARY.md 업데이트. 기존 archived 파일 제거.

## [2026-05-28 08:20] create | Atlassian Rovo 개요

생성 범위:
- wiki/ko/atlassian-rovo/README.md — Atlassian Rovo 섹션 개요
- wiki/ko/atlassian-rovo/index.md — Rovo Search, Chat, Agents, Studio, MCP Server, Forge Rovo Agent, 서버 활용 가능 케이스를 설명하는 한국어 초안
- specs/023-atlassian-rovo/ — Spec Kit 산출물
wiki/index.md 및 wiki/ko/SUMMARY.md 업데이트 완료.
Sources: Atlassian Rovo Support, Atlassian Rovo MCP Server Support, Rovo Studio Support, Forge Rovo Agent developer docs, Atlassian MCP announcement.

## [2026-05-28 09:05] specify | 문서 시스템 재정비 및 노출 정책 명세

작성 범위:
- specs/024-document-system-restructure/ — 문서 인벤토리, 메뉴 노출, 링크 전용 문서 처리, Spec Kit/일반 문서 분리, 누락 문서, 삭제/보류/아카이브, 최신화 체크리스트 명세
- .specify/intake/gitbook-spec-kit/ — 멀티 슬라이스 intake 산출물

`auto-PR`은 현재 로컬 `speckit-auto` 스킬의 유효 모드가 아니므로, 실제 문서 재작성이나 PR 생성 없이 plan-only 명세 산출물로 기록.

## [2026-05-28 09:28] specify | 문서 시스템 재정비 명세 보강

보강 범위:
- specs/024-document-system-restructure/spec.md — 사용자 요청 산출물 9종, 문서별 판단 기준, 범위/제외 범위, 성공 기준 보강
- specs/024-document-system-restructure/checklists/requirements.md — `/speckit-specify` 품질 체크리스트 형식에 맞춰 재검증 결과 반영

이 작업은 Spec Kit 명세 보강이며 위키 콘텐츠 인제스트/업데이트가 아니므로 Slack 알림은 전송하지 않음.

## [2026-05-28 09:45] clarify | 문서 시스템 재정비 명세 clarification 반영

반영 범위:
- specs/024-document-system-restructure/spec.md — Spec Kit 산출물 인벤토리 범위, 메뉴/링크 변경 적용 수준, 누락 문서 처리 방식, 감사 산출물 위치, 저위험 navigation 변경 정의를 Clarifications에 기록

이 작업은 Spec Kit 명세 clarification이며 위키 콘텐츠 인제스트/업데이트가 아니므로 Slack 알림은 전송하지 않음.

## [2026-05-28 09:52] plan | 문서 시스템 재정비 planning 산출물 갱신

갱신 범위:
- specs/024-document-system-restructure/plan.md — clarification 결과를 반영한 구현 계획 재작성
- specs/024-document-system-restructure/research.md — grouped Spec Kit inventory, 저위험 navigation 변경, 누락 문서 처리, 감사 산출물 위치 결정 기록
- specs/024-document-system-restructure/data-model.md — grouped artifact, low-risk navigation change, publication summary 엔티티 추가
- specs/024-document-system-restructure/contracts/documentation-audit-contract.md — 감사/노출/누락/저위험 navigation 계약 갱신
- specs/024-document-system-restructure/quickstart.md — reviewer workflow 갱신
- specs/024-document-system-restructure/version-guard-report.md — 현재 dependency 버전 확인 결과 기록

DocGuard review와 version guard check를 planning 전 훅으로 실행했다. 이 작업은 Spec Kit planning 산출물 갱신이며 위키 콘텐츠 인제스트/업데이트가 아니므로 Slack 알림은 전송하지 않음.

## [2026-05-28 09:56] tasks | 문서 시스템 재정비 task list 생성

생성 범위:
- specs/024-document-system-restructure/tasks.md — reader scenario별 58개 실행 task 생성

task list는 인벤토리, navigation 노출, Spec Kit/일반 문서 경계, 누락/삭제/보류/유지보수 정책을 독립 검증 가능한 단계로 분리했다. 이 작업은 Spec Kit task 산출물 생성이며 위키 콘텐츠 인제스트/업데이트가 아니므로 Slack 알림은 전송하지 않음.

## [2026-05-28 10:03] implement | 문서 시스템 재정비 감사 산출물 구현

구현 범위:
- specs/024-document-system-restructure/document-inventory.md — docs/wiki/specs 전체 문서 인벤토리 및 grouped Spec Kit artifact 인벤토리
- specs/024-document-system-restructure/navigation-audit.md — 메뉴 노출, 링크 전용 문서, 저위험 navigation 변경 판단
- specs/024-document-system-restructure/lifecycle-governance.md — Spec Kit/일반 문서 경계, 누락 문서, 최신화/삭제/보류/유지보수 정책
- specs/024-document-system-restructure/validation-report.md — 계약 검증, 범위 guard, checklist 상태
- specs/024-document-system-restructure/analysis.md — 구현 결과와 follow-up batch 요약
- specs/024-document-system-restructure/tasks.md — 58개 task 완료 표시
- .gitignore — 구현 전 setup verification에 따른 누락 ignore 패턴 보강

이 작업은 canonical audit 산출물 구현이며 reader-facing wiki 콘텐츠/메뉴 변경이 아니므로 Slack 알림은 전송하지 않음.

## [2026-05-28 10:30] create | Storybook 개요

생성 범위:
- wiki/ko/storybook/README.md — Storybook 섹션 개요
- wiki/ko/storybook/index.md — Storybook, 디자인 시스템, 주요 기능, Storybook MCP, Figma 기반 AI Native Development 3가지 케이스, Claude Code/Codex CLI 추론 흐름, 예상 토큰 소비량, 도입 사례를 설명하는 한국어 초안
- specs/025-storybook-https-storybook/ — Spec Kit 산출물

wiki/index.md 및 wiki/ko/SUMMARY.md 업데이트 완료.
Sources: Storybook docs/blog, Figma Dev Mode docs/blog, Anthropic Claude Code MCP docs, OpenAI Codex CLI docs/repository.

## [2026-05-28 16:18] update | OpenUI Personalization Case Reference

생성/갱신 범위:
- wiki/ko/openui/personalization-case-reference.md, wiki/en/openui/personalization-case-reference.md, wiki/ja/openui/personalization-case-reference.md — OpenUI 실시간 개인화 화면 가능성, 10개 사례 매트릭스, 근거 상태, 권장 PoC 검증 방향을 담은 3개 언어 초안
- wiki/glossary/openui-personalization-terms.md — OpenUI, 생성형 UI, 실시간 개인화, 적응형 화면, 근거 상태 등 용어 정리
- wiki/ko/openui/index.md, wiki/en/openui/index.md, wiki/ja/openui/index.md, wiki/ko/SUMMARY.md, wiki/en/SUMMARY.md, wiki/ja/SUMMARY.md, wiki/index.md — 새 문서 링크 추가
- specs/027-openui-https-www/review-gates.md — 출처 검증, 사례 분류, no-split 판단, Slack skip, 품질 게이트 기록

출처 검증: 2026-05-28 기준 OpenUI 공식 문서/GitHub와 Netflix, Spotify, TikTok, YouTube, Amazon, Airbnb, Duolingo, Stitch Fix, AWS 문서를 실시간 확인했다. 공개 근거가 없는 사이트는 OpenUI 사용 사례로 표현하지 않고 비교 사례로 라벨링했다.

## [2026-05-29 09:07] lint | OpenUI Personalization Markdown lint fix

수정 범위:
- wiki/ko/openui/personalization-case-reference.md, wiki/en/openui/personalization-case-reference.md, wiki/ja/openui/personalization-case-reference.md — EOF의 연속 빈 줄 제거
- wiki/glossary/openui-personalization-terms.md — EOF의 연속 빈 줄 제거

Markdown lint MD012 오류 수정만 수행했으며 reader-facing 내용은 변경하지 않았다. 위키 콘텐츠 인제스트/업데이트가 아니므로 Slack 알림은 전송하지 않음.
