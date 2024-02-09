if status is-interactive # Commands to run in interactive sessions can go here

    # Cleaning up the home directory using the XDG standart
    set -gx ANDROID_USER_HOME "$XDG_DATA_HOME"/android
    set -gx ADB_VENDOR_KEYS "$XDG_DATA_HOME"/android
    set -gx HISTFILE "$XDG_STATE_HOME"/bash/history
    set -gx CARGO_HOME "$XDG_DATA_HOME"/cargo
    set -gx GNUPGHOME "$XDG_DATA_HOME"/gnupg
    set -gx GTK2_RC_FILES "$XDG_CONFIG_HOME"/gtk-2.0/gtkrc
    set -gx LESSHISTFILE "$XDG_STATE_HOME"/less/history
    set -gx WINEPREFIX "$XDG_DATA_HOME"/wine
    set -gx NUGET_PACKAGES "$XDG_CACHE_HOME"/NuGetPackages
    set -gx TMPDIR "$XDG_RUNTIME_DIR"

    #Aliases (Different from Abbreviations)
    alias adb "HOME="$XDG_DATA_HOME"/android command adb"

    # Environment variables
    set -gx EDITOR micro
    set -gx BROWSER firefox
    set -gx MANGOHUD 1

    # Abbreviations (Similar to aliases)
    abbr s "sudo" 
    abbr sc "systemctl"
    abbr ssc "sudo systemctl"
    abbr scu "systemctl --user"
    abbr m "micro"
    abbr config_fish "$EDITOR $HOME/.config/fish/config.fish"
    abbr ssd "sudo smartctl -a /dev/nvme0"
    abbr fp "flatpak"
    abbr ff "fastfetch"

    # Adding directories to $PATH
    fish_add_path "/home/iliq/.local/bin"
    
end
