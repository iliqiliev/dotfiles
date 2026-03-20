Set-PSReadlineKeyHandler -Key Ctrl+d -Function DeleteCharOrExit


if (Get-Command starship -ErrorAction SilentlyContinue) {
    Invoke-Expression (&starship init powershell)
}
