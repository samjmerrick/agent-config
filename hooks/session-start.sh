#!/usr/bin/env bash
# Print a version stamp, then the global rules, into the session's context.
root="${CLAUDE_PLUGIN_ROOT:-$(cd "$(dirname "$0")/.." && pwd)}"
version=$(sed -n 's/.*"version"[[:space:]]*:[[:space:]]*"\([^"]*\)".*/\1/p' "$root/.claude-plugin/plugin.json" 2>/dev/null | head -1)
sha=$(git -C "$root" rev-parse --short HEAD 2>/dev/null)
echo "[agent-config v${version:-unknown}${sha:+ ($sha)}]"
echo
cat "$root/AGENTS.md" 2>/dev/null
exit 0
