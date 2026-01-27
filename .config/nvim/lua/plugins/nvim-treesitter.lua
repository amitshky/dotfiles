-- treesitter (syntax highlighting; builds syntax trees)
return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  opts = {
    ensure_installed = { "c", "lua", "markdown", "vimdoc" },
    auto_install = true,
    highlight = { enable = true },
  },
}
