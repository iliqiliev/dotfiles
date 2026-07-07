# `./conf.d` is loaded first.

# Fish version < 2.3 does not load `./conf.d`.
if not set --query FISH_LOCAL_UPGRADE
    source ~/.config/fish/conf.d/00_upgrade.fish
end

# Disabling fish_greeting.
set --export fish_greeting
# Disable automatic activation of `mise` vendor_conf.d script.
set --export MISE_FISH_AUTO_ACTIVATE 0

# Add directories to `PATH`.
fish_add_path \
    $HOME/.local/bin \
    $HOME/.local/share/mise/shims \
    /var/lib/flatpak/exports/bin

# Set and configure default pager.
set --export PAGER less
set --export LESS "-FMRXix4 --mouse --use-color --wheel-lines=3"

# Set `EDITOR` and related variables if `neovim` is installed.
if command --query nvim
    set --export EDITOR nvim
    set --export MANPAGER nvim +Man!
    set --export VIMRUNTIME (nvim --clean --headless --cmd 'echo $VIMRUNTIME|q' 2>&1)
end

# Source configs for interactive sessions.
if status is-interactive
    # Ignore warnings: old `starship` warns about unknown keys in config file.
    set --export STARSHIP_LOG error
    command --query starship; and starship init fish | source
    command --query zoxide; and zoxide init fish | source
end
