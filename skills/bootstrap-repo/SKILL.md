---
name: bootstrap-repo
description: Wire the current repository up to the shared agent-config plugin marketplace and create its repo-level AGENTS.md / CLAUDE.md. Use when the user asks to bootstrap, set up or onboard a repo for agents, or to "add agent-config" to a repo.
---

# Bootstrap a repo for agent-config

Goal: after this, every Claude Code session in the repo (local or cloud) installs the `agent-config` plugin automatically, which loads the global rules at session start.

## Steps

1. **Project settings.** Create or update `.claude/settings.json` in the repo root. Merge, don't overwrite - keep any existing keys. It must contain:

   ```json
   {
     "extraKnownMarketplaces": {
       "agent-config": {
         "source": {
           "source": "github",
           "repo": "samjmerrick/agent-config"
         }
       }
     },
     "enabledPlugins": {
       "agent-config@agent-config": true
     }
   }
   ```

   Validate the result is valid JSON (e.g. `python3 -m json.tool .claude/settings.json`).

2. **Repo rules.** If the repo has no `AGENTS.md`, create one for **repo-specific** rules only (the global rules come from the plugin - don't copy them). Look at the repo first and fill in what you can find:

   ```markdown
   # <Repo name>

   <One-line description of what this repo is.>

   ## Commands
   - Install: `...`
   - Test: `...`
   - Lint / format: `...`
   - Build / run: `...`

   ## Layout
   - `path/` - what lives here

   ## Conventions
   - Repo-specific rules that override or add to the global ones.
   ```

   Leave out sections you can't fill in honestly rather than guessing.

3. **CLAUDE.md pointer.** If there's no `CLAUDE.md`, create one containing just:

   ```markdown
   @AGENTS.md
   ```

   so Claude Code and other agents read the same file. If a `CLAUDE.md` already exists with content, leave it alone and mention to the user that they may want to merge it into `AGENTS.md`.

4. **Commit** the changes (`chore: wire repo to agent-config plugin`), then follow the global git rules.

5. **Report**: files created or changed, and a reminder that the plugin is picked up from the next session start in this repo.
