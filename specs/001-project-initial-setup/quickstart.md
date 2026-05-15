# Quickstart: kami-tech-wiki

## 사전 준비

```bash
# Bun 설치 확인
bun --version   # 1.2.22

# 의존성 설치
bun install

# Slack 웹훅 설정
cp .env.example .env
# .env 파일에 SLACK_WEBHOOK_URL 값을 입력하세요
```

---

## 첫 번째 위키 페이지 만들기

1. **소스 추가**: 아티클, 논문, 노트를 `raw/articles/` 또는 `raw/papers/`에 저장합니다.

2. **LLM에게 인제스트 요청**:
   ```
   raw/articles/claude-3-5-sonnet.md 파일을 인제스트해줘.
   ```

3. **LLM이 자동으로 수행하는 작업**:
   - `wiki/ko/claude/` 아래에 요약 페이지 생성
   - `wiki/index.md` 업데이트
   - `wiki/log.md`에 작업 기록 추가
   - Slack 알림 전송

---

## 위키 구조

```
wiki/
├── index.md          ← 전체 카탈로그 (여기서 시작)
├── log.md            ← 작업 이력
├── ko/               ← 한국어
│   ├── claude/       ← AI 도구별 폴더
│   ├── chatgpt/
│   ├── gemini/
│   └── ...
├── en/               ← English
└── ja/               ← 日本語

raw/                  ← 원본 소스 (절대 수정 금지)
├── articles/
├── papers/
└── notes/
```

---

## 자주 사용하는 명령

| 목적 | 방법 |
|------|------|
| 소스 인제스트 | LLM에게 "raw/... 인제스트해줘" 요청 |
| 위키 검색 | `wiki/index.md` 조회 후 LLM에게 질문 |
| 위키 상태 점검 | LLM에게 "위키 린트해줘" 요청 |
| Slack 알림 테스트 | `SLACK_WEBHOOK_URL=... bun run .wiki/scripts/notify-slack.ts --operation ingest --pages "테스트" --summary "테스트 알림"` |
| 테스트 실행 | `bun test .wiki/scripts/` |

---

## 위키 페이지 템플릿

| 템플릿 | 용도 |
|--------|------|
| `.wiki/templates/tool-page.md` | AI 도구/서비스 개요 페이지 |
| `.wiki/templates/concept-page.md` | AI 개념 설명 페이지 |
| `.wiki/templates/source-summary.md` | 인제스트된 소스 요약 페이지 |
| `.wiki/templates/index-entry.md` | `wiki/index.md` 항목 추가 패턴 |
