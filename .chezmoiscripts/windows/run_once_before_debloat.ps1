$ErrorActionPreference = 'Stop'


Write-Host 'Debloating...' -ForegroundColor Blue

$removed = 0
$PACKAGES = @(
    'Microsoft.GetHelp'
    'Microsoft.StartExperiencesApp'
    'Microsoft.WidgetsPlatformRuntime'
    'MicrosoftWindows.Client.WebExperience'
)

foreach ($package_name in $PACKAGES) {
    Write-Host "Removing '$package_name' ..." -ForegroundColor Blue
    $package = Get-AppxPackage $package_name

    if (!$package) {
        Write-Host "'$package_name' not found. Continuing." -ForegroundColor Green
        continue
    }

    Remove-AppxPackage $package
    Write-Host "'$package_name' successfully removed." -ForegroundColor Green
    $removed++
}

if ($removed -eq 0) {
    Write-Host "No packages to debloat. :)" -ForegroundColor Green
    exit 0
}

Write-Host "$removed packages debloated." -ForegroundColor Green

Restart-Explorer
