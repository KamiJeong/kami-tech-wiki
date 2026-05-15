/**
 * Wiki 업데이트 Slack 알림 스크립트
 * 사용: bun run .wiki/scripts/notify-slack.ts --operation ingest --pages "Claude Overview" --summary "Claude 3.5 Sonnet 릴리즈 노트 인제스트"
 */

interface NotifyOptions {
  operation: "ingest" | "update" | "lint" | "translate";
  pages: string[];
  summary: string;
}

function parseArgs(): NotifyOptions {
  const args = process.argv.slice(2);
  const get = (flag: string) => {
    const idx = args.indexOf(flag);
    return idx !== -1 ? args[idx + 1] : undefined;
  };

  const operation = get("--operation") as NotifyOptions["operation"];
  const pages = (get("--pages") ?? "").split(",").map((p) => p.trim()).filter(Boolean);
  const summary = get("--summary") ?? "";

  if (!operation || !["ingest", "update", "lint", "translate"].includes(operation)) {
    console.error("Error: --operation must be one of: ingest, update, lint, translate");
    process.exit(1);
  }

  return { operation, pages, summary };
}

function buildPayload(opts: NotifyOptions): object {
  const operationLabel: Record<NotifyOptions["operation"], string> = {
    ingest: "📥 인제스트",
    update: "✏️ 업데이트",
    lint: "🔍 린트",
    translate: "🌐 번역",
  };

  const timestamp = Math.floor(Date.now() / 1000);
  const pagesText = opts.pages.length > 0
    ? opts.pages.map((p) => `\`${p}\``).join(", ")
    : "_(없음)_";

  return {
    blocks: [
      {
        type: "header",
        text: { type: "plain_text", text: "📚 kami-tech-wiki 업데이트" },
      },
      {
        type: "section",
        fields: [
          { type: "mrkdwn", text: `*작업*\n${operationLabel[opts.operation]}` },
          { type: "mrkdwn", text: `*페이지*\n${pagesText}` },
        ],
      },
      opts.summary
        ? {
            type: "section",
            text: { type: "mrkdwn", text: `*요약*\n${opts.summary}` },
          }
        : null,
      {
        type: "context",
        elements: [
          {
            type: "mrkdwn",
            text: `<!date^${timestamp}^{date_short} {time}|${new Date().toISOString()}>`,
          },
        ],
      },
    ].filter(Boolean),
  };
}

async function notify(opts: NotifyOptions): Promise<void> {
  const webhookUrl = process.env.SLACK_WEBHOOK_URL;
  if (!webhookUrl) {
    console.error("Error: SLACK_WEBHOOK_URL environment variable is not set.");
    process.exit(1);
  }

  const payload = buildPayload(opts);

  const res = await fetch(webhookUrl, {
    method: "POST",
    headers: { "Content-Type": "application/json" },
    body: JSON.stringify(payload),
  });

  if (!res.ok) {
    console.error(`Slack notification failed: ${res.status} ${res.statusText}`);
    process.exit(1);
  }

  console.log(`Slack notification sent: ${opts.operation} — ${opts.pages.join(", ")}`);
}

await notify(parseArgs());
