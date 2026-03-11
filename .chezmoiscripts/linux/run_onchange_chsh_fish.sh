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
    echo -e "${GREEN}Shell changed to fish sucessfully.${NORMAL}"
    exit 0
fi

if grep --quiet "fish$" /etc/passwd; then
    echo -e "${GREEN}Fish already default. Will not change it.${NORMAL}"
    exit 0
fi

FISH_SHELL=$(grep "fish$" /etc/shells)

if [ -z "$FISH_SHELL" ]; then
    echo -e "${RED}Fish shell is not available as valid login shell.${NORMAL}"

    if command -v fish >/dev/null; then
        echo -e "${YELLOW}It is installed but not listed in '/etc/shells'.${NORMAL}"
    else
        echo -e "${RED}It is not installed.${NORMAL}"
    fi

    exit 0
fi

if ! $FISH_SHELL --version | grep --quiet "[4-9]\.[0-9]\.[0-9]"; then
    echo -e "${RED}$($FISH_SHELL --version) is older than version 4.0.0, aborting.${NORMAL}"
    exit 0
fi

# allows chsh to work with unset $USER
# shellcheck disable=2086
$CHEZ_SUDO chsh --shell "$FISH_SHELL" $USER
echo -e "${GREEN}Shell changed to fish sucessfully.${NORMAL}"
