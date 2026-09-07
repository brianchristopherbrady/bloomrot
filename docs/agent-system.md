# Bloomrot — Agent System

This repository is a **novel manuscript**, not a software project. There is no build, no test suite, no application, and no browser surface. The agent system here is scoped to what actually exists: a large, evolving world model, character canon, and prose drafts that need to stay consistent with each other across a long project.

This document explains what the agent system is, why each layer exists, and — just as important — what was deliberately **not** built, and why.

---

## What this repository is not

Generic "modernize your agentic AI system" checklists (hooks that run lint/build, browser-driven QA, MCP servers for external APIs, orchestrator/planner/implementer/reviewer/QA pipelines built around `npm test`) assume a software repository. This repo has none of the things those mechanisms operate on. Building them anyway — fake hooks with nothing to enforce, an MCP server with no external system to integrate, a browser QA agent with no application to launch — would be exactly the "theater" a good agentic architecture avoids: mechanisms that exist to be listed, not because they solve a real problem here.

Where a generic capability had no real referent in this repo, it was skipped rather than simulated. See "What was deliberately not built" below.

---

## Layers that exist

```
.github/copilot-instructions.md        — always-on, repo-wide rules
.github/instructions/*.instructions.md — scoped rules (applyTo: parts/**)
.github/skills/<name>/SKILL.md         — on-demand capability packages
.github/agents/*.agent.md              — specialized subagents
.github/hooks/*.json                   — deterministic checks (see status below)
scripts/                               — the actual deterministic check script
meta/                                  — the world model / canon (context, not code)
docs/agent-system.md                   — this file
```

### 1. Repository instructions (`copilot-instructions.md`)

Always loaded. Contains the durable, rarely-changing facts every agent needs regardless of task: project structure, the hard canon rules ("Correction makes a relationship non-actionable. Bloomrot is what remains real."), tone, and character-voice summaries. This is the top of the context-routing pyramid — cheap to load, broadly applicable, and small enough that loading it on every turn is not wasteful.

### 2. Scoped instructions (`.github/instructions/novel-context.instructions.md`)

`applyTo: "parts/**"`. Only injected when a file under `parts/` is in play. This is the progressive-context-loading principle in miniature: a chapter-drafting rule set that would be wasted context on, say, a meta-file consistency question, only loads when the file path matches.

### 3. Skills (`.github/skills/<name>/SKILL.md`)

Twelve skills exist, each targeting one specific kind of work:

| Skill | When it loads | What it's for |
|---|---|---|
| `write-chapter` | Drafting new prose | Reads outline/style/character context, then drafts |
| `write-dialogue` | Dialogue isn't working | Voice-specific dialogue diagnosis/repair |
| `chapter-outline` | Planning a chapter | Expands or stress-tests an outline entry |
| `consistency-check` | Canon audit | World model, character voice, guardrails |
| `continuity` | Deep continuity audit | Chronology, knowledge state, physical continuity |
| `pov-audit` | Perspective check | Unauthorized access to non-POV interiority |
| `scene-sequence-audit` | Structural duplication check | Repeated beats, knowledge-state violations |
| `anomaly-design` | Building a new anomaly | Ordinary vs. ambiguous vs. Bloomrot classification |
| `critique` | Craft-level review | Pacing, structure, voice — not canon accuracy |
| `engagement-auditor` | Reader-experience review | Pacing, tension, hook strength |
| `triage_skill` | Pre-rewrite structural diagnostic | Full dependency-graph triage before line editing |
| `meta-update` | After a chapter is finalized | Propagates new canon back into `meta/` |

This is the strongest demonstration of progressive context loading in this repo: none of these load on every turn. A user asking "what's the square root of 144" or even "read this chapter" does not pull in twelve skills' worth of instructions. Each loads only when its `description` frontmatter matches the task — this is why skill descriptions are written with explicit "Use when..." trigger language rather than vague summaries.

### 4. Specialized agents (`.github/agents/*.agent.md`)

Two agents exist:

- **`novel-writer`** — the default persona for drafting and editing prose. Tools: `[read, edit, search, todo]`. Can write.
- **`triage`** (Chapter Triage) — a **gatekeeper/orchestrator**, not a general editor. Tools: `[read, search, agent, todo]`. Deliberately **cannot edit files.** Its job is to move a chapter through fourteen sequential diagnostic gates (canon → chronology → knowledge → causality → discovery progression → redundancy → scene logic → character logic → dialogue → physical continuity → pacing → clarity → prose), invoking the correct specialized skill at each gate, and produce a prioritized repair order. It explicitly must not rewrite while diagnosing.

This is the tool-permission-boundary demonstration: the triage agent's inability to edit is not an oversight, it's the point. A diagnostic pass that can also silently rewrite the thing it's diagnosing defeats its own purpose — you'd never be sure whether a "finding" was actually left for the human to evaluate or quietly patched over. Read-only tooling is what makes its output trustworthy as a second opinion.

The triage agent is also the repo's clearest example of **orchestration without a build system to run**: instead of coordinating `npm test`/build/browser-QA the way a code repo's orchestrator would, it coordinates *skills* — deciding which of the twelve diagnostic skills is relevant at each gate, in what order, and short-circuiting later gates when an earlier one exposes a problem severe enough to invalidate them (the "Hard Stop" rules in Gates 0–5).

### 5. Deterministic check (`scripts/check-prose-quotes.ps1`)

This project's manuscripts require curly quotes (`" " ' '`) throughout `bloomrot_v2/**`, with no editor setting or lint enforcing it. Every instance of this being fixed in past sessions was done by hand: reading the file as raw bytes, searching for the offending character codes, and rewriting. `scripts/check-prose-quotes.ps1` makes that check repeatable — it scans for straight quotes, straight apostrophes inside words, doubled curly open-quotes (a specific typo that recurred), and open/close quote-count parity mismatches.

**This is the deterministic-vs-probabilistic distinction made concrete.** Whether a chapter's *prose* is working is a judgment call — that's what `critique` and `engagement-auditor` are for. Whether a file contains a straight apostrophe where a curly one belongs is not a judgment call; it's countable. A mature agent system should not ask a model to remember something a ten-line script can guarantee.

**Current status: written, not wired as an active hook.** See `.github/hooks/prose-quotes.json` and `scripts/README.md` for why: the candidate `PostToolUse` hook config was never executed in a live session (the terminal tool was disabled mid-authoring-session), and this environment's hooks documentation does not specify whether `PostToolUse` can be scoped to specific tools or file globs. An unscoped hook would run the script after *every* tool call in *every* session — including plain file reads — which is a real cost and noise problem, not a showcase of deterministic enforcement. The JSON file has no top-level `hooks` key for this reason, so it cannot be accidentally auto-loaded. Run it manually before finalizing a chapter:

```
pwsh -File scripts/check-prose-quotes.ps1
```

Activating it as a real hook is a one-line change (`_candidate_config_if_verified` → `hooks`) once the two open questions above are verified.

### 6. Context: `meta/`

Not an agentic mechanism by itself, but the thing the whole system exists to keep consistent. Eighteen numbered files (`01_novel_core.md` through `18_chapter_outline.md`) plus `bird_phrases.md`, each with an explicit tagging system (`HARD CANON` / `WORKING CANON` / `NARRATIVE INTENT` / `CANDIDATE IDEA` / `OPEN QUESTION`) and a documented source-of-truth hierarchy in `meta/README.md`. `17_migration_notes.md` is the audit trail for every place the meta system's own internal sources disagree — the project's explicit policy is to flag contradictions rather than silently resolve them, which is a form of self-imposed determinism inside an otherwise judgment-heavy system.

---

## What was found broken, and fixed

**The meta system's self-description was pointing at files that don't exist.** `meta/README.md` (and by inheritance, nine of twelve skills, both agents, and both instruction files) described the 18 numbered files as condensed pointers to a fuller "legacy `meta/`" folder — `meta/style_guide`, `meta/characters`, `meta/lexicon`, `meta/canon`, `meta/theory`, `meta/chapter_outline`, `meta/action_tension_map`, and others. `git log --all` confirms none of these bare-name files have ever existed in this repository's history. At some point `meta_v2/` (the reorganization) was renamed to `meta/` without updating any of its internal cross-references to the folder it was supposed to be sitting alongside.

Practical consequence before the fix: any skill or agent instructed to "read `meta/style_guide` first" would either fail the read outright, or — worse — an agent might quietly skip the read and proceed without the context it was told to gather, with no error surfaced to the user. This is a silent-failure mode that is much more dangerous than a loud one.

Fixed by: rewriting `meta/README.md`'s opening section into an explicit status note, and repointing every stale reference across `.github/**` at the real numbered files. Two files — `14_style_and_voice.md` and `15_lexicon.md` — were themselves written as thin pointers to the missing legacy content and are now explicitly flagged as **incomplete** rather than left to silently imply a fuller version exists somewhere.

**Both custom agents were missing YAML frontmatter.** Neither `.agent.md` file had a `description`, `tools`, or `name` field, meaning neither had a defined tool surface (defaulting to "everything") and neither carried the keyword-rich description that lets a parent agent or the agent picker discover them correctly. Fixed by adding frontmatter with role-appropriate tool scoping (see §4 above).

---

## What was deliberately not built

| Requested capability | Why it was skipped here |
|---|---|
| MCP integrations (GitHub, GIS, PostGIS, design systems) | No external system this repo needs to talk to. Adding one "for the showcase" would be exactly the theater this kind of modernization should avoid. |
| Browser-driven QA | No application, no UI, nothing to launch or click through. |
| Build/test/lint hooks | No build system, no test runner, no linter configured for this repo. |
| Planner → Implementer → Reviewer → QA agent pipeline | That pipeline exists to manage code-change risk across compile/test/runtime boundaries. This repo's actual risk (prose contradicting established canon) is already served by the triage agent's sequential-gate model plus the specific audit skills — building a parallel generic pipeline on top would duplicate function without adding capability. |
| Parallel subagent investigation | Genuinely independent investigations are rare in a single-manuscript, mostly-sequential-narrative repo; the triage agent's gates are explicitly sequential *because* later gates depend on earlier ones (documented Hard Stop rules), which is the opposite of a parallelizable structure. |

---

## Example: an end-to-end task through this system

**Request:** "Draft chapter 4, then check it for continuity problems."

1. **Context routing** — `write-chapter` skill's description matches "draft a new chapter" and loads. It does not load `continuity` yet; that would be premature context.
2. **Skill execution** — `write-chapter` reads `meta/18_chapter_outline.md` for the chapter's intended content/pressure, `meta/14_style_and_voice.md` and `meta/08_characters.md` for voice, checks `/memories/repo/bloomrot_v2-status.md`-equivalent status notes for which draft folder is current, and drafts prose.
3. **Handoff** — once drafted, the user's second instruction ("check it for continuity") triggers the `continuity` skill, a *different* specialized capability with its own context requirements (chronology, knowledge ledgers, physical continuity) — not a generic "review this" pass.
4. **Structural gate, if requested** — if the user instead asks for a full triage, the `triage` agent is invoked instead of a skill directly. It cannot edit; it produces a prioritized, dependency-ordered report and hands the repair order back to the user (or to `novel-writer`, which can edit).
5. **Deterministic check** — before calling the chapter final, `pwsh -File scripts/check-prose-quotes.ps1` is run manually to catch quote/apostrophe encoding issues no judgment-based skill is looking for.
6. **Canon propagation** — once the chapter is finalized, `meta-update` is the last skill invoked: it reads the finished chapter, checks it against `meta/16_open_questions.md` and existing `HARD CANON` statements, and updates the meta files so chapter 5's drafting doesn't silently contradict what chapter 4 just established.

This is the shape of "context routing + specialization + sequential diagnosis + deterministic spot-check + canon propagation" that a code repo would express as "planning + implementation + hooks + review + build/test." Same shape, different substrate.
