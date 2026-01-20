-- split window
vim.keymap.set('n', '<leader>\\\\', '<C-w>v', { desc = "Vertically" })
vim.keymap.set('n', '<leader>\\|', '<C-w>s', { desc = "Horizontally" })
vim.keymap.set('n', '<leader>a\\', '<C-w>v', { desc = "Vertically" })
vim.keymap.set('n', '<leader>a|', '<C-w>s', { desc = "Horizontally" })
-- navigate windows
vim.keymap.set('n', '<C-Down>', '<C-w>j')
vim.keymap.set('n', '<C-Up>', '<C-w>k')
vim.keymap.set('n', '<C-Left>', '<C-w>h')
vim.keymap.set('n', '<C-Right>', '<C-w>l')
vim.keymap.set('n', '<leader>aj', '<C-w>j')
vim.keymap.set('n', '<leader>ak', '<C-w>k')
vim.keymap.set('n', '<leader>ah', '<C-w>h')
vim.keymap.set('n', '<leader>al', '<C-w>l')
-- resize window
vim.keymap.set('n', '<C-k>', '<cmd>resize -12<CR>')
vim.keymap.set('n', '<C-j>', '<cmd>resize +12<CR>')
vim.keymap.set('n', '<C-h>', '<cmd>vertical resize -12<CR>')
vim.keymap.set('n', '<C-l>', '<cmd>vertical resize +12<CR>')
vim.keymap.set('n', '<leader>ae', '<C-w>=', { desc = "Equally high and wide" })
-- maximize window
vim.keymap.set('n', '<leader>aW', '<C-w>|', { desc = "Max out the width" })
vim.keymap.set('n', '<leader>aH', '<C-w>_', { desc = "Max out the height" })
