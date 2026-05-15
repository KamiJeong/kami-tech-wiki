---
title: "OpenUI 문서 인덱스"
aliases: ["openui", "generative-ui"]
tags: [openui, generative-ui, index]
category: reference
language: ko
date_created: 2026-05-15
date_modified: 2026-05-15
source_count: 0
related: []
status: active
---

# OpenUI 문서 인덱스

> [OpenUI](https://www.openui.com/) 공식 문서를 한국어로 정리한 위키입니다.
> OpenUI는 LLM이 UI를 생성할 수 있도록 설계된 풀스택 생성형 UI 프레임워크입니다.

**공식 사이트**: [https://www.openui.com/](https://www.openui.com/) | **GitHub**: [thesysdev/openui](https://github.com/thesysdev/openui)

---

## OpenUI Lang

OpenUI의 핵심 — 스트리밍 우선 UI 생성 언어와 런타임.

| 페이지 | 설명 |
|--------|------|
| [소개](introduction.md) | OpenUI란 무엇인지, 왜 만들어졌는지, 패키지 구조 |
| [개요](overview.md) | 4가지 핵심 구성요소: Library, Prompt Generator, Parser, Renderer |
| [빠른 시작](quickstart.md) | `npx @openuidev/cli`로 1분 안에 GenUI 앱 실행 |
| [시스템 프롬프트](system-prompts.md) | LLM 시스템 프롬프트 자동 생성 원리 |
| [벤치마크](benchmarks.md) | JSON 대비 최대 67% 토큰 절약 성능 비교 |
| [아키텍처](architecture.md) | Library → Prompt → LLM → Parser → Renderer 파이프라인 |

---

## Language Specification

| 페이지 | 설명 |
|--------|------|
| [명세 v0.5 (최신)](specification-v05.md) | 반응형 상태, 쿼리, 뮤테이션, 내장 함수 전체 명세 |

---

## Examples

| 페이지 | 설명 |
|--------|------|
| [Vercel AI Chat 예제](example-vercel-ai-chat.md) | Next.js + Vercel AI SDK + OpenUI 완전한 예제 앱 |

---

## Chat SDK

| 페이지 | 설명 |
|--------|------|
| [Chat SDK 소개](chat-introduction.md) | 헤드리스 채팅 상태 관리, 스트리밍 어댑터, 레이아웃 컴포넌트 |
| [GenUI](chat-genui.md) | 채팅 최적화 컴포넌트 라이브러리 (`openuiChatLibrary`) |

---

## API Reference

| 페이지 | 설명 |
|--------|------|
| [API 레퍼런스 개요](api-reference-overview.md) | 패키지별 API 구조 및 CLI 도구 |
| [@openuidev/react-ui](api-reference-react-ui.md) | 레이아웃 컴포넌트(FullScreen, Copilot, BottomTray) API |

---

## 관련 링크

- [[OpenUI 소개]] — 이 위키의 시작점
- [Open UI (W3C 표준)](../open-ui/) — W3C Open UI 워킹그룹 (별개 프로젝트)
