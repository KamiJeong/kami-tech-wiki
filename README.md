# kami-tech-wiki

개인 기술 지식 베이스(Tech Wiki)입니다. LLM이 위키 전체를 작성·유지하고, 사용자는 소스를 큐레이션하고 질문하는 역할을 담당합니다.

## 이 프로젝트는 무엇인가요?

[Karpathy의 LLM 위키 패턴](https://github.com/karpathy)에서 영감을 받은 개인 지식 베이스입니다. RAG처럼 매 쿼리마다 지식을 재발견하는 방식이 아니라, LLM이 **점진적으로 구축하고 유지하는 영속적인 위키**입니다.

| 레이어 | 역할 |
|--------|------|
| `raw/` | 원본 소스 문서 (불변, LLM이 읽기만 함) |
| `wiki/` | LLM이 작성·관리하는 마크다운 위키 (KO/EN/JA) |
| `CLAUDE.md` | LLM 동작 스키마 — 위키 구조, 규칙, 워크플로우 정의 |

## 위키 구조

```
wiki/
├── index.md          # 전체 위키 카탈로그 (매 인제스트 시 업데이트)
├── log.md            # 작업 이력 (append-only)
├── ko/               # 한국어 위키
│   ├── chatgpt/
│   ├── claude/
│   ├── gemini/
│   ├── open-ui/
│   ├── graphify/
│   └── ...           # 도구/서비스 추가 시 확장
├── en/               # English wiki
│   ├── chatgpt/
│   ├── claude/
│   └── ...
└── ja/               # 日本語ウィキ
    ├── chatgpt/
    ├── claude/
    └── ...

raw/                  # 원본 소스 (아티클, 논문, 노트 등)
```

## 주요 운영 방식

**인제스트(Ingest)**: 새 소스를 `raw/`에 추가하고 LLM에게 처리를 요청합니다. LLM은 소스를 읽고, 요점을 정리하여 위키 페이지를 생성하고, 관련 페이지를 업데이트하며, `log.md`에 기록합니다.

**쿼리(Query)**: 위키를 기반으로 질문합니다. LLM은 `index.md`를 먼저 읽고 관련 페이지를 찾아 답변합니다. 유용한 답변은 새 위키 페이지로 저장됩니다.

**린트(Lint)**: 주기적으로 위키 상태를 점검합니다. 모순, 오래된 주장, 고아 페이지, 누락된 교차 참조를 찾아 개선합니다.

## 알림 설정

위키 인제스트 또는 주요 업데이트 완료 시 **Slack 메시지**가 자동으로 전송됩니다.

## Spec Kit 워크플로우

이 프로젝트는 [Spec Kit](https://github.com/github/spec-kit) + Claude Code로 관리됩니다.

```
/speckit-specify   →   spec.md   (무엇을 만들 것인가)
/speckit-clarify   →   spec.md   (모호한 부분 해소)
/speckit-plan      →   plan.md   (어떻게 만들 것인가)
/speckit-tasks     →   tasks.md  (세부 작업 목록)
/speckit-implement →   code      (태스크 실행)
```

### 자동 품질 게이트 (`extensions.yml`)

| 게이트 | 실행 시점 |
|--------|-----------|
| `speckit.git.feature` | specify 전 — 기능 브랜치 생성 |
| `speckit.version-guard.check` | plan 전 — 기술 스택 버전 고정 |
| `speckit.token-analyzer.baseline` | specify/plan/tasks/implement 후 — 토큰 사용량 추적 (필수) |
| `speckit.docguard.guard` | implement 후 — 문서 동기화 검증 |
| `speckit.verify.run` | implement 후 — 스펙 요구사항 검증 |

## 프로젝트 메타데이터

| 설정 | 값 |
|------|----|
| Spec Kit 버전 | `0.8.10.dev0` |
| AI 통합 | Claude |
| 브랜치 넘버링 | Sequential |
| 컨텍스트 파일 | `CLAUDE.md` |
| 언어 | 한국어(KO) / English(EN) / 日本語(JA) |
