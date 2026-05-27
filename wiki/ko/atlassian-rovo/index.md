---
title: "Atlassian Rovo란 무엇인가?"
aliases: ["Rovo", "아틀라시안 로보", "Rovo MCP", "Rovo Agents"]
tags: [atlassian, rovo, ai-agent, mcp, jira, confluence]
category: tool
tool: "Atlassian Rovo"
language: ko
date_created: 2026-05-28
date_modified: 2026-05-28
source_count: 6
related: ["Codex CLI", "Kiro MCP 가이드", "Spec-Driven Development (SDD)"]
status: draft
review_cycle: fast-changing
freshness_date: 2026-05-28
---

# Atlassian Rovo란 무엇인가?

> Atlassian Rovo는 Jira, Confluence, Compass와 연결된 업무 도구의 데이터를 바탕으로 검색, 채팅, AI 에이전트, 자동화 빌더를 제공하는 Atlassian Cloud용 AI 제품군입니다.

## 이 페이지의 대상 독자

이 페이지는 Jira나 Confluence를 쓰는 팀에서 Rovo 도입을 검토하는 PM, 운영 담당자, 창업자, 초급 개발자를 위한 초안입니다. 2026-05-28 기준 공개된 Atlassian 공식 문서를 바탕으로 작성했습니다.

## 왜 중요한가

Rovo는 단순한 챗봇이 아니라 Atlassian 업무 시스템 위에 얹히는 AI 계층입니다. 검색은 Jira 이슈와 Confluence 문서, 연결된 외부 앱의 정보를 함께 찾고, Chat은 그 정보를 바탕으로 질문에 답하며, Agents와 Studio는 반복 업무를 자동화하는 방향으로 확장됩니다.

Atlassian을 이미 업무 허브로 쓰는 팀이라면 Rovo는 "AI를 따로 도입할 것인가"보다 "기존 Jira/Confluence 맥락 안에서 AI를 어디까지 허용할 것인가"에 가까운 의사결정이 됩니다.

## 쉽게 이해하는 설명

Rovo를 회사 안의 안내 데스크로 비유할 수 있습니다. 안내 데스크 직원은 각 팀의 문서함, 업무 요청함, 프로젝트 목록을 볼 수 있지만, 본인이 볼 권한이 없는 문서는 열람하지 못합니다. 사용자가 "이번 릴리스 위험 요소를 정리해줘"라고 묻는다면, Rovo는 접근 가능한 Jira 이슈와 Confluence 문서를 찾아 요약하고 다음 행동을 제안하는 식으로 동작합니다.

2026-05-28 기준 Rovo는 크게 다섯 축으로 이해하면 쉽습니다.

- **Rovo Search**: Atlassian 앱과 연결된 서드파티 앱을 함께 검색합니다.
- **Rovo Chat**: 업무 맥락을 바탕으로 질문 답변, 아이디어 생성, 피드백, 문제 해결을 돕습니다.
- **Rovo Agents**: 특정 목적과 지식을 가진 AI 팀원입니다.
- **Rovo Studio**: 에이전트, 자동화, 앱을 만드는 빌더 공간입니다.
- **Atlassian Rovo MCP Server**: ChatGPT, Claude, VS Code, Cursor 같은 MCP 호환 클라이언트가 Jira, Confluence, Compass 데이터와 상호작용하도록 연결하는 클라우드 브리지입니다.

## 핵심 개념

### Rovo Search

Rovo Search는 Jira, Confluence 같은 Atlassian 앱과 Google Drive, Slack 등 연결된 외부 앱의 결과를 함께 찾는 검색 기능입니다. Atlassian은 Rovo Search가 기존 사용자 권한을 존중하므로 사용자가 이미 접근 가능한 콘텐츠만 볼 수 있다고 설명합니다.

### Rovo Chat

Rovo Chat은 Atlassian 앱 안에서 사용하는 AI 대화 인터페이스입니다. 질문에 답하고, 초안을 만들고, 피드백을 주고, Jira나 Confluence 작업과 연결된 행동을 돕는 용도입니다. Atlassian 문서 기준으로 Jira, Jira Service Management, Jira Product Discovery, Confluence 및 브라우저 확장에서 접근할 수 있습니다.

### Rovo Agents

Rovo Agents는 특정 역할을 맡는 AI 에이전트입니다. 예를 들어 백로그 정리 에이전트, 온보딩 Q&A 에이전트, 릴리스 리스크 점검 에이전트처럼 이름, 목표, 지식, 행동 방식을 정해 둘 수 있습니다. Studio에서 만든 에이전트는 Chat, 자동화 흐름, Jira/Confluence 편집 화면 등에서 사용될 수 있습니다.

### Rovo Studio

Rovo Studio는 Atlassian 안에서 에이전트, 자동화, 앱을 만들고 관리하는 빌더 공간입니다. 에이전트의 정체성, 지시사항, 지식 소스, 스킬, 노출 위치를 설정하는 곳으로 보면 됩니다.

### Atlassian Rovo MCP Server

MCP(Model Context Protocol)는 AI 클라이언트가 외부 도구와 데이터를 연결하기 위한 프로토콜입니다. Atlassian Rovo MCP Server는 MCP 호환 클라이언트가 Atlassian Cloud의 Jira, Confluence, Compass와 연결되도록 돕는 서버입니다. Atlassian 문서 기준 권장 엔드포인트는 `https://mcp.atlassian.com/v1/mcp/authv2`이며, 기존 SSE 엔드포인트는 2026-06-30 이후 지원되지 않을 예정입니다.

## 사용 시나리오

| 적합한 경우 | 적합하지 않은 경우 |
|------------|-------------------|
| Jira/Confluence에 업무 지식이 많이 쌓여 있고 검색·요약 비용이 큰 팀 | Atlassian Cloud를 거의 쓰지 않는 팀 |
| 릴리스 노트, 회의록, 이슈 정리, 온보딩 Q&A처럼 반복 지식 업무가 많은 팀 | 권한 모델이 정리되지 않아 AI가 접근할 데이터 범위를 통제하기 어려운 팀 |
| ChatGPT, Claude, IDE 같은 외부 AI 클라이언트에서 Jira/Confluence 맥락을 쓰고 싶은 팀 | Rovo를 범용 백엔드 LLM API로 호출하려는 경우 |
| Forge 앱이나 Atlassian 자동화로 업무 흐름을 확장하려는 팀 | 온프레미스 Data Center만으로 모든 AI 기능을 완결해야 하는 조직 |

## 빠른 시작 관점

코드 한 줄로 시작하는 도구라기보다, 관리자가 먼저 Atlassian Cloud와 AI 사용 정책을 확인해야 하는 제품입니다.

```text
1. Atlassian Cloud Standard, Premium, Enterprise 환경인지 확인한다.
2. 조직의 AI 기능 활성화 정책과 Rovo 접근 권한을 확인한다.
3. Jira/Confluence의 프로젝트·스페이스 권한을 정리한다.
4. Rovo Search와 Chat으로 검색·요약 파일럿을 시작한다.
5. 반복 업무가 보이면 Rovo Studio에서 전용 Agent를 만든다.
6. 외부 AI 클라이언트 연동이 필요하면 Rovo MCP Server 설정을 검토한다.
```

**기대 동작**: 팀은 Rovo를 먼저 "권한을 지키는 업무 검색·요약 계층"으로 시험하고, 이후 에이전트나 MCP 연결로 확장할 수 있습니다.

## MCP/API와 서버 활용 가능 케이스

Rovo의 "API"를 이야기할 때는 세 가지를 구분해야 합니다.

| 구분 | 무엇인가 | 서버 활용 관점 |
|------|----------|----------------|
| Atlassian Rovo MCP Server | MCP 호환 AI 클라이언트가 Jira, Confluence, Compass를 다루도록 하는 Atlassian의 클라우드 MCP 서버 | 서버가 직접 Rovo를 호출한다기보다, AI 클라이언트가 OAuth 2.1 또는 허용된 API 토큰 흐름으로 Atlassian 데이터에 접근 |
| Forge Rovo Agent | Forge 앱 매니페스트의 `rovo:agent` 모듈로 정의하는 Atlassian 앱 기반 에이전트 | Forge 함수와 액션을 통해 Jira/Confluence 안의 커스텀 업무 로직을 실행 |
| Atlassian REST API | Jira, Confluence, Compass의 기존 API | 백엔드 서버가 안정적으로 데이터 생성·수정·조회 작업을 수행할 때 기본 선택지 |

### 가능 케이스 1: 릴리스 준비 요약 서버

1. 사내 서버가 Jira REST API로 특정 버전의 이슈 목록을 가져옵니다.
2. 서버가 위험 이슈, 미완료 이슈, 문서 링크를 정리합니다.
3. Rovo MCP Server를 연결한 AI 클라이언트나 Rovo Agent가 Confluence 릴리스 페이지를 찾아 요약을 보강합니다.
4. 최종 결과를 Confluence 페이지 초안이나 Jira 코멘트로 남깁니다.

이 구조에서 서버는 데이터 수집과 정규화, 권한 있는 쓰기 작업을 맡고, Rovo는 Atlassian 지식 맥락을 찾고 정리하는 역할을 맡습니다.

### 가능 케이스 2: 고객 피드백 라우팅

1. 외부 고객 피드백 시스템에서 들어온 요청을 서버가 수집합니다.
2. 서버가 Jira REST API로 관련 프로젝트와 컴포넌트를 찾습니다.
3. Rovo Agent가 Confluence의 제품 정책, 릴리스 계획, 기존 이슈를 참고해 분류와 우선순위 후보를 제안합니다.
4. 사람이 승인하면 서버가 Jira 이슈를 생성하거나 기존 이슈에 링크합니다.

### 가능 케이스 3: 개발자 IDE에서 Atlassian 맥락 사용

개발자는 VS Code, Cursor, Claude, ChatGPT 같은 MCP 호환 도구에서 Atlassian Rovo MCP Server를 연결해 "이 저장소의 `api-gateway`와 관련된 Compass 컴포넌트와 미해결 Jira 이슈를 찾아줘"처럼 질의할 수 있습니다. 이때 Atlassian 문서는 Node.js 18 이상과 `mcp-remote` 프록시가 필요한 로컬 클라이언트 구성을 설명합니다.

## 통합 & 연결

- **Jira**: 이슈 검색, 생성, 업데이트, 백로그 정리, 자동화 트리거와 연결됩니다.
- **Confluence**: 페이지 요약, 초안 생성, 문서 탐색, 지식 기반 Q&A에 사용됩니다.
- **Compass**: 서비스 컴포넌트 생성, 의존성 질의, 컴포넌트 문서 탐색에 연결될 수 있습니다.
- **Forge**: `rovo:agent` 모듈과 액션을 통해 앱 기반 Rovo Agent를 만들 수 있습니다.
- **MCP 클라이언트**: ChatGPT, Claude, VS Code, Cursor 같은 MCP 호환 도구가 Atlassian Rovo MCP Server를 통해 Atlassian 데이터와 연결될 수 있습니다.

## 주의사항 & 한계

1. **권한 설계가 먼저입니다.** Rovo와 MCP Server는 기존 접근 권한을 존중하도록 설계되어 있지만, 권한 구조가 부정확하면 AI 활용 범위도 부정확해집니다.
2. **Rovo는 범용 백엔드 LLM API가 아닙니다.** 2026-05-28 기준 공식 문서에서 확인되는 개발자 표면은 Forge Rovo Agent, Forge bridge Rovo API, Rovo MCP Server, 기존 Atlassian REST API의 조합에 가깝습니다.
3. **MCP Server 설정은 관리자 통제가 필요합니다.** OAuth 2.1, API 토큰 허용 여부, 도메인 허용, IP allowlist, 감사 로그를 확인해야 합니다.
4. **기능 제공 범위는 플랜과 클라우드 환경에 의존합니다.** Atlassian은 Rovo의 AI 기능을 온전히 활용하려면 Atlassian Cloud Standard, Premium, Enterprise 플랜이 필요하다고 설명합니다.
5. **제품 변화가 빠릅니다.** MCP 엔드포인트 변경처럼 실제 설정값이 바뀔 수 있으므로, 운영 전 공식 문서를 다시 확인해야 합니다.

## 흔한 오해

1. **"Rovo는 Jira용 ChatGPT다."** — 일부는 맞지만 불완전합니다. Rovo는 Search, Chat, Agents, Studio, MCP Server까지 포함하는 Atlassian 업무 맥락용 AI 계층입니다.
2. **"Rovo Agent는 아무 데이터나 볼 수 있다."** — 공식 문서 기준 Rovo는 사용자의 기존 접근 권한을 존중합니다. Forge 앱 기반 에이전트는 앱이 설치된 워크스페이스와 앱 호환성 설정에도 영향을 받습니다.
3. **"서버에서 Rovo API를 직접 호출하면 된다."** — 공개 문서만 보면 일반적인 서버-대-Rovo 대화 API보다는 Forge, MCP, Atlassian REST API 조합으로 설계하는 편이 안전합니다.
4. **"MCP를 켜면 모든 외부 도구가 자동으로 안전해진다."** — MCP는 연결 방식일 뿐입니다. OAuth, 토큰 정책, 도메인 허용, IP allowlist, 감사 로그 설정이 함께 필요합니다.

## 관련 용어

| 용어 | 뜻 |
|------|----|
| MCP | AI 클라이언트가 외부 도구·데이터와 연결하기 위한 프로토콜 |
| OAuth 2.1 | 사용자가 브라우저 기반 승인 흐름으로 외부 클라이언트 접근을 허용하는 인증 방식 |
| Forge | Atlassian Cloud 앱과 확장을 만드는 개발 플랫폼 |
| Rovo Agent | 목적, 지식, 행동을 설정할 수 있는 Atlassian AI 에이전트 |
| Studio | Rovo Agent, 자동화, 앱을 만들고 관리하는 Atlassian 빌더 공간 |

## 실무 도입 체크리스트

- Jira/Confluence 스페이스와 프로젝트 권한이 최신인지 확인한다.
- Rovo를 처음에는 읽기 중심 검색·요약 파일럿으로 제한한다.
- 고객 데이터, 보안 이슈, HR 문서처럼 민감한 영역은 별도 권한과 감사 정책을 둔다.
- MCP Server를 연결할 클라이언트 목록과 허용 도메인을 관리자 정책으로 관리한다.
- 백엔드 자동화는 Atlassian REST API와 Forge 액션을 기본으로 설계하고, Rovo는 지식 검색·요약·제안 역할로 시작한다.

## 참고 자료

- [What is Rovo?](https://support.atlassian.com/rovo/docs/what-is-rovo/) — Rovo Search, Chat, Agents, Studio 개요. 2026-05-28 확인.
- [Getting started with the Atlassian Rovo MCP Server](https://support.atlassian.com/atlassian-rovo-mcp-server/docs/getting-started-with-the-atlassian-remote-mcp-server/) — MCP Server 엔드포인트, OAuth/API token, 보안, 예시 워크플로우. 2026-05-28 확인.
- [What is Rovo Studio?](https://support.atlassian.com/studio/docs/what-is-rovo-studio/) — Studio와 에이전트 빌더 설명. 2026-05-28 확인.
- [What are agents?](https://support.atlassian.com/studio/docs/what-are-agents/) — Rovo Agents의 구성 요소와 사용 사례. 2026-05-28 확인.
- [Rovo Agent module for Forge](https://developer.atlassian.com/platform/forge/manifest-reference/modules/rovo-agent/) — Forge `rovo:agent` 매니페스트와 액션 개요. 2026-05-28 확인.
- [Extend what Rovo can do across your stack with MCP](https://www.atlassian.com/blog/announcements/rovo-mcp-gallery) — MCP 기반 Rovo 에이전트와 서드파티 앱 연결 사례. 2026-05-28 확인.
