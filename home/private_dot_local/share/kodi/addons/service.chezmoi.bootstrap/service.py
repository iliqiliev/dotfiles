from __future__ import annotations

from json import dumps as json_dumps

from xbmc import LOGINFO, executeJSONRPC, log
from xbmcaddon import Addon


def json_rpc(method: str, params: dict[str, str | bool] | None = None) -> None:
    payload = json_dumps(
        {
            "jsonrpc": "2.0",
            "id": 1,
            "method": method,
            "params": params or {},
        }
    )

    executeJSONRPC(payload)


def allow_unknown_sources() -> None:
    """Allow installing addons from ZIP files."""
    json_rpc(
        method="Settings.SetSettingValue",
        params={"setting": "addons.unknownsources", "value": True},
    )


ADDON_ID = Addon().getAddonInfo("id")


if __name__ == "__main__":
    log(f"[{ADDON_ID}] Started.", LOGINFO)
    allow_unknown_sources()
    log(f"[{ADDON_ID}] Finished.", LOGINFO)
