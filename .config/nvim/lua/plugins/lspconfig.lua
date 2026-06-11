return {
  {
    "neovim/nvim-lspconfig",
    dependencies =
    {
      "saghen/blink.cmp",
    },
    config = function()
      local cap =
          require("blink.cmp")
          .get_lsp_capabilities()

      vim.lsp
          .config("lua_ls", { capabilities = cap })

      vim.lsp
          .config("clangd",
            {
              capabilities = cap,
              cmd =
              {
                "clangd",
                "--background-index",
                "--clang-tidy",
              },
            })

      vim.lsp.config("bashls", { capabilities = cap })
      vim.lsp
          .config("pylsp", { capabilities = cap })

      vim.lsp.enable({ "lua_ls", "clangd", "bashls", "pylsp" })
    end,
  },
}
