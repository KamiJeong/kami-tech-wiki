---
title: "Codex 소개"
aliases: ["OpenAI Codex", "Codex란"]
tags: [codex, openai, ai-coding, code-generation]
category: tool
tool: "OpenAI Codex"
language: ko
date_created: 2026-05-18
date_modified: 2026-05-18
source_count: 1
related: ["Codex CLI", "Codex 101"]
status: active
---

# OpenAI Codex

> OpenAI가 개발한 AI 소프트웨어 엔지니어링 도구. 자연어 지시만으로 코드를 생성·수정·실행하며, 클라우드 기반 코딩 에이전트와 터미널 CLI 두 가지 형태로 제공된다.

---

## 핵심 개념

- **Codex (클라우드 에이전트)**: ChatGPT 및 API에 내장된 소프트웨어 엔지니어링 에이전트. 코드 작성·디버깅·PR 생성을 완전 자율로 처리한다. 각 태스크는 격리된 클라우드 샌드박스에서 실행된다.
- **Codex CLI**: 로컬 터미널에서 동작하는 AI 코딩 에이전트. 코드베이스를 직접 읽고 수정하며, 승인 모드로 자율성 수준을 조절할 수 있다.
- **샌드박스 격리**: Codex 에이전트는 네트워크 접근이 제한된 독립 컨테이너에서 실행된다. 코드 실행·테스트·반복이 안전한 환경에서 이루어진다.
- **멀티태스킹**: 여러 태스크를 동시에 병렬로 실행할 수 있어, 전통적인 단일 에이전트 방식 대비 생산성이 높다.

---

## 사용 시나리오

| 적합한 경우 | 적합하지 않은 경우 |
|------------|-------------------|
| 기능 구현·버그 수정·리팩토링 자동화 | 오프라인 환경 또는 인터넷 없는 CI |
| 코드 리뷰·PR 생성 자동화 | 사내 보안 정책상 외부 AI 도구 금지 환경 |
| 테스트 코드 작성 및 실행 | 완전히 새로운 도메인 지식이 필요한 아키텍처 설계 |
| 대규모 마이그레이션 (언어·프레임워크 전환) | 단순 파일 열람·복사 작업 |
| 여러 독립 태스크의 병렬 처리 | OpenAI 계정 또는 API 키 없이 사용 |

---

## 두 가지 형태: 클라우드 에이전트 vs CLI

| 구분 | Codex (클라우드 에이전트) | Codex CLI |
|------|--------------------------|-----------|
| 실행 환경 | OpenAI 클라우드 샌드박스 | 로컬 터미널 |
| 접근 방법 | ChatGPT 인터페이스 / API | `npm install -g @openai/codex` |
| 자율성 | 완전 자율 (태스크 단위) | 승인 모드로 조절 |
| 병렬 실행 | 여러 태스크 동시 실행 가능 | 단일 세션 기반 |
| 주요 용도 | 복잡한 다단계 개발 태스크 | 코드베이스 탐색·수정·자동화 |

---

## 작동 방식

1. **태스크 수신**: 자연어로 작업 지시 (예: "이 버그를 수정하고 테스트를 추가해줘")
2. **코드 탐색**: 관련 파일·함수·의존성을 파악
3. **계획 수립**: 변경 범위와 순서를 결정
4. **실행 & 반복**: 코드 수정 → 테스트 실행 → 결과 검토 → 필요 시 재시도
5. **결과 제출**: 변경 내용을 PR 또는 파일로 전달

---

## 빠른 시작

### ChatGPT에서 Codex 에이전트 사용

```
1. ChatGPT(Pro/Plus) 접속
2. 사이드바에서 [Codex] 선택
3. GitHub 저장소 연결
4. 태스크 입력: "src/api/user.ts의 인증 버그를 수정해줘"
5. 에이전트가 샌드박스에서 코드를 분석하고 PR을 생성
```

### Codex CLI 설치

```bash
# Node.js 22 이상 필요
npm install -g @openai/codex

# 대화형 모드 시작
codex

# 단일 태스크 실행
codex "현재 디렉토리의 TypeScript 오류를 모두 수정해줘"
```

> [!tip] 처음 시작할 때
> ChatGPT Pro/Plus 사용자는 별도 설정 없이 Codex 에이전트를 바로 사용할 수 있다. CLI를 사용하려면 OpenAI API 키 또는 ChatGPT 로그인이 필요하다.

---

## 통합 & 연결

- **GitHub**: Codex 에이전트는 GitHub 저장소에 직접 연결해 PR을 생성한다 → [[GitHub Actions]]
- **Codex CLI**: 터미널 환경에서 동일한 AI 능력을 사용 → [[Codex CLI]]
- **Codex 101**: 실전 설정·사용법 전체 가이드 → [[Codex 101]]
- **MCP**: Model Context Protocol로 외부 도구를 에이전트에 연결

---

## 주의사항 & 한계

> [!warning] 알려진 제약
> - Codex 에이전트는 ChatGPT Pro/Plus/Team/Enterprise 플랜에서만 사용 가능하다. API 접근은 별도 과금된다.
> - 클라우드 샌드박스는 외부 네트워크 접근이 제한되어 있어 외부 API를 직접 호출하는 태스크에는 제약이 있다.
> - 자율 실행 결과는 반드시 사람이 검토해야 한다. 복잡한 도메인 로직은 에이전트가 의도를 잘못 해석할 수 있다.

> [!note] 버전 정보
> 이 문서는 OpenAI Codex 공식 페이지(https://openai.com/codex) 기준으로 작성되었다. 2026년 5월 기준.

---

## 참고 링크

- [OpenAI Codex 공식 페이지](https://openai.com/codex) — Codex 소개 및 기능 개요 (2026-05-18)
- [Codex CLI GitHub 저장소](https://github.com/openai/codex) — 소스 코드, 이슈, 릴리스 노트 (2026-05-18)
- [OpenAI 개발자 문서](https://platform.openai.com/docs) — API 레퍼런스 및 통합 가이드 (2026-05-18)
