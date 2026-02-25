echo -e "${BLUE}Changing default shell to fish...${NORMAL}"

if [ "$CHEZ_DISTRO" == "android" ]; then
    yes fish | chsh
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

$CHEZ_SUDO chsh --shell /usr/bin/fish "$USER"
echo -e "${GREEN}Shell changed to fish sucessfully.${NORMAL}"
