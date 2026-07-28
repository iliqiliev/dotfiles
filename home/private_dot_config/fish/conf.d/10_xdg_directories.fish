set --export XDG_CACHE_HOME $HOME/.cache
set --export XDG_CONFIG_HOME $HOME/.config
set --export XDG_DATA_HOME $HOME/.local/share
set --export XDG_STATE_HOME $HOME/.local/state
set --export XDG_DESKTOP_DIR $HOME/Desktop
set --export XDG_DOWNLOAD_DIR $HOME/Downloads
set --export XDG_DOCUMENTS_DIR $HOME/Documents
set --export XDG_MUSIC_DIR $HOME/Music
set --export XDG_PICTURES_DIR $HOME/Pictures
set --export XDG_VIDEOS_DIR $HOME/Videos

set --export --path XDG_DATA_DIRS /usr/share /usr/local/share /var/lib/flatpak/exports/share $XDG_DATA_HOME/flatpak/exports/share
set --export --path XDG_CONFIG_DIRS /etc/xdg

if not set --query XDG_RUNTIME_DIR
    set --export XDG_RUNTIME_DIR $XDG_CACHE_HOME
end

# $XDG_RUNTIME_DIR
set --export TMPDIR $XDG_RUNTIME_DIR

# $XDG_CACHE_HOME
set --export NUGET_PACKAGES $XDG_CACHE_HOME/NuGetPackages
set --export RUFF_CACHE_DIR $XDG_CACHE_HOME/ruff
set --export PYTHONPYCACHEPREFIX $XDG_CACHE_HOME/python

# $XDG_CONFIG_HOME
set --export NPM_CONFIG_USERCONFIG $XDG_CONFIG_HOME/npm/npmrc

# $XDG_DATA_HOME
set --export ANDROID_USER_HOME $XDG_DATA_HOME/android
set --export ANDROID_EMULATOR_HOME $XDG_DATA_HOME/android
set --export ANDROID_SDK_HOME $XDG_DATA_HOME/android
set --export ANDROID_SDK_ROOT $XDG_DATA_HOME/android
set --export ADB_VENDOR_KEYS $XDG_DATA_HOME/android
set --export CARGO_HOME $XDG_DATA_HOME/cargo
set --export GNUPGHOME $XDG_DATA_HOME/gnupg
set --export KODI_DATA $XDG_DATA_HOME/kodi
set --export RUSTUP_HOME $XDG_DATA_HOME/rustup
set --export TERMINFO $XDG_DATA_HOME/terminfo
set --export --path TERMINFO_DIRS $TERMINFO /usr/share/terminfo
set --export WINEPREFIX $XDG_DATA_HOME/wine

# $XDG_STATE_HOME
set --export HISTFILE $XDG_STATE_HOME/bash/history
set --export LESSHISTFILE $XDG_STATE_HOME/less/history
set --export PYTHON_HISTORY $XDG_STATE_HOME/python_history

if command --query wget
    alias wget "wget --hsts-file=$XDG_STATE_HOME/wget-hsts"
end

if command --query adb
    mkdir --parents $XDG_DATA_HOME/android
    alias adb "HOME=$XDG_DATA_HOME/android command adb"
end
