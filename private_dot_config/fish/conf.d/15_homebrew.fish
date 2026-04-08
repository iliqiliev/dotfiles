if not test -x /home/linuxbrew/.linuxbrew/bin/brew
    exit
end

eval (/home/linuxbrew/.linuxbrew/bin/brew shellenv fish)
set --export --append --path fish_complete_path \
    /home/linuxbrew/.linuxbrew/share/fish/vendor_completions.d/
