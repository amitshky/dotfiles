vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.o.number = true
vim.o.relativenumber = true
vim.o.mousemodel = "extend"
vim.o.cursorline = true
vim.o.autoindent = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.softtabstop = 4
vim.o.expandtab = true
vim.o.wrap = true
vim.o.linebreak = true
vim.o.scrolloff = 0
vim.o.clipboard = "unnamedplus"
vim.o.hlsearch = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.updatetime = 250 -- decrease update time
vim.o.timeoutlen = 400 -- timeout for next key press
vim.o.completeopt = "menuone,noselect"
vim.o.termguicolors = true
vim.o.list = true
vim.o.listchars = "tab:→→,space:∙"
-- disable auto comment in newline
vim.cmd('autocmd BufEnter * set formatoptions-=cro')
vim.cmd('autocmd BufEnter * setlocal formatoptions-=cro')
vim.o.foldmethod = "manual"
vim.o.foldenable = false
vim.o.foldnestmax = 4
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.pumheight = 6      -- height menus such as autocompletion menu
vim.o.pumwidth = 15      -- width menus such as autocompletion menu
vim.o.path = vim.o.path .. "**"
vim.o.signcolumn = "yes" -- show/hide a column for error, warning signs; "no", "yes", "yes:<width>" eg: "yes:1"
vim.o.laststatus = 3
vim.o.showtabline = 0
vim.o.winbar = "%f %m"

-- keymaps
vim.keymap.set({ 'n', 'v' }, '<space>', '<nop>')
vim.keymap.set({ 'i', 'c' }, 'jk', '<esc>')
-- remove search highlights
vim.keymap.set('n', '<leader>h', '<cmd>nohl<cr>', { desc = "Remove search highlights" })
-- buffers
vim.keymap.set('n', '<S-h>', '<cmd>bp<cr>', { desc = "Prev Buffer" }) -- prev buffer
vim.keymap.set('n', '<S-l>', '<cmd>bn<cr>', { desc = "Next Buffer" }) -- next buffer
vim.keymap.set('n', '<leader>o', '<C-6>', { desc = "Jump to recently used buffer" })
