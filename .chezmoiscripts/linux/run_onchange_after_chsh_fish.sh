echo -e "${BLUE}Changing default shell to fish...${NORMAL}"

if ! command -v chsh >/dev/null; then
    echo -e "${RED}chsh command not found. Cannot change default shell.${NORMAL}"
    exit 0
fi

if [ "$CHEZ_DISTRO" == "android" ]; then
    if readlink .termux/shell | grep --quiet "fish"; then
        echo -e "${GREEN}Fish already default. Will not change it.${NORMAL}"
        exit 0
    fi

    yes fish | chsh >/dev/null
    echo -e "${GREEN}Shell changed to fish successfully.${NORMAL}"
    exit 0
fi

if grep --quiet "fish$" /etc/passwd; then
    echo -e "${GREEN}Fish already default. Will not change it.${NORMAL}"
    exit 0
fi

FISH_SHELL=/usr/bin/fish

if ! grep --fixed-strings --line-regexp --quiet $FISH_SHELL /etc/shells; then
    echo -e "${RED}Fish shell is not available as valid login shell.${NORMAL}"

    if command -v fish >/dev/null; then
        echo -e "${YELLOW}It is installed but not listed in '/etc/shells'.${NORMAL}"
    else
        echo -e "${RED}It is not installed.${NORMAL}"
    fi

    exit 0
fi

if ! fish_version_check 4 0 0 "$FISH_SHELL"; then
    fish_version="$($FISH_SHELL --version 2>&1)"
    echo -e "${RED}${fish_version} is older than version 4.0.0, aborting.${NORMAL}"
    exit 0
fi

$CHEZ_SUDO chsh --shell "$FISH_SHELL" >/dev/null
echo -e "${GREEN}Shell changed to $FISH_SHELL successfully.${NORMAL}"
