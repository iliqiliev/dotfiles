# apt packages hash: {{ .packages.apt | toString | sha256sum }}

echo -e "${BLUE}Syncing apt database...${NORMAL}"
$CHEZ_SUDO apt update -y

AVAILABLE_PACKAGES=$(
    #shellcheck disable=1012,2140
    comm -12 \
        <(apt-cache pkgnames | sort) \
        <(echo "{{ join "\n" .packages.apt }}" | sort)
)

echo -e "${BLUE}Installing apt packages...${NORMAL}"
$CHEZ_SUDO apt install -y "$AVAILABLE_PACKAGES"
echo -e "${GREEN}Packages installed sucessfully.${NORMAL}"
