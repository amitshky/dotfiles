-- add group keys to which-key
local wk = require("which-key")
wk.add({
  { "<leader>\\", group = "Split window" },
  { "<leader>a",  group = "Windows" },
  { "<leader>s",  group = "Session" },
  { "<leader>l",  group = "LSP" },
  { "<leader>t",  group = "Trouble" },
  { "gr",         group = "Code" },

  -- mini.surround mappings
  { "s",          group = "Surround" },
  { "sa",         group = "Add" },       -- Add surrounding in Normal/Visual modes
  { "sd",         group = "Delete" },    -- Delete surrounding
  { "sf",         group = "Find" },      -- Find surrounding (to the right)
  { "sF",         group = "Find Left" }, -- Find surrounding (to the left)
  { "sh",         group = "Highlight" }, -- Highlight surrounding
  { "sr",         group = "Replace" },   -- Replace surrounding
})
