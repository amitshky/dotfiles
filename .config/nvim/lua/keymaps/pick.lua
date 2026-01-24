vim.keymap.set("n", "<leader>f", function()
  require("mini.pick").builtin.cli({
    command = {
      "rg",
      "--files",
      "--follow",
      "--color=never",
      "--hidden",
      "--glob", "!.git/*",
      "--glob", "!node_modules/*",
    },
  }, { desc = "File picker" })
end, { desc = "Pick files with rg" })
vim.keymap.set('n', '<leader>g', '<cmd>Pick grep_live<cr>', { desc = "Live grep" })
vim.keymap.set('n', '<leader>B', '<cmd>Pick buffers<cr>', { desc = "Buffers" })
