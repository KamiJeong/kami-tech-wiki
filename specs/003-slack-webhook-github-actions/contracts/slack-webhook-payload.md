# Contract: Slack Incoming Webhook Payload

**Endpoint**: `POST $SLACK_WEBHOOK_URL` (Slack Incoming Webhook)
**Content-Type**: `application/json`
**Authorization**: URL itself is the credential (from `PROD_ENV` secret)

## Request Schema

```typescript
interface SlackWebhookPayload {
  text: string;          // Fallback for clients that don't render blocks
  blocks: SlackBlock[];  // Exactly 2 blocks: header + section
}

type SlackBlock = HeaderBlock | SectionBlock;

interface HeaderBlock {
  type: "header";
  text: {
    type: "plain_text";
    text: string;        // Max 150 chars
  };
}

interface SectionBlock {
  type: "section";
  fields: SlackField[]; // Exactly 4 fields
}

interface SlackField {
  type: "mrkdwn";
  text: string;          // Max 2000 chars
}
```

## Example Payload

```json
{
  "text": "Kami Tech — Main branch updated by JH Jeong (abc1234)",
  "blocks": [
    {
      "type": "header",
      "text": {
        "type": "plain_text",
        "text": "🔔 Kami Tech — Main Branch Updated"
      }
    },
    {
      "type": "section",
      "fields": [
        { "type": "mrkdwn", "text": "*Status:*\nSuccess" },
        { "type": "mrkdwn", "text": "*Time:*\n2026-05-15 10:28 UTC" },
        { "type": "mrkdwn", "text": "*System:*\nKami Tech" },
        { "type": "mrkdwn", "text": "*Details:*\nCreated: wiki/ko/claude/overview.md\nModified: wiki/index.md, wiki/log.md" }
      ]
    }
  ]
}
```

## Success Response

```
HTTP 200 OK
Body: ok
```

## Error Responses

| Status | Body | Action |
|--------|------|--------|
| 200 | `no_service` | Webhook URL is invalid or revoked — treat as error |
| 4xx | varies | Bad payload — log and exit 1 |
| 5xx | varies | Slack service error — retry once, then exit 1 |

## Constraints

- `text` field is mandatory (Slack requirement for accessibility and legacy clients)
- `blocks[].text.text` for header must not exceed 150 characters
- Each `fields[].text` must not exceed 2000 characters
- Total payload must not exceed Slack's 3000-block-element limit (not applicable at 2 blocks)
