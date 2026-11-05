if command --query bat
    alias cat bat
end

if command --query eza
    alias ls "eza --hyperlink"
    alias tree "eza --tree"
end

if test "$TERM" = xterm-kitty
    alias ssh "kitten ssh"
end
