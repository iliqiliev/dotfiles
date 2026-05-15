My dotfiles that are suitable for everyone! It's mostly sane defaults, nothing crazy.

<a href="https://codeberg.org/iliqiliev/dotfiles">
  <img alt="Get it on Codeberg" src="helpers/readme/codeberg_banner_dark.svg" height="60px">
</a>
<a href="https://github.com/iliqiliev/dotfiles">
  <img alt="Get it on GitHub" src="helpers/readme/github_banner_dark.png" height="60px">
</a>

# Installation:

## With `chezmoi` installed:
```console
chezmoi init --apply iliqiliev --depth 1
```

## With any **Linux** shell:
- Using `curl`:
  ```sh
  curl -L iliqiliev.me/dotfiles | sh
  ```
- Using `wget`:
  ```sh
  wget -O- iliqiliev.me/dotfiles | sh
  ```

## With `PowerShell`:
```ps1
irm iliqiliev.me/dotfiles.ps1 | iex
```

# Helpful Links:
- [chezmoi user guide](https://www.chezmoi.io/user-guide/command-overview)
- [chezmoi reference](https://www.chezmoi.io/reference)
