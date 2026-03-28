echo -e "${BLUE}Changing default shell to fish...${NORMAL}"

if [[ $SHELL =~ fish$ ]] || grep --quiet "${FISH_SHELL}$" /etc/passwd; then
    echo -e "${GREEN}Fish already default. Will not change it.${NORMAL}"
    exit 0
fi

if ! command -v fish >/dev/null; then
    echo -e "${RED}Fish shell is not installed. Aborting.${NORMAL}"
    exit 0
fi

if ! command -v chsh >/dev/null; then
    echo -e "${RED}'chsh' command not found. Cannot change default shell.${NORMAL}"
    exit 0
fi

FISH_SHELL=/usr/bin/fish

if test "$CHEZ_DISTRO" = "android"; then
    yes fish | chsh >/dev/null
    echo -e "${GREEN}Shell changed to fish successfully.${NORMAL}"
    exit 0
fi

if ! grep --fixed-strings --line-regexp --quiet $FISH_SHELL /etc/shells; then
    echo -e "${RED}Fish shell is installed but not listed in '/etc/shells'.${NORMAL}"
    exit 0
fi

if ! fish_version 4 0 0 "$FISH_SHELL"; then
    fish_version="$($FISH_SHELL --version 2>&1)"
    echo -e "${RED}${fish_version} is older than version 4.0.0, aborting.${NORMAL}"
    exit 0
fi

chsh --shell "$FISH_SHELL" >/dev/null
echo -e "${GREEN}Shell changed to $FISH_SHELL successfully.${NORMAL}"
