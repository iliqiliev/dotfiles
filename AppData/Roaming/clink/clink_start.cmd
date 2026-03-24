@ECHO OFF

WHERE /Q bat && DOSKEY cat=bat $*

WHERE /Q eza && (
    DOSKEY ls=eza $*
    DOSKEY ll=eza -l $*
    DOSKEY la=eza -la $*
    DOSKEY tree=eza -T $*
)
