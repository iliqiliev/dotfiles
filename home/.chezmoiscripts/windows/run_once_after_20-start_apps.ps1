$ErrorActionPreference = "Stop"

$PROGRAMS = @(
    "AltSnap"
    "Ditto"
)

foreach ($program in $PROGRAMS) {
    if (!(Get-Process -Name $program -ErrorAction Ignore)) {
        Start-Process $program -WindowStyle Hidden
        Write-Host "Started $program." -ForegroundColor Green
    }
}
