if not test -x /home/linuxbrew/.linuxbrew/bin/brew
    exit
end

set HOMEBREW_PREFIX /home/linuxbrew/.linuxbrew

$HOMEBREW_PREFIX/bin/brew shellenv fish | source
source $HOMEBREW_PREFIX/Homebrew/Library/Homebrew/command-not-found/handler.fish

set --export --append --path fish_complete_path \
    $HOMEBREW_PREFIX/share/fish/vendor_completions.d
