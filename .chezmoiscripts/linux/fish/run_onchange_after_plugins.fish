#!/usr/bin/env fish

echo -e $BLUE"Installing fisher plugins..."$NORMAL

if not type --query "fisher"
    echo -e $RED"Fisher is not installed. Aborting..."$NORMAL
    exit 0
end

# Making fisher adopt itself
contains -- jorgebucaran/fisher $_fisher_plugins
or set --universal --append _fisher_plugins jorgebucaran/fisher

fisher update > /dev/null
and echo -e $GREEN"Installed $(count (fisher list)) fish plugins."$NORMAL
