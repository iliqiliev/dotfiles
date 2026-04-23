Set-PSReadlineKeyHandler -Key Ctrl+d -Function DeleteCharOrExit
Set-PSReadLineKeyHandler -Key Tab -Function MenuComplete

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
# Aliases end

if (Get-Command starship -ErrorAction SilentlyContinue) {
    Invoke-Expression (&starship init powershell)
}

if (Get-Command carapace -ErrorAction SilentlyContinue) {
    $env:CARAPACE_BRIDGES = 'zsh,fish,bash,inshellisense'
    Set-PSReadLineOption -Colors @{ "Selection" = "`e[7m" }
    carapace _carapace | Out-String | Invoke-Expression
}
