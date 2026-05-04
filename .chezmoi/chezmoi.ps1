function Restart-Explorer {
    Write-Host "Restarting 'explorer.exe'" -ForegroundColor Blue
    Stop-Process -Name 'explorer'
    Start-Process 'explorer' -ArgumentList '/factory,{682159d9-c321-47ca-b3f1-30e36b2ec8b9}'
    Write-Host "'explorer.exe' restarted successfully." -ForegroundColor Green
}

function Set-RegistryHKCU {
    param (
        [Parameter(Mandatory)]
        [string]$PathName,

        [object]$Value
    )

    $PathName = "HKCU:\$($PathName)"

    if ($Value -eq $null) {
        if (Test-Path $PathName) {
            return
        }

        New-Item -Force -Path $PathName > $null
        return
    }

    $Path = Split-Path $PathName -Parent
    $Name = Split-Path $PathName -Leaf
    $TypeParam = @{}

    if ($Value -match '%\S+%') {
        $TypeParam.Type = 'ExpandString'
    }

    if (-not (Test-Path $Path)) {
        New-Item -Force -Path $Path > $null
    }

    Set-ItemProperty -Path $Path -Name $Name -Value $Value @TypeParam
}

$env:Path = [System.Environment]::GetEnvironmentVariable("Path", "Machine") `
    + ";" + [System.Environment]::GetEnvironmentVariable("Path", "User")

$LOCAL_BIN = "$env:USERPROFILE\.local\bin"

if ($env:Path -notlike "*$LOCAL_BIN*") {
    $env:Path += ";$LOCAL_BIN"
}

if ($args[0] -ne $null) {
    . $args[0]
}
