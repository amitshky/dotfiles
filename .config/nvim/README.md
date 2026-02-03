# nvimConfig
Neovim config file locations
- linux: `~/.config/nvim/`
- windows: `%USERPROFILE%/AppData/Local/nvim/`

> **NOTE:** change `run_on_start` to `true` if you want to automatically install some LSP

## Pre-requisites
- [Neovim (v0.11 or higher)](https://github.com/neovim/neovim/blob/master/INSTALL.md)

LSPs that need to be installed (these can be installed through Mason too (which is installed in this config) (see [Mason Readme](https://github.com/williamboman/mason.nvim?tab=readme-ov-file#commands))):
- [clangd](https://clangd.llvm.org/installation#installing-clangd)
- [luals](https://luals.github.io/#neovim-install)
- [bashls](https://github.com/bash-lsp/bash-language-server)
- [pylsp](https://github.com/python-lsp/python-lsp-server)
- [emmet_language_server](https://github.com/olrtg/emmet-language-server)
- [html](https://github.com/microsoft/vscode-html-languageservice)
- [vtsls](https://github.com/yioneko/vtsls)
- [cssls](https://github.com/hrsh7th/vscode-langservers-extracted)

These are OPTIONAL:
- [fd](https://github.com/sharkdp/fd)
- [ripgrep](https://github.com/BurntSushi/ripgrep)

NOTE: checkout `newconfig` branch for new configuration files

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
