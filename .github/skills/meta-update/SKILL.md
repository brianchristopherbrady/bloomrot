---
name: meta-update
description: "Use this skill to update the Bloomrot meta files after new canon is established in a completed chapter draft. Use when a finished chapter introduces new mechanics, resolves an open question, establishes a new canonical example, changes a character's knowledge state, or contradicts an existing meta file."
---

# Meta Update Skill

Use this skill when a committed chapter draft has introduced canonical material the meta files do not yet reflect.

Silent canon drift is the primary failure mode of the meta system. When a chapter is written and the meta is not updated, the next chapter risks contradicting the draft.

---

## Step 1: Read the Completed Chapter

Read the chapter in full. Note:

- New mechanics introduced or demonstrated (Foam behavior, Chrysanthemum use, correction anatomy)
- Open questions from `meta/16_open_questions.md` the chapter answers — even partially
- Character knowledge changes: what do B, Noor, and Mote now know that they didn't before?
- New canonical examples of anomaly, correction, Bloomrot manifestation, or institutional behavior
- Any language or framing that diverges from current meta files

---

## Step 2: Load the Relevant Meta Files

Load only the files the chapter touches. Common candidates:

```
meta/05_bloomrot.md          — Bloomrot mechanics demonstrated or confirmed
meta/03_correction.md        — if a correction occurred
meta/04_chrysanthemum.md     — if Chrysanthemum technology was used
meta/08_characters.md        — character arcs, knowledge states, current relationships
meta/09_relationships.md     — if relationships changed
meta/13_anomaly_design.md    — if a new canonical anomaly example was established
meta/16_open_questions.md    — check whether any open questions were resolved
meta/17_migration_notes.md   — the log for all resolved questions and canon changes
meta/18_chapter_outline.md   — update chapter status
meta/15_lexicon.md           — if new technical terms were introduced or confirmed
```

---

## Step 3: Classify Each Discrepancy

For each difference between the chapter and the meta:

**Hard conflict** — the chapter directly contradicts a HARD CANON statement.  
Requires a decision: is the chapter wrong (revise it), or has the canon been superseded (update the meta with a record of why)?

**Missing canon** — the chapter establishes something not yet in the meta. Add it.

**Open question resolved** — the chapter commits to an answer the meta lists as unresolved. Log it.

**Character knowledge update** — a character now knows something the meta doesn't reflect. Update.

---

## Step 4: Update the Meta Files

For each discrepancy, update the relevant file. Follow the existing tagging conventions:
- `[HARD CANON]` — foundational, supersedes earlier notes
- `[NARRATIVE INTENT]` — describes design intent, not a binding rule
- `[CANDIDATE]` — provisional, not yet committed

Do not silently smooth contradictions. If something changed, name what changed and why.

---

## Step 5: Log Resolved Open Questions

If the chapter forced resolution of any item in `meta/16_open_questions.md`:

1. Add an entry to `meta/17_migration_notes.md` recording:
   - Which question was resolved
   - What the resolution was
   - Which chapter forced it
   - The date
2. Remove or mark the item in `meta/16_open_questions.md` as RESOLVED
3. Update every other meta file that referenced the question as open

Do not resolve an open question without a log entry. That is exactly the failure mode `meta/17_migration_notes.md` exists to prevent.

---

## Step 6: Update the Chapter Outline

Mark the chapter as complete in `meta/18_chapter_outline.md`. Note any canonical decisions it forced and any open questions it sharpened or newly introduced.

---

## What Not To Do

- Do not update meta files for a draft that is still provisional — only committed canon
- Do not resolve open questions without a `meta/17_migration_notes.md` entry
- Do not add speculation without clearly labeling it `[CANDIDATE]`
- Do not delete superseded HARD CANON statements — mark them superseded and explain what replaced them
