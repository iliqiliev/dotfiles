echo -e "${BLUE}Syncing apt database...${NORMAL}"
$CHEZ_SUDO apt update -y
echo -e "${GREEN}Apt database synced successfully.${NORMAL}"

AVAILABLE_PACKAGES=$(
    comm -12 \
        <(apt-cache pkgnames | sort) \
        <(echo "$PACKAGES" | tr " " "\n")
)

echo -e "${BLUE}Installing apt packages...${NORMAL}"
# shellcheck disable=2086
$CHEZ_SUDO apt install -y $AVAILABLE_PACKAGES
echo -e "${GREEN}Packages installed successfully.${NORMAL}"
