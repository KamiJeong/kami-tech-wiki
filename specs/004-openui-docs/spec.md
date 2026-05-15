# Feature Specification: OpenUI 공식 문서 위키 인제스트

**Feature Branch**: `004-openui-docs`

**Created**: 2026-05-15

**Status**: Draft

**Input**: User description: "Make Docs OpenUI - site url: https://www.openui.com/ - check all docs, should link our docs. - use image their site reference - should include all docs, and generate index.md for find easily."

## User Scenarios & Testing *(mandatory)*

### User Story 1 - OpenUI 문서 탐색 및 빠른 참조 (Priority: P1)

내부 위키를 통해 OpenUI 전체 문서를 한국어로 탐색하고, 각 주제별로 빠르게 원하는 내용을 찾을 수 있다.

**Why this priority**: OpenUI를 처음 접하는 팀원이 공식 사이트(영어)를 직접 방문하지 않고도 내부 위키에서 한국어로 내용을 파악할 수 있어야 한다. index.md가 핵심 진입점이 된다.

**Independent Test**: `wiki/ko/openui/index.md`를 열었을 때 모든 문서 섹션 링크가 정상 작동하고, 각 링크 클릭 시 해당 위키 페이지로 이동하는지 확인.

**Acceptance Scenarios**:

1. **Given** 팀원이 위키에서 OpenUI를 검색할 때, **When** `wiki/ko/openui/index.md`를 열면, **Then** OpenUI의 모든 문서 섹션 목록과 각 페이지로의 링크가 표시된다.
2. **Given** 팀원이 "Quick Start"를 읽고 싶을 때, **When** index.md에서 해당 항목을 클릭하면, **Then** 한국어로 작성된 Quick Start 페이지가 표시되고 공식 문서 원본 URL 링크도 포함된다.
3. **Given** 팀원이 특정 페이지를 읽을 때, **When** 해당 페이지를 확인하면, **Then** 공식 사이트의 이미지/다이어그램 참조가 포함되어 시각적 맥락을 파악할 수 있다.

---

### User Story 2 - 원본 공식 문서와의 연결 (Priority: P2)

내부 위키 페이지에서 원본 OpenUI 공식 문서 페이지로 바로 이동할 수 있다.

**Why this priority**: 내부 위키는 빠른 참조와 한국어 요약을 제공하지만, 상세 내용이나 최신 업데이트를 확인하려면 공식 문서로 이동해야 한다.

**Independent Test**: 각 위키 페이지의 상단 또는 하단에 "공식 문서: [URL]" 형태의 링크가 존재하고, 해당 URL이 실제 openui.com 페이지로 연결되는지 확인.

**Acceptance Scenarios**:

1. **Given** 팀원이 위키에서 "Architecture" 페이지를 읽을 때, **When** 페이지를 확인하면, **Then** `https://www.openui.com/docs/openui-lang/how-it-works` 원본 링크가 명확히 표시된다.
2. **Given** 모든 위키 페이지에서, **When** 공식 문서 링크를 클릭하면, **Then** 해당하는 openui.com 문서 페이지로 직접 이동한다.

---

### User Story 3 - 시각적 다이어그램 및 이미지 참조 (Priority: P3)

OpenUI 공식 사이트의 이미지와 다이어그램을 위키 페이지에서 참조하여, 개념 이해를 돕는 시각 자료를 확인할 수 있다.

**Why this priority**: OpenUI의 아키텍처, 벤치마크 차트, 컴포넌트 예시 등은 이미지 없이 텍스트만으로 설명하기 어렵다.

**Independent Test**: Architecture, Benchmarks, Overview 페이지에 이미지 참조(공식 사이트 이미지 URL 임베드 또는 링크)가 포함되어 있는지 확인.

**Acceptance Scenarios**:

1. **Given** 팀원이 "Benchmarks" 페이지를 열 때, **When** 해당 위키 페이지를 확인하면, **Then** 공식 사이트의 벤치마크 차트 이미지가 참조되어 토큰 효율 비교를 시각적으로 확인할 수 있다.
2. **Given** 팀원이 "Architecture" 페이지를 열 때, **When** 해당 위키 페이지를 확인하면, **Then** 아키텍처 다이어그램 이미지가 참조되어 있다.

---

### Edge Cases

- OpenUI 공식 문서 페이지 URL이 변경되었을 경우, 해당 위키 페이지에 "(링크 확인 필요)" 표시를 추가한다.
- 이미지가 공식 사이트에서 로드되지 않을 경우, 텍스트로 이미지 내용을 설명하는 대체 텍스트가 제공되어야 한다.
- 공식 문서에서 아직 공개되지 않은 섹션은 인덱스에 "확인 예정" 표시로 남긴다.
- GitHub Actions 워크플로우에서 `SLACK_WEBHOOK_URL` secret이 설정되지 않은 경우, 알림 전송을 건너뛰되 워크플로우 자체는 실패 처리하지 않는다.

## Requirements *(mandatory)*

### Functional Requirements

- **FR-001**: `wiki/ko/openui/` 디렉토리 아래에 OpenUI 공식 문서의 모든 주요 섹션에 대응하는 위키 페이지를 생성해야 한다.
- **FR-002**: 각 위키 페이지는 공식 원본 문서 URL을 명시적으로 포함해야 한다.
- **FR-003**: 각 위키 페이지는 공식 사이트에서 사용되는 이미지 또는 다이어그램에 대한 참조(이미지 URL 임베드 또는 링크)를 포함해야 한다.
- **FR-004**: `wiki/ko/openui/index.md` 파일을 생성하여 모든 하위 페이지로의 링크와 간단한 설명을 포함해야 한다.
- **FR-005**: 모든 위키 페이지는 `.wiki/templates/`의 적절한 템플릿(tool-page 또는 concept-page)을 따른 프론트매터를 포함해야 한다.
- **FR-006**: 작업 완료 후 `wiki/index.md`에 OpenUI 항목을 추가하고 `wiki/log.md`에 작업 이력을 기록해야 한다.
- **FR-007**: main 브랜치 PR이 승인/머지된 이후 GitHub Actions 워크플로우가 Slack 알림을 자동 전송해야 한다. 알림 내용은 인제스트된 페이지 수, 섹션명, 한 줄 요약으로 구성된 축약 정보로 제한한다.
- **FR-008**: 각 위키 페이지는 관련된 다른 위키 페이지로의 크로스링크를 포함해야 한다. 링크 형식: 관련 페이지 참조는 Obsidian wikilink(`[[페이지명]]`), 인덱스 및 명시적 탐색 링크는 상대경로(`[제목](파일명.md)`) 혼용.
- **FR-009**: 각 위키 페이지는 단순 링크 목록이 아닌 한국어로 실제 내용을 작성해야 한다 (공식 문서 내용 기반 한국어 요약 및 설명 포함).

### 커버해야 할 문서 섹션

아래는 openui.com에서 확인된 모든 문서 페이지 목록이다:

| 섹션 | 페이지 | 공식 URL |
|------|--------|----------|
| OpenUI Lang | Introduction | `https://www.openui.com/docs/openui-lang` |
| OpenUI Lang | Overview | `https://www.openui.com/docs/openui-lang/overview` |
| OpenUI Lang | Quick Start | `https://www.openui.com/docs/openui-lang/quickstart` |
| OpenUI Lang | System Prompts | `https://www.openui.com/docs/openui-lang/system-prompts` |
| OpenUI Lang | Benchmarks | `https://www.openui.com/docs/openui-lang/benchmarks` |
| OpenUI Lang | Architecture | `https://www.openui.com/docs/openui-lang/how-it-works` |
| Language Spec | v0.5 (Latest) | `https://www.openui.com/docs/openui-lang/specification-v05` |
| Examples | Vercel AI Chat | `https://www.openui.com/docs/openui-lang/examples/vercel-ai-chat` |
| Chat SDK | Introduction | `https://www.openui.com/docs/chat` |
| Chat SDK | GenUI | `https://www.openui.com/docs/chat/genui` |
| API Reference | Overview | `https://www.openui.com/docs/api-reference` |
| API Reference | @openuidev/react-ui | `https://www.openui.com/docs/api-reference/react-ui` |

### Key Entities

- **위키 페이지 (Wiki Page)**: OpenUI 문서 섹션 하나에 대응하는 마크다운 파일. 프론트매터(title, tags, category, language, date_created, date_modified, source_count, status)를 포함.
- **인덱스 (Index)**: `wiki/ko/openui/index.md` — 모든 OpenUI 위키 페이지의 카탈로그. 섹션별 분류, 설명, 내부 링크 포함.
- **이미지 참조 (Image Reference)**: 공식 사이트의 이미지를 마크다운 이미지 문법으로 임베드하거나 링크로 제공. 이미지 설명(alt text)을 반드시 포함.
- **Slack 알림 페이로드 (Slack Notification Payload)**: PR 머지 후 GitHub Actions가 전송하는 축약 메시지. 포함 정보: 작업 유형(ingest), 인제스트 페이지 수, 섹션명 목록(쉼표 구분), 한 줄 요약. 기존 `notify-slack.ts` 스크립트 재사용.

## Success Criteria *(mandatory)*

### Measurable Outcomes

- **SC-001**: OpenUI 공식 문서의 12개 이상 페이지가 모두 내부 위키에 대응하는 페이지로 생성된다.
- **SC-002**: 생성된 모든 위키 페이지에서 공식 원본 URL 링크가 100% 포함된다.
- **SC-003**: `wiki/ko/openui/index.md` 하나의 파일에서 모든 위키 페이지로 이동할 수 있다 (1회 클릭).
- **SC-004**: 팀원이 OpenUI 위키 index.md에서 원하는 페이지를 1분 이내에 찾을 수 있다.
- **SC-005**: 시각 자료가 중요한 페이지(Architecture, Benchmarks, Overview)에서 이미지 참조가 80% 이상 포함된다.
- **SC-006**: `wiki/index.md`와 `wiki/log.md`가 이번 인제스트 작업 결과로 업데이트된다.
- **SC-007**: 각 위키 페이지에서 관련 페이지로의 크로스링크가 1개 이상 포함된다.
- **SC-008**: 모든 위키 페이지가 한국어 설명 콘텐츠를 포함한다 (프론트매터 + 링크만으로 구성된 페이지 없음).
- **SC-009**: main PR 머지 이후 GitHub Actions가 자동으로 Slack 알림을 전송한다 (수동 실행 불필요).

## Clarifications

### Session 2026-05-15

- Q: 위키 페이지 간 크로스링크 형식은? → A: Obsidian wikilink(`[[페이지명]]`)와 상대경로(`[제목](파일명.md)`) 혼용. 관련 페이지 참조에는 wikilink, 인덱스/탐색에는 상대경로 사용.
- Q: 각 페이지에서 공식 문서 링크 제공 및 위키 문서 실제 작성 여부 → A: 공식 URL 링크 제공 + 한국어로 실제 콘텐츠 작성 (단순 스텁 아님).
- Q: Slack 알림 전송 시점과 방식은? → A: main PR 승인/머지 이후 GitHub Actions 자동 전송. 알림 내용은 페이지 수·섹션명·한 줄 요약의 축약 정보.

## Assumptions

- 내부 위키의 주 언어는 한국어이며, 영어 버전(`wiki/en/openui/`)은 별도 요청 시 추가한다.
- 이미지는 공식 사이트 URL을 마크다운 이미지 문법으로 임베드하여 참조한다 (로컬 다운로드 없이).
- 공식 사이트 접근이 일시적으로 불가할 경우, 검색 결과와 GitHub README를 기반으로 최대한 정확하게 내용을 작성하고 검토 표시(`<!-- 검토 필요 -->`)를 남긴다.
- 언어 명세서의 구버전(v0.1 등)은 최신 버전(v0.5) 페이지 내 변경 이력으로 처리하며 별도 페이지를 생성하지 않는다.
- Slack 알림은 `SLACK_WEBHOOK_URL` 환경 변수가 설정된 환경에서만 전송된다.
- 기존 `wiki/` 구조와 `.wiki/templates/` 템플릿을 준수한다.
