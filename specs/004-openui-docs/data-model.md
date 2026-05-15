# Data Model: OpenUI 위키 페이지

## Wiki Page 엔티티

모든 위키 페이지는 아래 프론트매터 스키마를 준수한다.

```yaml
---
title: ""           # 필수: 페이지 제목 (한국어)
aliases: []         # 선택: 검색 별칭
tags: []            # 필수: 태그 목록 (예: [openui, generative-ui])
category: tool | concept | process | reference  # 필수
language: ko        # 필수: 이 위키는 ko
date_created: YYYY-MM-DD  # 필수
date_modified: YYYY-MM-DD # 필수: 내용 변경 시 업데이트
source_count: N     # 필수: 참조한 raw/ 파일 수 (이 위키는 공식 URL 참조이므로 0)
related: []         # 선택: 관련 페이지
status: draft | active | deprecated  # 필수
---
```

## 페이지 목록 및 분류

| 파일 경로 | 제목 | category | tags |
|-----------|------|----------|------|
| `wiki/ko/openui/index.md` | OpenUI 문서 인덱스 | reference | [openui] |
| `wiki/ko/openui/introduction.md` | OpenUI 소개 | tool | [openui, generative-ui] |
| `wiki/ko/openui/overview.md` | OpenUI 개요 | concept | [openui, openui-lang] |
| `wiki/ko/openui/quickstart.md` | OpenUI 빠른 시작 | tool | [openui, quickstart] |
| `wiki/ko/openui/system-prompts.md` | OpenUI 시스템 프롬프트 | concept | [openui, system-prompt, llm] |
| `wiki/ko/openui/benchmarks.md` | OpenUI 벤치마크 | reference | [openui, benchmark, token] |
| `wiki/ko/openui/architecture.md` | OpenUI 아키텍처 | concept | [openui, architecture] |
| `wiki/ko/openui/specification-v05.md` | OpenUI Lang 명세 v0.5 | reference | [openui, openui-lang, spec] |
| `wiki/ko/openui/example-vercel-ai-chat.md` | 예제: Vercel AI Chat | tool | [openui, example, vercel] |
| `wiki/ko/openui/chat-introduction.md` | OpenUI Chat SDK 소개 | tool | [openui, chat-sdk] |
| `wiki/ko/openui/chat-genui.md` | OpenUI Chat GenUI | concept | [openui, chat-sdk, genui] |
| `wiki/ko/openui/api-reference-overview.md` | API 레퍼런스 개요 | reference | [openui, api-reference] |
| `wiki/ko/openui/api-reference-react-ui.md` | @openuidev/react-ui | reference | [openui, api-reference, react] |

## index.md 구조

```markdown
# OpenUI 문서 인덱스

> openui.com 공식 문서를 한국어로 정리한 위키

## OpenUI Lang

- [OpenUI 소개](introduction.md) — OpenUI가 무엇인지, 왜 만들어졌는지
- [OpenUI 개요](overview.md) — 4가지 핵심 구성 요소
- [빠른 시작](quickstart.md) — 1분 안에 GenUI 앱 실행
- [시스템 프롬프트](system-prompts.md) — LLM 시스템 프롬프트 구성
- [벤치마크](benchmarks.md) — 토큰 효율성 비교
- [아키텍처](architecture.md) — OpenUI 작동 원리

## Language Specification

- [OpenUI Lang 명세 v0.5](specification-v05.md) — 전체 언어 명세 (최신)

## Examples

- [예제: Vercel AI Chat](example-vercel-ai-chat.md) — Next.js + Vercel AI SDK 예제

## Chat SDK

- [Chat SDK 소개](chat-introduction.md) — 드롭인 채팅 UI
- [GenUI](chat-genui.md) — 채팅 최적화 컴포넌트 라이브러리

## API Reference

- [API 레퍼런스 개요](api-reference-overview.md) — 패키지 구조 및 CLI
- [@openuidev/react-ui](api-reference-react-ui.md) — UI 컴포넌트 라이브러리 API
```

## wiki/index.md 항목 추가 형식

```markdown
## 한국어 (ko)

### OpenUI (Generative UI)
- [[OpenUI 소개]] — Generative UI를 위한 오픈 스탠다드 (updated: 2026-05-15, sources: 0)
- [[OpenUI 개요]] — 4가지 핵심 구성 요소 (updated: 2026-05-15, sources: 0)
- [[OpenUI 빠른 시작]] — 1분 안에 GenUI 앱 실행 (updated: 2026-05-15, sources: 0)
- ... (13개 항목 전체)
```
