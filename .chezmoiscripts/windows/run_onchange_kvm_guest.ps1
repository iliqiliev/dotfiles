$ErrorActionPreference = "Stop"

$system_info = Get-WmiObject -Class Win32_ComputerSystem

if (!($system_info.Manufacturer -match "QEMU")) {
    exit 0
}

$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") `
    + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")

Write-Host "System detected as a KVM guest. Installing guest tools." -ForegroundColor Blue
gsudo scoop install --no-update-scoop iliya/virtio-guest-tools; if (!$?) { exit 1 }
Write-Host "KVM guest tools successfully installed." -ForegroundColor Green
