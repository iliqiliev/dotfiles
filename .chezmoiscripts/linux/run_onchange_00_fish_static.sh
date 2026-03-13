if fish_version_check 4 0 0 2>/dev/null; then
    exit 0
else
    FISH_VERSION_STATUS=$?
fi

if [ $FISH_VERSION_STATUS -eq 127 ]; then
    echo -e "${BLUE}Fish shell is not installed. Installing static build...${NORMAL}"
else
    echo -e "${BLUE}Fish shell version is too old. Installing static build...${NORMAL}"
fi

FISH_VERSION=4.5.0
ARCH=$(uname --machine)
BASE_URL="https://github.com/fish-shell/fish-shell/releases/download"
FISH_URL="${BASE_URL}/${FISH_VERSION}/fish-${FISH_VERSION}-linux-${ARCH}.tar.xz"
FISH_LOCAL_PATH="$HOME/.local/bin/fish"

echo -e "${BLUE}Downloading from '${FISH_URL}' ...${NORMAL}"

$CHEZ_FETCH "$FISH_URL" | tar --extract --xz >"$FISH_LOCAL_PATH"
chmod +x "$FISH_LOCAL_PATH"

echo -e "${GREEN}Fish static installed to '${FISH_LOCAL_PATH}' successfully.${NORMAL}"
