return {
  {
    'nvim-mini/mini.pick',
    version = '*',
    config = function()
      require("mini.pick").setup({
        window = {
          config = function()
            local height = math.floor(0.618 * vim.o.lines)
            local width  = math.floor(0.618 * vim.o.columns)

            return {
              relative = "editor",
              anchor = "NW",
              row = math.floor((vim.o.lines - height) * 0.5),
              col = math.floor((vim.o.columns - width) * 0.5),
              width = width,
              height = height,
              border = "single",
            }
          end,
        },
      })
    end,
  },

  {
    'nvim-mini/mini.surround',
    version = '*',
    config = function()
      require("mini.surround").setup()
    end,
  },

  {
    'nvim-mini/mini.extra',
    version = '*',
    config = function()
      require("mini.extra").setup()
    end,
  },
}
