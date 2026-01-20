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
      tabline = {
        lualine_b = {
          {
            "filename",
            path = 1
          }
        },
        lualine_a = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {}
      },
    })
  end,
  event = "VimEnter",
}
