from xbmc import Monitor, executebuiltin
from xbmcaddon import Addon


def is_installed(addon_id: str) -> bool:
    try:
        Addon(addon_id)
        return True
    except RuntimeError:
        return False


ELEMENTUM_REPO_ID = "repository.elementumorg"

ELEMENTUM_ADDONS = [
    "plugin.video.elementum",
    "script.elementum.burst",
    "context.elementum",
]


def main() -> None:
    """Installs Elementum addons."""
    monitor = Monitor()

    monitor.waitForAbort(3)
    executebuiltin("UpdateAddonRepos")
    monitor.waitForAbort(3)

    for addon_id in filter(lambda addon: not is_installed(addon), ELEMENTUM_ADDONS):
        executebuiltin(f"InstallAddon({addon_id})")
        monitor.waitForAbort(3)


if __name__ == "__main__":
    main()
