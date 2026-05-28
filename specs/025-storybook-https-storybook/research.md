# Research: Storybook Overview for AI Native Frontend Development

**Date**: 2026-05-28

## Sources Reviewed

| Source | Use |
|--------|-----|
| Storybook docs: Get started / Why Storybook | Core definition, stories, isolation workflow, docs/testing/sharing benefits |
| Storybook docs: Install Storybook | Installation and recommended feature setup |
| Storybook docs: MCP server | Storybook MCP purpose, toolsets, setup, limitations |
| Storybook docs: Sharing your MCP server | Shared docs-toolset behavior and `@storybook/mcp` context |
| Storybook docs: Interaction, visual, and accessibility tests | Testing capability summaries |
| Storybook blog: Storybook 10.3 | Current MCP announcement and AI workflow framing |
| Figma Dev Mode and Dev Mode MCP official sources | Figma-side design context and MCP capabilities |
| Anthropic Claude Code MCP docs | Claude Code MCP integration behavior |
| OpenAI Codex GitHub/Help sources | Codex CLI as local coding agent and MCP client behavior |

## Decisions

### Decision 1: Position Storybook as executable UI knowledge

**Decision**: The article will explain Storybook as a frontend workshop and executable component documentation system, not merely a screenshot gallery.

**Rationale**: Official Storybook docs define Storybook around isolated component/page development, stories, docs, testing, sharing, and CI workflows.

**Alternatives considered**:
- Treat Storybook mainly as design-system documentation: rejected because it underplays story execution and tests.
- Treat Storybook mainly as testing infrastructure: rejected because it underplays design-system and collaboration value.

### Decision 2: Treat Figma and Storybook as complementary

**Decision**: Figma is described as design/handoff context; Storybook is described as code-backed component behavior and reusable implementation context.

**Rationale**: Figma Dev Mode and MCP provide design context to agents, while Storybook MCP exposes documented component usage, story previews, and story-test execution.

**Alternatives considered**:
- Frame Storybook as replacing Figma: rejected as inaccurate and likely misleading.
- Frame Figma-only as always inferior: rejected because simple one-off UI may not justify Storybook setup.

### Decision 3: Date Storybook MCP limitations

**Decision**: The article will state that Storybook AI/MCP capabilities are preview and currently React-focused as of 2026-05-28.

**Rationale**: Official Storybook AI/MCP docs mark the capabilities as preview and describe current React support constraints.

**Alternatives considered**:
- Omit limitations for readability: rejected because it would overpromise adoption readiness.

### Decision 4: Use heuristic token ranges

**Decision**: Token consumption will be described with relative ranges and explicit assumptions.

**Rationale**: Token usage depends on model, prompt, repository size, MCP output, and iteration count. The issue asks for expected token consumption, but no official benchmark exists for this exact comparison.

**Alternatives considered**:
- Provide exact numbers: rejected because that would imply false precision.
- Avoid numbers entirely: rejected because the issue explicitly asks for expected token consumption.

### Decision 5: Korean-only implementation

**Decision**: Implement only `wiki/ko/storybook/` for this issue.

**Rationale**: The user asked in Korean and project defaults prioritize Korean when not otherwise specified. The spec documents multilingual parity as a scoped exception.

**Alternatives considered**:
- Generate ko/en/ja in this feature: rejected because the issue scope is already broad and source-sensitive.
