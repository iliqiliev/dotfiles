if ! command -v xdg-mime >/dev/null; then
    exit 0
fi

xdg-mime install ~/.local/share/applications/zed-notepad.desktop
xdg-mime default zed-notepad.desktop text/plain
