echo -e "${BLUE}Installing apk packages...${NORMAL}"
# shellcheck disable=2086
$CHEZ_SUDO apk add $PACKAGES
echo -e "${GREEN}Packages installed successfully.${NORMAL}"
