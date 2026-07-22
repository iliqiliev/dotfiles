#!/usr/bin/env pwsh

$ErrorActionPreference = 'Stop'

$env:PATH += ";${HOME}/.local/bin"

if (!($CHEZMOI = (Get-Command chezmoi -ErrorAction Ignore).Path)) {
    $CHEZMOI = '~/.local/bin/chezmoi'
    $CHEZMOI_DIR = Split-Path $CHEZMOI -Parent
    $CHEZMOI_URL = 'https://get.chezmoi.io/ps1'

    Write-Host "Downloading chezmoi to '$CHEZMOI_DIR' ..." -ForegroundColor Blue

    $CHEZMOI_INSTALLER = [ScriptBlock]::Create((Invoke-RestMethod $CHEZMOI_URL))

    & $CHEZMOI_INSTALLER -BinDir $CHEZMOI_DIR
}

$CHEZMOI_ARGS = 'init', 'iliqiliev', '--apply', '--depth', '1'

Write-Host "Running 'chezmoi $CHEZMOI_ARGS' ..." -ForegroundColor Green
& $CHEZMOI @CHEZMOI_ARGS
