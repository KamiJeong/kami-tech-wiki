# Tasks: OpenUI 공식 문서 위키 인제스트 (ko + en + ja)

**Input**: Design documents from `specs/004-openui-docs/`

**Prerequisites**: plan.md ✅, spec.md ✅, research.md ✅, data-model.md ✅

**Tests**: 이 feature는 정적 콘텐츠 인제스트이므로 자동화 테스트 없음. 각 체크포인트에서 수동 검증.

**Organization**: 한국어(ko) 완료 → 영어(en) → 일본어(ja) 순서로 구성. 영어/일본어 각 페이지는 ko 콘텐츠 기반 번역·현지화.

## Format: `[ID] [P?] [Story] Description`

- **[P]**: 병렬 실행 가능 (다른 파일, 의존성 없음)
- **[Story]**: 해당 사용자 스토리 레이블 (US4=영어, US5=일본어)

---

## Phase 1–6: Korean Wiki (완료) ✅

> T001~T025 전체 완료. `wiki/ko/openui/` 13개 파일 생성, wiki/index.md·wiki/log.md 업데이트, Slack 알림 인프라 개선 완료.

- [x] T001 `wiki/ko/openui/` 디렉토리 생성 확인
- [x] T002 openui.com 공식 문서 12개 페이지 콘텐츠 수집
- [x] T003 `wiki/ko/openui/index.md` 생성
- [x] T004 [P] [US1] `wiki/ko/openui/introduction.md` 생성
- [x] T005 [P] [US1] `wiki/ko/openui/overview.md` 생성
- [x] T006 [P] [US1] `wiki/ko/openui/quickstart.md` 생성
- [x] T007 [P] [US1] `wiki/ko/openui/system-prompts.md` 생성
- [x] T008 [P] [US1] `wiki/ko/openui/benchmarks.md` 생성
- [x] T009 [P] [US1] `wiki/ko/openui/architecture.md` 생성
- [x] T010 [P] [US1] `wiki/ko/openui/specification-v05.md` 생성
- [x] T011 [P] [US1] `wiki/ko/openui/example-vercel-ai-chat.md` 생성
- [x] T012 [P] [US1] `wiki/ko/openui/chat-introduction.md` 생성
- [x] T013 [P] [US1] `wiki/ko/openui/chat-genui.md` 생성
- [x] T014 [P] [US1] `wiki/ko/openui/api-reference-overview.md` 생성
- [x] T015 [P] [US1] `wiki/ko/openui/api-reference-react-ui.md` 생성
- [x] T016 [US1] `wiki/ko/openui/index.md` 링크 검증
- [x] T017 [US1] `wiki/index.md` 업데이트 — OpenUI (Generative UI) ko 섹션 추가
- [x] T018 [US1] `wiki/log.md` 업데이트 — ko 인제스트 기록
- [x] T019 [US2] 12개 페이지 공식 URL 링크 검증
- [x] T020 [P] [US3] `wiki/ko/openui/architecture.md` 이미지 추가
- [x] T021 [P] [US3] `wiki/ko/openui/benchmarks.md` 이미지 추가
- [x] T022 [P] [US3] `wiki/ko/openui/overview.md` 이미지 추가
- [x] T023 `.wiki/scripts/notify-slack-ci.ts` 업데이트 — wiki 인제스트 감지
- [x] T024 `.wiki/scripts/notify-slack-ci.test.ts` 업데이트 — 테스트 추가
- [x] T025 `SLACK_WEBHOOK_URL` 미설정 시 graceful skip 처리

---

## Phase 7: Foundational — en/ja 디렉토리 준비

**Purpose**: 영어·일본어 위키 페이지 작성을 위한 구조 준비. `wiki/ko/openui/` 콘텐츠를 기준 소스로 활용.

- [x] T026 `wiki/en/openui/` 디렉토리 생성 확인 (없으면 생성)
- [x] T027 `wiki/ja/openui/` 디렉토리 생성 확인 (없으면 생성)

**Checkpoint**: 두 디렉토리 확인 후 영어·일본어 페이지 병렬 작성 시작 가능

---

## Phase 8: User Story 4 — English Wiki (Priority: P1) 🎯

**Goal**: `wiki/en/openui/` 에 OpenUI 공식 문서 13개 영어 위키 페이지 완성 (index.md 포함). 각 페이지는 `wiki/ko/openui/` 대응 페이지를 기반으로 영어로 현지화하되, 공식 문서 원본 URL·크로스링크·이미지 참조를 그대로 유지.

**Independent Test**: `wiki/en/openui/index.md` 열어 12개 링크가 모두 실존하는 파일을 가리키는지 확인. 각 파일에 영어 콘텐츠(헤딩 + 본문)가 있는지 확인.

### Navigation Hub

- [x] T028 [US4] `wiki/en/openui/index.md` 생성 — 영어 네비게이션 허브, 섹션별 분류 및 각 페이지 한 줄 영어 설명 포함 (상대경로 형식)

### OpenUI Lang 섹션 (병렬 가능)

- [x] T029 [P] [US4] `wiki/en/openui/introduction.md` 생성 — tool-page 템플릿, OpenUI introduction in English, 공식 URL: `https://www.openui.com/docs/openui-lang`, 크로스링크 포함
- [x] T030 [P] [US4] `wiki/en/openui/overview.md` 생성 — concept-page 템플릿, 4 core components (Library, Prompt Generator, Parser, Renderer) in English, 이미지 포함, 공식 URL: `https://www.openui.com/docs/openui-lang/overview`
- [x] T031 [P] [US4] `wiki/en/openui/quickstart.md` 생성 — tool-page 템플릿, Quick start guide in English, `npx @openuidev/cli@latest create` 포함, 공식 URL: `https://www.openui.com/docs/openui-lang/quickstart`
- [x] T032 [P] [US4] `wiki/en/openui/system-prompts.md` 생성 — concept-page 템플릿, System prompt auto-generation in English, 공식 URL: `https://www.openui.com/docs/openui-lang/system-prompts`
- [x] T033 [P] [US4] `wiki/en/openui/benchmarks.md` 생성 — concept-page 템플릿, Token efficiency benchmarks in English, 벤치마크 표 포함, 이미지 포함, 공식 URL: `https://www.openui.com/docs/openui-lang/benchmarks`
- [x] T034 [P] [US4] `wiki/en/openui/architecture.md` 생성 — concept-page 템플릿, Pipeline architecture in English, ASCII 다이어그램 + 이미지 포함, 공식 URL: `https://www.openui.com/docs/openui-lang/how-it-works`
- [x] T035 [P] [US4] `wiki/en/openui/specification-v05.md` 생성 — reference 템플릿, OpenUI Lang v0.5 spec in English (state, queries, mutations, actions), 공식 URL: `https://www.openui.com/docs/openui-lang/specification-v05`
- [x] T036 [P] [US4] `wiki/en/openui/example-vercel-ai-chat.md` 생성 — tool-page 템플릿, Vercel AI Chat example in English, 공식 URL: `https://www.openui.com/docs/openui-lang/examples/vercel-ai-chat`

### Chat SDK & API Reference 섹션 (병렬 가능)

- [x] T037 [P] [US4] `wiki/en/openui/chat-introduction.md` 생성 — tool-page 템플릿, Chat SDK introduction in English, 공식 URL: `https://www.openui.com/docs/chat`
- [x] T038 [P] [US4] `wiki/en/openui/chat-genui.md` 생성 — concept-page 템플릿, openuiChatLibrary components in English, 공식 URL: `https://www.openui.com/docs/chat/genui`
- [x] T039 [P] [US4] `wiki/en/openui/api-reference-overview.md` 생성 — reference 템플릿, 5 packages API overview in English, 공식 URL: `https://www.openui.com/docs/api-reference`
- [x] T040 [P] [US4] `wiki/en/openui/api-reference-react-ui.md` 생성 — reference 템플릿, @openuidev/react-ui API in English (FullScreen, Copilot, BottomTray), 공식 URL: `https://www.openui.com/docs/api-reference/react-ui`

### 카탈로그 업데이트

- [x] T041 [US4] `wiki/index.md` 업데이트 — `## English (en)` > `### OpenUI (Generative UI)` 섹션 추가, 12개 항목 기재

**Checkpoint**: T028~T041 완료 후 `wiki/en/openui/index.md` 에서 12개 링크 동작 확인 → US4 완료

---

## Phase 9: User Story 5 — Japanese Wiki (Priority: P2)

**Goal**: `wiki/ja/openui/` 에 OpenUI 공식 문서 13개 일본어 위키 페이지 완성 (index.md 포함). 각 페이지는 `wiki/ko/openui/` 대응 페이지를 기반으로 일본어로 현지화하되, 공식 문서 원본 URL·크로스링크·이미지 참조를 그대로 유지.

**Independent Test**: `wiki/ja/openui/index.md` 열어 12개 링크가 모두 실존하는 파일을 가리키는지 확인. 각 파일에 일본어 콘텐츠(헤딩 + 본문)가 있는지 확인.

### Navigation Hub

- [x] T042 [US5] `wiki/ja/openui/index.md` 생성 — 일본어 네비게이션 허브, 섹션별 분류 및 각 페이지 한 줄 일본어 설명 포함 (상대경로 형식)

### OpenUI Lang 섹션 (병렬 가능)

- [x] T043 [P] [US5] `wiki/ja/openui/introduction.md` 생성 — tool-page 템플릿, OpenUI紹介 in Japanese, 공식 URL: `https://www.openui.com/docs/openui-lang`, クロスリンク含む
- [x] T044 [P] [US5] `wiki/ja/openui/overview.md` 생성 — concept-page 템플릿, 4つのコアコンポーネント (Library, Prompt Generator, Parser, Renderer) in Japanese, 이미지 포함, 공식 URL: `https://www.openui.com/docs/openui-lang/overview`
- [x] T045 [P] [US5] `wiki/ja/openui/quickstart.md` 생성 — tool-page 템플릿, クイックスタートガイド in Japanese, `npx @openuidev/cli@latest create` 포함, 공식 URL: `https://www.openui.com/docs/openui-lang/quickstart`
- [x] T046 [P] [US5] `wiki/ja/openui/system-prompts.md` 생성 — concept-page 템플릿, システムプロンプト自動生成 in Japanese, 공식 URL: `https://www.openui.com/docs/openui-lang/system-prompts`
- [x] T047 [P] [US5] `wiki/ja/openui/benchmarks.md` 생성 — concept-page 템플릿, トークン効率ベンチマーク in Japanese, 벤치마크 표 포함, 이미지 포함, 공식 URL: `https://www.openui.com/docs/openui-lang/benchmarks`
- [x] T048 [P] [US5] `wiki/ja/openui/architecture.md` 생성 — concept-page 템플릿, パイプラインアーキテクチャ in Japanese, ASCII 다이어그램 + 이미지 포함, 공식 URL: `https://www.openui.com/docs/openui-lang/how-it-works`
- [x] T049 [P] [US5] `wiki/ja/openui/specification-v05.md` 생성 — reference 템플릿, OpenUI Lang v0.5仕様 in Japanese (状態管理, クエリ, ミューテーション, アクション), 공식 URL: `https://www.openui.com/docs/openui-lang/specification-v05`
- [x] T050 [P] [US5] `wiki/ja/openui/example-vercel-ai-chat.md` 생성 — tool-page 템플릿, Vercel AIチャット例 in Japanese, 공식 URL: `https://www.openui.com/docs/openui-lang/examples/vercel-ai-chat`

### Chat SDK & API Reference 섹션 (병렬 가능)

- [x] T051 [P] [US5] `wiki/ja/openui/chat-introduction.md` 생성 — tool-page 템플릿, Chat SDK紹介 in Japanese, 공식 URL: `https://www.openui.com/docs/chat`
- [x] T052 [P] [US5] `wiki/ja/openui/chat-genui.md` 생성 — concept-page 템플릿, openuiChatLibraryコンポーネント in Japanese, 공식 URL: `https://www.openui.com/docs/chat/genui`
- [x] T053 [P] [US5] `wiki/ja/openui/api-reference-overview.md` 생성 — reference 템플릿, 5パッケージAPIの概要 in Japanese, 공식 URL: `https://www.openui.com/docs/api-reference`
- [x] T054 [P] [US5] `wiki/ja/openui/api-reference-react-ui.md` 생성 — reference 템플릿, @openuidev/react-ui API in Japanese (FullScreen, Copilot, BottomTray), 공식 URL: `https://www.openui.com/docs/api-reference/react-ui`

### 카탈로그 업데이트

- [x] T055 [US5] `wiki/index.md` 업데이트 — `## 日本語 (ja)` > `### OpenUI (Generative UI)` 섹션 추가, 12개 항목 기재

**Checkpoint**: T042~T055 완료 후 `wiki/ja/openui/index.md` 에서 12개 링크 동작 확인 → US5 완료

---

## Phase 10: Polish — 최종 마무리

**Purpose**: 전체 3개 언어 위키 완성 후 이력 기록

- [x] T056 `wiki/log.md` 업데이트 — `## [2026-05-15 HH:MM] ingest | OpenUI 공식 문서 인제스트 — 영어·일본어 추가 (각 12페이지)` 항목 append

---

## Dependencies & Execution Order

### Phase Dependencies

- **Phase 7 (Foundational)**: T026~T027 — 즉시 시작 가능 (디렉토리 생성)
- **Phase 8 (US4 English)**: Phase 7 완료 후 → T028~T040 병렬, T041은 T029~T040 완료 후
- **Phase 9 (US5 Japanese)**: Phase 7 완료 후 → T042~T054 병렬, T055는 T043~T054 완료 후
- **Phase 10 (Polish)**: Phase 8 + Phase 9 완료 후

### User Story Dependencies

- **US4 (English, P1)**: Phase 7 완료 후 시작 — US5와 독립적으로 병렬 진행 가능
- **US5 (Japanese, P2)**: Phase 7 완료 후 시작 — US4와 독립적으로 병렬 진행 가능

### Parallel Opportunities

- T026~T027: 병렬 실행 가능 (각각 별도 디렉토리)
- T029~T040: 12개 영어 페이지 모두 병렬 실행 가능
- T043~T054: 12개 일본어 페이지 모두 병렬 실행 가능
- **US4와 US5 전체**: 서로 다른 디렉토리이므로 동시 진행 가능

---

## Parallel Example: US4 (English) + US5 (Japanese) 동시 실행

```
# T026~T027 완료 후 동시 실행:

[US4 영어 — wiki/en/openui/]          [US5 일본어 — wiki/ja/openui/]
T028: index.md                          T042: index.md
T029: introduction.md        동시      T043: introduction.md
T030: overview.md            실행      T044: overview.md
T031: quickstart.md                     T045: quickstart.md
T032: system-prompts.md                 T046: system-prompts.md
T033: benchmarks.md                     T047: benchmarks.md
T034: architecture.md                   T048: architecture.md
T035: specification-v05.md              T049: specification-v05.md
T036: example-vercel-ai-chat.md         T050: example-vercel-ai-chat.md
T037: chat-introduction.md              T051: chat-introduction.md
T038: chat-genui.md                     T052: chat-genui.md
T039: api-reference-overview.md         T053: api-reference-overview.md
T040: api-reference-react-ui.md         T054: api-reference-react-ui.md
T041: wiki/index.md (en)               T055: wiki/index.md (ja)
```

---

## Implementation Strategy

### 현황 (완료)

- Phase 1~6: Korean wiki 전체 완료 (T001~T025 `[x]`)
- PR #6 열림 — ko 위키 포함

### 남은 작업 (이 tasks.md의 목표)

1. Phase 7: 디렉토리 생성 (T026~T027)
2. Phase 8: 영어 위키 13파일 (T028~T041)
3. Phase 9: 일본어 위키 13파일 (T042~T055) — Phase 8과 병렬 가능
4. Phase 10: wiki/log.md 업데이트 (T056)

### 페이지 현지화 기준

- **English (en)**: `wiki/ko/openui/` 동명 파일을 기반으로 영어 번역. 한국어 UI 용어·코드·URL은 그대로 유지.
- **Japanese (ja)**: `wiki/ko/openui/` 동명 파일을 기반으로 일본어 번역. 기술 용어는 영어 병기(カタカナ) 허용.
- 프론트매터 `language:` 필드를 각각 `en`, `ja`로 설정
- 이미지 URL·공식 링크·코드 블록은 세 언어 공통 동일

---

## Notes

- `raw/` 디렉토리 파일은 절대 수정하지 않는다 (CLAUDE.md 규칙 #1)
- 각 페이지 프론트매터의 `language:` 필드: `ko`→완료, 신규는 `en` 또는 `ja`
- `source_count: 0` (raw/ 파일 미사용, 공식 URL 참조)
- 이미지 URL: `wiki/ko/openui/` 동명 페이지와 동일한 URL 재사용
- 총 태스크: 56개 (T001~T056) — 완료 25개, 잔여 31개
