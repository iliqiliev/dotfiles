if test ! -r ~/.local/share/blesh/ble.sh; then
    return
fi

# shellcheck source=/dev/null
source ~/.local/share/blesh/ble.sh

ble-sabbrev cz="chezmoi"
ble-sabbrev ff="fastfetch"
ble-sabbrev fp="flatpak"
ble-sabbrev sc= "systemctl"
ble-sabbrev scu="systemctl --user"
ble-sabbrev ssc="sudo systemctl"
