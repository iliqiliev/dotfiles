function Restart-Explorer {
    Write-Host "Restarting 'explorer.exe'" -ForegroundColor Blue
    Stop-Process -Name 'explorer'
    Start-Process 'explorer' -ArgumentList '/factory,{682159d9-c321-47ca-b3f1-30e36b2ec8b9}'
    Write-Host "'explorer.exe' restarted successfully." -ForegroundColor Green
}

$env:Path = [System.Environment]::GetEnvironmentVariable("Path", "Machine") `
    + ";" + [System.Environment]::GetEnvironmentVariable("Path", "User")

$LOCAL_BIN = "$env:USERPROFILE\.local\bin"

if ($env:Path -notlike "*$LOCAL_BIN*") {
    $env:Path += ";$LOCAL_BIN"
}

. $args[0]
