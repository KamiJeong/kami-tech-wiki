export interface MergeEvent {
  commitSha: string;
  shortSha: string;
  author: string;
  commitMessage: string;
  repository: string;
  branch: string;
  timestamp: string;
}

export interface ChangeSummary {
  created: string[];
  modified: string[];
  deleted: string[];
  totalCount: number;
  truncated: boolean;
}

interface SlackField {
  type: "mrkdwn";
  text: string;
}

interface HeaderBlock {
  type: "header";
  text: { type: "plain_text"; text: string };
}

interface SectionBlock {
  type: "section";
  fields: SlackField[];
}

export interface SlackWebhookPayload {
  text: string;
  blocks: [HeaderBlock, SectionBlock];
}

const MAX_FILES = 10;

export function detectWikiIngest(created: string[]): string[] {
  return created.filter(
    (f) => f.startsWith("wiki/ko/") && !f.endsWith("index.md") && !f.endsWith("log.md"),
  );
}

export function buildWikiIngestField(wikiFiles: string[]): SlackField {
  const sections = [...new Set(wikiFiles.map((f) => f.split("/")[2]).filter(Boolean))];
  const summary = `${wikiFiles.length}개 페이지 — ${sections.join(", ")} 섹션`;
  return { type: "mrkdwn", text: `*Wiki 인제스트:*\n${summary}` };
}

export function buildChangeSummary(env: NodeJS.ProcessEnv): ChangeSummary {
  const parse = (val: string | undefined): string[] =>
    (val ?? "").split(",").map((s) => s.trim()).filter(Boolean);

  const created = parse(env.FILES_CREATED);
  const modified = parse(env.FILES_MODIFIED);
  const deleted = parse(env.FILES_DELETED);

  return {
    created,
    modified,
    deleted,
    totalCount: created.length + modified.length + deleted.length,
    truncated:
      created.length > MAX_FILES ||
      modified.length > MAX_FILES ||
      deleted.length > MAX_FILES,
  };
}

export function formatDetails(summary: ChangeSummary): string {
  const lines: string[] = [];

  const formatCategory = (files: string[], label: string): void => {
    if (files.length === 0) return;
    const shown = files.slice(0, MAX_FILES);
    const overflow = files.length - shown.length;
    let line = `${label}: ${shown.join(", ")}`;
    if (overflow > 0) line += `\n…and ${overflow} more`;
    lines.push(line);
  };

  formatCategory(summary.created, "Created");
  formatCategory(summary.modified, "Modified");
  formatCategory(summary.deleted, "Deleted");

  return lines.length > 0 ? lines.join("\n") : "No file changes detected";
}

export function buildPayload(
  event: MergeEvent,
  summary: ChangeSummary,
): SlackWebhookPayload {
  const timeDisplay =
    new Date(event.timestamp).toISOString().replace("T", " ").slice(0, 16) +
    " UTC";

  const fields: SlackField[] = [
    { type: "mrkdwn", text: `*Status:*\nSuccess` },
    { type: "mrkdwn", text: `*Time:*\n${timeDisplay}` },
    { type: "mrkdwn", text: `*System:*\nKami Tech` },
    { type: "mrkdwn", text: `*Details:*\n${formatDetails(summary)}` },
  ];

  const wikiFiles = detectWikiIngest(summary.created);
  if (wikiFiles.length > 0) {
    fields.push(buildWikiIngestField(wikiFiles));
  }

  return {
    text: `Kami Tech — Main branch updated by ${event.author} (${event.shortSha})`,
    blocks: [
      {
        type: "header",
        text: {
          type: "plain_text",
          text: "🔔 Kami Tech — Main Branch Updated",
        },
      },
      {
        type: "section",
        fields,
      },
    ],
  };
}

export async function notify(payload: SlackWebhookPayload): Promise<void> {
  const webhookUrl = process.env.SLACK_WEBHOOK_URL;
  if (!webhookUrl) {
    console.warn("Warning: SLACK_WEBHOOK_URL is not set — skipping Slack notification.");
    return;
  }

  const post = (): Promise<Response> =>
    fetch(webhookUrl, {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify(payload),
    });

  let res = await post();
  if (!res.ok) {
    console.warn(
      `Slack notification failed (attempt 1): ${res.status} ${res.statusText}. Retrying in 5s…`,
    );
    await new Promise((resolve) => setTimeout(resolve, 5000));
    res = await post();
  }

  if (!res.ok) {
    console.error(
      `Slack notification failed (attempt 2): ${res.status} ${res.statusText}`,
    );
    process.exit(1);
  }

  console.log("Slack notification sent successfully.");
}

async function main(): Promise<void> {
  const env = process.env;

  const event: MergeEvent = {
    commitSha: env.COMMIT_SHA ?? "",
    shortSha: env.COMMIT_SHORT ?? (env.COMMIT_SHA?.slice(0, 7) ?? "unknown"),
    author: env.AUTHOR ?? "unknown",
    commitMessage: (env.COMMIT_MSG ?? "").split("\n")[0],
    repository: env.REPOSITORY ?? "",
    branch: env.BRANCH ?? "main",
    timestamp: env.TIMESTAMP ?? new Date().toISOString(),
  };

  const summary = buildChangeSummary(env);
  const payload = buildPayload(event, summary);
  await notify(payload);
}

if (import.meta.main) {
  await main();
}
