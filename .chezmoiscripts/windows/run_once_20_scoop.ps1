$ErrorActionPreference = "Stop"

Update-Path

if (!(Get-Command scoop -ErrorAction SilentlyContinue)) {
	Write-Host "Scoop not found. Installing it..." -ForegroundColor Blue
    Invoke-RestMethod -Uri https://get.scoop.sh | Invoke-Expression

    Update-Path
}

Write-Host "Setting up scoop buckets." -ForegroundColor Blue
scoop install --no-update-scoop git; if (!$?) { exit 1 }
scoop bucket add extras
scoop bucket add sysinternals
scoop bucket add nerd-fonts
scoop bucket add iliya https://github.com/iliqiliev/iliya-bucket
Write-Host "Scoop buckets added successfully." -ForegroundColor Green

Write-Host "Installing scoop packages..." -ForegroundColor Blue
$PACKAGES = $env:PACKAGES -split " "
scoop install --no-update-scoop @PACKAGES
Write-Host "Packages installed successfully." -ForegroundColor Green
