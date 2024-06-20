# Setting XDG Base Directories
# System
set -x XDG_DATA_DIRS /usr/share /usr/local/share
set -x XDG_CONFIG_DIRS /etc/xdg

# User
set -x XDG_CACHE_HOME $HOME/.cache
set -x XDG_CONFIG_HOME $HOME/.config
set -x XDG_DATA_HOME $HOME/.local/share
set -x XDG_DESKTOP_DIR $HOME/Desktop
set -x XDG_DOWNLOAD_DIR $HOME/Downloads
set -x XDG_DOCUMENTS_DIR $HOME/Documents
set -x XDG_MUSIC_DIR $HOME/Music
set -x XDG_PICTURES_DIR $HOME/Pictures
set -x XDG_VIDEOS_DIR $HOME/Videos

# Cleaning up the home directory using the XDG standart
set -x ANDROID_USER_HOME "$XDG_DATA_HOME"/android
set -x ADB_VENDOR_KEYS "$XDG_DATA_HOME"/android
set -x HISTFILE "$XDG_STATE_HOME"/bash/history
set -x CARGO_HOME "$XDG_DATA_HOME"/cargo
set -x GNUPGHOME "$XDG_DATA_HOME"/gnupg
set -x GTK2_RC_FILES "$XDG_CONFIG_HOME"/gtk-2.0/gtkrc
set -x LESSHISTFILE "$XDG_STATE_HOME"/less/history
set -x WINEPREFIX "$XDG_DATA_HOME"/wine
set -x NUGET_PACKAGES "$XDG_CACHE_HOME"/NuGetPackages
set -x TMPDIR "$XDG_RUNTIME_DIR"

# Environment variables
set -x EDITOR micro
set -x BROWSER firefox
set -x RUSTICL_ENABLE radeonsi # enables rusticl opnencl driver
set -x VDPAU_DRIVER radeonsi
set -x LIBVA_DRIVER_NAME radeonsi

# Abbreviations
abbr s "sudo" 
abbr sc "systemctl"
abbr ssc "sudo systemctl"
abbr scu "systemctl --user"
abbr m "micro"
abbr config_fish "$EDITOR $HOME/.config/fish/config.fish"
abbr ssd "sudo smartctl -a /dev/nvme0"
abbr fp "flatpak"
abbr ff "fastfetch"
abbr update "yay && flatpak update && flatpak remove --unused"

# Aliases (Different from Abbreviations)
alias adb "HOME="$XDG_DATA_HOME"/android command adb"

# Adding directories to $PATH
fish_add_path "/home/iliq/.local/bin" "/var/lib/flatpak/exports/bin/"


