---
title: "OpenUI 빠른 시작"
aliases: ["openui-quickstart", "openui-getting-started"]
tags: [openui, quickstart, getting-started]
category: tool
language: ko
date_created: 2026-05-15
date_modified: 2026-05-15
source_count: 0
related: [introduction, overview, system-prompts]
status: active
---

# OpenUI 빠른 시작

> `npx @openuidev/cli@latest create` 명령 하나로 1분 안에 GenUI 채팅 앱을 실행합니다.

**공식 문서**: [https://www.openui.com/docs/openui-lang/quickstart](https://www.openui.com/docs/openui-lang/quickstart)

---

## 핵심 개념

- **CLI 스캐폴딩**: `@openuidev/cli`가 Next.js 기반 GenUI 앱 전체 구조를 자동 생성합니다.
- **즉시 실행 가능**: 생성된 앱에는 채팅 레이아웃, OpenAI 백엔드 라우트, 시스템 프롬프트가 포함됩니다.
- **OpenAI 호환**: OpenAI API뿐만 아니라 OpenRouter, Azure OpenAI 등 호환 서비스 모두 지원합니다.

---

## 사용 시나리오

| 적합한 경우 | 적합하지 않은 경우 |
|------------|-------------------|
| GenUI 프로토타입을 빠르게 만들 때 | 기존 Next.js 앱에 통합할 때 (수동 설치 권장) |
| OpenUI 기능을 처음 탐색할 때 | 커스텀 프레임워크 사용 시 |
| 데모 앱이 필요할 때 | 프로덕션 빌드 최적화가 이미 된 앱 |

---

## 빠른 시작

### 방법 1: CLI 스캐폴딩 (권장)

```bash
# 1. 앱 생성
npx @openuidev/cli@latest create --name genui-chat-app

# 2. 디렉토리 이동
cd genui-chat-app

# 3. API 키 설정
echo "OPENAI_API_KEY=sk-your-key-here" > .env

# 4. 개발 서버 실행
npm run dev
```

**결과**: `http://localhost:3000` 에서 즉시 실행 가능한 GenUI 채팅 앱이 열립니다.

### 방법 2: 패키지 직접 설치

기존 프로젝트에 OpenUI를 추가할 때:

```bash
npm install @openuidev/react-lang @openuidev/react-ui
```

---

## 생성된 앱 구조

CLI가 생성하는 Next.js 앱 기본 구조:

```
genui-chat-app/
├── src/
│   ├── app/
│   │   ├── api/chat/route.ts   # OpenAI 스트리밍 백엔드
│   │   └── page.tsx            # 채팅 UI 페이지
│   └── generated/
│       └── system-prompt.txt   # 자동 생성된 시스템 프롬프트
├── .env                        # API 키 (OPENAI_API_KEY)
└── package.json
```

> [!tip] 처음 시작할 때
> `.env` 파일의 `OPENAI_API_KEY`만 설정하면 바로 동작합니다. OpenRouter 사용 시 `OPENAI_BASE_URL`도 함께 설정하세요.

---

## 통합 & 연결

- **소개**: OpenUI 전체 개요 → [소개](introduction.md)
- **시스템 프롬프트 커스터마이징** → [시스템 프롬프트](system-prompts.md)
- **채팅 UI 심화** → [Chat SDK 소개](chat-introduction.md)
- **예제 앱 심화** → [[Vercel AI Chat 예제]]

---

## 주의사항 & 한계

> [!warning] 알려진 제약
> CLI 스캐폴딩은 Next.js 기반 앱만 생성합니다. 다른 프레임워크는 패키지를 직접 설치하고 수동으로 설정해야 합니다.

> [!note] 업데이트 이력
> `@openuidev/cli` 최신 버전을 사용하려면 항상 `npx @openuidev/cli@latest`를 사용하세요. (2026-05-15)

---

## 참고 링크

- [공식 문서: Quick Start](https://www.openui.com/docs/openui-lang/quickstart) (2026-05-15)
- [GitHub: openui-chat 예제](https://github.com/thesysdev/openui/tree/main/examples/openui-chat) (2026-05-15)
