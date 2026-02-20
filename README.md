My dotfiles that are suitable for everyone! It's mostly sane defaults, nothing crazy.

# Installation:
With `chezmoi` installed:
```console
chezmoi init --apply iliqiliev
```
or with any _POSIX_ shell or `fish`:
```sh
# with curl
sh -c "$(curl -L iliqiliev.me/dotfiles)"
# with wget
sh -c "$(wget -qO- iliqiliev.me/dotfiles)"
```
or with `PowerShell`:
```ps1
Set-ExecutionPolicy -Scope CurrentUser RemoteSigned
iex "&{$(irm get.chezmoi.io/ps1)} -BinDir '~/.local/bin' init --apply iliqiliev"
```
