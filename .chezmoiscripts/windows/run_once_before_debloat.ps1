$ErrorActionPreference = 'Stop'


Write-Host 'Removing bloat packages...' -ForegroundColor Blue

$removed = 0
$PACKAGES = @(
    'Microsoft.BingSearch'
    'Microsoft.GetHelp'
    'Microsoft.StartExperiencesApp'
    'Microsoft.WidgetsPlatformRuntime'
    'MicrosoftWindows.Client.WebExperience'
)

foreach ($package_name in $PACKAGES) {
    Write-Host "Removing '$package_name' ... " -ForegroundColor Blue -NoNewline
    $package = Get-AppxPackage $package_name

    if (!$package) {
        Write-Host "Not found." -ForegroundColor Yellow
        continue
    }

    Remove-AppxPackage $package
    Write-Host "Done." -ForegroundColor Green
    $removed++
}

Write-Host "$($PACKAGES.Length) packages checked." -ForegroundColor Green

if ($removed -eq 0) {
    Write-Host "No packages to debloat. :)" -ForegroundColor Green
    exit 0
}

Write-Host "$removed packages debloated." -ForegroundColor Green

Restart-Explorer
