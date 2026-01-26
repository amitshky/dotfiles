return {
  "nvim-lualine/lualine.nvim",
  config = function()
    require("lualine").setup({
      options = {
        icons_enabled = false,
        theme = 'codedark',
      },
      sections = {
        lualine_b = { 'branch' },
      },
    })
  end,
  event = "VimEnter",
}
