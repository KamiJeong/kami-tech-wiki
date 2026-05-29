---
title: "Microsoft Fara란 무엇인가?"
aliases: ["Microsoft Fara", "Fara", "Fara-7B", "Fara1.5", "컴퓨터 사용 에이전트"]
tags: [microsoft, fara, ai-agent, computer-use-agent, browser-automation, slm]
category: tool
tool: "Microsoft Fara"
language: ko
date_created: 2026-05-29
date_modified: 2026-05-29
source_count: 0
related: ["Atlassian Rovo", "Codex CLI", "Kiro MCP 가이드", "Spec-Driven Development (SDD)"]
status: draft
review_cycle: fast-changing
freshness_date: 2026-05-29
---

# Microsoft Fara란 무엇인가?

> Microsoft Fara는 Microsoft Research의 컴퓨터 사용 에이전트 연구 모델 계열입니다. Fara-7B는 7B 규모의 첫 공개 모델이고, Fara1.5는 브라우저 작업 성능과 안전 장치를 확장한 최신 계열입니다.

## 이 페이지의 대상 독자

이 페이지는 Microsoft Fara가 제품인지, Copilot 기능인지, 연구 모델인지 확인하려는 PM, 운영 담당자, 창업자, AI 도구 평가자, 초급 개발자를 위한 한국어 초안입니다. 2026-05-29에 Microsoft Research, Microsoft Foundry, GitHub, arXiv, Hugging Face 공식 자료를 다시 확인했습니다.

## 왜 중요한가

대부분의 챗봇은 글을 생성합니다. Fara류 컴퓨터 사용 에이전트는 사용자의 목표를 받고, 브라우저 화면을 보고, 다음 행동을 고릅니다. 즉 "답변하는 AI"에서 "화면을 조작하는 AI"로 한 단계 이동한 연구 흐름입니다.

이 차이는 큽니다. 웹 예약, 검색, 폼 작성, 비교 쇼핑 같은 작업은 말로 설명하는 것보다 클릭과 입력이 필요합니다. 동시에 잘못 누른 버튼, 민감 정보 입력, 결제, 신청서 제출 같은 위험도 생깁니다. Fara는 그런 가능성과 위험을 함께 보여 주는 Microsoft Research의 실험적 연구 축으로 이해해야 합니다.

## 한 문장 요약

Microsoft Fara는 브라우저 화면을 스크린샷으로 보고 좌표 기반 행동을 예측하는 컴퓨터 사용 에이전트 모델 계열이며, 2026-05-29 기준 최신 공개 설명은 Fara-7B에서 Fara1.5-4B/9B/27B 계열로 발전한 상태입니다.

## 쉽게 이해하는 설명

Fara를 "웹 브라우저를 함께 보는 조수"로 생각하면 쉽습니다. 일반 챗봇은 "항공권 예약 방법은 이렇습니다"라고 설명합니다. 컴퓨터 사용 에이전트는 사용자가 허용한 환경 안에서 항공권 사이트를 보고, 출발지 입력칸을 클릭하고, 날짜를 고르고, 다음 단계로 이동하는 행동 자체를 시도합니다.

다만 좋은 조수라면 마음대로 결제하거나 개인정보를 입력하지 않습니다. Fara1.5와 Fara-7B 자료는 중요한 지점에서 사용자 확인, 샌드박스, 모니터링, 민감 정보 제한이 필요하다고 반복해서 강조합니다.

## 핵심 개념

| 용어 | 뜻 |
|------|----|
| Microsoft Fara | Microsoft Research의 컴퓨터 사용 에이전트 모델 작업을 가리키는 이름 |
| Fara-7B | 2025-11-24 공개된 7B 규모의 공개 가중치 컴퓨터 사용 에이전트 모델 |
| Fara1.5 | 2026-05-21 발표된 Fara 후속 계열. 4B, 9B, 27B 모델로 구성된 브라우저 중심 컴퓨터 사용 에이전트 계열 |
| 컴퓨터 사용 에이전트 | 화면을 보고 마우스, 키보드, 웹 검색 같은 행동을 선택해 작업을 수행하는 에이전트 |
| 작업 궤적 | 사용자의 목표를 이루기 위해 관찰, 추론, 행동이 이어진 단계 기록 |
| 중요 지점 | 개인정보, 결제, 메시지 전송, 신청 제출처럼 사람의 확인이 필요한 순간 |

## Fara-7B와 Fara1.5의 관계

Fara-7B는 Microsoft가 공개한 첫 Fara 모델로, 7B 규모의 작은 언어 모델이 브라우저 화면을 보고 좌표 기반 행동을 예측할 수 있음을 보여 준 연구 릴리스입니다. Microsoft Foundry Labs와 GitHub 저장소는 Fara-7B를 실험적 릴리스로 설명하고, 샌드박스와 모니터링을 권장합니다.

Fara1.5는 그 다음 단계입니다. Microsoft Research는 2026-05-21에 Fara1.5-4B, Fara1.5-9B, Fara1.5-27B를 소개했습니다. 2026-05-29 확인 기준으로 Microsoft Research 글은 9B 모델을 대부분의 사용 사례에 권장하고, Foundry 모델 카탈로그에는 Fara1.5-9B가 등록되어 있습니다. 4B와 27B는 Microsoft Research 글에서 곧 Foundry에 제공될 예정이라고 설명되어 있으므로, 현재 사용 가능하다고 단정하지 않습니다.

## 컴퓨터 사용 에이전트는 어떻게 움직이나

Fara류 모델은 브라우저 화면을 텍스트 DOM이나 접근성 트리만으로 이해하지 않습니다. 핵심은 스크린샷과 대화 이력, 이전 행동을 보고 다음 한 단계 행동을 예측하는 것입니다.

단순화하면 흐름은 이렇습니다.

1. **관찰**: 현재 브라우저 화면과 최근 스크린샷을 봅니다.
2. **생각**: 사용자의 목표와 현재 상태를 비교합니다.
3. **행동**: 클릭, 입력, 스크롤, 검색, 뒤로 가기, 사용자에게 질문 같은 다음 행동을 고릅니다.
4. **반복**: 화면이 바뀌면 다시 관찰하고 다음 행동을 고릅니다.

비유하면, 사람이 옆자리에서 "이 폼의 이름 칸을 눌러", "다음 버튼은 오른쪽 아래야"라고 단계별로 조작하는 것과 비슷합니다. 차이는 모델이 화면 좌표와 행동을 직접 예측한다는 점입니다.

## 왜 작은 모델을 강조하나

Fara의 흥미로운 지점은 "가장 큰 범용 모델이 모든 것을 한다"는 방향이 아니라, 브라우저 조작이라는 좁은 역할에 맞춘 작은 에이전트 모델을 실험한다는 점입니다.

Microsoft 자료는 Fara-7B가 작은 크기 덕분에 온디바이스 실행 가능성, 낮은 지연 시간, 개인정보가 로컬에 남는 구조를 기대할 수 있다고 설명합니다. Fara1.5도 4B, 9B, 27B처럼 크기를 나눠 비용, 성능, 배포 조건을 선택할 수 있게 설계된 계열로 소개됩니다.

작은 모델이 항상 안전하거나 정확하다는 뜻은 아닙니다. 핵심은 특정 작업 영역에 맞춰 데이터, 행동 공간, 검증기를 설계하면 작은 모델도 브라우저 작업에서 의미 있는 성능을 낼 수 있다는 연구 방향입니다.

## 최신 공식 문서 기준

| 출처 | 소유자 | 날짜 | 이 글에서 확인한 역할 |
|------|--------|------|----------------------|
| [Fara1.5 - A family of frontier computer use agent models](https://www.microsoft.com/en-us/research/articles/fara1-5-computer-use-agent/) | Microsoft Research | 2026-05-21 게시, 2026-05-29 접근 | Fara1.5 계열, 모델 크기, 벤치마크, FaraGen1.5, 시각 자료 |
| [Fara1.5-9B Model Catalog](https://ai.azure.com/catalog/models/Fara1.5-9B) | Microsoft Foundry | 2026-05 최종 업데이트, 2026-05-29 접근 | Fara1.5-9B 사용 목적, 안전 제한, human-in-the-loop, 샌드박스 권장 |
| [microsoft/fara](https://github.com/microsoft/fara) | Microsoft GitHub | 2026-05-29 접근 | Fara-7B 설치, 데모, 성능표, 실험적 릴리스와 샌드박스 권장 |
| [Fara-7B: An Efficient Agentic Model for Computer Use](https://arxiv.org/abs/2511.19663) | arXiv | 2025-11-24 제출, 2026-05-29 접근 | FaraGen, 작업 궤적, WebTailBench, 공개 가중치 설명 |
| [microsoft/Fara-7B](https://huggingface.co/microsoft/Fara-7B) | Hugging Face / Microsoft | 2025-11-24 릴리스, 2026-05-29 접근 | Fara-7B 모델 카드, MIT 라이선스, 안전 고려, 사용 제약 |
| [Fara1.5 - Microsoft Foundry Labs](https://labs.ai.azure.com/projects/fara1-5/) | Microsoft Foundry Labs | 2026-05-29 접근 | Fara1.5 실험 소개, Foundry 연결, 시각 자료 링크 |
| [Fara-7B - Microsoft Foundry Labs](https://labs.ai.azure.com/projects/fara-7b/) | Microsoft Foundry Labs | 2026-05-29 접근 | Fara-7B 연구 목적, 시각 자료, 벤치마크와 안전 설명 |

## 시각 자료와 출처

이 초안은 저작권이 불명확한 이미지를 로컬에 복사하지 않습니다. 대신 공식 페이지의 시각 자료를 링크형 시각 참고 자료로 사용합니다.

| 시각 자료 | Alt text | 출처와 권리 판단 |
|-----------|----------|------------------|
| [Fara1.5 observe-think-act loop Figure 2](https://www.microsoft.com/en-us/research/articles/fara1-5-computer-use-agent/) | Fara1.5가 스크린샷과 대화 이력을 관찰하고 생각한 뒤 원자적 행동을 내보내는 3단계 루프 다이어그램 | 소유자: Microsoft Research. 2026-05-29 접근. 공식 연구 글의 교육용 그림을 직접 복사하지 않고 원문 링크로 참조합니다. |
| [FaraGen1.5 synthetic data pipeline Figure 6](https://www.microsoft.com/en-us/research/articles/fara1-5-computer-use-agent/) | 환경, solver, verifier를 거쳐 Fara1.5 학습 궤적을 선별하는 FaraGen1.5 파이프라인 다이어그램 | 소유자: Microsoft Research. 2026-05-29 접근. 공식 연구 글의 그림을 링크형 참고 자료로 사용하며 로컬 바이너리를 저장하지 않습니다. |
| [Fara-7B WebVoyager cost/accuracy Figure 1](https://labs.ai.azure.com/projects/fara-7b/) | Fara-7B와 다른 컴퓨터 사용 에이전트의 WebVoyager 정확도와 비용을 비교한 차트 | 소유자: Microsoft Foundry Labs. 2026-05-29 접근. 원문 시각 자료를 복사하지 않고 출처 링크와 설명만 제공합니다. |

## 성능과 벤치마크를 읽는 법

2026-05-29 확인 기준 Microsoft Research 글은 Fara1.5-9B가 WebVoyager 86.6, Online-Mind2Web 63.4의 task success rate를 기록했다고 설명합니다. 같은 표에서 Fara-7B는 WebVoyager 73.5, Online-Mind2Web 34.1로 제시됩니다. Fara1.5-27B는 WebVoyager 88.6, Online-Mind2Web 72.0으로 보고됩니다.

이 숫자는 "모든 실제 업무에서 안전하게 자동화 가능"이라는 뜻이 아닙니다. 벤치마크는 정해진 평가 조건에서 모델이 작업을 완료했는지 보는 지표입니다. 실제 회사 업무에서는 로그인, 결제, 권한, 민감 정보, 사이트 변경, 프롬프트 인젝션, 감사 로그 같은 문제가 추가됩니다.

## 활용할 수 있는 곳

| 적합한 탐색 사례 | 이유 |
|------------------|------|
| 모니터링되는 브라우저 작업 연구 | Fara의 주요 설계 대상이 브라우저 기반 컴퓨터 사용 에이전트이기 때문 |
| 폼 작성과 비교 검색 프로토타입 | Fara1.5 자료가 폼 작성, 상품 비교, 예약 흐름 같은 사용 사례를 반복해서 언급 |
| 웹 에이전트 벤치마크 연구 | WebVoyager, Online-Mind2Web, WebTailBench 같은 평가 맥락이 공식 자료에 있음 |
| 에이전트 UI와 human-in-the-loop UX 연구 | Fara1.5-9B 모델 카탈로그가 MagenticLite, watch-mode, 즉시 중지, 샌드박스를 권장 |

## 안전하게 파일럿하는 방법

1. **샌드박스에서 시작**: Docker, VM, 격리 브라우저처럼 호스트 파일과 저장된 자격 증명에 접근하지 못하는 환경을 사용합니다.
2. **사람이 지켜보는 모드로 실행**: 모델 행동을 실시간으로 보고 즉시 멈출 수 있어야 합니다.
3. **허용 사이트를 제한**: allow-list나 block-list로 방문 가능한 사이트를 줄입니다.
4. **민감 정보 금지**: 비밀번호, 결제 정보, 개인 식별 정보, 고객 데이터는 모델 맥락에 넣지 않습니다.
5. **감사 로그 유지**: 클릭, 입력, 이동, 질문, 중단 지점을 나중에 검토할 수 있어야 합니다.
6. **성공 기준을 작게 잡기**: 운영 자동화가 아니라 연구, 프로토타입, 사용성 평가 수준에서 시작합니다.

## 적합하지 않은 경우

Fara 스타일 자동화는 다음 작업에 바로 쓰면 안 됩니다.

- 민감한 개인정보나 회사 기밀을 입력해야 하는 작업
- 결제, 구매, 송금, 예약 확정처럼 되돌리기 어려운 작업
- 법률, 의료, 금융 판단이나 조언
- 채용, 대출, 주거, 보험처럼 개인의 기회 배분에 영향을 주는 결정
- 사람이 보지 않는 무인 운영 자동화
- 로그인 세션, 저장된 쿠키, 로컬 파일, 환경 변수에 넓게 접근하는 브라우저 자동화

## 흔한 오해

1. **"Fara는 Microsoft Copilot의 또 다른 이름이다."** 아닙니다. Fara는 Microsoft Research의 컴퓨터 사용 에이전트 모델 연구이고, Copilot은 Microsoft의 여러 제품형 AI 경험을 포괄하는 더 넓은 이름입니다.
2. **"Fara는 모든 데스크톱 작업을 대신해도 된다."** 공식 자료의 중심은 브라우저 작업이며, 안전한 사용은 샌드박스와 human-in-the-loop 조건을 전제로 합니다.
3. **"벤치마크 점수가 높으면 바로 운영 자동화가 가능하다."** 벤치마크는 연구 지표입니다. 운영에는 권한, 감사, 안전, 책임, 사이트 변화 대응이 필요합니다.
4. **"작은 모델이면 안전하다."** 모델 크기와 안전성은 같은 말이 아닙니다. 작은 모델도 잘못된 클릭, 민감 정보 노출, 프롬프트 인젝션 위험을 가질 수 있습니다.

## 관련 용어

| 용어 | 이 글의 사용 방식 |
|------|-------------------|
| 컴퓨터 사용 에이전트 | 화면을 보고 행동을 선택하는 AI 에이전트 |
| 작업 궤적 | 목표 달성까지의 관찰, 생각, 행동 기록 |
| 검증기 | 생성된 작업 궤적이 맞는지 평가하는 구성요소 |
| 중요 지점 | 사용자 확인이 필요한 민감하거나 되돌리기 어려운 순간 |
| 연구 프리뷰 | 넓은 운영 제품이 아니라 연구와 실험 목적의 공개 상태 |

자세한 용어 정리는 [Microsoft Fara 용어집](../../glossary/microsoft-fara.md)을 참고하세요.

## 더 읽어볼 문서

- [Microsoft Research: Fara1.5](https://www.microsoft.com/en-us/research/articles/fara1-5-computer-use-agent/)
- [Microsoft Foundry: Fara1.5-9B](https://ai.azure.com/catalog/models/Fara1.5-9B)
- [GitHub: microsoft/fara](https://github.com/microsoft/fara)
- [arXiv: Fara-7B](https://arxiv.org/abs/2511.19663)
- [Hugging Face: microsoft/Fara-7B](https://huggingface.co/microsoft/Fara-7B)
- [Microsoft Foundry Labs: Fara1.5](https://labs.ai.azure.com/projects/fara1-5/)
- [Microsoft Foundry Labs: Fara-7B](https://labs.ai.azure.com/projects/fara-7b/)

## 언어 메모

모델명과 제품명은 번역하지 않습니다. "computer-use agent"는 이 글에서 "컴퓨터 사용 에이전트"로 씁니다. "trajectory"는 "작업 궤적", "verifier"는 "검증기", "critical point"는 "중요 지점", "research preview"는 "연구 프리뷰"로 통일합니다.

## 고급 메모

Fara1.5의 핵심은 단일 모델 성능만이 아니라 데이터 생성과 검증 체계입니다. Microsoft Research 글은 FaraGen1.5를 환경, solver, verifier로 구성된 합성 데이터 파이프라인으로 설명합니다. 특히 gated domain 문제를 실제 서비스에서 직접 실행하지 않고, 합성 환경인 FaraEnvs로 모사해 학습 데이터를 만드는 점이 중요합니다.

이 구조는 컴퓨터 사용 에이전트 연구에서 반복되는 문제를 보여 줍니다. 실제 웹은 계속 바뀌고, 로그인과 결제 같은 행동은 위험하며, 사람의 웹 사용 궤적은 비용이 높습니다. 그래서 Fara 계열은 "더 큰 모델"만이 아니라 "더 안전하고 검증 가능한 작업 궤적을 어떻게 만들 것인가"라는 데이터 문제와 함께 봐야 합니다.
