-- options
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
vim.o.clipboard = "unnamedplus" -- copy to system clipboard
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
-- vim.o.foldcolumn = "1"
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
vim.cmd.colorscheme("gruvbox")

-- override oil.nvim colors
vim.api.nvim_set_hl(0, "OilDir", { fg = "#83A598" })

vim.diagnostic.config({
    -- remove inline diagnostic messages
    virtual_text = false,
})

-- adding borders for lsp hover
vim.lsp.handlers["textDocument/hover"] =
    vim.lsp.with(vim.lsp.handlers.hover, {
        border = "single",
    })

-- disable automatic LSP signature popup
vim.lsp.handlers["textDocument/signatureHelp"] =
    vim.lsp.with(vim.lsp.handlers.signature_help, {
        border = "single",
        silent = true,
    })

-- change c comments to //
vim.api.nvim_create_autocmd('Filetype', {
    pattern = 'c',
    callback = function()
        vim.bo.commentstring = '// %s'
    end,
    group = comment_augroup
})
