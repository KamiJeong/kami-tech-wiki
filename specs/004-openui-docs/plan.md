# Implementation Plan: OpenUI 공식 문서 위키 인제스트

**Branch**: `004-openui-docs` | **Date**: 2026-05-15 | **Spec**: [spec.md](spec.md)

**Input**: Feature specification from `specs/004-openui-docs/spec.md`

## Summary

openui.com 공식 문서 전체를 `wiki/ko/openui/` 에 한국어 위키 페이지로 인제스트한다. 총 12개 문서 페이지 + 1개 index.md를 생성하고, 각 페이지에 공식 원본 URL 링크 및 이미지 참조를 포함한다. 완료 후 `wiki/index.md`, `wiki/log.md`를 업데이트하고 Slack 알림을 전송한다.

## Technical Context

**Language/Version**: Markdown (콘텐츠), TypeScript 6.0.3 (Bun 환경, 기존 Slack 알림 스크립트)

**Primary Dependencies**: Bun 1.3.14 (기존 notify-slack.ts 실행), 공식 openui.com 사이트 (콘텐츠 소스)

**Storage**: 파일 시스템 — `wiki/ko/openui/` 디렉토리 (마크다운 파일)

**Testing**: 링크 유효성 수동 확인, 프론트매터 스키마 준수 확인, index.md 링크 동작 확인

**Target Platform**: 파일 시스템 기반 마크다운 위키

**Project Type**: 콘텐츠 인제스트 (documentation)

**Performance Goals**: N/A (정적 마크다운 파일)

**Constraints**:
- `raw/` 디렉토리 수정 금지 (CLAUDE.md 규칙)
- `SLACK_WEBHOOK_URL` 환경 변수 필요 (Slack 알림)
- 기존 `.wiki/templates/` 템플릿 준수
- 이미지는 로컬 다운로드 없이 공식 사이트 URL 참조

**Scale/Scope**: 13개 마크다운 파일 생성 (index.md 포함)

## Constitution Check

*GATE: Must pass before Phase 0 research. Re-check after Phase 1 design.*

이 feature는 코드가 아닌 **콘텐츠/문서 인제스트** 작업. 아래 원칙 적용 평가:

| 원칙 | 적용 여부 | 상태 | 비고 |
|------|----------|------|------|
| I. Spec Before Code | ✅ 적용 | PASS | spec.md 존재 |
| II. Single Source of Truth | ✅ 적용 | PASS | 각 문서 1개 페이지 원칙 |
| III. Explicit Overrides | ✅ 적용 | PASS | 오버라이드 없음 |
| IV. Version-Pinned Stack | ✅ 적용 | PASS | version-guard 통과 |
| V. Type Safety | ➖ N/A | — | 신규 코드 없음 |
| VI. Code Quality | ➖ N/A | — | 신규 코드 없음 |
| VII. Testing Standards | ⚠️ 부분 적용 | ACCEPTED | 콘텐츠 특성상 자동화 테스트 불가. 수동 링크 유효성 확인으로 대체. |
| VIII. UX Consistency | ➖ N/A | — | UI 없음 |
| IX. Design System | ➖ N/A | — | UI 없음 |
| X. Accessibility | ➖ N/A | — | UI 없음 |
| XI. Performance Budgets | ➖ N/A | — | 정적 파일 |
| XII. Security & Privacy | ✅ 적용 | PASS | Slack webhook env var 사용 |
| XIII. Module Boundaries | ➖ N/A | — | 코드 모듈 없음 |
| XIV. Local-First | ✅ 적용 | PASS | 로컬 마크다운 파일 생성 |
| XV. AI Agent Governance | ✅ 적용 | PASS | 이 plan이 spec을 추적 |
| XVI. Definition of Done | ✅ 적용 | PASS | 아래 DoD 참조 |

**GATE: PASS** — 위반 없음.

*Post-design re-check*: Phase 1 결과(data-model.md) 검토 후 동일하게 PASS.

## Project Structure

### Documentation (this feature)

```text
specs/004-openui-docs/
├── plan.md              # This file
├── research.md          # Phase 0 output
├── data-model.md        # Phase 1 output
└── tasks.md             # Phase 2 output (/speckit-tasks command)
```

### Source Code (repository root)

이 feature는 신규 소스 코드 없음. 기존 스크립트 재사용:

```text
wiki/ko/openui/               # 신규 생성 (이 feature의 주요 산출물)
├── index.md                  # OpenUI 문서 전체 인덱스
├── introduction.md           # OpenUI 소개 (tool-page 템플릿)
├── overview.md               # OpenUI 개요 (concept-page 템플릿)
├── quickstart.md             # 빠른 시작 (tool-page 템플릿)
├── system-prompts.md         # 시스템 프롬프트 (concept-page 템플릿)
├── benchmarks.md             # 벤치마크 (concept-page 템플릿)
├── architecture.md           # 아키텍처 (concept-page 템플릿)
├── specification-v05.md      # 언어 명세 v0.5 (concept-page 템플릿)
├── example-vercel-ai-chat.md # 예제: Vercel AI Chat (tool-page 템플릿)
├── chat-introduction.md      # Chat SDK 소개 (tool-page 템플릿)
├── chat-genui.md             # Chat GenUI (concept-page 템플릿)
├── api-reference-overview.md # API 레퍼런스 개요 (tool-page 템플릿)
└── api-reference-react-ui.md # @openuidev/react-ui (tool-page 템플릿)

wiki/index.md                 # 기존 파일 업데이트 (OpenUI 섹션 추가)
wiki/log.md                   # 기존 파일 업데이트 (ingest 이력 추가)

.wiki/scripts/notify-slack.ts # 재사용 (수정 없음)
```

**Structure Decision**: 단일 콘텐츠 디렉토리. 기존 `wiki/ko/<tool>/` 패턴을 따라 `wiki/ko/openui/` 사용. `wiki/ko/open-ui/`와 구분 (open-ui는 W3C Open UI 표준용).

## Definition of Done

이 feature의 완료 기준 (Constitution Principle XVI 적용):

1. ✅ `wiki/ko/openui/` 에 13개 파일(index.md + 12개 문서 페이지) 생성
2. ✅ 모든 페이지 프론트매터 스키마 준수
3. ✅ 모든 페이지에 공식 원본 URL 링크 포함
4. ✅ Architecture, Benchmarks, Overview 페이지에 이미지 참조 포함
5. ✅ `wiki/index.md`에 OpenUI 섹션 추가
6. ✅ `wiki/log.md`에 ingest 이력 기록
7. ✅ Slack 알림 명령어 실행 가능 상태 (SLACK_WEBHOOK_URL 설정 필요)
