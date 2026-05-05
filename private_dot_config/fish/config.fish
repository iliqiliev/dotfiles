# conf.d is loaded first

# Upgrade fish version < 2.3 (does not load conf.d)
if not set --query FISH_LOCAL_UPGRADE
    source ~/.config/fish/conf.d/00_upgrade.fish
end

# Disabling fish_greeting
set --export fish_greeting

# Add directories to PATH
fish_add_path $HOME/.local/bin /var/lib/flatpak/exports/bin/

# Set neovim as EDITOR if available
command --query nvim; and set --export EDITOR nvim

# Source configs for interactive sessions
if status is-interactive
    # Silence warnings about unknown keys in config file on old starship versions
    set --export STARSHIP_LOG error
    command --query starship; and starship init fish | source
    command --query zoxide; and zoxide init fish | source
end
