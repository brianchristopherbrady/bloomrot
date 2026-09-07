# Bloomrot

Working repository for the novel **Bloomrot**.

## Structure

- `bloomrot_v2/` — active manuscript draft (chapters 1–3, in progress)
- `parts/` — earlier chapter drafts, organized by part (legacy; check `docs/agent-system.md` cross-reference for which draft is current per chapter)
- `meta/` — world model, canon, character reference, chapter outline, lexicon
- `docs/` — repository documentation, including the agent system reference
- `scripts/` — deterministic (non-agent) checks
- `.github/` — Copilot instructions, skills, and agents

## Agentic Development Architecture

This repository uses a layered agent system built around persistent repository instructions, scoped context loading, on-demand skills, a read-only diagnostic subagent, and one deterministic (script-based) check — sized to what this repository actually is: a novel manuscript, not a software project. There is no build, no test suite, and no application here, so this system does not include hooks, MCP integrations, or browser QA that would have nothing real to operate on.

Concretely: twelve `.github/skills/` packages each load only when their task matches (drafting, dialogue, continuity audit, POV audit, canon consistency, craft critique, chapter outlining, anomaly design); two `.github/agents/` custom agents provide role separation — `novel-writer` can draft and edit, `triage` is deliberately read-only and produces a prioritized diagnostic report rather than silently rewriting what it reviews; and `scripts/check-prose-quotes.ps1` enforces the manuscript's straight ASCII quote encoding rather than asking an agent to remember it.

See [`docs/agent-system.md`](docs/agent-system.md) for the full architecture, what was found broken and fixed, and what was deliberately left out.
