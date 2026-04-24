#!/usr/bin/env pwsh

$ErrorActionPreference = 'Stop'

$CHEZMOI_URL = 'https://get.chezmoi.io/ps1'
$CHEZMOI_DIR = '~/.local/bin'

$existing_chezmoi = Get-Command chezmoi -ErrorAction SilentlyContinue

if ($existing_chezmoi) {
    $CHEZMOI = $existing_chezmoi.Path
} elseif (Test-Path ~/.local/bin/chezmoi) {
    $CHEZMOI = '~/.local/bin/chezmoi'
} elseif (Test-Path ~/bin/chezmoi) {
    $CHEZMOI = '~/bin/chezmoi'
} else {
    $CHEZMOI = "$CHEZMOI_DIR/chezmoi"
    Write-Host "Downloading chezmoi to '$CHEZMOI' ..." -ForegroundColor Blue
    Invoke-Expression "&{$(Invoke-RestMethod $CHEZMOI_URL)} -BinDir $CHEZMOI_DIR"
}

$CHEZMOI_ARGS = @('init', 'iliqiliev', '--apply', '--depth', '1')
Write-Host "Running 'chezmoi $CHEZMOI_ARGS' ..." -ForegroundColor Green
& $CHEZMOI @CHEZMOI_ARGS
