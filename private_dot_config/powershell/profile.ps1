Set-PSReadLineKeyHandler Ctrl+c    RevertLine
Set-PSReadlineKeyHandler Ctrl+d    DeleteCharOrExit
Set-PSReadLineKeyHandler Tab       MenuComplete
Set-PSReadlineKeyHandler UpArrow   HistorySearchBackward
Set-PSReadlineKeyHandler DownArrow HistorySearchForward

Set-Alias 'ccopy' Set-Clipboard
Set-Alias 'cpaste' Get-Clipboard

Set-Alias 'cz' 'chezmoi'
Set-Alias 'ff' 'fastfetch'

if (Get-Command bat -ErrorAction SilentlyContinue) {
    Set-Alias 'cat' 'bat'
}

if (Get-Command eza -ErrorAction SilentlyContinue) {
    Set-Alias 'ls' 'eza'
    function __ll {eza -l @args}
    Set-Alias 'll' __ll
    function __la {eza -la @args}
    Set-Alias 'la' __la
    function __tree {eza -T @args}
    Set-Alias 'tree' __tree
}

if (Test-Path '~/scoop/apps/uutils-coreutils/current' ) {
    Set-Alias 'rm' '~/scoop/apps/uutils-coreutils/current/rm.exe'
}

$env:SHLVL = [int] $env:SHLVL + 1

if (Get-Command nvim -ErrorAction SilentlyContinue) {
    $env:EDITOR = 'nvim'
}

if (Get-Command carapace -ErrorAction SilentlyContinue) {
    $env:CARAPACE_BRIDGES = 'zsh,fish,bash,inshellisense'
    Set-PSReadLineOption -Colors @{ "Selection" = "`e[7m" }
    carapace _carapace powershell | Out-String | Invoke-Expression
}

if (Get-Command starship -ErrorAction SilentlyContinue) {
    $STARSHIP_INIT = (starship init powershell --print-full-init) -join "`n"
    Invoke-Expression $STARSHIP_INIT.Replace('\shims\', '\apps\starship\current\')
}

if (Get-Command zoxide -ErrorAction SilentlyContinue) {
    zoxide init powershell | Out-String | Invoke-Expression
}
