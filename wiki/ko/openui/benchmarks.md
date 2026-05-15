---
title: "OpenUI 벤치마크"
aliases: ["openui-benchmarks", "openui-token-efficiency"]
tags: [openui, benchmark, token, performance]
category: concept
language: ko
date_created: 2026-05-15
date_modified: 2026-05-15
source_count: 0
related: [introduction, overview, specification-v05]
status: active
---

# OpenUI 벤치마크

> `tiktoken`(GPT-5 인코더) 기준 7가지 UI 시나리오에서 OpenUI Lang이 JSON 기반 방식 대비 최대 67% 적은 토큰을 사용합니다.

**공식 문서**: [https://www.openui.com/docs/openui-lang/benchmarks](https://www.openui.com/docs/openui-lang/benchmarks)

![OpenUI 배너 — Generative UI 오픈 스탠다드](https://raw.githubusercontent.com/thesysdev/openui/main/assets/banner.png)

---

## 개요

OpenUI Lang은 위치 기반 인수와 라인 지향 구조로 토큰 수를 대폭 줄입니다. 아래 벤치마크는 동일한 UI를 세 가지 방식으로 생성했을 때의 토큰 수를 비교합니다.

- **Vercel JSON-Render**: Vercel의 JSON 기반 UI 생성 방식
- **Thesys C1 JSON**: Thesys의 C1 JSON 방식
- **OpenUI Lang**: 이 프레임워크의 방식

---

## 토큰 수 비교표

| 시나리오 | Vercel JSON | C1 JSON | OpenUI Lang | Vercel 대비 | C1 대비 |
|----------|-------------|---------|-------------|------------|---------|
| simple-table | 340 | 357 | 148 | -56.5% | -58.5% |
| chart-with-data | 520 | 516 | 231 | -55.6% | -55.2% |
| contact-form | 893 | 849 | 294 | **-67.1%** | **-65.4%** |
| dashboard | 2247 | 2261 | 1226 | -45.4% | -45.8% |
| pricing-page | 2487 | 2379 | 1195 | -52.0% | -49.8% |
| settings-panel | 1244 | 1205 | 540 | -56.6% | -55.2% |
| e-commerce-product | 2449 | 2381 | 1166 | -52.4% | -51.0% |
| **합계** | **10,180** | **9,948** | **4,800** | **-52.8%** | **-51.7%** |

---

## 핵심 원리

### 토큰 절감의 이유

1. **위치 기반 인수**: 키 이름을 반복하지 않습니다.
   ```
   # OpenUI Lang (컴팩트)
   stack = Stack([child1], "row", "l")

   # JSON (장황)
   {"type":"Stack","direction":"row","gap":"l","children":[...]}
   ```

2. **라인 지향 구조**: 중괄호, 따옴표 등 JSON 구조 문자 최소화
3. **약어 식별자**: 긴 속성명 대신 짧은 위치 인수 사용

### 렌더링 속도 비교

| 방식 | 평균 렌더링 시간 |
|------|----------------|
| JSON 기반 | 14.2초 |
| OpenUI Lang | 4.9초 (**-65%**) |

스트리밍 렌더링으로 첫 UI 요소가 훨씬 빠르게 표시됩니다.

---

## 실제 적용 예시

토큰 절감이 가장 큰 시나리오는 **contact-form**(-67.1%)입니다. 폼 요소처럼 반복적인 속성(label, placeholder, required 등)이 많을수록 효과가 큽니다.

```
# OpenUI Lang으로 표현한 contact form (간결)
form = Form([name_field, email_field, message_field, submit], "contact")
name_field = Input("이름", "text", true)
email_field = Input("이메일", "email", true)
message_field = Textarea("메시지", 4, false)
submit = Button("보내기", "submit")
```

---

## 관련 개념 비교

| 구분 | 토큰 효율이 중요한 이유 | 영향 |
|------|----------------------|------|
| 비용 | 토큰당 과금되는 LLM API | 운영 비용 절감 |
| 속도 | 토큰 수 = 생성 시간 | 사용자 경험 향상 |
| 컨텍스트 | 긴 대화에서 컨텍스트 한계 도달 | 더 많은 대화 이력 유지 |

---

## 연결된 도구 & 구현

- [[OpenUI 개요]] — 토큰 효율화의 기술적 배경
- [명세 v0.5](specification-v05.md) — OpenUI Lang 문법 상세
- [[OpenUI 소개]] — 프레임워크 전체 개요

---

## 참고 링크

- [공식 문서: Benchmarks](https://www.openui.com/docs/openui-lang/benchmarks) (2026-05-15)
- [GitHub: thesysdev/openui](https://github.com/thesysdev/openui) (2026-05-15)
