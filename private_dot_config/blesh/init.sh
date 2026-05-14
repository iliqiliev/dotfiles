# Set abbreviations.
# See https://github.com/akinomyoga/ble.sh/wiki/Manual-%C2%A77-Completion#user-content-sec-sabbrev
ble-sabbrev cz="chezmoi"
ble-sabbrev ff="fastfetch"
ble-sabbrev fp="flatpak"
ble-sabbrev sc="systemctl"
ble-sabbrev scu="systemctl --user"
ble-sabbrev ssc="sudo systemctl"

# Expand abbreviations if they are the only input.
bleopt edit_magic_accept=sabbrev:verify-syntax

# Disable highlighting based on filenames.
bleopt highlight_filename=
