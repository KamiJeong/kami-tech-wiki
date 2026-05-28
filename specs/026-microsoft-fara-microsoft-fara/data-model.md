# Data Model: Microsoft Fara Overview

## Entity: WikiArticle

Represents a reader-facing Markdown page created during implementation.

**Fields**:
- `path`: Required. One of `wiki/ko/microsoft-fara/README.md` or `wiki/ko/microsoft-fara/index.md`.
- `title`: Required frontmatter title.
- `language`: Required. Must be `ko`.
- `category`: Required. Must be `tool`.
- `tags`: Required list.
- `date_created`: Required `YYYY-MM-DD`.
- `date_modified`: Required `YYYY-MM-DD`.
- `source_count`: Required. Must be `0`.
- `status`: Required. `draft` or `active`.
- `review_cycle`: Required. Must be `fast-changing`.
- `sections`: Ordered article sections following the Korean tool-page style.
- `web_sources`: List of `SourceReference` entries cited in the body.
- `visuals`: List of `VisualReference` entries used or linked in the body.

**Validation rules**:
- `source_count` must remain `0` unless implementation introduces `raw/` inputs, which this feature forbids.
- All fast-changing claims must link to a `SourceReference`.
- The article must not contain process notes from the spec or plan.

## Entity: SourceReference

Represents a current official source checked during implementation.

**Fields**:
- `title`: Source title as shown by the source.
- `owner`: Source owner, such as Microsoft Research, Microsoft, GitHub repository owner, arXiv, Microsoft Foundry, or Hugging Face.
- `url`: External URL.
- `source_type`: `microsoft_research`, `microsoft_official`, `github`, `arxiv`, `foundry`, `hugging_face`, or `other_official`.
- `publication_date`: Source publication or release date when available.
- `access_date`: Date checked during implementation.
- `claim_roles`: Claims this source supports, such as identity, model family, availability, benchmark, safety, usage constraints, or visual provenance.

**Validation rules**:
- Official sources must be checked live on the implementation date.
- Secondary commentary may supplement context only after official source coverage is present.

## Entity: VisualReference

Represents an embedded image, locally captured screenshot, original diagram, or linked visual reference.

**Fields**:
- `usage_type`: `embedded_remote`, `linked_reference`, `local_screenshot`, or `original_diagram`.
- `alt_text`: Required.
- `caption`: Required.
- `owner`: Required source owner or `wiki-original`.
- `url_or_path`: Required URL or repository-relative path.
- `access_or_created_date`: Required date.
- `rights_decision`: Required explanation of why the visual may be embedded, linked, or stored.

**Validation rules**:
- At least two `VisualReference` entries are required.
- Copied binary files require defensible license or owner terms.
- Local files must be placed under `wiki/ko/microsoft-fara/assets/`.

## Entity: NavigationUpdate

Represents required wiki discoverability changes.

**Fields**:
- `path`: `wiki/index.md` or `wiki/ko/SUMMARY.md`.
- `entry_label`: Human-readable Microsoft Fara label.
- `target`: Relative link target.
- `placement_rationale`: Why the entry belongs in that section.

**Validation rules**:
- Links must resolve after implementation.
- Navigation updates must not expose broken article paths.

## Entity: GlossaryEntry

Represents a governed terminology record for Microsoft Fara terms introduced by the article.

**Fields**:
- `path`: Required. `wiki/glossary/microsoft-fara.md`.
- `preferred_term`: Required term used in article prose.
- `alternatives`: Alternative labels or abbreviations such as CUA or SLM.
- `korean_rendering`: Required Korean rendering.
- `english_term`: Required English term.
- `japanese_equivalent`: Required Japanese equivalent or an explicit pending marker.
- `definition`: Plain-language definition.
- `usage_note`: Guidance for first mention and repeated mention.
- `related_article`: Internal related article link when available.

**Validation rules**:
- Article terminology must match the glossary entry.
- Missing Japanese or English equivalents must be explicitly marked as pending review, not silently omitted.
- The glossary record does not make the article multilingual-complete by itself.

## Entity: WikiLogEntry

Represents the append-only log entry required after wiki updates.

**Fields**:
- `timestamp`: `YYYY-MM-DD HH:MM` in the local project timezone.
- `operation`: Expected `ingest` or `update`, consistent with existing log style.
- `title`: Microsoft Fara page title.
- `summary`: Short implementation summary.

**Validation rules**:
- Must append to `wiki/log.md`.
- Must not rewrite existing log entries.

## Entity: SlackNotification

Represents the post-update notification behavior.

**Fields**:
- `enabled`: True only when `SLACK_WEBHOOK_URL` is present in the environment.
- `operation`: Expected `ingest` for a new wiki topic unless implementation chooses an existing log-compatible update operation.
- `pages`: Comma-separated page names.
- `summary`: Short update summary.

**Validation rules**:
- Do not hardcode `SLACK_WEBHOOK_URL`.
- If the environment variable is absent, skip sending rather than failing the implementation.

## Entity: TermDecision

Represents terminology that must remain consistent in Korean.

**Fields**:
- `source_term`: English term or product/model name.
- `korean_rendering`: Preferred Korean rendering.
- `usage_note`: Short guidance for first mention and repeated mentions.

**Validation rules**:
- Preserve model and product names in English.
- Use the spec's translation choices for CUA, trajectory, verifier, critical point, and research preview.

## Entity: ReviewGateResult

Represents a quality gate result to be tracked during implementation or review.

**Fields**:
- `path`: Required. `specs/026-microsoft-fara-microsoft-fara/review-gates.md`.
- `gate`: One of readability, factual accuracy, source integrity, multilingual consistency, Markdown portability, terminology consistency, navigation, copying/plagiarism risk, template compliance, or learning goal.
- `status`: `pass`, `fail`, or `not_applicable`.
- `evidence`: File path, source list, or reviewer note.
- `notes`: Required when status is `not_applicable` or when the multilingual gate relies on the documented Principle IV override.

**Validation rules**:
- All ten Constitution Principle XII gates must appear exactly once.
- The multilingual consistency gate may be `not_applicable` only when it points to the documented Principle IV override and keeps article pages in `draft`.
- Human editorial review cannot be self-approved by the implementing AI agent.

## Entity: HumanReviewRecord

Represents editorial approval evidence when publication readiness or `active` status is requested.

**Fields**:
- `path`: `specs/026-microsoft-fara-microsoft-fara/review-report.md` or `specs/026-microsoft-fara-microsoft-fara/review-gates.md`.
- `reviewer_name`: Human reviewer name.
- `review_date`: `YYYY-MM-DD`.
- `decision`: `approved`, `changes_requested`, or `not_reviewed`.
- `scope`: Whether the reviewer approved Korean draft publication, the Principle IV override, or full multilingual parity.

**Validation rules**:
- AI agents must not populate `reviewer_name` with themselves.
- Without a human approval record, Microsoft Fara wiki pages remain `draft`.
