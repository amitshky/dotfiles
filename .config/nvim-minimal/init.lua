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
-- vim.o.clipboard = "unnamedplus" -- copy to system clipboard
vim.o.hlsearch = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.updatetime = 250 -- decrease update time
vim.o.timeoutlen = 400 -- timeout for next key press
vim.o.completeopt = "menuone"
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

-- colorscheme
vim.cmd.colorscheme("habamax")

-- keymaps
vim.keymap.set({ 'n', 'v' }, '<space>', '<nop>')
vim.keymap.set({ 'i', 'c' }, 'jk', '<esc>')
vim.keymap.set('n', '<leader>q', '<cmd>q<cr>', { desc = "Quit" })
vim.keymap.set('n', '<leader>Q', '<cmd>qa<cr>', { desc = "Quit all" })
vim.keymap.set('n', '<leader>w', '<cmd>w<cr>', { desc = "Save" })
vim.keymap.set('n', '<leader>W', '<cmd>wa<cr>', { desc = "Save all" })
vim.keymap.set({ 'n', 'v' }, 'U', '<C-r>')
vim.keymap.set({ 'n', 'v' }, '<C-r>', '<U>')
-- remove search highlights
vim.keymap.set('n', '<leader>h', '<cmd>nohl<cr>', { desc = "Remove search highlights" })
-- buffers
vim.keymap.set('n', '<S-h>', '<cmd>bp<cr>', { desc = "Prev Buffer" }) -- prev buffer
vim.keymap.set('n', '<S-l>', '<cmd>bn<cr>', { desc = "Next Buffer" }) -- next buffer
vim.keymap.set('n', '<leader>o', '<C-6>', { desc = "Jump to recently used buffer" })
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

-- change c comments to //
vim.api.nvim_create_autocmd('Filetype', {
    pattern = 'c',
    callback = function()
        vim.bo.commentstring = '// %s'
    end,
    group = comment_augroup
})
