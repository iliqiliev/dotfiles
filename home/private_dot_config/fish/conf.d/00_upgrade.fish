# If the system fish shell version is too old and there one available
# at ~/.local/bin/fish, exec it as to not break the system fish shell
# with the syntax of the config files made for the newer fish versions

set --query FISH_LOCAL_UPGRADE; and exit
set --export FISH_LOCAL_UPGRADE 1

# if fish version is >= 4.0.0
if test (echo $FISH_VERSION | awk -F '.' '{print $1}') -ge 4
    exit
end

set args (cat /proc/(echo %self)/cmdline | tr "\0" "\n" | tail -n +2)

exec ~/.local/bin/fish $args
