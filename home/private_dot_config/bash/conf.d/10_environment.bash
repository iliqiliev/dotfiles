if test -v ENVIRONMENT_D_SOURCED; then
    # Skip if `environment.d` was already loaded.
    return
fi

set -o allexport # Export sourced variables.

for file in ~/.config/environment.d/*.conf; do
    # shellcheck source=/dev/null
    source -- "$file"
done
unset file

set +o allexport
