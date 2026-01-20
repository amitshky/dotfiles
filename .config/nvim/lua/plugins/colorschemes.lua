return {
  {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    config = function()
      require("gruvbox").setup({
        palette_overrides = {
          dark0 = "#151515",
        },
      })
    end,
  },
}
