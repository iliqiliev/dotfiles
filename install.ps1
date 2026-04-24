#!/usr/bin/env pwsh

$CHEZMOI_URL = 'https://get.chezmoi.io/ps1'
$CHEZMOI_DIR = '~/.local/bin'
$CHEZMOI = "$CHEZMOI_DIR/chezmoi"

Invoke-Expression "&{$(Invoke-RestMethod $CHEZMOI_URL)} -BinDir $CHEZMOI_DIR"
& $CHEZMOI init iliqiliev --apply --depth 1
