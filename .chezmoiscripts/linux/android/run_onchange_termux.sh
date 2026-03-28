echo -e "${BLUE}Setting up Termux storage...${NORMAL}"

if ! command -v termux-setup-storage >/dev/null; then
    echo -e "${RED}'termux-setup-storage' command not found.${NORMAL}"
    exit 0
fi

termux-setup-storage

echo -e "${GREEN}Termux storage setup successfully.${NORMAL}"
