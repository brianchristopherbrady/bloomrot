# scripts/

Deterministic (non-agent) checks for the Bloomrot manuscript.

## check-prose-quotes.ps1

Scans all active chapters in `bloomrot_v2/` (or an explicit `-Path` list) for:

- curly double quotation marks (manuscripts use straight ASCII `"`)
- curly single quotation marks and apostrophes (manuscripts use straight ASCII `'`)
- an odd number of straight double quotation marks, which may indicate an unmatched quote

Run manually before treating a chapter as final:

```
pwsh -File scripts/check-prose-quotes.ps1
```

This is **advisory, non-blocking, and not wired as a `.github/hooks/*.json` lifecycle hook.** It was written but never executed in a live session (terminal access was unavailable when it was authored), and this environment's hooks reference does not document a tool-name or file-glob matcher for `PostToolUse` — an unscoped hook here would run after *every* tool call in every session, not just after prose edits. Before wiring this as an actual hook, verify:

1. The script runs cleanly against the current chapter files with no false-positive storm.
2. `PostToolUse` hooks in this environment can be scoped to specific tools (e.g. only after `edit_notebook_file`/file-edit tools) or file globs — if not, an unscoped hook is the wrong mechanism and this should stay a manually-invoked script instead.
