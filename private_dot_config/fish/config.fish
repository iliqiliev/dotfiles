# conf.d is loaded first

if not set --query FISH_LOCAL_UPGRADE; and status --is-interactive
    source ~/.config/fish/conf.d/00_exec_local.fish
end

# Disabling fish greeting
set --export fish_greeting

# Add directories to PATH
fish_add_path $HOME/.local/bin /var/lib/flatpak/exports/bin/

command --query nvim
and set --export EDITOR nvim

# Source configs for interactive sessions
if status is-interactive

    command --query starship
    and starship init fish | source

    command --query zoxide
    and string length --quiet $__fish_data_dir
    and zoxide init fish | source

end

# subconfig is loaded last
for file in $__fish_config_dir/subconfig/*.fish
    source $file
end
