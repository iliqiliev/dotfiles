# Setting XDG Base Directories
# User
set --export XDG_CACHE_HOME    $HOME/.cache
set --export XDG_CONFIG_HOME   $HOME/.config
set --export XDG_DATA_HOME     $HOME/.local/share
set --export XDG_STATE_HOME    $HOME/.local/state
set --export XDG_DESKTOP_DIR   $HOME/Desktop
set --export XDG_DOWNLOAD_DIR  $HOME/Downloads
set --export XDG_DOCUMENTS_DIR $HOME/Documents
set --export XDG_MUSIC_DIR     $HOME/Music
set --export XDG_PICTURES_DIR  $HOME/Pictures
set --export XDG_VIDEOS_DIR    $HOME/Videos

# System
set --export XDG_DATA_DIRS /usr/share /usr/local/share /var/lib/flatpak/exports/share $XDG_DATA_HOME/flatpak/exports/share
set --export XDG_CONFIG_DIRS /etc/xdg

# Cleaning up the home directory according to the XDG standard
set --export TMPDIR                $XDG_RUNTIME_DIR
set --export NUGET_PACKAGES        $XDG_CACHE_HOME/NuGetPackages
set --export ANDROID_USER_HOME     $XDG_DATA_HOME/android
set --export ANDROID_EMULATOR_HOME $XDG_DATA_HOME/android
set --export ANDROID_SDK_HOME      $XDG_DATA_HOME/android
set --export ANDROID_SDK_ROOT      $XDG_DATA_HOME/android
set --export ADB_VENDOR_KEYS       $XDG_DATA_HOME/android
set --export CARGO_HOME            $XDG_DATA_HOME/cargo
set --export GNUPGHOME             $XDG_DATA_HOME/gnupg
set --export WINEPREFIX            $XDG_DATA_HOME/wine
set --export HISTFILE              $XDG_STATE_HOME/bash/history
set --export LESSHISTFILE          $XDG_STATE_HOME/less/history
set --export PYTHON_HISTORY        $XDG_STATE_HOME/python_history
set --export fish_greeting

alias adb "HOME=$XDG_DATA_HOME/android command adb"

if command --quiet eza
    alias ls="eza"
    alias tree="eza --all --tree"
end

if command --quiet bat
    alias cat="bat --paging=never --style=plain"
end

if command --quiet micro
    set --export EDITOR micro
end

if grep --quiet --no-messages amdgpu /proc/modules
    set --export RUSTICL_ENABLE radeonsi # enables rusticl opnencl driver
    set --export VDPAU_DRIVER radeonsi
    set --export LIBVA_DRIVER_NAME radeonsi
end

# [zoxide](https://github.com/ajeetdsouza/zoxide)
if command --quiet zoxide  
    zoxide init fish | source
end

# Abbreviations
abbr config_fish "$EDITOR $HOME/.config/fish/config.fish"
abbr sc "systemctl"
abbr ssc "sudo systemctl"
abbr scu "systemctl --user"
abbr fp "flatpak"
abbr ff "fastfetch"

# Adding directories to $PATH
fish_add_path $HOME/.local/bin /var/lib/flatpak/exports/bin/


