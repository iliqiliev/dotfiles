if grep -q "fish$" /etc/passwd; then
    exit 0
fi

echo "Changing default shell to fish."

if [ ! -f /usr/bin/fish ]; then
    echo "Fish shell file not found."
    exit 0
fi

$CHEZ_SUDO chsh --shell /usr/bin/fish "$USER"
