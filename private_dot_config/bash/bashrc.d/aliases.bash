if command -v bat >/dev/null; then
    alias cat="bat"
fi

alias ll="ls -l"
alias la="ls -la"

if command -v eza >/dev/null; then
    alias ls="eza"
    alias tree="eza -T"
fi
