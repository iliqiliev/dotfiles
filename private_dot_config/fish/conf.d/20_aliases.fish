alias ccopy  "fish_clipboard_copy"
alias cpaste "fish_clipboard_paste"

if command --query adb
    alias adb "HOME=$XDG_DATA_HOME/android command adb"
end

if command --query bat
    alias cat "bat"
end

if command --query eza
    alias ls "eza"
    alias tree "eza -T"
end

if command --query fdfind
    alias fd "fdfind"
end

if command --query wget
    alias wget "wget --hsts-file='$XDG_STATE_HOME/wget-hsts'"
end
