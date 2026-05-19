# Wiki 인덱스

> LLM이 관리하는 개인 테크 위키 카탈로그입니다. 인제스트할 때마다 자동 업데이트됩니다.

> **GitBook 연동**: 각 로케일 디렉토리(`wiki/ko`, `wiki/en`, `wiki/ja`)는 GitBook Git Sync를 통해 각각의 GitBook Space와 동기화됩니다. GitHub가 단일 원본(Source of Truth)이며, GitBook은 문서 뷰어로만 사용됩니다. 각 로케일 디렉토리에 `.gitbook.yaml`, `README.md`, `SUMMARY.md`가 포함되어 있습니다.

---

## 한국어 (ko)

<!-- 인제스트 시 LLM이 이 섹션을 업데이트합니다 -->

### OpenUI (Generative UI)

- [[OpenUI 소개]] — LLM이 UI를 생성하는 풀스택 생성형 UI 프레임워크 (updated: 2026-05-15, sources: 0)
- [[OpenUI 개요]] — Library, Prompt Generator, Parser, Renderer 4가지 핵심 구성요소 (updated: 2026-05-15, sources: 0)
- [[OpenUI 빠른 시작]] — `npx @openuidev/cli`로 1분 안에 GenUI 앱 실행 (updated: 2026-05-15, sources: 0)
- [[OpenUI 시스템 프롬프트]] — 컴포넌트 라이브러리에서 LLM 프롬프트 자동 생성 (updated: 2026-05-15, sources: 0)
- [[OpenUI 벤치마크]] — JSON 대비 최대 67% 토큰 절약 성능 비교 (updated: 2026-05-15, sources: 0)
- [[OpenUI 아키텍처]] — Library→Prompt→LLM→Parser→Renderer 파이프라인 상세 (updated: 2026-05-15, sources: 0)
- [[OpenUI Lang 명세 v0.5]] — 반응형 상태, 쿼리, 뮤테이션 포함 최신 언어 명세 (updated: 2026-05-15, sources: 0)
- [[예제: Vercel AI Chat]] — Next.js + Vercel AI SDK + OpenUI 완전한 예제 (updated: 2026-05-15, sources: 0)
- [[OpenUI Chat SDK 소개]] — 헤드리스 채팅 상태 관리 및 레이아웃 컴포넌트 (updated: 2026-05-15, sources: 0)
- [[OpenUI Chat GenUI]] — 채팅 최적화 `openuiChatLibrary` 컴포넌트 (updated: 2026-05-15, sources: 0)
- [[OpenUI API 레퍼런스 개요]] — 5개 패키지 및 CLI 도구 전체 참조 (updated: 2026-05-15, sources: 0)
- [[@openuidev/react-ui API]] — FullScreen, Copilot, BottomTray 레이아웃 컴포넌트 API (updated: 2026-05-15, sources: 0)

### Codex

- [[Codex 소개]] — OpenAI의 AI 소프트웨어 엔지니어링 도구. 클라우드 에이전트와 CLI 두 가지 형태로 자연어 기반 코드 생성·수정·실행 지원 (updated: 2026-05-18, sources: 1)

### Codex CLI

- [[Codex CLI]] — OpenAI의 터미널 기반 AI 코딩 에이전트. 승인 모드·슬래시 명령·이미지 분석 지원 (updated: 2026-05-15, sources: 0)

### SDD (Spec-Driven Development)

- [[Spec-Driven Development (SDD)]] — 코드 작성 전에 명세서를 먼저 정의하는 개발 방법론. 비개발자를 위한 비유, SDD 6단계 워크플로우, BDD/TDD/바이브 코딩 비교표, 오해 정정, AI 코딩 에이전트 맥락 포함. 22개 섹션 전체 포함 (updated: 2026-05-19, sources: 0)

### Kiro

- [[Kiro]] — AWS AI 기반 IDE. 스티어링 파일·스펙 문서·에이전트 태스크·오토파일럿 모드로 SDD를 IDE 수준에서 구현 (updated: 2026-05-18, sources: 0)

### Spec-Kit

- [[Spec-Kit]] — Claude Code 기반 SDD 워크플로우 도구. specify→clarify→plan→tasks→implement→verify 6단계 파이프라인 (updated: 2026-05-18, sources: 8)

---

## English (en)

### OpenUI (Generative UI)

- [[OpenUI Introduction]] — Full-stack Generative UI framework where LLMs generate UI (updated: 2026-05-15, sources: 0)
- [[OpenUI Overview]] — Library, Prompt Generator, Parser, Renderer — 4 core components (updated: 2026-05-15, sources: 0)
- [[OpenUI Quick Start]] — Run a GenUI app in 1 minute with `npx @openuidev/cli` (updated: 2026-05-15, sources: 0)
- [[OpenUI System Prompts]] — Auto-generate LLM prompts from component library (updated: 2026-05-15, sources: 0)
- [[OpenUI Benchmarks]] — Up to 67% fewer tokens vs JSON — performance comparison (updated: 2026-05-15, sources: 0)
- [[OpenUI Architecture]] — Library→Prompt→LLM→Parser→Renderer pipeline in detail (updated: 2026-05-15, sources: 0)
- [[OpenUI Lang Specification v0.5]] — Reactive state, queries, mutations — full spec (updated: 2026-05-15, sources: 0)
- [[Example: Vercel AI Chat]] — Next.js + Vercel AI SDK + OpenUI complete example (updated: 2026-05-15, sources: 0)
- [[OpenUI Chat SDK Introduction]] — Headless chat state management and layout components (updated: 2026-05-15, sources: 0)
- [[OpenUI Chat GenUI]] — Chat-optimized `openuiChatLibrary` components (updated: 2026-05-15, sources: 0)
- [[OpenUI API Reference Overview]] — Full reference for 5 packages and CLI tool (updated: 2026-05-15, sources: 0)
- [[@openuidev/react-ui API]] — FullScreen, Copilot, BottomTray layout component API (updated: 2026-05-15, sources: 0)

### Codex

- [[What is Codex]] — OpenAI's AI software engineering tool. Available as a cloud agent and CLI; generates, modifies, and executes code from natural language instructions (updated: 2026-05-18, sources: 1)

### Codex CLI

- [[Codex CLI]] — Terminal-based AI coding agent by OpenAI. Supports approval modes, slash commands, and image analysis (updated: 2026-05-15, sources: 0)

### SDD (Spec-Driven Development)

- [[Spec-Driven Development (SDD)]] — Methodology where a specification is written before code. Covers plain-language analogy, the 6-stage SDD workflow, comparison table vs TDD/BDD/vibe coding, common misconceptions, and AI coding agent context. All 22 required sections included (updated: 2026-05-19, sources: 0)

### Kiro

- [[Kiro]] — AWS AI-powered IDE. Implements SDD through steering files, spec documents, agent tasks, and autopilot mode (updated: 2026-05-18, sources: 0)

### Spec-Kit

- [[Spec-Kit]] — Claude Code SDD workflow tool. specify→clarify→plan→tasks→implement→verify six-stage pipeline (updated: 2026-05-18, sources: 8)

---

## 日本語 (ja)

### OpenUI (Generative UI)

- [[OpenUI 紹介]] — LLMがUIを生成するフルスタックGenerative UIフレームワーク (updated: 2026-05-15, sources: 0)
- [[OpenUI 概要]] — Library、Prompt Generator、Parser、Renderer — 4つのコアコンポーネント (updated: 2026-05-15, sources: 0)
- [[OpenUI クイックスタート]] — `npx @openuidev/cli`で1分以内にGenUIアプリを起動 (updated: 2026-05-15, sources: 0)
- [[OpenUI システムプロンプト]] — コンポーネントライブラリからLLMプロンプトを自動生成 (updated: 2026-05-15, sources: 0)
- [[OpenUI ベンチマーク]] — JSONと比べて最大67%少ないトークン — パフォーマンス比較 (updated: 2026-05-15, sources: 0)
- [[OpenUI アーキテクチャ]] — Library→Prompt→LLM→Parser→Rendererパイプラインの詳細 (updated: 2026-05-15, sources: 0)
- [[OpenUI Lang 仕様 v0.5]] — リアクティブState、クエリ、ミューテーション — 完全仕様 (updated: 2026-05-15, sources: 0)
- [[サンプル: Vercel AI Chat]] — Next.js + Vercel AI SDK + OpenUI完全なサンプル (updated: 2026-05-15, sources: 0)
- [[OpenUI Chat SDK 紹介]] — ヘッドレスチャット状態管理とレイアウトコンポーネント (updated: 2026-05-15, sources: 0)
- [[OpenUI Chat GenUI]] — チャット最適化`openuiChatLibrary`コンポーネント (updated: 2026-05-15, sources: 0)
- [[OpenUI APIリファレンス概要]] — 5つのパッケージとCLIツールの完全リファレンス (updated: 2026-05-15, sources: 0)
- [[@openuidev/react-ui API]] — FullScreen、Copilot、BottomTrayレイアウトコンポーネントAPI (updated: 2026-05-15, sources: 0)

### Codex

- [[Codexとは]] — OpenAIのAIソフトウェアエンジニアリングツール。クラウドエージェントとCLIの2形態で自然言語によるコード生成・修正・実行が可能 (updated: 2026-05-18, sources: 1)

### Codex CLI

- [[Codex CLI]] — OpenAIのターミナルベースAIコーディングエージェント。承認モード、スラッシュコマンド、画像解析をサポート (updated: 2026-05-15, sources: 0)

### SDD (Spec-Driven Development)

- [[Spec-Driven Development (SDD)]] — コードを書く前に仕様書を先に定義する開発手法。非エンジニア向けのたとえ話、SDD 6段階ワークフロー、TDD/BDD/バイブコーディングとの比較表、よくある誤解、AIコーディングエージェントの文脈を含む全22セクション収録 (updated: 2026-05-19, sources: 0)

### Kiro

- [[Kiro]] — AWS AI搭載IDE。スティアリングファイル・スペックドキュメント・エージェントタスク・オートパイロットモードでSSDをIDE水準で実装 (updated: 2026-05-18, sources: 0)

### Spec-Kit

- [[Spec-Kit]] — Claude Code SDDワークフローツール。specify→clarify→plan→tasks→implement→verify の6段階パイプライン (updated: 2026-05-18, sources: 8)
