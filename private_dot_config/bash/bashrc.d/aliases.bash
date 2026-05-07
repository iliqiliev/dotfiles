alias ll="ls -l"
alias la="ls -la"

if command -v bat >/dev/null; then
    alias cat="bat"
fi

if command -v chezmoi >/dev/null; then
    alias cz="chezmoi"
fi

if command -v eza >/dev/null; then
    alias ls="eza"
    alias tree="eza -T"
fi

if command -v fastfetch >/dev/null; then
    alias ff="fastfetch"
fi
