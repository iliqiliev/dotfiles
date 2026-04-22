$env:Path = [System.Environment]::GetEnvironmentVariable("Path", "Machine") `
    + ";" + [System.Environment]::GetEnvironmentVariable("Path", "User")

$LOCAL_BIN = "$env:USERPROFILE\.local\bin"

if ($env:Path -notlike "*$LOCAL_BIN*") {
    $env:Path += ";$LOCAL_BIN"
}

. $args[0]
