alias ccopy fish_clipboard_copy
alias cpaste fish_clipboard_paste

if command --query bat
    alias cat bat
end

if command --query eza
    alias ls eza
    alias tree "eza -T"
end

if command --query fdfind
    alias fd fdfind
end
