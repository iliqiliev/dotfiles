$ErrorActionPreference = "Stop"


$BUCKETS = @(
    "extras"
    "sysinternals"
    "nerd-fonts"
    "iliya https://github.com/iliqiliev/iliya-bucket"
)

if (!(Get-Command scoop -ErrorAction SilentlyContinue)) {
	Write-Host "Scoop not found. Installing it..." -ForegroundColor Blue
    Invoke-RestMethod -Uri https://get.scoop.sh | Invoke-Expression
}

Write-Host "Setting up scoop buckets." -ForegroundColor Blue

if (!(Get-Command git -ErrorAction SilentlyContinue)) {
    Write-Host "Git not found. Installing it..." -ForegroundColor Blue
    scoop install --no-update-scoop git
    Write-Host "Git installed successfully." -ForegroundColor Green
}

foreach ($bucket in $BUCKETS) {
    $name, $url = $bucket.Split(" ", 2)

    if (Test-Path "$env:USERPROFILE\scoop\buckets\$name" -PathType Container) {
        Write-Host "The $name bucket is added already." -ForegroundColor Green
        continue
    }

    scoop bucket add $name $url
}

Write-Host "Scoop buckets added successfully." -ForegroundColor Green

Write-Host "Installing scoop packages..." -ForegroundColor Blue
$PACKAGES = $env:PACKAGES -split " "
scoop install --no-update-scoop @PACKAGES
Write-Host "Packages installed successfully." -ForegroundColor Green
