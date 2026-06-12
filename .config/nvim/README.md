# nvimConfig
Neovim config file locations
- linux: `~/.config/nvim/`
- windows: `%USERPROFILE%/AppData/Local/nvim/`

## Pre-requisites
- [Neovim (v0.11 or higher)](https://github.com/neovim/neovim/blob/master/INSTALL.md)

These need to be installed for some of the plugins to work
- [fd](https://github.com/sharkdp/fd)
- [ripgrep](https://github.com/BurntSushi/ripgrep)

These need to be installed for the LSPs to be automatically installed:
- [nodejs](https://nodejs.org/en/download)
    - [npm](https://docs.npmjs.com/cli/v9/configuring-npm/install?v=true)
- [unzip](https://archlinux.org/packages/?name=unzip) (for linux; required by `clangd` to be installed automatically)
- [python](https://www.python.org/downloads/)
    - pip
    - venv

### NOTE

These are LSPs that get installed automatically through [Mason](https://github.com/williamboman/mason.nvim?tab=readme-ov-file#commands).
- [clangd](https://clangd.llvm.org/installation#installing-clangd)
- [lua_ls](https://luals.github.io/#neovim-install)
- [bashls](https://github.com/bash-lsp/bash-language-server)
- [pylsp](https://github.com/python-lsp/python-lsp-server)


## Configuring multiple nvim instances
- if your `.config` directory looks like this:
```
.config/
├── nvim/
│   ├── init.lua
├── nvim-minimal/
│   └── init.lua
```
- then you can open `nvim` with nvim-minimal config like this:
```
NVIM_APPNAME=nvim-minimal nvim
// OR
nvim --clean -u ~/.config/nvim-minimal/init.lua
```

## LSP Configuration
See `:help lspconfig-all` and search for the specific lsp to configure it.
