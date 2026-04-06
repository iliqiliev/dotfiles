$ErrorActionPreference = "Stop"


if ("QEMU" -inotin (Get-CimInstance Win32_ComputerSystem).Manufacturer) {
    exit 0
}

Write-Host "System detected as a KVM guest. Installing guest tools." -ForegroundColor Blue
gsudo scoop install --no-update-scoop virtio-guest-tools; if (!$?) { exit 1 }
Write-Host "KVM guest tools successfully installed." -ForegroundColor Green
