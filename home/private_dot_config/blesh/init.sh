# Mimic behaviour of fish so that existing abbreviations can be used.
function abbr() {
    local KEY="$1"
    local VALUE="$2"
    # https://github.com/akinomyoga/ble.sh/wiki/Manual-%C2%A77-Completion#user-content-sec-sabbrev
    ble-sabbrev "$KEY"="$VALUE"
}

# Set abbreviations.
# shellcheck source=private_dot_config/fish/conf.d/30_abbreviations.fish
source ~/.config/fish/conf.d/30_abbreviations.fish

# Expand abbreviations if they are the only input.
bleopt edit_magic_accept=sabbrev:verify-syntax

# Disable highlighting based on filenames.
bleopt highlight_filename=
