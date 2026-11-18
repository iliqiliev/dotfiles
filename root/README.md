# Special Files

This directory contains files that `chezmoi` cannot normally manage.  
They are placed using scripts in `home/.chezmoiscripts`

- `./etc` - Files that require root access.
  Files ending in `.tmpl` are rendered with `chezmoi`'s and placed without the suffix.
- `./home/$USER` - Home-relative files that are placed behind a symlink.
