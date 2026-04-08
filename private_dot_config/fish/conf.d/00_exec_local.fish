# If the system fish shell version is too old and there one available
# at ~/.local/bin/fish, exec it as to not break the system fish shell
# with the syntax of the config files made for the newer fish versions

if set --query __FISH_BREAK_RECURSION
    exit # break infinite recursion
end

set --export FISH_LOCAL_UPGRADE 1
set __FISH_BREAK_RECURSION 1
set fish_path (readlink /proc/(echo %self)/exe)

if ~/.local/bin/fish_version 4 0 0 $fish_path
    exit # current fish version is good enough
end

set args (cat /proc/(echo %self)/cmdline | string split0)
set args[1] ~/.local/bin/fish

exec $args
