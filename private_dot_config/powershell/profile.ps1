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

if (Get-Command nvim -ErrorAction SilentlyContinue) {
    $env:EDITOR = 'nvim'
}

if (Get-Command carapace -ErrorAction SilentlyContinue) {
    $env:CARAPACE_BRIDGES = 'zsh,fish,bash,inshellisense'
    Set-PSReadLineOption -Colors @{ "Selection" = "`e[7m" }
    carapace _carapace powershell | Out-String | Invoke-Expression
}

if (Get-Command direnv -ErrorAction SilentlyContinue) {
    direnv hook pwsh | Out-String | Invoke-Expression
}

if (Get-Command starship -ErrorAction SilentlyContinue) {
    starship init powershell | Invoke-Expression
}

if (Get-Command zoxide -ErrorAction SilentlyContinue) {
    zoxide init powershell | Out-String | Invoke-Expression
}

# https://github.com/PowerShell/PowerShell/issues/18180#issuecomment-1261140386
function TabExpansion2
{
    <# Options include:
         RelativeFilePaths - [bool]
             Always resolve file paths using Resolve-Path -Relative.
             The default is to use some heuristics to guess if relative or absolute is better.

       To customize your own custom options, pass a hashtable to CompleteInput, e.g.
             return [System.Management.Automation.CommandCompletion]::CompleteInput($inputScript, $cursorColumn,
                 @{ RelativeFilePaths=$false }
    #>

    [CmdletBinding(DefaultParameterSetName = 'ScriptInputSet')]
    [OutputType([System.Management.Automation.CommandCompletion])]
    Param
    (
        [Parameter(ParameterSetName = 'ScriptInputSet', Mandatory = $true, Position = 0)]
        [string] $inputScript,

        [Parameter(ParameterSetName = 'ScriptInputSet', Position = 1)]
        [int] $cursorColumn = $inputScript.Length,

        [Parameter(ParameterSetName = 'AstInputSet', Mandatory = $true, Position = 0)]
        [System.Management.Automation.Language.Ast] $ast,

        [Parameter(ParameterSetName = 'AstInputSet', Mandatory = $true, Position = 1)]
        [System.Management.Automation.Language.Token[]] $tokens,

        [Parameter(ParameterSetName = 'AstInputSet', Mandatory = $true, Position = 2)]
        [System.Management.Automation.Language.IScriptPosition] $positionOfCursor,

        [Parameter(ParameterSetName = 'ScriptInputSet', Position = 2)]
        [Parameter(ParameterSetName = 'AstInputSet', Position = 3)]
        [Hashtable] $options = $null
    )

    End
    {
        $CompletionOutput = if ($psCmdlet.ParameterSetName -eq 'ScriptInputSet')
        {
            [System.Management.Automation.CommandCompletion]::CompleteInput(
                <#inputScript#>  $inputScript,
                <#cursorColumn#> $cursorColumn,
                <#options#>      $options)
        }
        else
        {
            [System.Management.Automation.CommandCompletion]::CompleteInput(
                <#ast#>              $ast,
                <#tokens#>           $tokens,
                <#positionOfCursor#> $positionOfCursor,
                <#options#>          $options)
        }

        if ($inputScript -and
            !$inputScript.Contains('.\') -and
            $CompletionOutput.CompletionMatches.Count -gt 0 -and
            $CompletionOutput.CompletionMatches[0].ResultType -eq [System.Management.Automation.CompletionResultType]::ProviderContainer -or
            $CompletionOutput.CompletionMatches[0].ResultType -eq [System.Management.Automation.CompletionResultType]::ProviderItem
        )
        {
            [System.Object[]]$NewCompletionList = foreach ($Item in $CompletionOutput.CompletionMatches)
            {
                if ($Item.CompletionText.Contains('.\'))
                {
                    [System.Management.Automation.CompletionResult]::new($Item.CompletionText.Replace('.\',''), $Item.ListItemText, $Item.ResultType, $Item.ToolTip)
                }
                else
                {
                    $Item
                }
            }
            $CompletionOutput.CompletionMatches = $NewCompletionList
        }

        return $CompletionOutput
    }
}
