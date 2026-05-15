$ErrorActionPreference = "Stop"


if (!(Get-Command scoop -ErrorAction Ignore)) {
    Write-Host "Scoop not found. Installing it..." -ForegroundColor Blue
    Invoke-RestMethod -Uri https://get.scoop.sh | Invoke-Expression
}

Write-Host "Setting up scoop buckets." -ForegroundColor Blue

if (!(Get-Command git -ErrorAction Ignore)) {
    Write-Host "Git not found. Installing it..." -ForegroundColor Blue
    scoop install --no-update-scoop git
    Write-Host "Git installed successfully." -ForegroundColor Green
}

$BUCKETS = @(
    "extras"
    "sysinternals"
    "nerd-fonts"
    "iliya https://github.com/iliqiliev/iliya-bucket"
)

foreach ($bucket in $BUCKETS) {
    $name, $url = $bucket.Split(" ", 2)

    if (Test-Path "~/scoop/buckets/$name" -PathType Container) {
        Write-Host "The $name bucket is added already." -ForegroundColor Green
        continue
    }

    scoop bucket add $name $url
}

Write-Host "Scoop buckets added successfully." -ForegroundColor Green


$ALL_SCOOP_PACKAGES = (Get-ChildItem "~/scoop/buckets/*/bucket/*.json").BaseName
$NEED_SUDO_PACKAGES = @("virtio-guest-tools")
$REQUESTED_PACKAGES = $env:PACKAGES -split " "

$AVAILABLE_PACKAGES = $REQUESTED_PACKAGES | Where-Object {$_ -in $ALL_SCOOP_PACKAGES}

$AVAILABLE_USER_PACKAGES = @($AVAILABLE_PACKAGES | Where-Object {$_ -notin $NEED_SUDO_PACKAGES})
$AVAILABLE_SUDO_PACKAGES = @($AVAILABLE_PACKAGES | Where-Object {$_ -in $NEED_SUDO_PACKAGES})

if ($AVAILABLE_USER_PACKAGES.Count -gt 0) {
    Write-Host "Installing scoop packages..." -ForegroundColor Blue
    scoop install --no-update-scoop @AVAILABLE_USER_PACKAGES
    Write-Host "Packages installed successfully." -ForegroundColor Green
}

if (($AVAILABLE_SUDO_PACKAGES.Count -gt 0) -and ($env:CHEZ_SUDO -ne "false")) {
    Write-Host "Installing packages that require admin privileges..." -ForegroundColor Blue
    gsudo scoop install --no-update-scoop @AVAILABLE_SUDO_PACKAGES
    if (!$?) { exit 1 }
    Write-Host "Admin packages installed successfully." -ForegroundColor Green
}
