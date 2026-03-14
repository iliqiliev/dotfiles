# Disabling fish greeting
set --export fish_greeting

# Setting User XDG Base Directories
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

# Setting System XDG Base Directories
set --export --path XDG_DATA_DIRS /usr/share /usr/local/share /var/lib/flatpak/exports/share $XDG_DATA_HOME/flatpak/exports/share
set --export --path XDG_CONFIG_DIRS /etc/xdg

if not set --query XDG_RUNTIME_DIR
    set --export XDG_RUNTIME_DIR $XDG_CACHE_HOME
end

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


if grep --quiet --no-messages amdgpu /proc/modules
    set --export RUSTICL_ENABLE radeonsi
    set --export LIBVA_DRIVER_NAME radeonsi
end

if command --query nvim
    set --export EDITOR nvim
end

if command --query starship
    starship init fish | source
end

if command --query zoxide && string length --quiet $__fish_data_dir
    zoxide init fish | source
end


fish_add_path $HOME/.local/bin /var/lib/flatpak/exports/bin/
