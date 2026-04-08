# conf.d is loaded first

# Upgrade fish version if < 2.3 (doesn't load conf.d)
if not set --query FISH_LOCAL_UPGRADE; and status --is-interactive
    source ~/.config/fish/conf.d/00_exec_local.fish
end

# Disabling fish greeting
set --export fish_greeting

# Add directories to PATH
fish_add_path $HOME/.local/bin /var/lib/flatpak/exports/bin/

# Set neovim as EDITOR if available
command --query nvim; and set --export EDITOR nvim

# Source configs for interactive sessions
if status is-interactive
    command --query starship; and starship init fish | source
    command --query zoxide; and zoxide init fish | source
end
