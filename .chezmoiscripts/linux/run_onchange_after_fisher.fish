echo -e $BLUE"Installing fisher plugins..."$NORMAL

if not type --query "fisher"
    echo -e $RED"Fisher is not installed. Aborting..."$NORMAL
    exit 0
end

fisher update > /dev/null
and echo -e $GREEN"Installed $(count (fisher list)) fish plugins."$NORMAL
