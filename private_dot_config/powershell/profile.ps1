Set-PSReadLineKeyHandler Ctrl+c    RevertLine
Set-PSReadlineKeyHandler Ctrl+d    DeleteCharOrExit
Set-PSReadLineKeyHandler Tab       MenuComplete
Set-PSReadlineKeyHandler UpArrow   HistorySearchBackward
Set-PSReadlineKeyHandler DownArrow HistorySearchForward

# Aliases start
Set-Alias 'ccopy' Set-Clipboard
Set-Alias 'cpaste' Get-Clipboard

Set-Alias 'cz' 'chezmoi'
Set-Alias 'ff' 'fastfetch'

if (Get-Command bat -ErrorAction SilentlyContinue) {
    Set-Alias 'cat' 'bat'
}

if (Get-Command eza -ErrorAction SilentlyContinue) {
    Set-Alias 'ls' 'eza'
    function ll {eza -l @args}
    function la {eza -la @args}
    function tree {eza -T @args}
}

if (Test-Path '~/scoop/apps/uutils-coreutils/current' ) {
    Set-Alias 'rm' '~/scoop/apps/uutils-coreutils/current/rm.exe'
}
# Aliases end

if (Get-Command carapace -ErrorAction SilentlyContinue) {
    $env:CARAPACE_BRIDGES = 'zsh,fish,bash,inshellisense'
    Set-PSReadLineOption -Colors @{ "Selection" = "`e[7m" }
    carapace _carapace powershell | Out-String | Invoke-Expression
}

if (Get-Command starship -ErrorAction SilentlyContinue) {
    starship init powershell | Invoke-Expression
}

if (Get-Command zoxide -ErrorAction SilentlyContinue) {
    zoxide init powershell | Out-String | Invoke-Expression
}
