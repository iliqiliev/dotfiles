# If the system `fish` version is too old and does not support
# the syntax used in the plugin files
# then `fish` will break and spam the terminal with error messages.

set --query FISH_LOCAL_UPGRADE; and exit
set FISH_LOCAL_UPGRADE 1

# $FISH_VERSION >= 4.0.0
test (echo $FISH_VERSION | awk -F '.' '{print $1}') -ge 4; and exit

set args (cat /proc/(echo %self)/cmdline | tr "\0" "\n" | tail -n +2)

exec ~/.local/bin/fish $args 2>&1
