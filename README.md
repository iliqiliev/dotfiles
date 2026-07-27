[![ShellCheck](https://github.com/iliqiliev/dotfiles/actions/workflows/shellcheck.yml/badge.svg)](https://github.com/iliqiliev/dotfiles/actions/workflows/shellcheck.yaml)

My dotfiles that are suitable for everyone! It's mostly sane defaults, nothing crazy.

<a href="https://codeberg.org/iliqiliev/dotfiles">
  <img alt="Get it on Codeberg." src="helpers/readme/codeberg_banner_dark.svg" height="60px">
</a>
<a href="https://github.com/iliqiliev/dotfiles">
  <img alt="Get it on GitHub." src="helpers/readme/github_banner_dark.png" height="60px">
</a>

# Installation:

## With `chezmoi` installed:

```console
chezmoi init --apply iliqiliev --depth 1
```

## With any **Linux** shell:

- Using `curl`:
  ```sh
  curl -L iliq.org/dotfiles | sh
  ```
- Using `wget`:
  ```sh
  wget -O- iliq.org/dotfiles | sh
  ```

## With `PowerShell`:

```ps1
irm iliq.org/dotfiles.ps1 | iex
```

# Helpful Links:

- [chezmoi user guide](https://www.chezmoi.io/user-guide/command-overview)
- [chezmoi reference](https://www.chezmoi.io/reference)
