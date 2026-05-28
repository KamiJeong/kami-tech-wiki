# Data Model: OpenUI Personalization Case Reference

## WikiArticle

Represents one language version of the reader-facing article.

**Fields**:
- `path`: Required. One of `wiki/ko/openui/personalization-case-reference.md`, `wiki/en/openui/personalization-case-reference.md`, `wiki/ja/openui/personalization-case-reference.md`.
- `language`: Required enum: `ko`, `en`, `ja`.
- `title`: Required localized title.
- `frontmatter`: Required metadata block.
- `sections`: Ordered list of `ArticleSection`.
- `status`: Required enum: `draft`, `active`, `deprecated`.
- `review_cycle`: Required value: `fast-changing`.

**Validation rules**:
- Must include all required frontmatter fields: `title`, `tags`, `category`, `language`, `date_created`, `date_modified`, `source_count`, `status`, and `review_cycle`.
- `source_count` must be `0` unless implementation later uses files from `raw/`.
- `status` must remain `draft` until all three language versions, review gates, and human review are complete.
- Internal links must be relative Markdown links.

## ArticleSection

Represents one required section in the case-reference adaptation of the standard article template.

**Fields**:
- `order`: Required integer.
- `heading`: Required localized heading.
- `template_role`: Required enum matching the 13-section structure.
- `required`: Boolean.
- `content_checks`: List of review checks for the section.

**Required section roles**:
1. Title
2. One-sentence summary
3. Who this page is for
4. Why this matters
5. Plain-language explanation
6. Key concepts
7. Example or analogy
8. Practical applications, adapted to include case matrix, feasibility findings, and recommendation
9. Common misconceptions
10. Related terms
11. Further reading
12. Language notes
13. Advanced notes, optional

**Validation rules**:
- The case matrix and feasibility findings are the documented case-reference adaptation of the standard practical applications layer.
- Common misconceptions must include the three misconceptions listed in the spec.

## CaseExample

Represents a selected site, product, demo, or case study.

**Fields**:
- `name`: Required.
- `url`: Required external URL.
- `short_description`: Required original summary.
- `personalization_pattern`: Required `PersonalizationPattern`.
- `evidence_status`: Required `EvidenceStatus`.
- `source_references`: Required list with at least one `SourceReference`.
- `access_date`: Required date for each source-backed observation.
- `practical_takeaway`: Required.
- `included_in_languages`: Required list: `ko`, `en`, `ja`.

**Validation rules**:
- A case may be described as using OpenUI only when `evidence_status` is `Verified OpenUI`.
- Comparable examples must include the phrase equivalent to "not verified as OpenUI" in every language version.
- Case rows must preserve the same classification across Korean, English, and Japanese.

## EvidenceStatus

Represents the claim strength for OpenUI adoption or relevance.

**Allowed values**:
- `Verified OpenUI`
- `Partially supported`
- `Unclear`
- `Not verified as OpenUI, comparable`
- `Excluded`

**Validation rules**:
- `Verified OpenUI` requires explicit reliable-source support.
- `Partially supported` must explain the supported claim and the missing proof.
- `Unclear` must not be used to imply adoption.
- `Excluded` cases do not appear in the final reader-facing case matrix.

## PersonalizationPattern

Represents the adaptive behavior being compared.

**Allowed examples**:
- `content_ranking`
- `recommendation`
- `layout_adaptation`
- `onboarding_variation`
- `task_flow_customization`
- `generated_ui`
- `chat_driven_ui`
- `contextual_dashboard`

**Validation rules**:
- Each selected case must have at least one pattern.
- Pattern names must be localized naturally in article text while preserving the same underlying meaning across languages.

## SourceReference

Represents a cited source and the claim it supports.

**Fields**:
- `title`: Required.
- `url`: Required.
- `source_owner`: Required when identifiable.
- `publication_date`: Optional when unavailable.
- `access_date`: Required.
- `claim_supported`: Required.
- `source_role`: Required enum: `official_openui`, `case_evidence`, `personalization_background`, `terminology`, `comparison`, `other`.

**Validation rules**:
- At least 12 verifiable sources are required across the article.
- Every case row must have at least one source reference.
- No paragraph-length source text may be copied.
- Fast-changing claims must include publication date or access date.

## FeasibilityFinding

Represents a decision-oriented takeaway for stakeholders.

**Fields**:
- `category`: Required enum: `confirmed_fact`, `reasonable_interpretation`, `assumption`, `open_question`.
- `statement`: Required original synthesis.
- `supporting_sources`: Required for facts and interpretations.
- `recommended_next_step`: Optional.

**Validation rules**:
- The article must distinguish all four categories.
- Recommendation must identify evidence gaps and next validation steps.

## TermDecision

Represents a terminology or translation decision.

**Fields**:
- `term`: Required.
- `ko`: Required Korean preferred wording or explanation.
- `en`: Required English preferred wording.
- `ja`: Required Japanese preferred wording or explanation.
- `notes`: Required when the translation is not direct.
- `glossary_action`: Required enum: `reuse`, `add`, `update`, `article_note_only`.

**Validation rules**:
- Required terms: OpenUI, generative UI, real-time personalization, adaptive screen, evidence status.
- Existing terms must be reused consistently when present.

## NavigationUpdate

Represents a required navigation edit.

**Fields**:
- `path`: Required.
- `entry_label`: Required localized label.
- `target`: Required relative link.
- `section`: Required navigation section.

**Required updates**:
- `wiki/index.md`
- `wiki/ko/SUMMARY.md`
- `wiki/en/SUMMARY.md`
- `wiki/ja/SUMMARY.md`
- `wiki/ko/openui/index.md`
- `wiki/en/openui/index.md`
- `wiki/ja/openui/index.md`

## WikiLogEntry

Represents the append-only work log entry.

**Fields**:
- `timestamp`: Required in `YYYY-MM-DD HH:MM` format.
- `operation`: Required, expected `ingest` or `update` depending on implementation path.
- `title`: Required.
- `summary`: Required.

**Validation rules**:
- Must append to `wiki/log.md`.
- Must not rewrite existing log entries.

## SlackNotification

Represents the optional post-update notification.

**Fields**:
- `operation`: Required.
- `pages`: Required comma-separated page list.
- `summary`: Required.
- `webhook_env`: Required value: `SLACK_WEBHOOK_URL`.

**Validation rules**:
- Attempt only when `SLACK_WEBHOOK_URL` exists.
- Never hardcode the webhook URL.

## ReviewGateResult

Represents evidence for one Principle XII quality gate.

**Fields**:
- `gate`: Required.
- `status`: Required enum: `pass`, `fail`, `not_applicable`.
- `evidence`: Required path, source note, or reviewer note.
- `reviewer`: Required for human review gate.
- `date`: Required.

**Validation rules**:
- All ten Principle XII gates must be represented in `review-gates.md`.
- Failures must block active status.
