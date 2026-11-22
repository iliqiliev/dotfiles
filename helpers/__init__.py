"""Helper functions."""

import tomllib
from os import environ as env
from pathlib import Path
from shlex import split as shlex_split
from subprocess import DEVNULL, PIPE, CompletedProcess, Popen
from subprocess import run as subprocess_run
from typing import Literal, TypedDict

from rich.console import Console
from rich.theme import Theme
from typeguard import check_type

console = Console(
    theme=Theme(
        {
            "fail": "bright_red",
            "good": "bright_green",
            "info": "bright_blue",
            "warn": "bright_yellow",
        }
    )
)


def fmt(message: str, end: str = "\n") -> None:
    console.print(message, end=end)


def restart_explorer() -> None:
    """Restart `explorer.exe`."""
    fmt("[info]Restarting [i]explorer.exe[/] ...", end=" ")
    run("TASKKILL /F /IM explorer.exe", out=DEVNULL)
    Popen("explorer.exe")
    fmt("[good]OK")


def run(
    *cmd: str | Path | None,
    check: bool = True,
    input: str | None = None,
    out: int | None = None,
    err: int | None = None,
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

    fmt("[info]Caching sudo credentials ...")
    run("sudo -v")
    fmt("[good]Sudo credentials cached.")


class ChezmoiData(TypedDict):
    """The `[data]` section of the `chezmoi` config."""

    os: Literal["linux", "windows"]
    distro: str
    isPersonal: bool
    isWork: bool
    email: str
    name: str
    sudo: Literal["", "false", "sudo"]
    productName: str
    manageGui: bool
    manageGnome: bool


CHEZMOI_CONFIG = tomllib.loads(Path(env["CHEZMOI_CONFIG_FILE"]).read_text("utf-8"))
CHEZMOI_DATA = check_type(CHEZMOI_CONFIG["data"], ChezmoiData)
SUDO = CHEZMOI_DATA["sudo"]

cmd = "chezmoi execute-template '{{ template `packages` .}}'"
CHEZMOI_PACKAGES: set[str] = set(run(cmd, out=PIPE).stdout.split())
