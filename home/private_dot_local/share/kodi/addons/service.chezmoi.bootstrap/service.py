from xbmc import executebuiltin
from xbmcaddon import Addon


def is_installed(addon_id: str) -> bool:
    try:
        Addon(addon_id)
        return True
    except RuntimeError:
        return False


ADDONS = [
    "plugin.video.elementum",
    "script.elementum.burst",
    "context.elementum",
]


def main() -> None:
    executebuiltin("UpdateAddonRepos")

    for addon_id in filter(lambda addon: not is_installed(addon), ADDONS):
        executebuiltin(f"InstallAddon({addon_id})")


if __name__ == "__main__":
    main()
