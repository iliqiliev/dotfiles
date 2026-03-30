#!/usr/bin/env fish

echo "$(set_color blue)Installing fisher plugins...$(set_color normal)"

if not type --query "fisher"
    echo "$(set_color red)Fisher is not installed. Aborting...$(set_color normal)"
    exit 0
end

# Making fisher adopt itself
contains -- jorgebucaran/fisher $_fisher_plugins
or set --universal --append _fisher_plugins jorgebucaran/fisher

fisher update > /dev/null || exit 1
echo "$(set_color green)Installed $(count (fisher list)) fish plugins.$(set_color normal)"
