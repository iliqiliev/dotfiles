"""Helper functions."""

import tomllib
from os import environ as env
from os import pathsep
from pathlib import Path
from shlex import split as shlex_split
from subprocess import DEVNULL, CompletedProcess, Popen
from subprocess import PIPE as PIPE  # Re-exported.
from subprocess import run as subprocess_run
from typing import Literal, TypedDict

import typeguard
from rich.console import Console
from rich.theme import Theme
from typeguard import CollectionCheckStrategy, check_type, typechecked

typeguard.config.collection_check_strategy = CollectionCheckStrategy.ALL_ITEMS

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


@typechecked
def path_add(*paths: Path, mode: Literal["append", "prepend"] = "prepend") -> None:
    """Add `paths` to `PATH`, skipping the ones already in it."""
    old_paths = env["PATH"].strip(pathsep).split(pathsep)
    new_paths = (str(path) for path in paths if str(path) not in old_paths)

    if mode == "prepend":
        all_paths: tuple[str, ...] = (*new_paths, *old_paths)
    else:
        all_paths: tuple[str, ...] = (*old_paths, *new_paths)

    env["PATH"] = pathsep.join(all_paths)


def restart_explorer() -> None:
    """Restart `explorer.exe`."""
    fmt("[info]Restarting [i]explorer.exe[/] ...", end=" ")
    run("TASKKILL /F /IM explorer.exe", out=DEVNULL)
    Popen("explorer.exe")
    fmt("[good]OK")


@typechecked
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
        else:
            args.extend(shlex_split(part))

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


chezmoi_config = tomllib.loads(Path(env["CHEZMOI_CONFIG_FILE"]).read_text("utf-8"))

CHEZMOI_DATA = check_type(chezmoi_config["data"], ChezmoiData)
SUDO = CHEZMOI_DATA["sudo"]
