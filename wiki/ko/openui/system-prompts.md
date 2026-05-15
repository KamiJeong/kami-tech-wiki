---
title: "OpenUI 시스템 프롬프트"
aliases: ["openui-system-prompts", "openui-prompt-generation"]
tags: [openui, system-prompt, llm, prompt-engineering]
category: concept
language: ko
date_created: 2026-05-15
date_modified: 2026-05-15
source_count: 0
related: [overview, quickstart, specification-v05]
status: active
---

# OpenUI 시스템 프롬프트

> OpenUI는 컴포넌트 라이브러리로부터 LLM 시스템 프롬프트를 자동 생성하여, 모델이 허용된 컴포넌트만 사용하도록 출력을 제어합니다.

**공식 문서**: [https://www.openui.com/docs/openui-lang/system-prompts](https://www.openui.com/docs/openui-lang/system-prompts)

---

## 개요

OpenUI의 시스템 프롬프트는 수동으로 작성하지 않습니다. **컴포넌트 라이브러리 정의로부터 자동 생성**됩니다. 이를 통해:

1. 모델이 허용된 컴포넌트만 사용하도록 출력을 구속합니다.
2. 라이브러리가 변경되면 프롬프트도 자동으로 갱신됩니다.
3. 개발자가 프롬프트 유지보수를 따로 할 필요가 없습니다.

---

## 핵심 원리

### 자동 프롬프트 생성

`library.prompt()`를 호출하면 시스템 프롬프트가 자동 생성됩니다:

```ts
import { createLibrary, openuiLibrary } from "@openuidev/react-lang";

const library = createLibrary(openuiLibrary);
const systemPrompt = library.prompt();
// → 허용 컴포넌트 목록 + props + OpenUI Lang 구문 규칙이 포함된 프롬프트
```

### 두 가지 생성 방식

| 방식 | 사용 시점 | 도구 |
|------|----------|------|
| **동적 생성** | 서버사이드에서 요청마다 생성 | `@openuidev/lang-core`의 `generatePrompt` |
| **정적 생성** | 빌드 타임에 파일로 미리 생성 | `@openuidev/cli` |

### 서버리스/Edge 환경에서의 동적 생성

React 의존성 없이 Node/Edge/서버리스 환경에서 사용 가능합니다:

```ts
import { generatePrompt } from "@openuidev/lang-core";

const systemPrompt = generatePrompt(libraryDefinition);
```

### CLI를 이용한 정적 생성

```bash
npx @openuidev/cli generate-prompt --output src/generated/system-prompt.txt
```

생성된 파일을 백엔드에서 정적으로 불러와 사용합니다.

---

## 실제 적용 예시

```ts
// app/api/chat/route.ts (Next.js)
import { createLibrary, openuiChatLibrary } from "@openuidev/react-lang";

const library = createLibrary(openuiChatLibrary);

export async function POST(req: Request) {
  const { messages } = await req.json();

  const response = await openai.chat.completions.create({
    model: "gpt-4o",
    messages: [
      { role: "system", content: library.prompt() }, // ← 자동 생성된 프롬프트
      ...messages,
    ],
    stream: true,
  });

  return new Response(response.toReadableStream());
}
```

---

## 관련 개념 비교

| 구분 | OpenUI 자동 생성 프롬프트 | 수동 작성 프롬프트 |
|------|--------------------------|------------------|
| 유지보수 | 라이브러리 변경 시 자동 반영 | 수동 업데이트 필요 |
| 일관성 | 코드와 항상 동기화 | 불일치 위험 |
| 토큰 효율 | 최적화됨 | 작성자에 따라 다름 |
| 커스터마이징 | 제한적 | 완전 자유 |

---

## 연결된 도구 & 구현

- [[OpenUI 개요]] — Prompt Generator 단계 상세 설명
- [명세 v0.5](specification-v05.md) — OpenUI Lang 구문 명세 (프롬프트 내 포함되는 규칙)
- [빠른 시작](quickstart.md) — 실제 사용 예제

---

## 참고 링크

- [공식 문서: System Prompts](https://www.openui.com/docs/openui-lang/system-prompts) (2026-05-15)
- [GitHub: thesysdev/openui](https://github.com/thesysdev/openui) (2026-05-15)
