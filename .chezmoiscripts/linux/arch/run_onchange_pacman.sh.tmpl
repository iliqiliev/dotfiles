# packages.yaml hash: {{ .packages.pacman | toString | sha256sum }}

function add_chaotic_aur() {
    CHAOTIC_KEY="3056513887B78AEB"
    CHAOTIC_CDN="https://cdn-mirror.chaotic.cx/chaotic-aur/"

    echo -e "${BLUE}Installing Chaotic-AUR...${NORMAL}"
    $CHEZ_SUDO pacman-key --init

    $CHEZ_SUDO pacman-key --recv-key $CHAOTIC_KEY --keyserver keyserver.ubuntu.com
    $CHEZ_SUDO pacman-key --lsign-key $CHAOTIC_KEY

    $CHEZ_SUDO pacman -U --noconfirm $CHAOTIC_CDN/chaotic-{keyring,mirrorlist}.pkg.tar.zst

    cat <<'EOF' | $CHEZ_SUDO tee --append /etc/pacman.conf >/dev/null

[chaotic-aur]
Include = /etc/pacman.d/chaotic-mirrorlist
EOF

    $CHEZ_SUDO pacman -Sy --noconfirm
    echo -e "${GREEN}Chaotic-AUR installed succesfully.{NORMAL}"

    echo -e "${BLUE}Installing Yay AUR helper...${NORMAL}"
    $CHEZ_SUDO pacman -S --needed --noconfirm yay
    echo -e "${GREEN}Yay installed sucessfully.${NORMAL}"
}

echo -e "${BLUE}Syncing pacman database...${NORMAL}"
$CHEZ_SUDO pacman -Syu --noconfirm

echo -e "${BLUE}Installing pacman packages...${NORMAL}"
#shellcheck disable=1083
$CHEZ_SUDO pacman -S --needed --noconfirm {{ join " " .packages.pacman }}
echo -e "${GREEN}Packages installed sucessfully.${NORMAL}"

if grep --quiet "chaotic-aur" /etc/pacman.conf; then
    echo -e "${GREEN}Chaotic-AUR is already installed.${NORMAL}"
    exit 0
fi

echo -e "$BLUE"
read -p "Install Chaotic-AUR? [y/N]: " -r -s -N 1 CHAOTIC_REPLY
echo -e "$NORMAL"
case ${CHAOTIC_REPLY,,} in
y) add_chaotic_aur ;;
*) echo -e "${RED}Skipping Chaotic-AUR installation.{NORMAL}" ;;
esac
