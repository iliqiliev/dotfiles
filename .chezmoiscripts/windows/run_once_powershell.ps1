$ErrorActionPreference = "Stop"


if (Get-ExecutionPolicy CurrentUser -eq "RemoteSigned") {
    exit 0
}

Write-Host "Changing execution policy to allow script execution." -ForegroundColor Blue
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
Write-Host "Execution policy changed successfully." -ForegroundColor Green
