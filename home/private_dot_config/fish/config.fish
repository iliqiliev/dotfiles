# `./conf.d` is loaded first.

# Add directories to `PATH`.
fish_add_path \
    $HOME/.local/share/mise/shims \
    $HOME/.local/bin \
    /var/lib/flatpak/exports/bin

# Source configs for interactive sessions.
if status is-interactive
    env starship init fish 2>/dev/null | source
    env zoxide init fish 2>/dev/null | source
end
