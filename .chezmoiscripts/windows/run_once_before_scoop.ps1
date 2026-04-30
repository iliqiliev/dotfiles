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

$SCOOP_PACKAGES = (Get-ChildItem ~/scoop/buckets/*/bucket/*.json).BaseName
$PACKAGES = $env:PACKAGES -split " "
$AVAILABLE_PACKAGES = (
    Compare-Object $SCOOP_PACKAGES $PACKAGES -PassThru -IncludeEqual -ExcludeDifferent
)

scoop install --no-update-scoop @AVAILABLE_PACKAGES
Write-Host "Packages installed successfully." -ForegroundColor Green
