$f = "C:\Users\Owner\repos\bloomrot\bloomrot_v2\chapter_1"
$bytes = [System.IO.File]::ReadAllBytes($f)
$text = [System.Text.Encoding]::UTF8.GetString($bytes)
$nl = "`r`n"
$old = "At five in the morning many of the towers across the channel were still milky pink. Transit ran mostly empty. A few windows were already lit."
$new = "Transit ran mostly empty. A few windows were already lit."
if ($text.Contains($old)) {
    $text = $text.Replace($old, $new)
    [System.IO.File]::WriteAllBytes($f, [System.Text.Encoding]::UTF8.GetBytes($text))
    Write-Host "OK"
} else { Write-Host "FAILED" }
