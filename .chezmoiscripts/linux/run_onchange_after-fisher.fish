if not type --query "fisher"
    echo -e $BLUE"Installing fisher..."$NORMAL

    if not curl -sL git.io/fisher | source
        echo -e $RED"Fisher install failed."$NORMAL >&2
        exit 0
    end

    echo -e $GREEN"Fisher installed successfully."$NORMAL
end

echo -e $BLUE"Installing fisher plugins..."$NORMAL
fisher update > /dev/null
and echo -e $GREEN"Installed $(count (fisher list)) fish plugins."$NORMAL
