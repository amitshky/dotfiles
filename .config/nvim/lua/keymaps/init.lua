-- add group keys to which-key
require('keymaps.which-key')

-- keymaps
vim.keymap.set({ 'n', 'v' }, '<space>', '<nop>')
vim.keymap.set({ 'i', 'c' }, 'jk', '<esc>')
vim.keymap.set('n', 'J', '<nop>')
vim.keymap.set({ 'n', 'i', 'v' }, '<C-Space>', '<nop>')
vim.keymap.set('n', '<leader>q', '<cmd>q<cr>', { desc = "Quit" })
vim.keymap.set('n', '<leader>Q', '<cmd>qa<cr>', { desc = "Quit all" })
vim.keymap.set('n', '<leader>w', '<cmd>w<cr>', { desc = "Save" })
vim.keymap.set('n', '<leader>W', '<cmd>wa<cr>', { desc = "Save all" })
vim.keymap.set('i', '<C-h>', '<C-w>')  -- emulate Ctrl+Backspace
vim.keymap.set('i', '<C-BS>', '<C-w>') -- emulate Ctrl+Backspace; works for some terminals (eg: `foot`)
vim.keymap.set({ 'n', 'v' }, 'U', '<C-r>')
vim.keymap.set({ 'n', 'v' }, '<C-r>', '<U>')

-- terminal mode
vim.keymap.set('t', 'jk', '<C-\\><C-n>') -- switch to normal mode
vim.keymap.set('t', '<esc>', '<C-\\><C-n><cmd>q<cr>', { desc = "Close terminal" })
vim.keymap.set('t', '<C-e>', '<esc>')    -- <esc> useful in lazygit
-- navigation in terminal mode
vim.keymap.set('t', '<C-j>', '<down>')
vim.keymap.set('t', '<C-k>', '<up>')
vim.keymap.set('t', '<C-l>', '<right>')
vim.keymap.set('t', '<C-h>', '<left>')

-- cut current line
vim.keymap.set('n', 'X', 'dd')

-- prevents the delete operation to pollute the unnamed buffer
vim.keymap.set('n', 'dd', '"add')

-- use leader d or c for normal behavior of d and c
vim.keymap.set({ 'n', 'v', 'x' }, '<leader>d', 'd')
vim.keymap.set({ 'n', 'v', 'x' }, '<leader>c', 'c')
-- by default don't pollute the registers with d and c
vim.keymap.set({ 'n', 'v', 'x' }, 'd', '"_d')
vim.keymap.set({ 'n', 'v', 'x' }, 'c', '"_c')

-- to not yank the text when pasting on selection
vim.keymap.set('v', 'p', 'P')

-- for word wrap
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- move line/s
vim.keymap.set('i', '<A-j>', '<esc>:m .+1<cr>==gi')
vim.keymap.set('i', '<A-k>', '<esc>:m .-2<cr>==gi')
vim.keymap.set('n', '<A-j>', '<esc>:m .+1<cr>==')
vim.keymap.set('n', '<A-k>', '<esc>:m .-2<cr>==')
vim.keymap.set('v', '<A-j>', ":m '>+1<cr>gv-gv")
vim.keymap.set('v', '<A-k>', ":m '<-2<cr>gv-gv")

-- indentation
-- vim.keymap.set('n', '>', '<cmd>><cr>')
-- vim.keymap.set('n', '<', '<cmd><<cr>')
vim.keymap.set('v', '<', '<gv')
vim.keymap.set('v', '>', '>gv')

-- buffers
vim.keymap.set('n', '<S-h>', '<cmd>bp<cr>', { desc = "Prev Buffer" }) -- prev buffer
vim.keymap.set('n', '<S-l>', '<cmd>bn<cr>', { desc = "Next Buffer" }) -- next buffer
vim.keymap.set('n', '<leader>o', '<C-6>', { desc = "Jump to recently used buffer" })
vim.keymap.set('n', '<leader>x', '<cmd>bd<cr>', { desc = "Close current buffer" })

-- tabs
vim.keymap.set('n', '<M-h>', '<cmd>tabprevious<cr>', { desc = "Prev Tab" })
vim.keymap.set('n', '<M-l>', '<cmd>tabNext<cr>', { desc = "Next Tab" })

-- remove search highlights
vim.keymap.set('n', '<leader>h', '<cmd>nohl<cr>', { desc = "Remove search highlights" })

-- comment
-- vim.keymap.set('n', '<leader>/', '<Plug>(comment_toggle_linewise_current)') -- comment line
-- vim.keymap.set('v', '<leader>/', '<Plug>(comment_toggle_linewise_visual)')  -- comment line in visual mode

-- file explorer
vim.keymap.set('n', '<leader>e', '<cmd>Oil<cr>', { desc = "Toggle Oil.nvim" })
-- vim.keymap.set('n', '<leader>e', '<cmd>NvimTreeToggle<cr>', { desc = "Toggle NvimTree" })

-- sessions
vim.keymap.set('n', '<leader>Ss', '<cmd>mksession! session.vim<cr>', { desc = "Save session" })
vim.keymap.set('n', '<leader>Sl', '<cmd>source session.vim<cr>', { desc = "Load session" })

-- snipe
vim.keymap.set('n', '<leader>s', function() require("snipe").open_buffer_menu() end, { desc = "Open Snipe buffer menu" })


require('keymaps.window')
require('keymaps.pick')
require('keymaps.lsp')
require('keymaps.trouble')
