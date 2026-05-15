$ErrorActionPreference = 'Stop'


$PACKAGES = @(
    'Clipchamp.Clipchamp'
    'Microsoft.BingNews'
    'Microsoft.BingSearch'
    'Microsoft.BingWeather'
    'Microsoft.GetHelp'
    'Microsoft.MicrosoftSolitaireCollection'
    'Microsoft.MicrosoftStickyNotes'
    'Microsoft.PowerAutomateDesktop'
    'Microsoft.StartExperiencesApp'
    'Microsoft.Todos'
    'Microsoft.WidgetsPlatformRuntime'
    'Microsoft.Windows.DevHome'
    'Microsoft.WindowsAlarms'
    'Microsoft.WindowsFeedbackHub'
    'Microsoft.WindowsSoundRecorder'
    'Microsoft.ZuneMusic'
    'MicrosoftCorporationII.QuickAssist'
    'MicrosoftWindows.Client.WebExperience'
)

$ADDITIONAL_PACKAGES = @(
    "Microsoft.Paint"
    "Microsoft.OutlookForWindows"
    "MSTeams"
)

$deep_debloat = $host.UI.PromptForChoice(
    "Perform deep debloat?",
    "This will remove packages like Edge, OneDrive, Teams, etc.",
    @("Yes", "No"),
    1
) -eq 0

if ($deep_debloat) { $PACKAGES += $ADDITIONAL_PACKAGES }

Write-Host 'Removing bloat packages...' -ForegroundColor Blue

$removed = 0
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
