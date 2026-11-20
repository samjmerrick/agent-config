# Global agent rules

These rules apply in every repo and session. Repo-specific rules (a repo's own `AGENTS.md` / `CLAUDE.md`) take precedence where they conflict.

## Working style

- **Act, then report.** For small, clear tasks (fixes, tweaks, config, docs), make reasonable decisions and get on with it. Ask only when something is genuinely ambiguous or destructive.
- **Plan before deep code work.** Before any substantial code change (new feature, refactor, multi-file change, architectural choice), present a thorough plan and get my sign-off first. Ask me the questions that shape the design. Don't skip this to save time.
- **Don't get stuck waiting.** If a single command or step has been running for more than a few minutes, stop it, work out why, and fix it yourself (narrow the scope, add a timeout, run it in the background, try another approach). Only come to me once you've genuinely run out of options.
- **Verify your work.** Run the relevant tests, lint or build before calling something done. Report failures honestly, with the output.

## Models and delegation (Claude)

- Use Opus for orchestration: planning, breaking work down, reviewing and integrating results.
- Delegate code writing to Sonnet subagents (the `coder` agent from this plugin), giving each one a self-contained brief: goal, files, constraints, and how to verify.
- Review delegated output before committing it.

## Git and PRs

- Commit in small, logical steps with clear messages.
- When the work is done and verified: push the branch, open a PR, and merge it. Don't stop to ask unless the repo's own rules say otherwise or CI is failing.
- Never commit secrets: `.env` files, API keys, tokens, credentials, private keys. If one is staged, unstage it and warn me.
- Never force-push to shared branches or rewrite someone else's history.

## Communication

- Terse. Short summaries and bullet points, no preamble or filler. Expand only when I ask.
- End-of-task report: what changed, how it was verified, and anything left open.
- Use British English in prose, docs, comments and commit messages (e.g. "colour", "organise", "behaviour"). Leave code identifiers and external APIs as they are.

## Code

- Stack varies by repo: follow the existing conventions, tooling and style of the repo you're in.
- Keep changes focused on the task; don't refactor unrelated code without asking.
- Keep README and docs in step with behaviour changes.
