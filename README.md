My dotfiles that are suitable for everyone! It's mostly sane defaults, nothing crazy.

<a href="https://codeberg.org/iliqiliev/dotfiles">
  <img alt="Get it on Codeberg" src="data/readme/codeberg_banner_dark.svg" height="60px">
</a>
<a href="https://github.com/iliqiliev/dotfiles">
  <img alt="Get it on GitHub" src="data/readme/github_banner_dark.png" height="60px">
</a>

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
iex "&{$(irm get.chezmoi.io/ps1)} -b ~/.local/bin init --apply iliqiliev"
```

# Helpful Links:
- [chezmoi user guide](https://www.chezmoi.io/user-guide/command-overview)
- [chezmoi reference](https://www.chezmoi.io/reference)
