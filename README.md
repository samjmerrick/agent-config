# agent-config

Shared Claude Code config for all my repos and sessions, packaged as a plugin plus a single-plugin marketplace.

## What's in it

| Path | Purpose |
| --- | --- |
| `AGENTS.md` | Global rules. Injected into context at every session start by the hook. |
| `hooks/hooks.json` | `SessionStart` hook that prints `AGENTS.md`. |
| `agents/coder.md` | Sonnet subagent for delegated code writing. |
| `agents/ui-designer.md` | Sonnet subagent for delegated UI design and build work. |
| `agents/runner.md` | Haiku subagent that runs tests, builds and logs and reports a short diagnosis (read-only). |
| `skills/bootstrap-repo/` | Skill that wires a repo to this marketplace and creates its `AGENTS.md` / `CLAUDE.md`. |
| `.claude-plugin/plugin.json` | Plugin manifest (bump `version` on changes). |
| `.claude-plugin/marketplace.json` | Marketplace manifest listing the plugin. |

## Using it in a repo

Fastest: open a session in the repo and ask Claude to "bootstrap this repo" (once the plugin is enabled somewhere), or add this to the repo's `.claude/settings.json`:

```json
{
  "extraKnownMarketplaces": {
    "agent-config": {
      "source": { "source": "github", "repo": "samjmerrick/agent-config" }
    }
  },
  "enabledPlugins": {
    "agent-config@agent-config": true
  }
}
```

Every session in that repo, local or cloud, installs the plugin at start. The repo is public, so no extra GitHub access is needed; the cloud environment's network just needs to allow `github.com`, which the default does.

Locally you can also install it for yourself across all projects:

```bash
claude plugin marketplace add samjmerrick/agent-config
```

```bash
claude plugin install agent-config@agent-config
```

## Changing it

1. Edit rules, agents or skills.
2. Bump `version` in `.claude-plugin/plugin.json`.
3. `claude plugin validate .`
4. Push to `main`. Sessions pick up the new version on their next start.

Repo-specific rules belong in each repo's own `AGENTS.md`, not here.
