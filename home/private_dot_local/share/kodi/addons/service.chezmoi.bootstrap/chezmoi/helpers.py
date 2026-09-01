"""Kodi helper functions for Chezmoi bootstrap."""

from json import dumps as json_dumps
from json import loads as json_loads
from pathlib import Path
from sqlite3 import connect as sqlite3_connect
from typing import Literal

from xbmc import (
    LOGDEBUG,
    LOGERROR,
    LOGINFO,
    LOGWARNING,
    executebuiltin,
    executeJSONRPC,
    log,
)
from xbmcaddon import Addon
from xbmcgui import DLG_YESNO_YES_BTN, Dialog

type KodiSettingsValue = list[str] | str | int | bool


ADDON = Addon()
ADDON_ID = ADDON.getAddonInfo("id")
ADDON_NAME = ADDON.getAddonInfo("name")


def install_missing_addons() -> bool:
    kodi_log("Installing missing addons ...")

    deps_addons = kodi_get_addon_dependencies()
    repo_addons = kodi_get_addons(installed="all")

    missing_addons = deps_addons - kodi_get_addons()

    if not missing_addons:
        kodi_log("All addon dependencies are already installed.")
        return True

    missing_repo_addons = (deps_addons & repo_addons) - kodi_get_addons()

    for addon in sorted(missing_repo_addons):
        kodi_log(f"Trying to install '{addon}' automatically ...")
        executebuiltin(f"InstallAddon({addon})", wait=True)

    missing_external_addons = (deps_addons - repo_addons) - kodi_get_addons()

    for addon in sorted(missing_external_addons):
        kodi_log(f"Trying to install '{addon}' manually ...")

        if not Dialog().yesno(
            heading=f"{ADDON_NAME} - Missing Addon",
            message=f"Do you want to install [B]{addon}[/B]?",
            defaultbutton=DLG_YESNO_YES_BTN,
        ):
            kodi_log("Skipping file picker.")
            return False

        Dialog().notification(
            heading="Choose this file:",
            message=f"[B]Chezmoi/{addon}.zip[/B]",
            time=10000,  # [ms]
        )

        kodi_log("Opening file picker ...")
        executebuiltin("InstallFromZip", wait=True)

        kodi_log("File picker closed.")
        executebuiltin("Dialog.Close(notification)", wait=True)

    still_missing_addons = deps_addons - kodi_get_addons()

    if still_missing_addons:
        kodi_log(f"{len(still_missing_addons)} addon(s) are still missing.")
        return False

    return True


def kodi_configure_db_myvideos(
    db: Path,
    path: str,
    content: Literal["movies", "tvshows"],
    scraper: str,
) -> None:

    parameters = {
        "strPath": path,
        "strContent": content,
        "strScraper": scraper,
        "scanRecursive": 2**31 - 1,  # Kodi sets this value by default.
    }

    kodi_log(f"Configuring '{path}' ...")

    with sqlite3_connect(db, autocommit=True) as connection:
        existing = connection.execute(  # sql
            "SELECT idPath FROM path WHERE strPath == :strPath;",
            parameters,
        )

        if existing.fetchone() is not None:
            kodi_log(f"'{path}' is already configured.")
            return

        connection.execute(  # sql
            """INSERT INTO path (strPath, strContent, strScraper, scanRecursive)
               VALUES (:strPath, :strContent, :strScraper, :scanRecursive);""",
            parameters,
        )


def kodi_get_addon_dependencies(addon_id: str = ADDON_ID) -> set[str]:
    response = kodi_rpc(
        method="Addons.GetAddonDetails",
        params={"addonid": addon_id, "properties": ["dependencies"]},
    )
    response_dict = json_loads(response)

    dependencies: set[str] = {
        dependency["addonid"]
        for dependency in response_dict["result"]["addon"]["dependencies"]
    }
    dependencies.discard("xbmc.python")

    return dependencies


def kodi_get_addons(installed: bool | Literal["all"] = True) -> set[str]:
    response = kodi_rpc("Addons.GetAddons", {"installed": installed})
    kodi_log(f"Addons.GetAddons(installed={installed})='{response}'", LOGDEBUG)

    response_dict = json_loads(response)
    return {addon["addonid"] for addon in response_dict["result"]["addons"]}


def kodi_log(message: str, level: int = LOGINFO) -> None:
    log(f"[{ADDON_ID}] {message}", level)


def kodi_rpc(method: str, params: dict[str, KodiSettingsValue]) -> str:
    payload = json_dumps(
        {
            "jsonrpc": "2.0",
            "id": 1,
            "method": method,
            "params": params,
        }
    )

    return executeJSONRPC(payload)


def kodi_set_setting(
    key: str,
    value: KodiSettingsValue,
) -> bool:
    response = kodi_rpc("Settings.SetSettingValue", {"setting": key, "value": value})
    kodi_log(f"Settings.SetSettingValue({key}={value})='{response}'", LOGDEBUG)

    response_dict = json_loads(response)
    call_signature = f"Settings.SetSettingValue({key}={value})"

    if isinstance(result := response_dict.get("result"), bool):
        if result is False:
            kodi_log(f"{call_signature}: failed", LOGWARNING)

        return result

    if error := response_dict.get("error"):
        kodi_log(f"{call_signature}: {error}", LOGERROR)
        return False

    kodi_log(f"{call_signature}: unexpected RPC response", LOGWARNING)
    return False
