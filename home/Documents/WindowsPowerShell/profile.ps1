$env:SHLVL = [int]$env:SHLVL + 1

Set-PSReadLineKeyHandler Ctrl+c    RevertLine
Set-PSReadlineKeyHandler Ctrl+d    DeleteCharOrExit
Set-PSReadLineKeyHandler Tab       MenuComplete

Set-PSReadlineKeyHandler UpArrow   HistorySearchBackward
Set-PSReadlineKeyHandler DownArrow HistorySearchForward
Set-PSReadLineOption -HistorySearchCursorMovesToEnd

Set-Alias 'ccopy' Set-Clipboard
Set-Alias 'cpaste' Get-Clipboard
