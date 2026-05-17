---
title: "Codex CLI"
aliases: []
tags: [codex-cli, openai, ai-coding, cli]
category: tool
tool: "Codex CLI"
language: ko
date_created: 2026-05-15
date_modified: 2026-05-15
source_count: 0
related: []
status: active
---

# Codex CLI

> OpenAI가 개발한 터미널 기반 AI 코딩 에이전트. 코드 읽기·수정·실행을 터미널에서 직접 처리하며, 승인 모드·슬래시 명령·이미지 분석을 지원한다. (v0.130.0, Apache 2.0)

---

## 핵심 개념

- **승인 모드 (Approval Mode)**: 에이전트가 파일 시스템과 명령을 어느 수준까지 자율적으로 다룰지 결정하는 권한 단계. Auto(자동), Read-Only(읽기 전용), Full Access(전체 접근) 세 가지가 있다.
- **슬래시 명령 (Slash Commands)**: 대화 세션 중 `/new`, `/resume`, `/plan`, `/review`, `/diff`, `/permissions`, `/status` 등을 입력해 워크플로우를 전환한다.
- **Non-Interactive 모드**: `codex exec` 명령으로 반복 작업을 자동화할 수 있다. CI/CD 파이프라인에서 주로 활용된다.
- **MCP (Model Context Protocol)**: 서드파티 도구와 추가 컨텍스트를 Codex CLI에 통합하는 확장 프로토콜.

---

## 사용 시나리오

| 적합한 경우 | 적합하지 않은 경우 |
|------------|-------------------|
| 코드 개발·디버깅·리팩토링 | 단순한 파일 열람·복사 작업 |
| 테스트 코드 작성 및 실행 | OpenAI 계정 또는 API 키 없이 사용 |
| 대규모 코드베이스 마이그레이션 | Windows 네이티브 환경(프로덕션용; WSL2 권장) |
| CI/CD 자동화 (PR 리뷰, 릴리스 노트) | macOS Homebrew 설치에서 Computer Use 기능 사용 |
| 데이터 분석 및 시각화 자동화 | 오프라인 환경 |

---

## 빠른 시작

### 시스템 요구사항

| 항목 | 요구사항 |
|------|---------|
| 운영체제 | macOS, Linux, Windows (WSL2 권장) |
| RAM | 최소 2 GB, 권장 4 GB |
| Node.js | 22 이상 (npm 설치 방법 사용 시) |
| 인증 | ChatGPT Plus/Pro/Business/Edu/Enterprise 계정 또는 OpenAI API 키 |

### 설치

```bash
# npm으로 설치 (권장)
npm install -g @openai/codex

# Homebrew로 설치 (macOS)
brew install --cask codex
```

> [!warning] 주의
> npm의 `codex` 패키지(스코프 없음)는 2012년의 무관한 패키지입니다. 반드시 `@openai/codex`를 사용하세요.

### 기본 사용법

```bash
# 대화형 모드 시작 (현재 디렉토리 기준)
codex

# 단일 작업 실행
codex "버그를 찾아서 수정해줘"

# 비대화형 자동화 모드
codex exec "변경 이력을 바탕으로 릴리스 노트를 생성해줘"

# 이미지를 첨부해 분석
codex --image before.png,after.png "두 이미지를 비교해줘"
```

**결과**: 에이전트가 요청을 분석하고, 승인 모드에 따라 파일을 읽거나 수정하거나 명령을 실행한다.

> [!tip] 처음 시작할 때
> `codex`를 실행하면 전체 화면 터미널 UI가 열린다. `/permissions` 명령으로 승인 모드를 확인하고, Read-Only 모드에서 먼저 탐색해보는 것을 권장한다.

---

## 통합 & 연결

- **GitHub Actions**: `openai/codex-action` 워크플로우로 CI/CD 파이프라인에서 Codex CLI를 실행한다.
- **MCP 도구**: Model Context Protocol을 통해 서드파티 도구를 에이전트에 연결할 수 있다.
- **서브에이전트**: 대규모 작업을 복수의 에이전트에 위임해 병렬 처리할 수 있다.

---

## 주의사항 & 한계

> [!warning] 알려진 제약

| 항목 | 내용 |
|------|------|
| 사용량 제한 | 5시간 롤링 윈도우 + 주간 할당량 제한. ChatGPT 플랜에 따라 할당량이 다름 |
| Windows 지원 | 네이티브 Windows는 실험적 지원 단계. 프로덕션 환경에서는 WSL2 사용 권장 |
| macOS Homebrew | Homebrew로 설치한 경우 Computer Use 기능 사용 불가. 해당 기능은 Codex.app 번들 CLI 필요 |
| 주간 할당량 드리프트 버그 | 사용하지 않아도 할당량 비율이 약 1%씩 감소하는 알려진 버그 |
| `/status` 명령 지연 | 첫 실행 시 사용량 섹션이 비어 있음; 첫 메시지 전송 후 데이터가 로드됨 |
| 컨텍스트 윈도우 | 컨텍스트 압축 임계값은 컨텍스트 윈도우의 90%를 초과할 수 없음 |

> [!note] 버전 정보
> 이 문서는 Codex CLI **v0.130.0** (2026-05-08 출시) 기준으로 작성되었습니다. 프로젝트는 활발히 개발 중이므로 최신 변경 사항은 공식 릴리스 노트를 확인하세요.

---

## 참고 링크

- [Codex CLI 공식 문서](https://developers.openai.com/codex/cli) — 전체 CLI 레퍼런스 및 기능 가이드 (2026-05-15)
- [빠른 시작 가이드](https://developers.openai.com/codex/quickstart) — 5분 안에 시작하는 Codex CLI (2026-05-15)
- [GitHub 저장소 — openai/codex](https://github.com/openai/codex) — 소스 코드, 이슈, 릴리스 노트 (2026-05-15)
- [npm 패키지 @openai/codex](https://www.npmjs.com/package/@openai/codex) — 설치 정보 및 버전 이력 (2026-05-15)
- [슬래시 명령 레퍼런스](https://developers.openai.com/codex/cli/slash-commands) — 전체 슬래시 명령 목록 (2026-05-15)
- [변경 이력 (Changelog)](https://developers.openai.com/codex/changelog) — 버전별 변경 사항 (2026-05-15)
