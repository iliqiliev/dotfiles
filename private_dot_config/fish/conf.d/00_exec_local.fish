# If the system fish shell version is too old and there one available
# at ~/.local/bin/fish, exec it as to not break the system fish shell
# with the syntax of the config files made for the newer fish versions

if set --query __FISH_BREAK_RECURSION
    exit # break infinite recursion
end

set --export FISH_LOCAL_UPGRADE 1
set __FISH_BREAK_RECURSION 1

# if build-info is available, the fish version is >= 4.0.0
if status build-info 1>/dev/null 2>/dev/null
    exit
end

set args (cat /proc/(echo %self)/cmdline | tr "\0" "\n" | tail -n +2)

exec ~/.local/bin/fish $args
