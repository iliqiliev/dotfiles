$ErrorActionPreference = "Stop"

Update-Path

Write-Host "Setting up clink autorun." -ForegroundColor Blue
clink autorun install; if (!$?) { exit 1 }
Write-Host "Clink successfully configured." -ForegroundColor Green
