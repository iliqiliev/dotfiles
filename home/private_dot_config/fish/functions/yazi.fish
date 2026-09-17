function yazi
    set tmp (mktemp -t "yazi-cwd-file.XXXXXX")
    command yazi $argv --cwd-file="$tmp"

    read -z cwd <"$tmp"
    and test "$cwd" != "$PWD"
    and builtin cd -- "$cwd"

    command rm -f -- "$tmp"
end
