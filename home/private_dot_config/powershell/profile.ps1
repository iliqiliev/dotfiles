Set-PSReadLineKeyHandler Ctrl+c    RevertLine
Set-PSReadlineKeyHandler Ctrl+d    DeleteCharOrExit
Set-PSReadLineKeyHandler Tab       MenuComplete

Set-PSReadlineKeyHandler UpArrow   HistorySearchBackward
Set-PSReadlineKeyHandler DownArrow HistorySearchForward
Set-PSReadLineOption -HistorySearchCursorMovesToEnd

Set-Alias 'ccopy' Set-Clipboard
Set-Alias 'cpaste' Get-Clipboard

Set-Alias 'cz' 'chezmoi'
Set-Alias 'ff' 'fastfetch'

if (Get-Command bat -ErrorAction Ignore) {
    Set-Alias 'cat' 'bat'
}

if (Get-Command eza -ErrorAction Ignore) {
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

if (Get-Command nvim -ErrorAction Ignore) {
    $env:EDITOR = 'nvim'
}

if (Get-Command starship -ErrorAction Ignore) {
    $STARSHIP_INIT = (starship init powershell --print-full-init) -join "`n"
    Invoke-Expression $STARSHIP_INIT.Replace('\shims\', '\apps\starship\current\')
}

if (Get-Command uv, uvx -ErrorAction Ignore) {
    uv generate-shell-completion powershell | Out-String | Invoke-Expression
    uvx --generate-shell-completion powershell | Out-String | Invoke-Expression
}

if (Get-Command zoxide -ErrorAction Ignore) {
    zoxide init powershell | Out-String | Invoke-Expression
}
