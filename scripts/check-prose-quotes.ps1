# Deterministic prose-encoding check for Bloomrot manuscript files.
#
# Why this exists: bloomrot_v2/** uses straight ASCII quotes and apostrophes
# throughout, but pasted or generated prose can silently introduce curly
# Unicode punctuation. This script makes the encoding check repeatable.
#
# This is intentionally NON-BLOCKING (always exits 0). Prose is judgment-based;
# the script reports; it does not repair or refuse.
#
# Usage: pwsh -File scripts/check-prose-quotes.ps1 [-Path <glob>]

param(
    [string[]]$Path = @(
        "bloomrot_v2/chapter_1",
        "bloomrot_v2/chapter_2",
        "bloomrot_v2/chapter_3",
        "bloomrot_v2/chapter_4",
        "bloomrot_v2/chapter_6"
    )
)

$curlyOpenDouble  = [char]0x201C
$curlyCloseDouble = [char]0x201D
$curlyOpenSingle  = [char]0x2018
$curlyApostrophe  = [char]0x2019

$totalIssues = 0

foreach ($relPath in $Path) {
    $full = Join-Path (Split-Path $PSScriptRoot -Parent) $relPath
    if (-not (Test-Path $full)) { continue }

    $bytes = [System.IO.File]::ReadAllBytes($full)
    $text = [System.Text.Encoding]::UTF8.GetString($bytes)

    $issues = @()

    $curlyDoubleCount = ([regex]::Matches($text, "[$curlyOpenDouble$curlyCloseDouble]")).Count
    if ($curlyDoubleCount -gt 0) {
        $issues += "  - $curlyDoubleCount curly double-quote(s) found - use straight ASCII double quotes"
    }

    $curlySingleCount = ([regex]::Matches($text, "[$curlyOpenSingle$curlyApostrophe]")).Count
    if ($curlySingleCount -gt 0) {
        $issues += "  - $curlySingleCount curly single-quote/apostrophe character(s) found - use straight ASCII apostrophes"
    }

    $straightDoubleCount = ([regex]::Matches($text, '"')).Count
    if (($straightDoubleCount % 2) -ne 0) {
        $issues += "  - odd straight double-quote count ($straightDoubleCount) - possible unmatched quotation mark"
    }

    if ($issues.Count -gt 0) {
        Write-Host "[$relPath]"
        $issues | ForEach-Object { Write-Host $_ }
        $totalIssues += $issues.Count
    }
}

if ($totalIssues -eq 0) {
    Write-Host "check-prose-quotes: no issues found."
} else {
    Write-Host ""
    Write-Host "check-prose-quotes: $totalIssues issue(s) found. This is advisory only (non-blocking) — review before treating a chapter as final."
}

exit 0
