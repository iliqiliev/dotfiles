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
BASE_URL="github.com/fish-shell/fish-shell/releases/"
FISH_URL="${BASE_URL}/${FISH_VERSION}/fish-${FISH_VERSION}-linux-${ARCH}.tar.xz"

$CHEZ_FETCH "$FISH_URL" | tar --extract --xz >"$HOME"/.local/bin/fish
