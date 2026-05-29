---
title: "Microsoft Fara 용어집"
tags: [microsoft, fara, glossary, ai-agent, computer-use-agent]
category: reference
language: ko
date_created: 2026-05-29
date_modified: 2026-05-29
source_count: 0
status: draft
review_cycle: fast-changing
---

# Microsoft Fara 용어집

이 용어집은 `wiki/ko/microsoft-fara/` 문서에서 사용하는 Microsoft Fara 관련 용어를 통일하기 위한 기록입니다. 영어와 일본어 등가 표현은 전체 번역본이 아직 없으므로 용어 검토용 기준으로만 둡니다.

| Preferred term | Korean rendering | English term | Japanese equivalent | Alternatives | Definition | Usage note |
|----------------|------------------|--------------|---------------------|--------------|------------|------------|
| Microsoft Fara | Microsoft Fara | Microsoft Fara | Microsoft Fara | Fara | Microsoft Research의 컴퓨터 사용 에이전트 모델 작업을 가리키는 이름 | 제품형 Copilot과 혼동하지 않도록 첫 언급에서 연구 모델 계열이라고 설명 |
| Fara-7B | Fara-7B | Fara-7B | Fara-7B | Fara 7B | 7B 규모의 공개 가중치 컴퓨터 사용 에이전트 모델 | 2025-11-24 공개 모델로 설명 |
| Fara1.5 | Fara1.5 | Fara1.5 | Fara1.5 | Fara 1.5 | Fara-7B 후속으로 소개된 4B, 9B, 27B 컴퓨터 사용 에이전트 모델 계열 | Fara1.5-9B의 현재 Foundry 등록 상태와 4B/27B 제공 예정 표현을 구분 |
| computer-use agent | 컴퓨터 사용 에이전트 | computer-use agent | コンピューター使用エージェント | CUA | 화면을 관찰하고 마우스, 키보드, 웹 도구 행동을 선택해 작업을 수행하는 에이전트 | 첫 언급에는 영어 약어 CUA를 병기 가능 |
| small language model | 작은 언어 모델 | small language model | 小規模言語モデル | SLM | 특정 목적에 맞게 상대적으로 작은 규모로 설계된 언어 모델 | "작다"가 안전하다는 뜻은 아니라고 설명 |
| FaraGen | FaraGen | FaraGen | FaraGen | FaraGen1.5 | 컴퓨터 사용 작업 궤적을 생성하고 검증하는 Microsoft Research의 합성 데이터 파이프라인 | 세부 구조는 고급 메모나 출처 섹션에서 짧게 설명 |
| FaraEnvs | FaraEnvs | FaraEnvs | FaraEnvs | synthetic environments | 로그인, 이메일, 일정, 마켓플레이스 같은 gated domain을 모사한 합성 환경 | 실제 서비스에서 위험 행동을 수행하지 않고 학습하는 맥락으로 설명 |
| WebTailBench | WebTailBench | WebTailBench | WebTailBench | long-tail web benchmark | 기존 웹 에이전트 벤치마크에 적게 포함된 긴 꼬리 웹 작업을 평가하기 위한 벤치마크 | 벤치마크 결과를 운영 안전성으로 과장하지 말 것 |
| trajectory | 작업 궤적 | trajectory | タスク軌跡 | action trace | 목표 수행 중 관찰, 생각, 행동이 이어진 단계 기록 | 첫 언급에서 "작업을 푸는 과정 기록"이라고 풀어쓰기 |
| verifier | 검증기 | verifier | 検証器 | evaluator | 생성된 작업 궤적이 맞는지 평가하고 학습 데이터로 쓸지 판단하는 구성요소 | FaraGen 설명에서 사용 |
| critical point | 중요 지점 | critical point | 重要地点 | approval checkpoint | 개인정보 입력, 결제, 제출, 메시지 전송처럼 사용자 확인이 필요한 순간 | 안전 설명과 pilot guidance에서 일관되게 사용 |
| MagenticLite | MagenticLite | MagenticLite | MagenticLite | Magentic-UI successor | Microsoft Research가 소개한 작은 모델 기반 agentic application 경험 | Fara1.5-9B 권장 실행 환경 맥락에서 언급 |
| Microsoft Foundry | Microsoft Foundry | Microsoft Foundry | Microsoft Foundry | Azure AI Foundry | Microsoft의 AI 모델 카탈로그와 배포 환경 | 모델 가용성 출처로 사용 |
| model card | 모델 카드 | model card | モデルカード | model documentation | 모델의 용도, 제한, 라이선스, 안전 정보를 담은 공개 문서 | 가용성과 사용 제약 확인 출처로 사용 |
| human-in-the-loop | human-in-the-loop | human-in-the-loop | human-in-the-loop | human supervision | 사람이 모델 행동을 확인하고 중단 또는 승인하는 운영 방식 | 한국어 본문에서는 "사람이 지켜보는", "사람 승인"으로 풀어쓰기 |
