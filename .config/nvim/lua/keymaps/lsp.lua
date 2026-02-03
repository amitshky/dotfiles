-- on lsp attach
vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    local lsp_client = vim.lsp.get_client_by_id(args.data.client_id)
    -- if lsp is not found
    if not lsp_client then
      return
    end

    -- if its a lua file
    if vim.bo.filetype == "lua" then
      -- format current buffer on save
      vim.api.nvim_create_autocmd('BufWritePre', {
        buffer = args.buf,
        callback = function()
          vim.lsp.buf.format({ bufnr = args.buf, id = lsp_client.id })
        end,
      })
    end

    -- keymaps
    vim.keymap.set('n', 'K',
      '<cmd>lua vim.lsp.buf.hover({ border = "single" })<cr>',
      { desc = "Go to definition", buffer = args.buf })
    vim.keymap.set('n', 'gd',
      '<cmd>lua vim.lsp.buf.definition()<cr>',
      { desc = "Go to definition", buffer = args.buf })
    vim.keymap.set('n', 'gD',
      '<cmd>lua vim.lsp.buf.declaration()<cr>',
      { desc = "Go to declaration", buffer = args.buf })
    vim.keymap.set('n', 'gl',
      '<cmd>lua vim.diagnostic.open_float({ border = "single" })<cr>',
      { desc = "Open diagnostics popup", buffer = args.buf })

    vim.keymap.set('n', '<leader>lL',
      '<cmd>LspRestart<cr>',
      { desc = "Restart LSP", buffer = args.buf })

    vim.keymap.set('n', '<leader>ls', '<cmd>Pick lsp scope="document_symbol"<cr>',
      { desc = "Document symbols", buffer = args.buf })
    vim.keymap.set('n', '<leader>lS', '<cmd>Pick lsp scope="workspace_symbol"<cr>',
      { desc = "Workspace symbols", buffer = args.buf })

    vim.keymap.set('n', '<leader>lR', '<cmd>Pick lsp scope="references"<cr>',
      { desc = "Go to references", buffer = args.buf })
    vim.keymap.set('n', 'grr', '<cmd>Pick lsp scope="references"<cr>',
      { desc = "Go to references", buffer = args.buf })

    vim.keymap.set('n', '<leader>lo', '<cmd>ClangdSwitchSourceHeader<cr>',
      { desc = "Switch source and header (C++)", buffer = args.buf })

    vim.keymap.set('n', '<leader>lr', vim.lsp.buf.rename,
      { desc = "Rename symbol ('grn')", buffer = args.buf })

    vim.keymap.set('n', '<leader>ld', vim.lsp.buf.definition,
      { desc = "Go to definition ('gd')", buffer = args.buf })
    vim.keymap.set('n', '<leader>lD', vim.lsp.buf.declaration,
      { desc = "Go to declaration ('gD')", buffer = args.buf })

    vim.keymap.set('n', '<leader>la', vim.lsp.buf.code_action,
      { desc = "Code actions ('gra')", buffer = args.buf })

    vim.keymap.set('n', '<leader>ll', '<cmd>lua vim.diagnostic.open_float({ border = "single" })<cr>',
      { desc = "Open diagnostics popup ('gl')", buffer = args.buf })

    -- show signature help
    vim.keymap.set({ "i", "s" }, "<C-k>", vim.lsp.buf.signature_help, {
      silent = true,
    })

    -- code format
    vim.keymap.set('n', '<leader>lf', function()
      vim.lsp.buf.format({ bufnr = args.buf })
    end, { desc = "Format code", buffer = args.buf })
  end
})
