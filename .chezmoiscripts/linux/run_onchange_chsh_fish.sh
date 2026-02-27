echo -e "${BLUE}Changing default shell to fish...${NORMAL}"

if ! command -v chsh >/dev/null; then
    echo -e "${RED}chsh command not found. Cannot change default shell.${NORMAL}"
    exit 0
fi

if [ "$CHEZ_DISTRO" == "android" ]; then
    if readlink .termux/shell | grep -q "fish"; then
        echo -e "${GREEN}Fish already default. Will not change it.${NORMAL}"
        exit 0
    fi

    yes fish | chsh >/dev/null
    echo -e "${GREEN}Shell changed to fish sucessfully.${NORMAL}"
    exit 0
fi

if grep -q "fish$" /etc/passwd; then
    echo -e "${GREEN}Fish already default. Will not change it.${NORMAL}"
    exit 0
fi

if [ ! -f /usr/bin/fish ]; then
    echo -e "${RED}Fish shell is not installed.${NORMAL}"
    exit 0
fi

#shellcheck disable=2086
$CHEZ_SUDO chsh --shell /usr/bin/fish $USER
echo -e "${GREEN}Shell changed to fish sucessfully.${NORMAL}"
