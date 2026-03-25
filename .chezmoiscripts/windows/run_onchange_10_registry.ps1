$ErrorActionPreference = "Stop"

Write-Host "Setting registry settings..." -ForegroundColor Blue

$REG_PATH = "HKCU:\Control Panel\Mouse"
Set-ItemProperty -Path $REG_PATH -Name "MouseSpeed" -Value "0"
Set-ItemProperty -Path $REG_PATH -Name "MouseThreshold1" -Value "0"
Set-ItemProperty -Path $REG_PATH -Name "MouseThreshold2" -Value "0"

$REG_PATH = "HKCU:\Environment"
Set-ItemProperty -Path $REG_PATH -Name "XDG_CACHE_HOME" -Value "%USERPROFILE%\.cache" -Type ExpandString
Set-ItemProperty -Path $REG_PATH -Name "XDG_CONFIG_HOME" -Value "%USERPROFILE%\.config" -Type ExpandString
Set-ItemProperty -Path $REG_PATH -Name "XDG_STATE_HOME" -Value "%USERPROFILE%\.local\state" -Type ExpandString

Set-ItemProperty -Path $REG_PATH -Name "BAT_CONFIG_PATH" -Value "%USERPROFILE%\.config\bat\config" -Type ExpandString
Set-ItemProperty -Path $REG_PATH -Name "HISTFILE" -Value "%USERPROFILE%\.local\state\bash\history" -Type ExpandString
Set-ItemProperty -Path $REG_PATH -Name "PYTHONPYCACHEPREFIX" -Value "%USERPROFILE%\.cache\python" -Type ExpandString
Set-ItemProperty -Path $REG_PATH -Name "PYTHON_HISTORY" -Value "%USERPROFILE%\.local\state\python_history" -Type ExpandString
Set-ItemProperty -Path $REG_PATH -Name "CLINK_PROFILE" -Value "%APPDATA%\clink"

Set-ItemProperty -Path "HKCU:\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}\InprocServer32" -Name "(Default)" -Value "Restore the classic context menu in Windows 11."

$REG_PATH = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced"
Set-ItemProperty -Path $REG_PATH -Name "DisabledHotkeys" -Value "V"
Set-ItemProperty -Path $REG_PATH -Name "Hidden" -Value 1
Set-ItemProperty -Path $REG_PATH -Name "HideFileExt" -Value 0
Set-ItemProperty -Path $REG_PATH -Name "TaskbarAl" -Value 0

Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel" -Name "{2cc5ca98-6485-489a-920e-b3e88a6ccce3}" -Value 1

Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" -Name "Personal" -Value "%APPDATA%" -Type ExpandString

Write-Host "Registry settings imported successfully." -ForegroundColor Green

Write-Host "Restarting explorer.exe" -ForegroundColor Blue
taskkill -f -im explorer.exe; if (!$?) { exit 1 }
Start-Process explorer.exe
Write-Host "explorer.exe restarted successfully." -ForegroundColor Green
