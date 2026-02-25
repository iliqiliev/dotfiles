echo -e $BLUE"Setting up fisher..."$NORMAL

if not type --query "fisher"
    if not curl -sL git.io/fisher | source
        echo -e $RED"Fisher install failed."$NORMAL >&2
        exit 0
    end
end

echo -e $BLUE"Installing fish plugins..."$NORMAL
fisher update > /dev/null

echo -e $GREEN"Installed $(count (fisher list)) fish plugins."$NORMAL
