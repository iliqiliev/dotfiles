My dotfiles that are suitable for everyone! It's mostly sane defaults, nothing crazy.

# Installation:
With `chezmoi` installed:
```console
chezmoi init --apply iliqiliev
```
or with any _POSIX_ shell or `fish`:
```sh
sh -c "$(curl -L iliqiliev.me/dotfiles)"
```
or with `PowerShell`:
```ps1
iex "&{$(irm 'https://get.chezmoi.io/ps1')} -BinDir '~/.local/bin' init --apply 'iliqiliev'"
```
