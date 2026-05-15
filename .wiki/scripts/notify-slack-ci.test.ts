import { describe, expect, it, spyOn, afterEach } from "bun:test";
import {
  buildChangeSummary,
  formatDetails,
  buildPayload,
  notify,
  detectWikiIngest,
  buildWikiIngestField,
  type ChangeSummary,
  type MergeEvent,
} from "./notify-slack-ci";

const baseEvent: MergeEvent = {
  commitSha: "abc1234567890",
  shortSha: "abc1234",
  author: "JH Jeong",
  commitMessage: "feat: add slack notification",
  repository: "KamiJeong/kami-tech-wiki",
  branch: "main",
  timestamp: "2026-05-15T10:28:00Z",
};

const emptySummary: ChangeSummary = {
  created: [],
  modified: [],
  deleted: [],
  totalCount: 0,
  truncated: false,
};

// ── buildChangeSummary ─────────────────────────────────────────────────────

describe("buildChangeSummary", () => {
  it("parses comma-separated file lists", () => {
    const summary = buildChangeSummary({
      FILES_CREATED: "a.md,b.md",
      FILES_MODIFIED: "x.md",
      FILES_DELETED: "",
    });
    expect(summary.created).toEqual(["a.md", "b.md"]);
    expect(summary.modified).toEqual(["x.md"]);
    expect(summary.deleted).toEqual([]);
    expect(summary.totalCount).toBe(3);
    expect(summary.truncated).toBe(false);
  });

  it("handles undefined env vars as empty arrays", () => {
    const summary = buildChangeSummary({});
    expect(summary.created).toEqual([]);
    expect(summary.modified).toEqual([]);
    expect(summary.deleted).toEqual([]);
    expect(summary.totalCount).toBe(0);
  });

  it("trims whitespace around file names", () => {
    const summary = buildChangeSummary({ FILES_CREATED: " a.md , b.md " });
    expect(summary.created).toEqual(["a.md", "b.md"]);
  });

  it("sets truncated=true when any category exceeds 10 files", () => {
    const files = Array.from({ length: 11 }, (_, i) => `file${i}.md`).join(",");
    const summary = buildChangeSummary({ FILES_CREATED: files });
    expect(summary.truncated).toBe(true);
    expect(summary.totalCount).toBe(11);
  });
});

// ── formatDetails ──────────────────────────────────────────────────────────

describe("formatDetails", () => {
  it("returns fallback text when all categories are empty", () => {
    expect(formatDetails(emptySummary)).toBe("No file changes detected");
  });

  it("omits empty categories", () => {
    const summary: ChangeSummary = {
      ...emptySummary,
      created: ["a.md"],
      totalCount: 1,
    };
    const result = formatDetails(summary);
    expect(result).toContain("Created: a.md");
    expect(result).not.toContain("Modified:");
    expect(result).not.toContain("Deleted:");
  });

  it("shows all three categories when present", () => {
    const summary: ChangeSummary = {
      created: ["a.md"],
      modified: ["b.md"],
      deleted: ["c.md"],
      totalCount: 3,
      truncated: false,
    };
    const result = formatDetails(summary);
    expect(result).toContain("Created: a.md");
    expect(result).toContain("Modified: b.md");
    expect(result).toContain("Deleted: c.md");
  });

  it("truncates each category at 10 files with overflow suffix", () => {
    const files = Array.from({ length: 12 }, (_, i) => `file${i}.md`);
    const summary: ChangeSummary = {
      ...emptySummary,
      created: files,
      totalCount: 12,
      truncated: true,
    };
    const result = formatDetails(summary);
    expect(result).toContain("…and 2 more");
    expect(result.split(",").length).toBeLessThanOrEqual(10);
  });

  it("does not include overflow suffix when exactly 10 files", () => {
    const files = Array.from({ length: 10 }, (_, i) => `file${i}.md`);
    const summary: ChangeSummary = {
      ...emptySummary,
      modified: files,
      totalCount: 10,
    };
    expect(formatDetails(summary)).not.toContain("more");
  });
});

// ── buildPayload ───────────────────────────────────────────────────────────

describe("buildPayload", () => {
  it("returns exactly 2 blocks", () => {
    const payload = buildPayload(baseEvent, emptySummary);
    expect(payload.blocks).toHaveLength(2);
  });

  it("sets header block text correctly", () => {
    const payload = buildPayload(baseEvent, emptySummary);
    expect(payload.blocks[0].type).toBe("header");
    expect(payload.blocks[0].text.text).toBe("🔔 Kami Tech — Main Branch Updated");
  });

  it("section block has exactly 4 mrkdwn fields", () => {
    const payload = buildPayload(baseEvent, emptySummary);
    const section = payload.blocks[1];
    expect(section.type).toBe("section");
    expect(section.fields).toHaveLength(4);
    for (const field of section.fields) {
      expect(field.type).toBe("mrkdwn");
    }
  });

  it("Status field is 'Success'", () => {
    const payload = buildPayload(baseEvent, emptySummary);
    expect(payload.blocks[1].fields[0].text).toContain("Success");
  });

  it("System field is 'Kami Tech'", () => {
    const payload = buildPayload(baseEvent, emptySummary);
    expect(payload.blocks[1].fields[2].text).toContain("Kami Tech");
  });

  it("Details field uses formatDetails output", () => {
    const summary: ChangeSummary = {
      ...emptySummary,
      created: ["wiki/ko/claude/overview.md"],
      totalCount: 1,
    };
    const payload = buildPayload(baseEvent, summary);
    expect(payload.blocks[1].fields[3].text).toContain("Created: wiki/ko/claude/overview.md");
  });

  it("fallback text includes author and short SHA", () => {
    const payload = buildPayload(baseEvent, emptySummary);
    expect(payload.text).toContain("JH Jeong");
    expect(payload.text).toContain("abc1234");
  });
});

// ── detectWikiIngest ───────────────────────────────────────────────────────

describe("detectWikiIngest", () => {
  it("returns wiki/ko/ files excluding index.md and log.md", () => {
    const created = [
      "wiki/ko/openui/introduction.md",
      "wiki/ko/openui/overview.md",
      "wiki/ko/openui/index.md",
      "wiki/log.md",
      "wiki/index.md",
      "specs/plan.md",
    ];
    const result = detectWikiIngest(created);
    expect(result).toEqual([
      "wiki/ko/openui/introduction.md",
      "wiki/ko/openui/overview.md",
    ]);
  });

  it("returns empty array when no wiki/ko/ files created", () => {
    expect(detectWikiIngest(["specs/plan.md", "wiki/index.md"])).toEqual([]);
  });

  it("returns empty array for empty input", () => {
    expect(detectWikiIngest([])).toEqual([]);
  });
});

// ── buildWikiIngestField ───────────────────────────────────────────────────

describe("buildWikiIngestField", () => {
  it("includes page count and section names", () => {
    const files = [
      "wiki/ko/openui/introduction.md",
      "wiki/ko/openui/overview.md",
      "wiki/ko/claude/overview.md",
    ];
    const field = buildWikiIngestField(files);
    expect(field.type).toBe("mrkdwn");
    expect(field.text).toContain("3개 페이지");
    expect(field.text).toContain("openui");
    expect(field.text).toContain("claude");
  });

  it("deduplicates section names", () => {
    const files = [
      "wiki/ko/openui/a.md",
      "wiki/ko/openui/b.md",
    ];
    const field = buildWikiIngestField(files);
    const openui_count = (field.text.match(/openui/g) ?? []).length;
    expect(openui_count).toBe(1);
  });
});

// ── buildPayload — wiki ingest field ──────────────────────────────────────

describe("buildPayload with wiki ingest", () => {
  it("adds wiki ingest field when wiki/ko/ files are created", () => {
    const summary: ChangeSummary = {
      ...emptySummary,
      created: ["wiki/ko/openui/introduction.md", "wiki/ko/openui/overview.md"],
      totalCount: 2,
    };
    const payload = buildPayload(baseEvent, summary);
    expect(payload.blocks[1].fields).toHaveLength(5);
    const lastField = payload.blocks[1].fields[4];
    expect(lastField.text).toContain("Wiki 인제스트");
  });

  it("does not add wiki ingest field when no wiki/ko/ files created", () => {
    const payload = buildPayload(baseEvent, emptySummary);
    expect(payload.blocks[1].fields).toHaveLength(4);
  });
});

// ── notify — missing SLACK_WEBHOOK_URL ────────────────────────────────────

describe("notify", () => {
  afterEach(() => {
    process.env.SLACK_WEBHOOK_URL = undefined as unknown as string;
  });

  it("skips notification gracefully when SLACK_WEBHOOK_URL is not set", async () => {
    delete process.env.SLACK_WEBHOOK_URL;

    const dummyPayload = buildPayload(baseEvent, emptySummary);
    // Should resolve without throwing (no process.exit)
    await expect(notify(dummyPayload)).resolves.toBeUndefined();
  });
});
