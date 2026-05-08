if test ! -r ~/.local/share/blesh/ble.sh; then
    return
fi

# shellcheck source=/dev/null
if ! source ~/.local/share/blesh/ble.sh; then
    return
fi

ble-sabbrev cz="chezmoi"
ble-sabbrev ff="fastfetch"
ble-sabbrev fp="flatpak"
ble-sabbrev sc="systemctl"
ble-sabbrev scu="systemctl --user"
ble-sabbrev ssc="sudo systemctl"
