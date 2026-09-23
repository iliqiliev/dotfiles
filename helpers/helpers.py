"""Helper functions."""

from json import loads as json_loads
from pathlib import Path
from shlex import split as shlex_split
from shutil import which
from subprocess import DEVNULL, PIPE, CompletedProcess, Popen
from subprocess import run as subprocess_run
from typing import Any, Literal

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
    args: list[str | Path] = []

    for part in filter(None, cmd):
        if isinstance(part, Path):
            args.append(part)
        elif isinstance(part, str):
            args.extend(shlex_split(part))
        else:
            raise TypeError

    return subprocess_run(
        args=args,
        check=check,
        input=input,
        stdout=out,
        stderr=err,
        text=True,
    )


def sudo_cache() -> None:
    if SUDO == "":
        return

    if SUDO == "false":
        raise PermissionError

    if not run("sudo -n true", check=False, err=DEVNULL).returncode:
        return

    rich_print("[bright_blue]Caching sudo credentials ...[/]")
    run("sudo -v")
    rich_print("[bright_green]Sudo credentials cached.[/]")


cmd = "chezmoi data --format json"
CHEZMOI_DATA: dict[str, Any] = json_loads(run(cmd, out=PIPE).stdout)
cmd = "chezmoi execute-template '{{ template `packages` .}}'"
CHEZMOI_PACKAGES: set[str] = set(run(cmd, out=PIPE).stdout.split())

SUDO: Literal["", "false", "sudo"] = CHEZMOI_DATA.get("sudo", "sudo")
