---
title: "Claude"
aliases: ["Anthropic Claude", "Claude AI"]
tags: [ai-tool, llm, anthropic, assistant]
category: tool
tool: "Claude"
language: ko
date_created: 2026-05-15
date_modified: 2026-05-15
source_count: 0
related: ["[[ChatGPT Overview]]", "[[Gemini Overview]]"]
status: draft
---

# Claude

> Anthropic이 개발한 AI 어시스턴트. 안전성(Constitutional AI)을 핵심 설계 원칙으로 하며, 장문 컨텍스트 이해와 코드 작성, 문서 분석에 강점을 가진다.

---

## 핵심 개념

- **Constitutional AI (CAI)**: 모델이 일련의 원칙("헌법")을 기반으로 자체 출력을 비판하고 수정하는 훈련 방법론. 인간 피드백만으로 정렬하는 방식보다 확장성이 높다.
- **컨텍스트 윈도우**: 한 번의 대화에서 처리할 수 있는 최대 토큰 수. Claude 3.5 Sonnet 기준 200K 토큰.
- **모델 패밀리**: Haiku(경량·속도), Sonnet(균형), Opus(최고 성능)의 3단계 구조.

---

## 사용 시나리오

| 적합한 경우 | 적합하지 않은 경우 |
|------------|-------------------|
| 장문 문서(PDF, 코드베이스) 분석 | 실시간 인터넷 검색이 필요한 작업 |
| 복잡한 코딩 작업 및 리팩터링 | 이미지 생성 |
| 긴 대화 맥락을 유지하는 멀티턴 작업 | 최신 뉴스나 실시간 데이터 조회 |
| 구조화된 데이터 추출 및 변환 | 매우 짧고 단순한 조회 (Haiku 사용 권장) |

---

## 빠른 시작

```bash
# Claude Code CLI 실행
claude

# 특정 파일 분석
claude "이 파일을 분석해줘" --file report.pdf
```

**결과**: Claude Code가 파일을 읽고 요약, 핵심 인사이트, 후속 질문을 제안한다.

> [!tip] 처음 시작할 때
> Claude Code를 사용할 경우 `CLAUDE.md`에 프로젝트 컨텍스트를 작성해두면 매 세션마다 재설명이 불필요하다.

---

## 통합 & 연결

- **Claude Code**: CLI 기반 코딩 에이전트. 이 위키 자체가 Claude Code로 관리된다 → [[Claude Code]]
- **Anthropic API**: 프로그래밍 방식으로 Claude 모델에 접근하는 REST API → [[Anthropic API]]
- **MCP (Model Context Protocol)**: 외부 도구와 데이터 소스를 Claude에 연결하는 프로토콜 → [[MCP]]

---

## 주의사항 & 한계

> [!warning] 알려진 제약
> - 학습 데이터 컷오프 이후의 최신 정보는 알지 못한다 (웹 검색 도구 없이는).
> - 긴 컨텍스트(100K+)에서는 문서 중간부 정보를 상대적으로 덜 활용하는 경향이 있다 ("lost in the middle" 현상).
> - API 비용은 입력+출력 토큰에 비례하므로 대용량 문서 처리 시 비용 계획 필요.

> [!note] 업데이트 이력
> - Claude 3.5 Sonnet (2024): 코딩 성능 및 컨텍스트 윈도우 대폭 향상
> - Claude 3.7 Sonnet (2025): Extended Thinking 기능 추가 — 복잡한 추론 문제에서 성능 향상

---

## 참고 링크

- [Claude 공식 문서](https://docs.anthropic.com) — Anthropic API, 모델 스펙 (2026-05-15)
- [Constitutional AI 논문](https://arxiv.org/abs/2212.08073) — Bai et al., Anthropic (2022-12-15)
- [Claude 모델 비교](https://www.anthropic.com/claude) — Haiku/Sonnet/Opus 가격 및 성능 비교 (2026-05-15)
