"""Helper functions."""

from pathlib import Path
from shlex import split as shlex_split
from shutil import which
from subprocess import DEVNULL, CompletedProcess, Popen
from subprocess import run as subprocess_run

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
    rich_print("[bright_blue]Restarting [i]explorer.exe[/] ...[/]", end=" ")
    run("TASKKILL /F /IM explorer.exe", out=DEVNULL)
    Popen("explorer.exe")
    rich_print("[bright_green]Done.[/]")


def run(
    *cmd: str | Path | None,
    check: bool = True,
    input: str | None = None,
    out: int | None = True,
    err: int | None = True,
) -> CompletedProcess[str]:
    args: list[str] = []

    for part in filter(None, cmd):
        args.extend(shlex_split(str(part)))

    return subprocess_run(
        args=args,
        check=check,
        input=input,
        stdout=out,
        stderr=err,
        text=True,
    )
