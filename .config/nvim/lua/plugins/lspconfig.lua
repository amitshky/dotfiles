return {
  'neovim/nvim-lspconfig',
  dependencies = {
    'saghen/blink.cmp',
  },
  config = function()
    local lspconfig = require('lspconfig')
    local cap = require('blink.cmp').get_lsp_capabilities()

    lspconfig.lua_ls.setup({
      capabilities = cap
    })

    lspconfig.clangd.setup({
      capabilities = cap,
      cmd = {
        "clangd",
        "--background-index",
        "--clang-tidy",
        "--header-insertion=never",
        "--completion-style=detailed",
        "--function-arg-placeholders=0",
        "--fallback-style=llvm",
        "--log=verbose",
      },
    })

    lspconfig.bashls.setup({
      capabilities = cap
    })

    lspconfig.pylsp.setup({
      capabilities = cap
    })

    -- lspconfig.emmet_language_server.setup({
    --   capabilities = cap
    -- })
    --
    -- lspconfig.html.setup({
    --   capabilities = cap
    -- })
    --
    -- lspconfig.vtsls.setup({
    --   capabilities = cap
    -- })
    --
    -- lspconfig.cssls.setup({
    --   capabilities = cap
    -- })
  end,
}
