# Specification Analysis Report

**Feature**: Spec-Driven Development Multilingual Wiki
**Feature directory**: `specs/019-create-replace-multilingual/`
**Analysis date**: 2026-05-19
**Artifacts analyzed**: spec.md, plan.md, tasks.md
**Constitution version**: 2.0.0

---

## Findings Table

| ID | Category | Severity | Location(s) | Summary | Recommendation |
|----|----------|----------|-------------|---------|----------------|
| I1 | Inconsistency | CRITICAL | tasks.md §Path Conventions vs. plan.md §Project Structure | Output file paths conflict: tasks.md declares `wiki/ko/sdd/spec-driven-development.md` (and en/ja equivalents), while plan.md declares `wiki/ko/sdd/index.md` (and en/ja equivalents). Existing files are at `index.md` paths. Every article-writing task will target incorrect file paths if tasks.md is followed as written. | Align tasks.md Path Conventions to `index.md` (matching plan.md and existing files), or amend plan.md and rename existing files. Pick one canonical path before implementation. |
| I2 | Inconsistency | HIGH | tasks.md §Phase 2 intro vs. plan.md §Implementation Strategy | tasks.md designates Korean as "Primary Language" written first; plan.md designates English as "canonical language; written first" with Korean as Phase 2. The editorial sequence contradicts itself across artifacts. | Choose one canonical-first language and apply consistently across both artifacts. |
| I3 | Inconsistency | HIGH | spec.md §CR-001 / plan.md §22 Required Sections items 21-22 | Items 21-22 in the plan section list are frontmatter fields, not body sections. T022 and T047 verify "22 sections" using this list, producing a misleading count. | Clarify whether items 21-22 are body sections or frontmatter fields and update T022/T047 verification criteria accordingly. |
| I4 | Inconsistency | MEDIUM | tasks.md T004 vs. plan.md §Complexity Tracking | T004 creates glossary stubs in `wiki/glossary/`. plan.md explicitly marks glossary update out of scope. `wiki/glossary/` directory does not exist. | Remove T004 (and reframe T003) to match plan.md, or add directory creation and update plan.md to include glossary as in-scope. |
| I5 | Inconsistency | MEDIUM | tasks.md T001/T002 vs. plan.md §Phase 0 | plan.md Phase 0 says sources are recorded "in tasks.md"; T001/T002 target `specs/019-create-replace-multilingual/research.md`. The research output destination is contradictory. | Amend plan.md Phase 0 deliverable description to reference `research.md`, matching tasks.md. |
| U1 | Underspecification | HIGH | tasks.md T003 | `wiki/glossary/` does not exist. T003 behavior against an absent directory is undefined -- will fail silently or produce a misleading result with no guidance on next steps. | Add a sub-step: if directory is absent, record the absence and proceed. Tie resolution to I4 decision. |
| U2 | Underspecification | MEDIUM | tasks.md T001/T002 | Neither artifact specifies whether `research.md` is a permanent committed artifact or a temporary scratchpad, nor whether it requires frontmatter. | Add an explicit lifecycle statement for `research.md` in either plan.md or tasks.md. |
| U3 | Underspecification | MEDIUM | spec.md §RS1 Acceptance 3 | No task verifies cross-language learning outcome equivalence -- T043 checks structural parity only (section count and order). RS1 Acceptance 3 requires readers reach "the same understanding" across all three language versions. | Expand T043 or add T043a to verify the RS1 completion check is achievable from each language version independently. |
| U4 | Underspecification | MEDIUM | tasks.md T062 | T062 updates SUMMARY.md files but no task inspects their current structure to confirm the "AI Development Practices" parent section exists before writing. | Add a prerequisite sub-step to T062 to read current SUMMARY.md structure before inserting the new entry. |
| U5 | Underspecification | LOW | plan.md §Frontmatter Template | `date_created: 2026-05-18` is hardcoded in the plan frontmatter template but spec.md records the feature creation date as 2026-05-19. This stale date would be embedded into all three articles if the template is copied verbatim. | Update `date_created` to `2026-05-19` in plan.md Frontmatter Template. |
| A1 | Ambiguity | MEDIUM | spec.md §CR-004 / tasks.md T006, T021 | The 3,000-word split threshold is "per language version" but the split decision is made once before drafting (T006). Criteria for divergent word counts across languages are undefined. | Specify whether the split decision is made independently per language or once based on the canonical-first draft. |
| A2 | Ambiguity | LOW | spec.md §SR-002 | "Dated with the knowledge cutoff or publication date" is ambiguous: whose knowledge cutoff -- the AI drafting the article, or the cited source document? | Clarify SR-002 requires the publication date of the cited source document, not the AI drafting agent's training cutoff. |
| C1 | Constitution Alignment | MEDIUM | tasks.md vs. Constitution §IX | Constitution Principle IX MUST: "New articles MUST add new terms to the glossary before publishing." Glossary update is marked out of scope in plan.md; no documented exception appears in spec.md §Exception documentation. | Add a full glossary-entry completion task before Phase 6, or file a documented exception in spec.md §Exception documentation. |
| C2 | Constitution Alignment | LOW | tasks.md T051 | T051 is marked [P] parallel with T050 but Constitution Principle XV requires human review to assess clarity and trustworthiness -- implying a sequential read-then-verify flow. | Add a note that T051 runs concurrently within the same review session as T050, not as a fully independent gate. |
| D1 | Duplication | LOW | plan.md §Phase 4 Review Checklist vs. tasks.md §Phase 4 | The plan's 20-item review checklist and the 10 tasks.md gate tasks (T040-T049) overlap substantially. Some plan checklist items (e.g., "No backup files created (CR-000)") have no tasks.md equivalent, creating orphaned acceptance criteria. | Map each plan checklist item to a task ID or consolidate. Ensure no checklist item is orphaned from a trackable task. |

---

## Coverage Summary Table

| Requirement Key | Has Task? | Task IDs | Notes |
|-----------------|-----------|----------|-------|
| CR-000 (overwrite in place, no backup) | Partial | T030, T031, T054 | Mentioned in task prose; no standalone verification gate task |
| CR-001 (22 sections) | Yes | T022, T047 | Section count definition ambiguous -- see I3 |
| CR-002 (plain-language analogy) | Yes | T012, T040 | Covered |
| CR-003 (common misconceptions) | Yes | T019, T047 | Covered |
| CR-004 (single-page default, split at 3,000 words) | Yes | T006, T021 | Covered; split criteria ambiguous across languages -- see A1 |
| CR-005 (multilingual parity) | Yes | T036, T043 | Covered |
| CR-005a (inline hyperlinks) | Yes | T037, T046 | Covered |
| CR-006 (no article prose in spec) | Yes | T022 | Covered |
| TR-001 (new terms) | Partial | T004, T045 | T004 has scoping conflict -- see I4 |
| TR-002 (existing glossary terms) | Yes | T003, T045 | Covered |
| TR-003 (locked translations) | Yes | T005, T034, T035, T045 | All three languages covered |
| SR-001 (>=2 verifiable TDD/BDD sources) | Yes | T001, T041 | Covered |
| SR-002 (dated AI capability claims) | Yes | T002, T041 | Covered |
| SR-003 (original synthesis) | Yes | T042 | Covered |
| RS1 (PM learns SDD) | Yes | T011-T014, T017, T019, T040, T049 | Strong coverage |
| RS2 (beginner dev understands workflow) | Yes | T015, T017, T048 | Covered |
| RS3 (vibe coder understands difference) | Yes | T016, T034, T035 | Covered |
| Constitution §IX (glossary before publish) | No | T004 (scoping conflict) | Potential MUST violation; no exception documented |
| Constitution §XV (human review before merge) | Yes | T050-T054 | Fully covered |

---

## Constitution Alignment Issues

| Principle | Finding | Severity |
|-----------|---------|----------|
| IX. Terminology Governance | MUST: "New articles MUST add new terms to the glossary before publishing." Glossary update marked out of scope in plan.md; no exception in spec.md §Exception documentation. | MEDIUM |
| XII. Review and Quality Gates | plan.md review checklist item "No backup files created (CR-000)" has no corresponding tasks.md gate task. | LOW |

---

## Unmapped Tasks

| Task | Issue |
|------|-------|
| T003 | Targets `wiki/glossary/` which does not exist |
| T004 | Creates glossary stubs in `wiki/glossary/` which does not exist; plan.md marks this explicitly out of scope |

---

## Metrics

| Metric | Value |
|--------|-------|
| Total Content Requirements analyzed | 14 (CR-000 through CR-006, TR-001 through TR-003, SR-001 through SR-003) |
| Total Reader Scenarios | 3 (RS1-RS3) |
| Total Tasks | 47 (T001-T063 with gaps) |
| Requirements with >=1 task | 13/14 (93%) |
| Ambiguity Count | 2 |
| Duplication Count | 1 |
| Inconsistency Count | 5 |
| Underspecification Count | 5 |
| Constitution Alignment Issues | 2 |
| Critical Issues Count | 1 |

---

RESOLVED: Output path conflict fixed — all tasks.md article-writing tasks now correctly reference wiki/ko/sdd/index.md, wiki/en/sdd/index.md, wiki/ja/sdd/index.md. No CRITICAL issues remain.

---

## Next Actions

**A CRITICAL issue exists. Resolve I1 before running `/speckit-implement`.**

### Ordered remediation steps

1. **I1 (CRITICAL -- output path conflict)**
   Decide the canonical filename for all three language articles.
   - Option A (recommended): keep `index.md` -- edit tasks.md Path Conventions and all task output paths (T010-T022, T030-T037, T054, T062) to use `index.md`.
   - Option B: keep `spec-driven-development.md` -- edit plan.md Project Structure and rename the three existing `wiki/*/sdd/index.md` files.
   Then re-run `/speckit-analyze` to confirm resolution.

2. **I2 (HIGH -- canonical-first language conflict)**
   Choose English-first (per plan.md) or Korean-first (per tasks.md) and apply consistently across both artifacts.

3. **I3 (HIGH -- section count definition)**
   Clarify whether plan.md items 21-22 are body sections or frontmatter fields; update T022 and T047 verification criteria accordingly.

4. **I4 + C1 (MEDIUM -- glossary scope conflict + Constitution §IX)**
   Either remove T004 and reframe T003, or create `wiki/glossary/` and add it to plan scope. If deferring glossary update, file a documented exception in spec.md §Exception documentation with: principle overridden (IX), reason, approver, and review date.

5. **I5 + U2 (MEDIUM -- research.md destination)**
   Align plan.md Phase 0 deliverable description with tasks.md T001/T002 (`research.md`) and declare whether research.md is a committed artifact.

6. **U5 (LOW -- stale date_created)**
   Update `date_created` from `2026-05-18` to `2026-05-19` in plan.md Frontmatter Template.

---

## Remediation Offer

Would you like concrete remediation edits for the top issues (I1, I2, I3, I4)?
