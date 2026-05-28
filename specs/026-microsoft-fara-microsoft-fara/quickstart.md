# Quickstart: Microsoft Fara Overview Implementation

Use this workflow after tasks are generated.

## 1. Load Context

Read:
- `specs/026-microsoft-fara-microsoft-fara/spec.md`
- `specs/026-microsoft-fara-microsoft-fara/plan.md`
- `specs/026-microsoft-fara-microsoft-fara/contracts/microsoft-fara-wiki-contract.md`
- `AGENTS.md`

## 2. Verify Current Sources

Before drafting, re-check official sources live and record publication or access dates for claims about:
- What Microsoft Fara is.
- Fara-7B and Fara1.5 relationship.
- Model availability in Microsoft Foundry, Hugging Face, GitHub, or other official model cards.
- Benchmarks, FaraGen, FaraEnvs, WebTailBench, trajectory, verifier, and critical-point claims.
- Safety guidance, usage constraints, and research-preview status.
- Visual source provenance and licensing or reuse constraints.

Do not rely on planning-date assumptions for fast-changing facts.

## 3. Draft Wiki Pages

Create:
- `wiki/ko/microsoft-fara/README.md`
- `wiki/ko/microsoft-fara/index.md`
- `wiki/glossary/microsoft-fara.md`

Both pages must:
- Use required wiki frontmatter.
- Set `language: ko`.
- Set `category: tool`.
- Set `review_cycle: fast-changing`.
- Set `source_count: 0`.
- List official web sources in the body rather than counting them as raw sources.
- Keep `status: draft` unless a human reviewer records approval of the Korean-only Principle IV override or English/Japanese parity is implemented.
- Use glossary-approved terminology for introduced Microsoft Fara terms.

## 4. Handle Visuals

Include at least two embedded visuals or linked visual references. Each one needs:
- Alt text.
- Caption.
- Source owner.
- Source URL or local path.
- Access or created date.
- Rights decision.

Store local screenshots or original diagrams only under `wiki/ko/microsoft-fara/assets/`. Do not commit copied binary images unless reuse is defensible from source license or owner terms.

## 5. Update Navigation And Log

Update:
- `wiki/index.md`
- `wiki/ko/SUMMARY.md`

Append:
- `wiki/log.md`

Do not modify `raw/`.

## 6. Record Review Gates

Create or update `specs/026-microsoft-fara-microsoft-fara/review-gates.md` with evidence for all ten Constitution Principle XII gates:
- Readability
- Factual accuracy
- Source integrity
- Multilingual consistency or the documented Principle IV override
- Markdown portability
- Terminology consistency
- Navigation
- Copying/plagiarism risk
- Template compliance
- Learning goal

Do not mark human editorial review complete yourself. If a human reviewer approves publication or the Korean-only override, record reviewer name, date, and decision in `review-gates.md` or `review-report.md`.

## 7. Notify Slack When Available

After wiki updates, if `SLACK_WEBHOOK_URL` exists in the environment, run the project Slack script with an operation, pages list, and summary. If the variable is absent, skip notification without hardcoding or storing the webhook.

## 8. Validate

Check:
- All internal links resolve.
- All visual references have full attribution.
- All major claims cite official sources.
- Fast-changing claims include source dates or access dates.
- `source_count: 0` is present on both wiki pages.
- `wiki/glossary/microsoft-fara.md` covers new terms and the article uses those preferred terms.
- `raw/` has no changes.
- Navigation entries point to existing files.
- `wiki/log.md` was appended, not rewritten.
- `review-gates.md` has all ten quality gates with evidence.
- Human editorial review is still required before final publication.
