# This file is also used by bash, so it only uses syntax both shells support.

command -v bat >/dev/null && alias cat="bat"
command -v eza >/dev/null && alias ls="eza --hyperlink=auto"
command -v eza >/dev/null && alias tree="eza --tree --hyperlink=auto"
command -v fd >/dev/null && alias fd="fd --hyperlink=auto"
test "$TERM" = xterm-kitty && alias ssh="kitten ssh"
