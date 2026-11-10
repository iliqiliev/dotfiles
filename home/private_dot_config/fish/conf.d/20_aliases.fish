if command --query bat
    alias cat bat
end

if command --query eza
    alias ls "eza --hyperlink=auto"
    alias tree "eza --tree --hyperlink=auto"
end

if command --query fd
    alias fd "fd --hyperlink=auto"
end

if test "$TERM" = xterm-kitty
    alias ssh "kitten ssh"
end
