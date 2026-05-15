# Research: OpenUI 공식 문서 위키 인제스트

## 1. OpenUI란 무엇인가

- **Decision**: openui.com (thesysdev)의 OpenUI는 Generative UI를 위한 풀스택 프레임워크. W3C Open UI (open-ui.org)와 다른 별개 프로젝트.
- **Rationale**: 사용자가 명시한 URL이 https://www.openui.com/ 이므로 thesysdev의 OpenUI를 대상으로 함.
- **Alternatives considered**: open-ui.org(W3C 표준) — 이미 `wiki/ko/open-ui/` 디렉토리가 존재하므로 별도 관리.

## 2. 위키 디렉토리 네이밍

- **Decision**: `wiki/ko/openui/` (하이픈 없음)
- **Rationale**: 기존 `wiki/ko/open-ui/`는 W3C Open UI용으로 유지. openui.com 문서는 `openui/`로 구분.
- **Alternatives considered**: `wiki/ko/open-ui-gen/` — 너무 길고 직관적이지 않음.

## 3. 커버할 문서 페이지 전체 목록

검색 결과에서 확인된 openui.com 공식 문서 페이지:

| 파일명 | 공식 URL | 섹션 |
|--------|----------|------|
| `index.md` | (없음, 내부 인덱스) | 인덱스 |
| `introduction.md` | `/docs/openui-lang` | OpenUI Lang |
| `overview.md` | `/docs/openui-lang/overview` | OpenUI Lang |
| `quickstart.md` | `/docs/openui-lang/quickstart` | OpenUI Lang |
| `system-prompts.md` | `/docs/openui-lang/system-prompts` | OpenUI Lang |
| `benchmarks.md` | `/docs/openui-lang/benchmarks` | OpenUI Lang |
| `architecture.md` | `/docs/openui-lang/how-it-works` | OpenUI Lang |
| `specification-v05.md` | `/docs/openui-lang/specification-v05` | Language Spec |
| `example-vercel-ai-chat.md` | `/docs/openui-lang/examples/vercel-ai-chat` | Examples |
| `chat-introduction.md` | `/docs/chat` | Chat SDK |
| `chat-genui.md` | `/docs/chat/genui` | Chat SDK |
| `api-reference-overview.md` | `/docs/api-reference` | API Reference |
| `api-reference-react-ui.md` | `/docs/api-reference/react-ui` | API Reference |

총 13개 파일 (index.md 포함).

## 4. 템플릿 사용 기준

- **OpenUI 자체 (도구 개요)**: `tool-page.md` 템플릿 → `introduction.md`, `overview.md`
- **개념 설명 페이지**: `concept-page.md` 템플릿 → `architecture.md`, `specification-v05.md`, `system-prompts.md`, `benchmarks.md`
- **기능/SDK 페이지**: `tool-page.md` 또는 `concept-page.md` → `quickstart.md`, `chat-*`, `api-reference-*`, `example-*`
- **인덱스**: 별도 형식 (`index-entry.md` 패턴 참조)

## 5. 이미지 처리 방식

- **Decision**: 공식 사이트 이미지 URL을 마크다운 이미지 문법으로 임베드. 로컬 다운로드 없음.
- **Rationale**: 사용자 요청이 "use image their site reference"이므로 외부 이미지 참조가 의도된 방식.
- **Note**: 공식 사이트가 rate limit으로 직접 접근 불가한 경우, 이미지 URL은 공개 GitHub README의 이미지 URL을 사용하거나 GitHub Pages/CDN URL을 추정하여 사용.

## 6. Slack 알림 파라미터

기존 `notify-slack.ts` 스크립트 사용:
```bash
SLACK_WEBHOOK_URL="..." bun run .wiki/scripts/notify-slack.ts \
  --operation ingest \
  --pages "OpenUI Introduction, OpenUI Overview, OpenUI Quick Start, OpenUI System Prompts, OpenUI Benchmarks, OpenUI Architecture, OpenUI Spec v0.5, OpenUI Vercel AI Chat Example, OpenUI Chat SDK, OpenUI Chat GenUI, OpenUI API Reference, OpenUI API react-ui" \
  --summary "OpenUI 공식 문서 전체 인제스트 완료 (12개 페이지 + index)"
```
