return {
  {
    "williamboman/mason.nvim",
    config = function()
      require('mason').setup({
        registries = {
          'github:mason-org/mason-registry',
          'github:crashdummyy/mason-registry',
        },
      })
    end
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    dependencies = { "williamboman/mason.nvim" },
    config = function()
      require("mason-tool-installer").setup({
        ensure_installed = {
          -- LSPs
          "lua-language-server",
          "clangd",
          "bash-language-server",
          "python-lsp-server",
          -- "emmet-language-server",
          -- "html-lsp",
          -- "vtsls",
          -- "css-lsp",

          -- Formatters
          -- "prettier", -- JS/TS/HTML/CSS/JSON/Markdown/YAML
          "stylua",   -- Lua
          "black",    -- Python

          -- Linters
          -- "eslint_d",
        },
        auto_update = false, -- update installed tools automatically
        run_on_start = true, -- check & install on startup
      })
    end,
  },
}
