#!/usr/bin/env -S uv run --script
#
# /// script
# dependencies = ["vdf"]
# ///
from pathlib import Path

from vdf import dump, parse

PERSONAL_ID3 = "460410354"
CS2 = "730"
KCD2 = "1771300"


localconfigs: set[Path] = set()

roots = [
    Path.home() / ".local/share/Steam",  #                        # native
    Path.home() / ".var/app/com.valvesoftware.Steam/data/Steam",  # flatpak
]

for root in roots:
    localconfigs.update(root.glob("userdata/*/config/localconfig.vdf"))


for path in localconfigs:
    id3 = path.parent.parent.name

    with open(path) as local_config:
        parsed_vdf = parse(local_config)

    system = parsed_vdf["UserLocalConfigStore"]["system"]
    system["InGameOverlayShortcutKey"] = "Ctrl\tShift\tKEY_TAB"

    apps = parsed_vdf["UserLocalConfigStore"]["Software"]["Valve"]["Steam"]["apps"]
    language = "-language 'Bulgarian'" if id3 == PERSONAL_ID3 else ""

    apps[CS2]["LaunchOptions"] = f"gamemoderun %command% {language}".strip()
    apps[KCD2]["LaunchOptions"] = "gamemoderun %command%"

    with open(path, "w") as local_config:
        dump(parsed_vdf, local_config, pretty=True)
