function Restart-Explorer {
    Write-Host "Restarting 'explorer.exe'" -ForegroundColor Blue
    Stop-Process -Name 'explorer'
    Start-Process 'explorer' -ArgumentList '/factory,{682159d9-c321-47ca-b3f1-30e36b2ec8b9}'
    Write-Host "'explorer.exe' restarted successfully." -ForegroundColor Green
}

function Set-RegistryHKCU {
    param (
        [Parameter(Mandatory)][string]$PathName,
        [object]$Value = $null
    )

    $PathName = "HKCU:\$($PathName)"

    if ($null -eq $Value) {
        if (Test-Path $PathName) { return }

        New-Item -Force -Path $PathName > $null
        return
    }

    $Path = Split-Path $PathName -Parent
    $Name = Split-Path $PathName -Leaf

    if (-not (Test-Path $Path)) {
        New-Item -Force -Path $Path > $null
    }

    $TypeParam = @{}
    if ($Value -match '%\S+%') { $TypeParam.Type = 'ExpandString' }

    Set-ItemProperty -Path $Path -Name $Name -Value $Value @TypeParam
}

function Update-UserPathVar {
    <#
    .SYNOPSIS
        Adds a directory to the user's PATH environment variable.

    .PARAMETER NewPathValue
        $HOME relative path to add to the PATH environment variable.

    .EXAMPLE
        Update-UserPathVar '.local\share\mise\shims'
    #>

    param (
        [Parameter(Mandatory)][string]$NewPathValue
    )

    $Environment = "HKCU:\Environment"
    $DoNotExpand = [Microsoft.Win32.RegistryValueOptions]::DoNotExpandEnvironmentNames

    $OldFullPath = (Get-Item $Environment).GetValue("Path", "", $DoNotExpand)
    $NewPathValue = "%USERPROFILE%\$NewPathValue"

    if (";$OldFullPath;" -like "*;$NewPathValue;*") {
        return
    }

    $NewFullPath = $OldFullPath.TrimEnd(';')  + ";" + $NewPathValue

    Set-ItemProperty `
        -Path $Environment `
        -Name "Path" `
        -Value $NewFullPath `
        -Type ExpandString
}

# Refresh PATH.
$env:Path = [System.Environment]::GetEnvironmentVariable("Path", "Machine") `
    + ";" + [System.Environment]::GetEnvironmentVariable("Path", "User")

if ($args.Count -gt 0) {
    . $args[0]
}
