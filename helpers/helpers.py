"""Helper functions."""

from pathlib import Path
from shutil import which
from subprocess import DEVNULL, Popen, run

from rich import print as rich_print


def is_busybox(utility: str) -> bool:
    if (utility_path := which(utility)) is None:
        raise FileNotFoundError(f"'{utility}' is not installed.")

    if (busybox_path := which("busybox")) is None:
        return False

    utility_path_resolved = Path(utility_path).resolve()
    busybox_path_resolved = Path(busybox_path).resolve()

    return utility_path_resolved == busybox_path_resolved


def restart_explorer() -> None:
    """Restart `explorer.exe`."""
    rich_print("[bright_blue]Restarting 'explorer.exe' ...", end=" ")
    run(("TASKKILL", "/F", "/IM", "explorer.exe"), check=True, stdout=DEVNULL)
    Popen("explorer.exe")
    rich_print("[bright_green]Done.")
