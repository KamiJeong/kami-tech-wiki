---
title: "OpenUI Lang 명세 v0.5"
aliases: ["openui-spec", "openui-lang-spec", "openui-specification"]
tags: [openui, openui-lang, spec, specification, v0.5]
category: reference
language: ko
date_created: 2026-05-15
date_modified: 2026-05-15
source_count: 0
related: [overview, architecture, system-prompts]
status: active
---

# OpenUI Lang 명세 v0.5

> OpenUI Lang의 최신 공식 언어 명세. 반응형 상태(State), 데이터 페칭(Data), 액션(Actions)을 포함합니다.

**공식 문서**: [https://www.openui.com/docs/openui-lang/specification-v05](https://www.openui.com/docs/openui-lang/specification-v05)
**공식 명세 미러**: [https://openuispec.org/spec](https://openuispec.org/spec)

---

## 개요

OpenUI Lang v0.5는 v0.1을 확장하여 **인터랙티브 데이터 기반 앱**을 위한 기능을 추가합니다. v0.1이 정적 UI 생성에 초점을 맞췄다면, v0.5는 반응형 상태와 서버 데이터 연동을 지원합니다.

---

## 기본 문법

### 할당 명령문

모든 명령문은 `identifier = Expression` 형태의 단일 할당입니다.

```
# 기본 컴포넌트 할당
title = Text("Hello, World!", "h1")
container = Stack([title, content], "column", "m")
```

### 위치 기반 인수

컴포넌트의 props는 Zod 스키마 키 순서에 따라 위치 인수로 전달됩니다.

```
# Stack(children, direction, gap) — Zod 스키마 순서
stack = Stack([child1, child2], "row", "l")

# Input(label, type, required)
email = Input("이메일", "email", true)
```

---

## 핵심 원리

### State (반응형 상태)

`$variable` 접두사로 반응형 상태 변수를 선언합니다.

```
$selectedCategory = "전체"
$searchQuery = ""

# 상태 변수는 컴포넌트에 직접 사용 가능
filter = Select($selectedCategory, ["전체", "기술", "비즈니스"])
search = Input($searchQuery, "search")
```

상태 값이 변경되면 연결된 쿼리가 **자동으로 재실행**됩니다.

### Data (데이터 페칭)

쿼리(Query)와 뮤테이션(Mutation)으로 서버 데이터를 연동합니다.

**쿼리 (읽기)**:
```
# 카테고리와 검색어로 필터링되는 쿼리
posts = @Query("getPosts", { category: $selectedCategory, q: $searchQuery })
postList = List(posts.data, PostCard)
```

**뮤테이션 (쓰기)**:
```
# Action 내부의 @Run(mutation)이 트리거될 때만 실행
createPost = @Mutation("createPost")
```

뮤테이션의 특성:
- 로드 시 자동 실행되지 않음
- `@Run(mutation)` 트리거 시에만 실행
- 실패 시 나머지 Action 단계는 생략됨

### Actions (액션)

사용자 이벤트에 반응하는 동작 시퀀스입니다.

```
submitAction = @Action([
  @Set($isLoading, true),
  @Run(createPost, { title: $title, content: $content }),
  @Set($isLoading, false),
  @Navigate("/posts"),
])

submitButton = Button("게시하기", submitAction, $isLoading)
```

---

## 실제 적용 예시

반응형 검색 인터페이스 예시:

```
# 상태 선언
$query = ""
$results = []

# UI 구성
searchBox = Input($query, "search", false)
resultList = List(@Query("search", { q: $query }).data, ResultCard)

# $query가 변경될 때마다 search 쿼리 자동 재실행
layout = Stack([searchBox, resultList], "column", "l")
```

---

## v0.1 → v0.5 주요 변경사항

| 기능 | v0.1 | v0.5 |
|------|------|------|
| 상태 관리 | 없음 | `$variable` 반응형 상태 |
| 데이터 페칭 | 없음 | `@Query`, `@Mutation` |
| 이벤트 처리 | 없음 | `@Action`, `@Run`, `@Set`, `@Navigate` |
| UI 인터랙티비티 | 정적 | 완전 인터랙티브 |

---

## 연결된 도구 & 구현

- [[OpenUI 개요]] — 명세를 사용하는 파이프라인
- [[OpenUI 아키텍처]] — Parser가 이 명세를 파싱하는 방법
- [시스템 프롬프트](system-prompts.md) — 명세 내용이 프롬프트에 포함되는 방식

---

## 참고 링크

- [공식 문서: v0.5 Specification](https://www.openui.com/docs/openui-lang/specification-v05) (2026-05-15)
- [공식 명세 미러: openuispec.org](https://openuispec.org/spec) (2026-05-15)
- [GitHub: thesysdev/openui](https://github.com/thesysdev/openui) (2026-05-15)
