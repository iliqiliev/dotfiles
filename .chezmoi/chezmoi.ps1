$env:Path = [System.Environment]::GetEnvironmentVariable("Path", "Machine") `
    + ";" + [System.Environment]::GetEnvironmentVariable("Path", "User")

$LOCAL_BIN = "$env:PATH\.local\bin"

if ($env:PATH -notlike "*$LOCAL_BIN*") {
    $env:PATH += ";$LOCAL_BIN"
}

. $args[0]
