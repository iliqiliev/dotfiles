@ECHO OFF

DOSKEY cd=if "$1"=="" (cd /d "%USERPROFILE%") else (cd /d "$*")

DOSKEY ccopy=clip $*
DOSKEY cpaste=powershell -NoProfile -Command "Get-Clipboard"

DOSKEY cz=chezmoi $*

WHERE /Q bat && (
    DOSKEY cat=bat $*
)

WHERE /Q eza && (
    DOSKEY ls=eza $*
    DOSKEY ll=eza -l $*
    DOSKEY la=eza -la $*
    DOSKEY tree=eza -T $*
)

WHERE /Q fastfetch && (
    DOSKEY ff=fastfetch $*
)
