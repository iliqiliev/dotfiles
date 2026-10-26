# `./conf.d` is loaded first.

# Add directories to `PATH`.
fish_add_path \
    $HOME/.local/share/mise/shims \
    $HOME/.local/bin \
    /var/lib/flatpak/exports/bin


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
