if systemctl list-unit-files scx_loader.service &>/dev/null; then
    exit 0
fi

$CHEZ_SUDO pacman -S --needed --noconfirm scx-scheds scx-tools
$CHEZ_SUDO cp "$CHEZMOI_SOURCE_DIR"/.data/scx_loader.toml /etc/scx_loader.toml
$CHEZ_SUDO systemctl enable --now scx_loader.service
