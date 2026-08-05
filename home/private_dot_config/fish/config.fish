# `./conf.d` is loaded first.

# Fish version < 2.3 does not load `./conf.d`.
if not set --query FISH_LOCAL_UPGRADE
    source ~/.config/fish/conf.d/00_upgrade.fish
end

# Add directories to `PATH`.
fish_add_path \
    $HOME/.local/bin \
    $HOME/.local/share/mise/shims \
    /var/lib/flatpak/exports/bin

# `less` variables.
set --export PAGER less
set --export LESS "-FMRXix4 --mouse --use-color --wheel-lines=3"

# `neovim` variables.
if command --query nvim
    set --export EDITOR nvim
    set --export MANPAGER nvim +Man!
    set --export SUDO_EDITOR (command --search nvim)
end

# Source configs for interactive sessions.
if status is-interactive
    env starship init fish 2>/dev/null | source
    env zoxide init fish 2>/dev/null | source
end
