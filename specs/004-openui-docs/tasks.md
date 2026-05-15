# Tasks: OpenUI 공식 문서 위키 인제스트

**Input**: Design documents from `specs/004-openui-docs/`

**Prerequisites**: plan.md ✅, spec.md ✅, research.md ✅, data-model.md ✅

**Tests**: 이 feature는 정적 콘텐츠 인제스트이므로 자동화 테스트 없음. 각 체크포인트에서 수동 검증.

**Organization**: 사용자 스토리(P1→P3) 우선순위 순서로 구성. P1(인덱스 탐색)이 MVP.

## Format: `[ID] [P?] [Story] Description`

- **[P]**: 병렬 실행 가능 (다른 파일, 의존성 없음)
- **[Story]**: 해당 사용자 스토리 레이블 (US1, US2, US3)

---

## Phase 1: Setup (공유 인프라)

**Purpose**: 위키 디렉토리 준비 및 공식 문서 콘텐츠 수집

- [x] T001 `wiki/ko/openui/` 디렉토리 생성 확인 (존재하지 않으면 생성)
- [x] T002 openui.com 공식 문서 12개 페이지 콘텐츠 수집 — 웹 검색 및 WebFetch로 각 페이지 내용 파악 (Introduction, Overview, Quick Start, System Prompts, Benchmarks, Architecture, Spec v0.5, Vercel AI Chat Example, Chat SDK Intro, Chat GenUI, API Reference Overview, @openuidev/react-ui)

---

## Phase 2: Foundational (블로킹 선행 조건)

**Purpose**: 모든 위키 페이지의 탐색 허브가 되는 index.md 생성

**⚠️ CRITICAL**: index.md가 완성되기 전에는 US1 구현이 불완전함

- [x] T003 `wiki/ko/openui/index.md` 생성 — 13개 페이지 전체 링크, 섹션별 분류, 각 페이지 한 줄 설명 포함 (상대경로 `[제목](파일명.md)` 형식)

**Checkpoint**: index.md 완성 → 이후 개별 페이지 작업을 병렬로 시작 가능

---

## Phase 3: User Story 1 - 인덱스 기반 탐색 (Priority: P1) 🎯 MVP

**Goal**: wiki/ko/openui/의 12개 한국어 위키 페이지를 index.md와 함께 완성. 각 페이지는 한국어 설명 콘텐츠, 공식 URL 링크, 관련 페이지 크로스링크를 포함.

**Independent Test**: `wiki/ko/openui/index.md`를 열어 12개 링크가 모두 존재하는 실제 파일을 가리키는지 확인. 각 파일에 한국어 콘텐츠(헤딩 + 본문)가 있는지 확인.

### OpenUI Lang 섹션 (병렬 가능)

- [x] T004 [P] [US1] `wiki/ko/openui/introduction.md` 생성 — tool-page 템플릿, OpenUI 소개 (Generative UI 풀스택 프레임워크, 4개 패키지 구조, 탄생 배경), 공식 URL: `https://www.openui.com/docs/openui-lang`, 관련 페이지 크로스링크 포함
- [x] T005 [P] [US1] `wiki/ko/openui/overview.md` 생성 — concept-page 템플릿, 4가지 핵심 구성요소 설명 (Library, Prompt Generator, Parser, Renderer), 공식 URL: `https://www.openui.com/docs/openui-lang/overview`, 관련 페이지 크로스링크 포함
- [x] T006 [P] [US1] `wiki/ko/openui/quickstart.md` 생성 — tool-page 템플릿, `npx @openuidev/cli@latest create` 명령어 포함 빠른 시작 가이드, 환경변수 설정, 공식 URL: `https://www.openui.com/docs/openui-lang/quickstart`, 관련 페이지 크로스링크 포함
- [x] T007 [P] [US1] `wiki/ko/openui/system-prompts.md` 생성 — concept-page 템플릿, LLM 시스템 프롬프트 생성 원리 및 `library.prompt()` 설명, 공식 URL: `https://www.openui.com/docs/openui-lang/system-prompts`, 관련 페이지 크로스링크 포함
- [x] T008 [P] [US1] `wiki/ko/openui/benchmarks.md` 생성 — concept-page 템플릿, 토큰 효율성 벤치마크 (JSON 대비 최대 67% 감소, 7가지 시나리오 비교), 공식 URL: `https://www.openui.com/docs/openui-lang/benchmarks`, 관련 페이지 크로스링크 포함
- [x] T009 [P] [US1] `wiki/ko/openui/architecture.md` 생성 — concept-page 템플릿, OpenUI 작동 원리 (LLM → Parser → Renderer → React 컴포넌트), 공식 URL: `https://www.openui.com/docs/openui-lang/how-it-works`, 관련 페이지 크로스링크 포함
- [x] T010 [P] [US1] `wiki/ko/openui/specification-v05.md` 생성 — concept-page 템플릿, OpenUI Lang v0.5 명세 (반응형 상태, 쿼리, 뮤테이션, 내장 함수), 공식 URL: `https://www.openui.com/docs/openui-lang/specification-v05`, 관련 페이지 크로스링크 포함
- [x] T011 [P] [US1] `wiki/ko/openui/example-vercel-ai-chat.md` 생성 — tool-page 템플릿, Vercel AI SDK + Next.js 예제 앱 설명, 공식 URL: `https://www.openui.com/docs/openui-lang/examples/vercel-ai-chat`, 관련 페이지 크로스링크 포함

### Chat SDK & API Reference 섹션 (병렬 가능)

- [x] T012 [P] [US1] `wiki/ko/openui/chat-introduction.md` 생성 — tool-page 템플릿, Chat SDK 소개 (드롭인 채팅 레이아웃, 스트리밍 어댑터), 공식 URL: `https://www.openui.com/docs/chat`, 관련 페이지 크로스링크 포함
- [x] T013 [P] [US1] `wiki/ko/openui/chat-genui.md` 생성 — concept-page 템플릿, GenUI 라이브러리 설명 (채팅 최적화 컴포넌트: Card, FollowUpBlock, ListBlock, SectionBlock), 공식 URL: `https://www.openui.com/docs/chat/genui`, 관련 페이지 크로스링크 포함
- [x] T014 [P] [US1] `wiki/ko/openui/api-reference-overview.md` 생성 — tool-page 템플릿, 4개 패키지 API 개요 (@openuidev/react-lang, react-headless, react-ui, cli), 공식 URL: `https://www.openui.com/docs/api-reference`, 관련 페이지 크로스링크 포함
- [x] T015 [P] [US1] `wiki/ko/openui/api-reference-react-ui.md` 생성 — tool-page 템플릿, @openuidev/react-ui 패키지 API (사전 구성 채팅 레이아웃 및 컴포넌트), 공식 URL: `https://www.openui.com/docs/api-reference/react-ui`, 관련 페이지 크로스링크 포함

### 크로스링크 및 카탈로그 업데이트

- [x] T016 [US1] `wiki/ko/openui/index.md` 업데이트 — T004~T015에서 생성된 실제 파일명 기준으로 링크 검증 및 보완
- [x] T017 [US1] `wiki/index.md` 업데이트 — `## 한국어 (ko)` > `### OpenUI (Generative UI)` 섹션 추가, 13개 항목 기재
- [x] T018 [US1] `wiki/log.md` 업데이트 — `## [2026-05-15 HH:MM] ingest | OpenUI 공식 문서 인제스트 (12페이지)` 항목 append

**Checkpoint**: T003~T018 완료 후 index.md에서 12개 링크가 모두 실존하는 파일을 가리키는지 확인 → US1 완료

---

## Phase 4: User Story 2 - 공식 문서 연결 검증 (Priority: P2)

**Goal**: 모든 12개 위키 페이지의 "참고 링크" 섹션에 공식 문서 URL이 포함되어 있는지 검증하고 누락 시 추가.

**Independent Test**: 각 위키 페이지의 "참고 링크" 또는 "공식 문서" 섹션에 openui.com URL이 1개 이상 있는지 확인.

- [x] T019 [US2] T004~T015에서 생성된 12개 페이지 전체 검토 — 공식 URL 링크 누락 시 각 페이지 "참고 링크" 섹션에 추가. 형식: `- [공식 문서](https://www.openui.com/docs/...) — (YYYY-MM-DD)`

**Checkpoint**: 12개 페이지 모두 공식 URL 링크 포함 확인 → US2 완료

---

## Phase 5: User Story 3 - 이미지 참조 (Priority: P3)

**Goal**: Architecture, Benchmarks, Overview 페이지에 공식 사이트 이미지/다이어그램 참조 추가.

**Independent Test**: 3개 페이지에 마크다운 이미지 문법(`![alt](url)`) 또는 이미지 링크가 1개 이상 포함되어 있는지 확인.

- [x] T020 [P] [US3] `wiki/ko/openui/architecture.md` 업데이트 — GitHub 저장소 또는 공식 사이트에서 아키텍처 다이어그램 이미지 URL 탐색 후 임베드. 이미지 없을 경우 텍스트 아스키아트 다이어그램으로 대체
- [x] T021 [P] [US3] `wiki/ko/openui/benchmarks.md` 업데이트 — GitHub README의 벤치마크 차트 이미지 URL 탐색 후 임베드. 이미지 없을 경우 마크다운 표로 벤치마크 수치 정리
- [x] T022 [P] [US3] `wiki/ko/openui/overview.md` 업데이트 — GitHub README 또는 공식 사이트의 아키텍처 개요 이미지 탐색 후 임베드. 이미지 없을 경우 텍스트 설명 보완

**Checkpoint**: 3개 페이지에 시각 자료(이미지 또는 대체 표/다이어그램) 포함 확인 → US3 완료

---

## Phase 6: Polish — Slack 알림 축약 정보 처리

**Purpose**: main PR 머지 시 위키 인제스트 전용 축약 Slack 알림 지원

- [x] T023 `.wiki/scripts/notify-slack-ci.ts` 업데이트 — `wiki/ko/` 하위 파일 생성을 감지할 때 Slack 메시지에 위키 인제스트 요약 필드 추가. 형식: `인제스트된 페이지: N개 | 섹션: OpenUI Lang, Chat SDK, API Reference | 요약: OpenUI 공식 문서 인제스트 완료`. 기존 일반 파일 변경 알림 형식은 유지하고 위키 섹션만 추가
- [x] T024 `.wiki/scripts/notify-slack-ci.test.ts` 업데이트 — T023에서 추가된 위키 인제스트 감지 로직에 대한 테스트 케이스 추가 (wiki 파일 생성 시 인제스트 요약 포함 여부)
- [x] T025 기존 `.github/workflows/notify-slack.yml` 동작 검증 — `push: branches: main` 트리거가 PR 머지 이후 정상 동작하는지 확인. `SLACK_WEBHOOK_URL` secret 미설정 시 워크플로우 자체는 실패하지 않도록 조건부 처리 확인

---

## Dependencies & Execution Order

### Phase Dependencies

- **Setup (Phase 1)**: 즉시 시작 가능
- **Foundational (Phase 2)**: Phase 1 완료 후 → US1 작업을 블로킹
- **US1 (Phase 3)**: Phase 2 완료 후 → T004~T015 병렬 실행 가능, T016~T018은 T004~T015 완료 후
- **US2 (Phase 4)**: Phase 3(T004~T015) 완료 후
- **US3 (Phase 5)**: Phase 3(T005, T008, T009) 완료 후 병렬 실행 가능
- **Polish (Phase 6)**: 독립적으로 진행 가능 (코드 변경이므로 콘텐츠 작업과 별개)

### User Story Dependencies

- **US1 (P1)**: Phase 2 완료 후 시작 — 다른 스토리에 의존 없음
- **US2 (P2)**: T004~T015 완료 후 시작 — US1 페이지 존재 필요
- **US3 (P3)**: T005, T008, T009 완료 후 시작 — 해당 페이지 존재 필요

### Parallel Opportunities

- T004~T015: 12개 페이지 생성 작업 모두 병렬 실행 가능 (각각 독립 파일)
- T020~T022: 3개 이미지 참조 추가 작업 병렬 실행 가능
- T023~T025: 코드 작업으로 콘텐츠 작업과 독립적으로 병렬 진행 가능

---

## Parallel Example: User Story 1 (Phase 3)

```
# T003 완료 후 병렬 실행:
Task T004: wiki/ko/openui/introduction.md 생성
Task T005: wiki/ko/openui/overview.md 생성
Task T006: wiki/ko/openui/quickstart.md 생성
Task T007: wiki/ko/openui/system-prompts.md 생성
Task T008: wiki/ko/openui/benchmarks.md 생성
Task T009: wiki/ko/openui/architecture.md 생성
Task T010: wiki/ko/openui/specification-v05.md 생성
Task T011: wiki/ko/openui/example-vercel-ai-chat.md 생성
Task T012: wiki/ko/openui/chat-introduction.md 생성
Task T013: wiki/ko/openui/chat-genui.md 생성
Task T014: wiki/ko/openui/api-reference-overview.md 생성
Task T015: wiki/ko/openui/api-reference-react-ui.md 생성

# T004~T015 완료 후:
Task T016: index.md 링크 검증
Task T017: wiki/index.md 업데이트
Task T018: wiki/log.md 업데이트
```

---

## Implementation Strategy

### MVP First (US1만)

1. Phase 1: wiki/ko/openui/ 디렉토리 확인
2. Phase 2: index.md 생성 (CRITICAL)
3. Phase 3: T004~T018 완료 (12페이지 + index + wiki/index.md + log.md 업데이트)
4. **STOP and VALIDATE**: index.md에서 모든 링크 동작 확인
5. PR 생성 → 리뷰 → main 머지

### Incremental Delivery

1. Setup + Foundational → index.md 완성
2. US1 (T004~T018) → 12개 한국어 페이지 완성 + 카탈로그 업데이트 → MVP
3. US2 (T019) → 공식 URL 링크 검증 완료
4. US3 (T020~T022) → 이미지 참조 추가
5. Polish (T023~T025) → Slack 알림 개선

---

## Notes

- `raw/` 디렉토리 파일은 절대 수정하지 않는다 (CLAUDE.md 규칙 #1)
- 각 위키 페이지 생성 시 `.wiki/templates/` 템플릿의 프론트매터 필드를 모두 채운다
- `source_count: 0` (raw/ 파일 미사용, 공식 URL 참조)
- 이미지 URL은 공식 사이트 또는 GitHub raw 콘텐츠 URL 사용 (로컬 다운로드 없음)
- Slack 알림은 `SLACK_WEBHOOK_URL` secret이 설정된 환경에서만 동작
