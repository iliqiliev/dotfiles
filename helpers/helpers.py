"""Helper functions."""

from subprocess import DEVNULL, Popen, run

from rich import print as rich_print


def restart_explorer() -> None:
    """Restart `explorer.exe`."""
    rich_print("[bright_blue]Restarting 'explorer.exe' ...", end=" ")
    run(("TASKKILL", "/F", "/IM", "explorer.exe"), check=True, stdout=DEVNULL)
    Popen("explorer.exe")
    rich_print("[bright_green]Done.")
