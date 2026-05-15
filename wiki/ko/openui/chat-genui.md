---
title: "OpenUI Chat GenUI"
aliases: ["openui-genui", "openui-chat-library", "openuiChatLibrary"]
tags: [openui, chat-sdk, genui, components]
category: concept
language: ko
date_created: 2026-05-15
date_modified: 2026-05-15
source_count: 0
related: [chat-introduction, api-reference-react-ui, overview]
status: active
---

# OpenUI Chat GenUI

> 대화형 채팅에 최적화된 컴포넌트 라이브러리. 모든 응답이 `Card`로 래핑되며, 후속 질문(follow-up) 패턴을 자연스럽게 지원합니다.

**공식 문서**: [https://www.openui.com/docs/chat/genui](https://www.openui.com/docs/chat/genui)

---

## 개요

`openuiChatLibrary`는 채팅 인터페이스를 위해 특별히 설계된 OpenUI 컴포넌트 라이브러리입니다. 범용 `openuiLibrary`와 달리:

- 모든 응답이 **단일 카드(`Card`)의 수직 배치**로 구성됩니다.
- `Stack` 컴포넌트를 포함하지 않습니다 (채팅은 항상 세로 방향).
- 후속 질문 버튼(`FollowUpBlock`)이 내장되어 있습니다.

---

## 핵심 원리

### 채팅 특화 컴포넌트

| 컴포넌트 | 역할 |
|----------|------|
| `Card` | 모든 응답을 감싸는 기본 래퍼 |
| `FollowUpBlock` | 후속 질문 버튼 블록 |
| `ListBlock` | 항목 목록 표시 |
| `SectionBlock` | 응답 내 섹션 구분 |
| `Button` | 단일 액션 버튼 |
| `Buttons` | 버튼 그룹 |

### 범용 라이브러리와의 차이

| 구분 | `openuiLibrary` (범용) | `openuiChatLibrary` (채팅) |
|------|----------------------|--------------------------|
| 레이아웃 | `Stack` (자유 방향) | 항상 수직 카드 |
| 응답 래퍼 | 없음 | 자동으로 `Card` 래핑 |
| 후속 질문 | 없음 | `FollowUpBlock` 내장 |
| 사용 맥락 | 일반 UI 생성 | 채팅 인터페이스 |

---

## 실제 적용 예시

채팅에서 LLM이 생성하는 OpenUI Lang 예시:

```
# 검색 결과 카드 (openuiChatLibrary)
card = Card([
  results_section,
  follow_up
])
results_section = SectionBlock("검색 결과", [
  result1,
  result2,
  result3
])
result1 = ListBlock("첫 번째 결과", "설명 텍스트")
follow_up = FollowUpBlock([
  Button("더 자세히 알아보기"),
  Button("관련 항목 검색"),
])
```

---

## Open WebUI 통합

`thesysdev/openwebui-plugin`을 사용하면 Open WebUI 환경에서도 `openuiChatLibrary`를 사용할 수 있습니다:

```python
# Open WebUI 플러그인 설치 후 자동으로 GenUI 렌더링 활성화
# 차트, 폼, 테이블, 카드가 채팅에서 인터랙티브하게 표시됨
```

---

## 관련 개념 비교

| 구분 | 채팅 컨텍스트 | 일반 앱 컨텍스트 |
|------|-------------|----------------|
| 라이브러리 | `openuiChatLibrary` | `openuiLibrary` |
| 레이아웃 | 수직 카드 스택 | 자유 레이아웃 |
| 후속 질문 | FollowUpBlock | 없음 |
| 적합한 용도 | 채팅 어시스턴트 | 대시보드, CRUD |

---

## 연결된 도구 & 구현

- [[OpenUI Chat SDK]] — ChatProvider 및 헤드리스 상태 관리
- [API 레퍼런스: react-ui](api-reference-react-ui.md) — 레이아웃 컴포넌트
- [[Vercel AI Chat 예제]] — `openuiChatLibrary` 실제 사용 예제
- [[OpenUI 개요]] — 컴포넌트 라이브러리의 역할

---

## 참고 링크

- [공식 문서: GenUI](https://www.openui.com/docs/chat/genui) (2026-05-15)
- [GitHub: thesysdev/openwebui-plugin](https://github.com/thesysdev/openwebui-plugin) (2026-05-15)
- [GitHub: thesysdev/openui](https://github.com/thesysdev/openui) (2026-05-15)
