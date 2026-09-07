# meta/ — How This Works

**[STATUS NOTE — read this first]** This folder was formerly `meta_v2/`, a clean-room reorganization staged as a *candidate* alongside a separate legacy `meta/` folder (`meta/canon`, `meta/lexicon`, `meta/theory`, `meta/characters`, `meta/chapter_outline`, `meta/action_tension_map`, `meta/style_guide`, `meta/themes`, `meta/research`, `meta/novel_overview`, `meta/world_model`, `meta/institutional_architecture`). That legacy folder no longer exists on disk and has no recoverable git history — `meta_v2/` was renamed to `meta/` at some point without updating its internal cross-references. Every citation below to one of those bare filenames (no number prefix) points at a file that is gone.

**Practical consequence:** the 18 numbered files in this folder (plus `bird_phrases.md`) are now the *sole* current meta system — not condensed pointers to a fuller legacy source. Two files in particular were written as thin pointers that deferred almost all their actual content to the missing legacy files: `14_style_and_voice.md` (style/voice/guardrails) and `15_lexicon.md` (technical terminology). Treat both as **incomplete** until someone reconstructs the deferred content directly into them — do not assume a fuller version exists elsewhere. Similarly, no file named `meta/chapter_outline` or `meta/action_tension_map` exists; `18_chapter_outline.md` (a labeled CANDIDATE restructure) and the per-chapter "Pressure" notes inside it are the only surviving planning material of that kind.

When any file below cites a bare `meta/<name>` path, read it as a historical citation only — do not attempt to open it, and do not tell the user you will "check" it.

## Source-of-Truth Hierarchy

When two sources disagree, resolve in this order:

1. **Drafted manuscript prose** — what a chapter in `bloomrot_v2/` or `parts/` actually shows the reader. A drafted scene outranks any meta document, including this one. Note that `bloomrot_v2/` chapters are a newer, actively-developed draft that already diverges from `18_chapter_outline.md`'s legacy `parts/part_one/` plan in places (see `/memories/repo/bloomrot_v2-status.md`) — when the two disagree, the more recently drafted prose wins, and the meta should be updated (via the `meta-update` skill) rather than treated as silently overruling the newer draft.
2. **Explicit HARD CANON** in these numbered meta files — see tagging system below.
3. **WORKING CANON** in these numbered meta files.
4. **NARRATIVE INTENT** in these numbered meta files.
5. **CANDIDATE IDEA** in these numbered meta files.

There is no surviving legacy tier below this — see the status note above. If two HARD CANON statements conflict, **do not choose silently.** Flag the contradiction in `17_migration_notes.md` or `16_open_questions.md` and leave both positions visible until a drafting decision resolves it. Silent resolution is the failure mode this system exists to prevent.

## The Tagging System

Every substantive claim in this meta system should be tagged with one of the following. Tags may appear inline (`[HARD CANON]`) or as a section-level header.

- **HARD CANON** — Established by drafted manuscript prose, or decided with enough finality that changing it would require a deliberate migration note. Treat as load-bearing.
- **WORKING CANON** — The current best-supported model. Believed true for drafting purposes. Can be revised without a formal migration note, but revisions should be recorded in `17_migration_notes.md`.
- **NARRATIVE INTENT** — Not a fact about the world; a decision about what the novel is trying to do, achieve, or avoid. Guides drafting without asserting ontology.
- **CANDIDATE IDEA** — A generative possibility under consideration. Not binding. May be discarded without ceremony.
- **OPEN QUESTION** — Deliberately unresolved. See `16_open_questions.md` for the master list. Do not resolve these locally inside a topic file; resolving an open question is itself a decision that belongs in a migration note.

## The Central Distinction

`meta_v2` deliberately separates three things that are easy to collapse into one:

1. **What reality is** (ontology — Foam, Float, correction mechanics as they actually operate).
2. **What characters believe reality is** (institutional doctrine, folk understanding, professional training, Noor's evolving theory, the Choir's official model).
3. **What the novel has actually revealed to the reader** (the current state of manuscript disclosure — what a reader of the published chapters knows, versus what the author/meta apparatus knows).

These three are not the same, and the gap between them is a primary source of the novel's tension. Characters can have incorrect models. Institutions can have incorrect models — Asterion's own doctrine about what correction does is shown to be wrong by Noor's discovery. Noor herself can discover that accepted Chrysanthemum theory is incomplete. The meta must never confuse *institutional doctrine* with *ontological truth*, and it must never confuse *what the author knows* with *what the manuscript has disclosed*.

Practical consequence: a file like `03_correction.md` should distinguish "what correction actually does" (ontology) from "what Continuity doctrine claims correction does" (institutional belief) from "what B and Noor have figured out by the end of chapter_1" (reader disclosure state). Where a topic file does not make this distinction explicit, assume the default voice is ontological ("what reality is") unless marked otherwise.

## File Map

| File | Responsibility |
|---|---|
| `01_novel_core.md` | What Bloomrot fundamentally is, in one page |
| `02_ontology.md` | Foam / Float / time — what reality is made of |
| `03_correction.md` | Correction mechanics, relational braids, correction debt |
| `04_chrysanthemum.md` | The interface technology, practitioner skill, artistry vs. bureaucracy |
| `05_bloomrot.md` | The fungal model end to end — residue through mature manifestation |
| `06_world_and_society.md` | How correction-era civilization actually works day to day |
| `07_institutions.md` | The Choir, Asterion, House Vey, healthcare, courts, and their fragmentation |
| `08_characters.md` | B, Noor, Mote, the Carrier, Simon Kade, the Vey Architect, the Asterion Director |
| `09_relationships.md` | Dyadic relationship maps and what each pairing means thematically |
| `10_themes.md` | The novel's questions, posed as questions, with the aesthetics material |
| `11_narrative_architecture.md` | Scale, disclosure strategy, "confidence without explanation" |
| `12_part_one_design.md` | Structural analysis of Part One, including the Noor-screen-time question |
| `13_anomaly_design.md` | How to build a primary anomaly vs. a Bloomrot manifestation from scratch |
| `14_style_and_voice.md` | Pointer to `meta/style_guide` plus meta_v2-specific additions |
| `15_lexicon.md` | Pointer to `meta/lexicon` plus meta_v2-specific new terms |
| `16_open_questions.md` | Master list of unresolved questions, consolidated from all files |
| `17_migration_notes.md` | Every place `meta_v2` changes, sharpens, or flags a conflict with legacy `meta/` |
| `18_chapter_outline.md` | Candidate Part One restructure (extended Noor presence) — answers the open question in `12_part_one_design.md`, not yet adopted |

## What This Pass Does Not Do

It does not revise chapter prose. It does not silently resolve any contradiction it finds between existing `meta/` files (see `17_migration_notes.md` for the catalogued conflicts). It does not convert evocative metaphysics into rigid engineering — where `meta/canon` and `meta/lexicon` already correctly refuse to over-quantify (fertility, semantic affinity, mycelium consciousness), `meta_v2` preserves that refusal rather than "completing" it.
