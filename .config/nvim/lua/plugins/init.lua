-- keep other miscellaneous plugins here
-- these plugins will get included in lazy's config
-- see https://lazy.folke.io/usage/structuring
return {
  { "tpope/vim-sleuth" }, -- Detect tabstop and shiftwidth automatically

  -- treesitter (syntax highlighting; builds syntax trees)
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    opts = {
      ensure_installed = { "c", "lua", "markdown", "markdown_inline" },
      auto_install = true,
      highlight = { enable = true },
    },
  },
}
