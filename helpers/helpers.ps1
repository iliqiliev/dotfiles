# Refresh PATH.
$env:Path = [System.Environment]::GetEnvironmentVariable("Path", "Machine") `
    + ";" + [System.Environment]::GetEnvironmentVariable("Path", "User")

if ($args.Count -gt 0) {
    . $args[0]
}
