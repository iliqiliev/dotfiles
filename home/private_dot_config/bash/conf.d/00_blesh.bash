# Source `ble.sh` if available.
if test -r ~/.local/share/mise/installs/blesh/ble.sh; then
    # shellcheck source=/dev/null
    source -- ~/.local/share/mise/installs/blesh/ble.sh
fi
