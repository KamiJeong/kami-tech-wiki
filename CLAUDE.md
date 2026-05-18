<!-- SPECKIT START -->
For additional context about technologies to be used, project structure,
shell commands, and other important information, read the current plan:
specs/009-sdd-wiki-spec-kit/plan.md
<!-- SPECKIT END -->

# kami-tech-wiki — LLM 동작 스키마

이 파일은 LLM(Claude Code)이 이 위키를 유지할 때 따라야 할 모든 규칙을 정의합니다.
상세 계약은 `specs/001-project-initial-setup/contracts/wiki-schema.md`를 참조하세요.

---

## 역할 분담

| 담당 | 작업 |
|------|------|
| **사용자** | `raw/`에 소스 추가, 인제스트 지시, 질문, 방향 결정 |
| **LLM** | `wiki/` 전체 관리, `wiki/index.md` 및 `wiki/log.md` 업데이트, Slack 알림 전송 |

---

## 핵심 규칙

1. **`raw/` 디렉토리의 파일은 절대 수정하지 않는다.** 읽기만 가능.
2. **`wiki/` 아래의 모든 파일은 LLM이 작성하고 관리한다.** 사용자는 검토만 한다.
3. **모든 작업 후 `wiki/log.md`에 기록을 추가한다.** 형식: `## [YYYY-MM-DD HH:MM] {operation} | {title}`
4. **인제스트/업데이트 완료 후 Slack 알림을 전송한다.**
   ```bash
   SLACK_WEBHOOK_URL="..." bun run .wiki/scripts/notify-slack.ts \
     --operation ingest \
     --pages "페이지1, 페이지2" \
     --summary "요약"
   ```
5. **보안**: `SLACK_WEBHOOK_URL`은 환경 변수로만 사용. 코드에 하드코딩 금지.
6. **언어 기본값**: 별도 지시 없으면 한국어(`wiki/ko/`)에 먼저 작성한다.
7. **Git 커밋**: 커밋 메시지에 `Co-Authored-By: Claude` 등 Claude 작성 표기를 포함하지 않는다.

---

## 위키 구조

```
wiki/
├── index.md              # 전체 카탈로그 — 인제스트마다 업데이트
├── log.md                # 작업 이력 — append-only
├── ko/<tool>/            # 한국어 위키, 도구별 폴더
├── en/<tool>/            # English wiki, same tool folders
└── ja/<tool>/            # 日本語ウィキ

raw/                      # 원본 소스 (불변)
.wiki/templates/          # 위키 페이지 템플릿
.wiki/scripts/            # 유틸리티 스크립트
```

---

## 페이지 템플릿 사용 기준

| 페이지 유형 | 사용할 템플릿 |
|------------|--------------|
| AI 도구 개요 (ChatGPT, Claude 등) | `.wiki/templates/tool-page.md` |
| AI 개념 (RAG, Prompt Engineering 등) | `.wiki/templates/concept-page.md` |
| 인제스트된 소스 요약 | `.wiki/templates/source-summary.md` |
| index.md 항목 추가 | `.wiki/templates/index-entry.md` 패턴 참조 |

---

## 프론트매터 필수 필드

```yaml
---
title: ""
tags: []
category: tool | concept | process | reference
language: ko | en | ja
date_created: YYYY-MM-DD
date_modified: YYYY-MM-DD
source_count: 0
status: draft | active | deprecated
---
```

`date_modified`는 페이지 내용이 변경될 때마다 업데이트한다.
`source_count`는 실제로 참조한 `raw/` 파일 수와 일치해야 한다.
