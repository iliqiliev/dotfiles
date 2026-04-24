#!/usr/bin/env pwsh

$CHEZMOI_URL = 'https://get.chezmoi.io/ps1'
$CHEZMOI_DIR = '~/.local/bin'
$CHEZMOI = "$CHEZMOI_DIR/chezmoi"


Write-Host "Installing chezmoi to '$CHEZMOI'" -ForegroundColor Blue
Invoke-Expression "&{$(Invoke-RestMethod $CHEZMOI_URL)} -BinDir $CHEZMOI_DIR"

$CHEZMOI_ARGS = @('init', 'iliqiliev', '--apply', '--depth', '1')
Write-Host "Running 'chezmoi $CHEZMOI_ARGS' ..." -ForegroundColor Blue
& $CHEZMOI @CHEZMOI_ARGS
