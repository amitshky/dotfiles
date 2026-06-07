-- trouble
vim.keymap.set('n', '<leader>Td', '<cmd>Trouble diagnostics toggle<cr>', { desc = "Diagnostics (Trouble)" })
vim.keymap.set('n', '<leader>TD', '<cmd>Trouble diagnostics toggle filter.buf=0<cr>',
  { desc = "Buffer Diagnostics (Trouble)" })
vim.keymap.set('n', '<leader>Ts', '<cmd>Trouble symbols toggle focus=false<cr>', { desc = "Symbols (Trouble)" })
vim.keymap.set('n', '<leader>Tl', '<cmd>Trouble lsp toggle focus=false win.position=right<cr>',
  { desc = "LSP Definitions / references / ... (Trouble)" })
vim.keymap.set('n', '<leader>TL', '<cmd>Trouble loclist toggle<cr>', { desc = "Location List (Trouble)" })
vim.keymap.set('n', '<leader>TQ', '<cmd>Trouble qflist toggle<cr>', { desc = "Quickfix List (Trouble)" })
