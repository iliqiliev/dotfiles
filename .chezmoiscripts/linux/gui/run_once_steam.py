#!/usr/bin/env -S uv run --script
#
# /// script
# requires-python = ">=3.9"
# dependencies = ["vdf"]
# ///

from pathlib import Path

from vdf import dump, parse

PERSONAL_ID3 = "460410354"
CS2 = "730"
KCD2 = "1771300"


class DefaultDict(dict[str, "str | DefaultDict"]):
    def __missing__(self, key: str):
        empty_dict = DefaultDict()
        self[key] = empty_dict
        return empty_dict


localconfigs: set[Path] = set()

for steam_root in (
    Path("~/.local/share/Steam").expanduser(),
    Path("~/.var/app/com.valvesoftware.Steam/data/Steam").expanduser(),
):
    localconfigs.update(steam_root.glob("userdata/*/config/localconfig.vdf"))

for path in localconfigs:
    with open(path) as localconfig:
        parsed_vdf = parse(localconfig, mapper=DefaultDict)

    id3 = path.parent.parent.name
    system = parsed_vdf["UserLocalConfigStore"]["System"]
    apps = parsed_vdf["UserLocalConfigStore"]["Software"]["Valve"]["Steam"]["apps"]

    system["InGameOverlayScreenshotHotKey"] = "KEY_NONE"
    system["InGameOverlayShortcutKey"] = "Ctrl\tShift\tKEY_TAB"

    language = "-language 'Bulgarian'" if id3 == PERSONAL_ID3 else ""
    apps[CS2]["LaunchOptions"] = f"gamemoderun %command% {language}".strip()

    apps[KCD2]["LaunchOptions"] = "gamemoderun %command%"

    with open(path, "w") as localconfig:
        dump(parsed_vdf, localconfig, pretty=True)
