# Load `environment.d` if it was not.
if set --query ENVIRONMENT_D_SOURCED
    return
end

cat ~/.config/environment.d/*.conf \
    # Transform  `${NAME}` into `$NAME`, which fish understands.
    | string replace --regex --all '[$]{(\w+)}' '$$$1' \
    # Transform `NAME="value"` into `set --global --export NAME "value"`,
    | string replace --regex '^(\w+)=' 'set --global --export $1 ' \
    # Source the transformed contents.
    | source
