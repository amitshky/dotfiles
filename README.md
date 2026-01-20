# dotfiles
dot files for linux

## Requirements
- [stow](https://www.gnu.org/software/stow/)

## Usage
This will create symlinks in the parent directory for all the files in the repo.
```sh
stow .
```

This will override the conflicting config files in the repo.
```sh
stow --adopt .
```
