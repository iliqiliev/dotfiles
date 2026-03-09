$ErrorActionPreference = "Stop"

# Refresh $PATH
$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") `
    + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")

Write-Host "Setting up clink autorun." -ForegroundColor Blue
clink autorun install
Write-Host "Clink successfully configured." -ForegroundColor Green
