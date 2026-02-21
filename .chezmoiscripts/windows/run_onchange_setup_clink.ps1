# Refresh $PATH
$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") `
    + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")

clink autorun install
