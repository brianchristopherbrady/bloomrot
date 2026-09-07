---
name: write-chapter
description: "Use this skill to draft a new chapter or major scene for Bloomrot. Guides through reading the outline entry, world context, and style guide before generating prose."
---

# Write Chapter Skill

Use this skill to draft a new chapter or major scene for the novel **Bloomrot**.

## Steps

### 1. Identify the Chapter

Ask the user which chapter they want to draft, or check `meta/18_chapter_outline.md` for the next chapter that needs content, and `/memories/repo/bloomrot_v2-status.md` for which draft folder (`bloomrot_v2/` vs. legacy `parts/part_one/`) is current.

### 2. Read Reference Material

Read these files **before** generating any prose (see `meta/README.md` for the full map — bare-name legacy files no longer exist):

```
meta/18_chapter_outline.md  — the chapter's content, meaning, drama, and pressure notes (candidate restructure)
meta/14_style_and_voice.md  — voice, tone, character voices, Bloomrot texture, guardrails (flagged incomplete)
meta/08_characters.md       — profiles and arcs for any characters appearing in this chapter
meta/05_bloomrot.md         — canon rules, causal model
meta/02_ontology.md         — world mechanics, Foam/Float
meta/15_lexicon.md          — verify any technical terms used (flagged incomplete)
```

Only read `meta/06_world_and_society.md` if the chapter needs sceneable institutional or medical detail.

### 3. Identify the Pressure

Every chapter should have at minimum:

- A **commit point** — a correction committing, a train leaving, a district settling, a memory becoming inherited, a provenance seam closing.
- A **primary pressure type** — from: commit, identity, access, consent, provenance, carrier, or residue pressure (see the "Pressure" note in the chapter's `meta/18_chapter_outline.md` entry).
- An **irreversible cost** — something that does not reset after the scene.

Confirm these before drafting.

### 4. Draft the Prose

Write in the novel's established style:

- Poetic, tactile, sardonic — not essayistic.
- Humor is load-bearing, not decorative.
- Every metaphor reveals character, system, or consequence.
- Dialogue is economical. Characters speak in character (see `meta/14_style_and_voice.md` and `meta/08_characters.md` for each voice).
- Meridian and Choir systems should feel like lived propaganda, not exposition.
- Distinguish primary anomalies from Bloomrot manifestations by causal provenance.

### 5. Check Before Delivering

Before presenting the draft, verify:

- B, Noor, and Mote speak in their correct voices.
- Any Bloomrot manifestations are distinguishable from primary anomalies.
- No canonical guardrails from `meta/14_style_and_voice.md` / `.github/copilot-instructions.md` are violated.
- The chapter's irreversible cost is present and real.
- Institutional language (Choir, Asterion) uses the correct register — see `meta/07_institutions.md`.

## Output

Deliver the draft as prose ready for the chapter file. Do not include editorial commentary inline unless the user asks for notes. Liner notes or questions should be bracketed `[like this]` if included.
