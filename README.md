My dotfiles that are suitable for everyone! It's mostly sane defaults, nothing crazy.

# Installation:

## With `chezmoi` installed:
```console
chezmoi init --apply iliqiliev
```

## With any _POSIX_ shell or `fish`:
- Using `curl`:
  ```sh
  sh -c "$(curl -L iliqiliev.me/dotfiles)"
  ```
- Using `wget`:
  ```sh
  sh -c "$(wget -O- iliqiliev.me/dotfiles)"
  ```

## With `PowerShell`:
```ps1
Set-ExecutionPolicy -Scope CurrentUser RemoteSigned
iex "&{$(irm get.chezmoi.io/ps1)} -BinDir ~/.local/bin -- init --apply iliqiliev"
```

# Helpful Links:
- [chezmoi](https://chezmoi.io)
- [chezmoi user guide](https://www.chezmoi.io/user-guide/command-overview)
- [chezmoi reference](https://www.chezmoi.io/reference)
