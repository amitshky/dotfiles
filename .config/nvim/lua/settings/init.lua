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
-- vim.o.foldcolumn = "1"
vim.o.foldnestmax = 4
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.pumheight = 6      -- height menus such as autocompletion menu
vim.o.pumwidth = 15      -- width menus such as autocompletion menu
vim.o.path = vim.o.path .. "**"
vim.o.signcolumn = "yes" -- show/hide a column for error, warning signs; "no", "yes", "yes:<width>" eg: "yes:1"
vim.o.laststatus = 3
vim.o.showtabline = 2

-- colorscheme
vim.cmd.colorscheme("gruvbox")

vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#181818" })
vim.api.nvim_set_hl(0, "FloatBorder", { bg = "#151515" })

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

-- change color of the signcolumn
local function set_bg_preserve_fg(group, bg)
    local hl = vim.api.nvim_get_hl(0, { name = group, link = false })
    if not hl then
        return
    end
    hl.bg = bg
    vim.api.nvim_set_hl(0, group, hl)
end
-- change the bg but preserve the fg
local normal = vim.api.nvim_get_hl(0, { name = "Normal", link = false })
local bg = normal.bg
set_bg_preserve_fg("SignColumn", bg)
set_bg_preserve_fg("DiagnosticSignError", bg)
set_bg_preserve_fg("DiagnosticSignWarn", bg)
set_bg_preserve_fg("DiagnosticSignInfo", bg)
set_bg_preserve_fg("DiagnosticSignHint", bg)
