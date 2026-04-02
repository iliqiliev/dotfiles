$ErrorActionPreference = "Stop"

$AUTOSTART_PROGRAMS = @(
    "AltSnap"
    "Ditto"
)

foreach ($program in $AUTOSTART_PROGRAMS) {
    if (!(Get-Process -Name $program -ErrorAction SilentlyContinue)) {
        Start-Process $program -WindowStyle Hidden
        Write-Host "Started $program." -ForegroundColor Green
    }
}
