# dotfiles
dot files for linux

## Cloning
```sh
git clone --recurse-submodules https://github.com/amitshky/dotfiles
```
- you can also configure to push changes in submodule along with main
```sh
git config push.recurseSubmodules on-demand
```

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
