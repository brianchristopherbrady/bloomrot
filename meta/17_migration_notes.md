# 17 — Migration Notes

Every place `meta_v2` changes, sharpens, or flags a conflict against legacy `meta/`. This file is the audit trail required by the README's "do not silently resolve contradictions" rule.

## Contradictions Found and Flagged (Not Resolved)

### 1. Duplicate chapter numbering in `meta/chapter_outline` [FLAGGED — not resolved]

`meta/chapter_outline` contains two chapters both labeled "Chapter Fifteen":

- Line 462: "Chapter Fifteen: The Authorized Shape"
- Line 482: "Chapter Fifteen: The Sealed Experiment"

These are clearly meant to be sequential (Fifteen and Sixteen), and "Chapter Sixteen and Beyond" at line 504 treats "Chapters 15-24" as a range that includes both — but as drafted, the outline itself has a numbering collision. **This is not resolved here.** `meta_v2` does not renumber these chapters or silently pick one number for each. This should be corrected in `meta/chapter_outline` directly by whoever next revises Part Three planning, with the correction noted as an update to this file.

### 2. `meta/action_tension_map`'s 25-chapter pressure table vs. `meta/chapter_outline`'s narrower detailed outline [FLAGGED — not resolved]

`meta/action_tension_map`'s "Major Pressure Sequences" table runs chapters 0–24 (25 entries, including a "1b: Unscheduled" insert), while `meta/chapter_outline` only provides full prose detail through roughly Chapter Fifteen/Sixteen before deferring to the pressure map for "Chapters 15-24." The two files use compatible but not identical chapter numbering (e.g., action_tension_map's "1: Ghost Weight" appears to correspond to chapter_outline's "Chapter Two: Available Response," and action_tension_map's "0: The Metal Stick" to chapter_outline's "Chapter One"). **This offset is not reconciled here.** Any future full renumbering pass should treat both files as needing simultaneous, coordinated updates, not one silently deferring to the other.

### 3. `meta/chapter_outline`'s Chapter Two title vs. `meta/action_tension_map`'s Chapter 1 title [FLAGGED — not resolved]

`meta/chapter_outline` titles the present-day B chapter "Available Response." `meta/action_tension_map`'s pressure table titles the apparently corresponding entry "1: Ghost Weight." Both cannot be the canonical title without clarification of whether these are the same chapter under two working titles, or two different chapters. Not resolved here.

## Sharpenings (Compatible Extensions, Not Contradictions)

These are not contradictions — they are places where `meta_v2` adds precision to a legacy concept that was previously stated more loosely. Listed for transparency, not because they require a decision.

- **Time mechanics** (`02_ontology.md` §Time): `meta/canon` §2 already establishes "no time travel, no branching timelines" but this had not previously appeared explicitly anywhere else in `meta/`. `meta_v2` treats this as HARD CANON going forward.
- **The Critical Noor Discovery, reframed** (`05_bloomrot.md` §The Critical Noor Discovery): `meta/theory` and `meta/lexicon` describe Noor's discovery primarily in terms of the cross-domain pattern (paired corrected/displaced cases). `meta/canon` §23 and this file add the sharper, more radical framing — "meaning can propagate without an author" — as the deeper theoretical claim beneath the evidentiary pattern. These are treated as compatible (the pattern is the evidence, the propagation-without-authorship claim is the theory it supports), not as one superseding the other. Flagged here so a future writer understands the two framings are meant to nest rather than compete.
- **Chrysanthemum-as-art** (`04_chrysanthemum.md`): new emphasis, not present with this specificity anywhere in prior `meta/`. Fully compatible with existing Chrysanthemum hardware/mechanics description in `meta/lexicon` §V.
- **Class and Healthcare as dedicated sections** (`06_world_and_society.md`): new organization; the underlying ideas (consequence laundering, correction as a luxury good) were already present in `meta/lexicon`'s Consequence Laundering entry, but had not been developed into full sections until `meta/canon` §14–15 and this file.
- **Structural Absence and Correction Debt named as mandatory techniques** (`05_bloomrot.md`, `03_correction.md`): both mechanisms were already operating in drafted prose (chapter_1's Alis Dane and Northern District cases) and in `meta/canon`, but had not previously been given standalone named-technique status in a style/craft file. No contradiction — this is naming an existing practice.

## Decisions Resolving Open Questions

### 7. Alis Dane's daughter — manifestation-created child, later removed by correction [PARTIAL RESOLUTION — 2026-08-18]

`bloomrot_v2/chapter_4` states: "The child only existed inside the part of the event that got corrected. When they fixed the failure, the correction didn't leave room for her." This commits, for this specific case, to the stronger reading of Open Question #7 (`16_open_questions.md`) — an anomaly can produce a real child, and correcting the anomaly can remove her from the Float entirely, not merely sever a recognized relationship. Justified by precedent already established in `bird_phrases.md` (correction removed birds as a category, not merely recognition of birds). This is a scene-level commitment, not a general resolution — the question of whether this is *always* true of manifestation remains open and is not decided here. Flagged in `16_open_questions.md` item 7 with a cross-reference back to this entry.

## What Was NOT Changed

To be explicit about scope: this pass did not alter, did not contradict, and does not supersede:

- `meta/lexicon`'s term-level definitions (Foam, Pressure, Pattern, Anomaly, Frame, Constraint, Semantic Affinity, Carrier, the full fungal-model apparatus, all Choir Correction Categories, House Vey, the Mnemonic Family Lattice, all informal motifs).
- `meta/style_guide`'s voice guidance, guardrails, Reusable Line Bank, and Institutional Language Register.
- `meta/characters`'s full unabridged character profiles (condensed, not altered, in `meta_v2/08_characters.md`).
- `meta/chapter_outline`'s and `meta/action_tension_map`'s chapter-by-chapter plans (analyzed in `meta_v2/12_part_one_design.md` and referenced in `meta_v2/11_narrative_architecture.md`, but not rewritten).
- `meta/canon`, the prior consolidation pass — `meta_v2` draws on it extensively and treats it as compatible source material throughout, not as something to revise.
- Any manuscript prose in `parts/`.

## New Candidate Proposals Logged

### 4. `18_chapter_outline.md` created — candidate Part One restructure [CANDIDATE — not adopted]

Date: 2026-08-09
Files affected: `18_chapter_outline.md` (new), `16_open_questions.md` (item 14 annotated), `README.md` (file map updated)
What changed: formatted, refined, and tagged a raw brainstorm into a full candidate answer to the open question in `12_part_one_design.md` — proposing Noor remain present on the page for approximately seven chapters (through "The Experiment") before the present-day/post-disappearance material begins, rather than appearing only in Chapter One as `meta/chapter_outline` currently specifies.
Why: the user requested the raw draft be formatted, refined, and expanded. The content itself was already directionally aligned with `12_part_one_design.md`'s leading candidate, so it was developed into a full per-chapter proposal (Chapters One through Seven) with explicit cross-references to `03_correction.md`, `04_chrysanthemum.md`, `05_bloomrot.md`, and `08_characters.md`.
Status: this is a CANDIDATE IDEA only. It does not override `meta/chapter_outline`'s existing seven-chapter Part One plan (which keeps Noor on-page for Chapter One only) or `meta/action_tension_map`'s pressure sequence. Open question 14 in `16_open_questions.md` remains open — adopting this proposal requires a deliberate future decision, logged as a new entry here, plus a full renumbering reconciliation against `meta/action_tension_map`'s 0–24 pressure table (not attempted in `18_chapter_outline.md`).

### 5. First joint full-emergence dive moved from Chapter Four to Chapter Three [RESOLVED]

Date: 2026-08-13
Files affected: `18_chapter_outline.md` (Chapter Three and Chapter Four entries revised)
What changed: `18_chapter_outline.md` previously assigned "the first joint dive — B, Noor, and Mote together inside the Foam" to Chapter Four, justified by that chapter's Alis Dane/semantic-affinity content. `bloomrot_v2/chapter_3` was drafted with the full negotiated dive sequence (rules, full emergence, the Foam encounter, the unexplained bird-murmuration image, post-dive "Non-reportable" classification) occurring after the South Quay/district-infrastructure discussion — one chapter earlier than the outline specified. Per the README's source-of-truth hierarchy, drafted manuscript prose outranks this outline, so Chapter Three's entry has been rewritten to describe the dive as it was actually drafted, and Chapter Four's entry has been revised to frame any dive there as a second, more purposeful one (investigating Alis Dane specifically) rather than the first.
Why: discovered during a full structural triage of `bloomrot_v2/chapter_3` (Gate 4 — causal logic / chapter-job placement). Flagged as a MAJOR finding because leaving it unresolved risked chapter_4 being drafted next as though the "first dive" framing still applied, duplicating or contradicting the emotional beat already spent in chapter_3.

### 6. Bird-removal canon (`bird_phrases.md`) surfaces first in Chapter Three's dive, not a Chapter Two ribbon [FLAGGED — not resolved]

Date: 2026-08-13
Files affected: none yet — flagged only
What changed: nothing changed; a discrepancy was found and is being recorded rather than silently resolved. `meta/bird_phrases.md` carries a note reading "(Used in chapter_2 / chapter_2_alt as public ribbon)" under its "Known corrected equivalents (in use)" table, implying the birds-removed-from-the-Float canon was expected to first surface as a corrected-phrase public ribbon in Chapter Two. The current `bloomrot_v2/chapter_2` draft contains two public ribbons ("CONTINUITY IS SHARED CARE." / "KINDS OF A KIND KEEP TOGETHER.") but neither is bird-phrase-derived. Instead, the first and currently only bird-adjacent material in the drafted manuscript is `bloomrot_v2/chapter_3`'s full-emergence dive scene, where B and Noor witness an unexplained murmuration-like image and B reaches for a word that no longer exists ("There should be a word." / "There was one. Once.") — delivered as a direct Foam-image rather than a corrected institutional phrase.
Why flagged rather than resolved: this is a real discrepancy between a meta file's continuity assumption and the drafted manuscript, and the fix requires an authorial decision this session did not have grounds to make unilaterally: either (a) add an early bird-idiom-corrected ribbon to `bloomrot_v2/chapter_2` to plant the category before chapter_3's payoff, using the ribbon device that chapter already establishes, or (b) treat chapter_3's dive as the canonical first appearance and update `meta/bird_phrases.md`'s note to match. Until one of these is chosen and logged, `meta/bird_phrases.md` and the current manuscript disagree about where this canon first surfaces.

### 7. B's characterization sharpened — non-judgment, material-conditions empathy, and joke boundaries [RESOLVED]

Date: 2026-08-17
Files affected: `08_characters.md` (B's Core temperament bullets)
What changed: added two new bullet points to B's Core temperament in `08_characters.md`, marked [SHARPENED — 2026-08-17]. First: B does not look down on people and accepts them almost to a fault; when Noor complains about someone (e.g., a coworker), he will support her but will also tend to reach for the other person's perspective or material circumstances, consistent with seeing people as shaped by their material environment rather than as freely-chosen bad actors. Second: B's humor can be dry and sharp about systems and situations, but does not land on people — especially absent people who cannot answer for themselves — as a verdict on their character or history. "Did someone sever your relationship to chairs?" (chapter_2, teasing someone present) was confirmed as the correct register; a joke speculating about a third party's private history (e.g., an absent character's history of victimization) for a laugh was named as the specific thing B would not do.
Why: raised in session as a proposed character addition. `bloomrot_v2/chapter_1` and `chapter_2` were checked against the proposal and found already compatible — no existing B dialogue needed to change. Two candidate problem lines were checked ("Forty-three years of the same stupid little theft," "Tomas holding the first slice like a small, stupid entitlement...") and confirmed to already belong to Noor's POV, not B's, so no edit was required there either. Logged as a character-file addition rather than a manuscript edit, since the trait is compatible with all currently drafted material but has not yet had a scene that directly demonstrates it (Noor complaining about a specific person to B). A future scene giving this trait its first on-page demonstration is recommended but not yet written or assigned to a chapter.

### 8. B's characterization sharpened — embodied cognition, care with freedom, and live model-building [RESOLVED]

Date: 2026-08-19
Files affected: `08_characters.md` (B's profile)
What changed: expanded B's profile from a primarily trait-based description into an operational scene guide. B now arrives bodily and thinks in real time, often moving from body to joke to moral recoil to a partial theory, a better model, and restraint or near-failed restraint. The update establishes his preference for very sweet Vietnamese or Saigon-style condensed milk coffee; defines his humor by function; names care with freedom as his central ethic; sharpens his stillness around administrative language; formalizes his relational rather than essential model of the Float; and distinguishes his dynamics with Noor and Mote. It also establishes the Halloway-specific guardrail that B must notice Tomas's human cost before becoming conceptually useful about the anomaly.
Why: the prior profile correctly established B's empathy, humor, intellectual curiosity, and danger of confusing responsibility with permission, but could still produce a polished diagnostic protagonist who entered scenes already organized. This sharpening makes his embodiment, mistakes, interruptions, moral recoil, and on-page model revision mandatory craft behavior while preserving his existing biography, flaws, and arc.

### 9. Dual emergence can produce relational parallax [RESOLVED]

Date: 2026-08-21
Files affected: `bloomrot_v2/chapter_3`, `04_chrysanthemum.md`, `18_chapter_outline.md`
What changed: Chapter Three's first joint full-emergence dive now has Noor hold the corrected South Quay source case while B holds the Western Quarter manifestations. An ambiguous pale branching is perceptible only between their distinct but related perspectives and is not retained by standard diagnostics, which record two concurrent sessions rather than their overlap. The effect is not identified as literal spores or mycelium and does not prove the Bloomrot mechanism.
Why: the previous draft let Noor directly perceive South Quay's pressure leaving its source and seeking a compatible destination, prematurely disclosing semantic affinity and contradicting Bloomrot's extra-consensus network mechanics. Relational parallax preserves the investigative sequence, gives the unprecedented joint dive a specific epistemic function, and supplies a non-exclusive institutional blind spot without making B and Noor's intimacy a supernatural power.

## Log Format for Future Entries

When a future pass resolves an open question or discovers a new contradiction, add an entry here in this format:

```
### [N]. <short description> [RESOLVED | FLAGGED]

Date: <date>
Files affected: <list>
What changed: <description>
Why: <scene, decision, or reasoning that forced the change>
```
