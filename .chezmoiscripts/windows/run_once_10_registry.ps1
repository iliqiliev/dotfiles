$ErrorActionPreference = "Stop"


Write-Host "Setting registry settings..." -ForegroundColor Blue


$REG_PATH = "HKCU:\Environment" # Set environment variables.
Set-ItemProperty $REG_PATH CLINK_PROFILE       "%APPDATA%\clink"                           -Type ExpandString
Set-ItemProperty $REG_PATH XDG_CACHE_HOME      "%USERPROFILE%\.cache"                      -Type ExpandString
Set-ItemProperty $REG_PATH PYTHONPYCACHEPREFIX "%USERPROFILE%\.cache\python"               -Type ExpandString
Set-ItemProperty $REG_PATH XDG_CONFIG_HOME     "%USERPROFILE%\.config"                     -Type ExpandString
Set-ItemProperty $REG_PATH BAT_CONFIG_PATH     "%USERPROFILE%\.config\bat\config"          -Type ExpandString
Set-ItemProperty $REG_PATH TEALDEER_CONFIG_DIR "%USERPROFILE%\.config\tealdeer"            -Type ExpandString
Set-ItemProperty $REG_PATH XDG_STATE_HOME      "%USERPROFILE%\.local\state"                -Type ExpandString
Set-ItemProperty $REG_PATH HISTFILE            "%USERPROFILE%\.local\state\bash\history"   -Type ExpandString
Set-ItemProperty $REG_PATH PYTHON_HISTORY      "%USERPROFILE%\.local\state\python_history" -Type ExpandString

$REG_PATH = "HKCU:\Control Panel\Mouse" # Disable mouse acceleration.
Set-ItemProperty $REG_PATH MouseSpeed      "0"
Set-ItemProperty $REG_PATH MouseThreshold1 "0"
Set-ItemProperty $REG_PATH MouseThreshold2 "0"

if ($env:CHEZ_IS_PERSONAL -eq "true") {
    $REG_PATH = "HKCU:\Keyboard Layout\Preload"
    Set-ItemProperty $REG_PATH 1 "00000409"  # English (US)
    Set-ItemProperty $REG_PATH 2 "00040402"  # Bulgarian (Phonetic Traditional)
}

$REG_PATH = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced"
# Free Super+V shortcut for external clipboard manager.
Set-ItemProperty $REG_PATH DisabledHotkeys "V"
# Show hidden files and folders in explorer.
Set-ItemProperty $REG_PATH Hidden           1
# Show file extensions in explorer.
Set-ItemProperty $REG_PATH HideFileExt      0
# Align taskbar to the left.
Set-ItemProperty $REG_PATH TaskbarAl        0
# Hide widgets from the taskbar. Key protected by UCPD: https://kolbi.cz/blog/2024/04/03/userchoice-protection-driver-ucpd-sys
Set-ItemProperty $REG_PATH TaskbarDa        0 -ErrorAction SilentlyContinue

$REG_PATH = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Run" # Autoruns.
Set-ItemProperty $REG_PATH AltSnap "`"$env:USERPROFILE\scoop\apps\altsnap\current\AltSnap.exe`""
Set-ItemProperty $REG_PATH Ditto     "$env:USERPROFILE\scoop\apps\ditto\current\Ditto.exe"


New-Item -Path "HKCU:\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}\InprocServer32" `
         -Force > $null # Restore the classic context menu in Windows 11.

Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel" `
                 -Name "{2cc5ca98-6485-489a-920e-b3e88a6ccce3}" `
                 -Value 1 # Hide the 'Learn about this picture' icon from the desktop.

Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" `
                 -Name "Personal" `
                 -Value "%APPDATA%" `
                 -Type ExpandString # Move PowerShell's profile directory.

Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Search" `
                 -Name "SearchboxTaskbarMode" `
                 -Value 0 # Hide the taskbar search box.


Write-Host "Registry settings imported successfully." -ForegroundColor Green

Write-Host "Restarting explorer.exe" -ForegroundColor Blue
TASKKILL /F /IM "explorer.exe"; if (!$?) { exit 1 }
Start-Process "explorer.exe"
Write-Host "explorer.exe restarted successfully." -ForegroundColor Green
