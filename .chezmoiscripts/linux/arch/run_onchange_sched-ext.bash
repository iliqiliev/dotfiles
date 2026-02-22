if systemctl is-active --quiet scx_loader; then
    echo -e "${GREEN}Sched_ext is already configured.${NORMAL}"
    exit 0
fi

echo -e "${BLUE}Installing Sched_ext...${NORMAL}"
$CHEZ_SUDO pacman -S --needed --noconfirm scx-tools

cat <<'EOF' | $CHEZ_SUDO tee /etc/scx_loader.toml >/dev/null
default_sched = "scx_lavd"
default_mode = "Gaming"

[scheds.scx_bpfland]
auto_mode = []
gaming_mode = []
lowlatency_mode = ["-m", "performance", "-w"]
powersave_mode = ["-s", "20000", "-m", "powersave", "-I", "100", "-t", "100"]
server_mode = ["-s", "20000", "-S"]

[scheds.scx_rusty]
auto_mode = []
gaming_mode = []
lowlatency_mode = []
powersave_mode = []
server_mode = []

[scheds.scx_p2dq]
auto_mode = []
gaming_mode = ["--task-slice", "true", "-f", "--sched-mode", "performance"]
lowlatency_mode = ["-y", "-f", "--task-slice", "true"]
powersave_mode = ["--sched-mode", "efficiency"]
server_mode = ["--keep-running"]

[scheds.scx_rustland]
auto_mode = []
gaming_mode = []
lowlatency_mode = []
powersave_mode = []
server_mode = []

[scheds.scx_beerland]
auto_mode = []
gaming_mode = []
lowlatency_mode = []
powersave_mode = []
server_mode = []

[scheds.scx_flash]
auto_mode = []
gaming_mode = ["-m", "all"]
lowlatency_mode = ["-m", "performance", "-w", "-C", "0"]
powersave_mode = ["-m", "powersave", "-I", "10000", "-t", "10000", "-s", "10000", "-S", "1000"]
server_mode = ["-m", "all", "-s", "20000", "-S", "1000", "-I", "-1", "-D", "-L"]

[scheds.scx_tickless]
auto_mode = []
gaming_mode = ["-f", "5000", "-s", "5000"]
lowlatency_mode = ["-f", "5000", "-s", "1000"]
powersave_mode = ["-f", "50"]
server_mode = ["-f", "100"]

[scheds.scx_lavd]
auto_mode = []
gaming_mode = ["--performance"]
lowlatency_mode = ["--performance"]
powersave_mode = ["--powersave"]
server_mode = []

[scheds.scx_cosmos]
auto_mode = ["-s", "20000", "-d", "-c", "0", "-p", "0"]
gaming_mode = ["-c", "0", "-p", "0"]
lowlatency_mode = ["-m", "performance", "-c", "0", "-p", "0", "-w"]
powersave_mode = ["-m", "powersave", "-d", "-p", "5000"]
server_mode = ["-s", "20000"]
EOF

echo -e "${BLUE}Starting and enabling Sched_ext...${NORMAL}"
$CHEZ_SUDO systemctl enable --now scx_loader
echo -e "${GREEN}Sched_ext installed sucessfully.${NORMAL}"
