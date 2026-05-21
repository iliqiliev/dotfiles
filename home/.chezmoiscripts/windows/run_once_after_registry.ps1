$ErrorActionPreference = 'Stop'


Write-Host 'Setting registry settings...' -ForegroundColor Blue

if ($env:CHEZ_IS_PERSONAL -eq 'true') {
    Set-RegistryHKCU 'Keyboard Layout\Preload\1' '00000409'  # English (US)
    Set-RegistryHKCU 'Keyboard Layout\Preload\2' '00040402'  # Bulgarian (Phonetic Traditional)
}

# Disable mouse acceleration.
Set-RegistryHKCU 'Control Panel\Mouse\MouseSpeed'      '0'
Set-RegistryHKCU 'Control Panel\Mouse\MouseThreshold1' '0'
Set-RegistryHKCU 'Control Panel\Mouse\MouseThreshold2' '0'

# Set environment variables.
Set-RegistryHKCU 'Environment\XDG_BIN_HOME'        '%USERPROFILE%\.local\bin'
Set-RegistryHKCU 'Environment\XDG_CACHE_HOME'      '%USERPROFILE%\.cache'
Set-RegistryHKCU 'Environment\XDG_CONFIG_HOME'     '%USERPROFILE%\.config'
Set-RegistryHKCU 'Environment\XDG_DATA_HOME'       '%USERPROFILE%\.local\share'
Set-RegistryHKCU 'Environment\XDG_STATE_HOME'      '%USERPROFILE%\.local\state'

Set-RegistryHKCU 'Environment\PYTHONPYCACHEPREFIX' '%USERPROFILE%\.cache\python'
Set-RegistryHKCU 'Environment\RUFF_CACHE_DIR'      '%USERPROFILE%\.cache\ruff'
Set-RegistryHKCU 'Environment\BAT_CONFIG_PATH'     '%USERPROFILE%\.config\bat\config'
Set-RegistryHKCU 'Environment\TEALDEER_CONFIG_DIR' '%USERPROFILE%\.config\tealdeer'
Set-RegistryHKCU 'Environment\HISTFILE'            '%USERPROFILE%\.local\state\bash\history'
Set-RegistryHKCU "Environment\PYTHON_HISTORY"      '%USERPROFILE%\.local\state\python_history'

Set-RegistryHKCU 'Environment\CLINK_PROFILE' '%APPDATA%\clink'
Set-RegistryHKCU 'Environment\MANPAGER' 'nvim +Man!'
Set-RegistryHKCU 'Environment\PAGER' 'nvim -R -M'
Set-RegistryHKCU 'Environment\POWERSHELL_TELEMETRY_OPTOUT' 1
Set-RegistryHKCU 'Environment\VIMRUNTIME' "$env:USERPROFILE\scoop\apps\neovim\current\share\nvim\runtime"

# Restore the classic context menu in Windows 11.
Set-RegistryHKCU 'Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}\InprocServer32'

# Inject clink into cmd.
Set-RegistryHKCU 'Software\Microsoft\Command Processor\AutoRun' 'clink inject --autorun'

$EXPLORER = 'Software\Microsoft\Windows\CurrentVersion\Explorer'
# Free Super+V shortcut for external clipboard manager.
Set-RegistryHKCU "$EXPLORER\Advanced\DisabledHotkeys" 'V'
# Show hidden files and folders in explorer.
Set-RegistryHKCU "$EXPLORER\Advanced\Hidden" 1
# Show file extensions in explorer.
Set-RegistryHKCU "$EXPLORER\Advanced\HideFileExt" 0
# Align taskbar to the left.
Set-RegistryHKCU "$EXPLORER\Advanced\TaskbarAl" 0
# Hide widgets from the taskbar. Key may be protected by the UCPD driver.
Set-RegistryHKCU "$EXPLORER\Advanced\TaskbarDa" 0 -ErrorAction SilentlyContinue
# Add 'End task' button when right-clicking a program.
Set-RegistryHKCU "$EXPLORER\Advanced\TaskbarDeveloperSettings\TaskbarEndTask" 1
# Change the app opened by the CALC key.
Set-RegistryHKCU "$EXPLORER\AppKey\18\ShellExecute" 'qalculate-gtk'
# Hide 'Learn about this picture' icon.
Set-RegistryHKCU "$EXPLORER\HideDesktopIcons\NewStartPanel\{2cc5ca98-6485-489a-920e-b3e88a6ccce3}" 1

$AUTORUN = 'Software\Microsoft\Windows\CurrentVersion\Run'
Set-RegistryHKCU "$AUTORUN\AltSnap" "`"$env:USERPROFILE\scoop\apps\altsnap\current\AltSnap.exe`""
Set-RegistryHKCU "$AUTORUN\Ditto"     "$env:USERPROFILE\scoop\apps\ditto\current\Ditto.exe"

$SEARCH = 'Software\Microsoft\Windows\CurrentVersion\Search'
Set-RegistryHKCU "$SEARCH\SearchboxTaskbarMode" 0 # Hide the taskbar search box.
Set-RegistryHKCU "$SEARCH\BingSearchEnabled"    0 # Disable Bing in Start search.

Write-Host 'Registry settings imported successfully.' -ForegroundColor Green

Restart-Explorer
