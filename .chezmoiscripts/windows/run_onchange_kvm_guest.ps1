$ErrorActionPreference = "Stop"

$system_info = Get-WmiObject -Class Win32_ComputerSystem

if (!($system_info.Manufacturer -match "QEMU")) {
    exit 0
}

Update-Path

Write-Host "System detected as a KVM guest. Installing guest tools." -ForegroundColor Blue
gsudo scoop install --no-update-scoop virtio-guest-tools; if (!$?) { exit 1 }
Write-Host "KVM guest tools successfully installed." -ForegroundColor Green
