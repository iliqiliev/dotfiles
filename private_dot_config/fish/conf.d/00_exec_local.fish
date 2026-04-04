# If the system fish shell version is too old and there one available
# at ~/.local/bin/fish, exec it as to not break the system fish shell
# with the syntax of the config files made for the newer fish versions

if set --query FISH_EXEC_LOCAL
    exit # break infinite recursion
end

set FISH_LOCAL ~/.local/bin/fish
set _fish_pid %self
set fish_path (readlink /proc/$_fish_pid/exe)

if ~/.local/bin/fish_version 4 0 0 $fish_path
    exit # current fish version is good enough
end

set --export FISH_EXEC_LOCAL 1
exec ~/.local/bin/fish; or exit 1
