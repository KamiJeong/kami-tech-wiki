import { describe, expect, it } from "bun:test";

// Re-export buildPayload for testing (extracted inline for test isolation)
function buildPayload(opts: {
  operation: "ingest" | "update" | "lint" | "translate";
  pages: string[];
  summary: string;
}): { blocks: object[] } {
  const operationLabel = {
    ingest: "📥 인제스트",
    update: "✏️ 업데이트",
    lint: "🔍 린트",
    translate: "🌐 번역",
  };

  const pagesText = opts.pages.length > 0
    ? opts.pages.map((p) => `\`${p}\``).join(", ")
    : "_(없음)_";

  return {
    blocks: [
      { type: "header", text: { type: "plain_text", text: "📚 kami-tech-wiki 업데이트" } },
      {
        type: "section",
        fields: [
          { type: "mrkdwn", text: `*작업*\n${operationLabel[opts.operation]}` },
          { type: "mrkdwn", text: `*페이지*\n${pagesText}` },
        ],
      },
      opts.summary
        ? { type: "section", text: { type: "mrkdwn", text: `*요약*\n${opts.summary}` } }
        : null,
    ].filter(Boolean) as object[],
  };
}

describe("buildPayload", () => {
  it("includes operation label and pages in blocks", () => {
    const payload = buildPayload({
      operation: "ingest",
      pages: ["Claude Overview"],
      summary: "테스트 요약",
    });

    const sectionBlock = payload.blocks[1] as { fields: { text: string }[] };
    expect(sectionBlock.fields[0].text).toContain("📥 인제스트");
    expect(sectionBlock.fields[1].text).toContain("`Claude Overview`");
  });

  it("shows 없음 when no pages", () => {
    const payload = buildPayload({ operation: "lint", pages: [], summary: "" });
    const sectionBlock = payload.blocks[1] as { fields: { text: string }[] };
    expect(sectionBlock.fields[1].text).toContain("_(없음)_");
  });

  it("omits summary block when summary is empty", () => {
    const payload = buildPayload({ operation: "lint", pages: [], summary: "" });
    expect(payload.blocks).toHaveLength(2);
  });

  it("includes summary block when summary is provided", () => {
    const payload = buildPayload({ operation: "update", pages: ["Page A"], summary: "요약" });
    expect(payload.blocks).toHaveLength(3);
  });
});
