$ErrorActionPreference = "Stop"

$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") `
    + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")

Write-Host "Setting up clink autorun." -ForegroundColor Blue
clink autorun install; if (!$?) { exit 1 }
Write-Host "Clink successfully configured." -ForegroundColor Green
