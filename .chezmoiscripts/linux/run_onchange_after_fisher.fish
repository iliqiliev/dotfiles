echo -e $BLUE"Installing fisher plugins..."$NORMAL

if not fish_version_check 3 4 0
    echo -e $RED"Fish version is older than 3.4, aborting."$NORMAL >&2
    exit 0
end

if not type --query "fisher"
    echo -e $BLUE"Fisher is not installed. Installing it first..."$NORMAL

    if not eval $CHEZ_FETCH https://git.io/fisher | source
        echo -e $RED"Fisher install failed."$NORMAL >&2
        exit 0
    end

    echo -e $GREEN"Fisher installed successfully."$NORMAL
end

fisher update > /dev/null
and echo -e $GREEN"Installed $(count (fisher list)) fish plugins."$NORMAL
