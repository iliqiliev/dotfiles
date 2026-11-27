function yazi() {
    local tmp cwd
    tmp="$(mktemp -t "yazi-cwd-file.XXXXXX")"
    command yazi "$@" --cwd-file="$tmp"

    IFS= read -r -d '' cwd <"$tmp"
    test "$cwd" != "$PWD" &&
        builtin cd -- "$cwd" || true

    command rm -f -- "$tmp"
}
