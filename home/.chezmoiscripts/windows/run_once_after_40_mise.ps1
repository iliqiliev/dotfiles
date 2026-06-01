$ErrorActionPreference = 'Stop'


Write-Host "Installing dev tools using 'mise' ..." -ForegroundColor Blue

if (!(Get-Command mise -ErrorAction Ignore)) {
    Write-Host "'mise' is not installed. Aborting." -ForegroundColor Red
    exit 0
}

mise install

Write-Host "Dev tools installed successfully." -ForegroundColor Green
