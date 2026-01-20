-- to run external fromatters
return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local conform = require("conform")

    conform.setup({
      formatters_by_ft = {
        javascript = { "prettier" },
        typescript = { "prettier" },
        -- javascriptreact = { "prettier" },
        -- typescriptreact = { "prettier" },
        json = { "prettier" },
        css = { "prettier" },
        html = { "prettier" },
        markdown = { "prettier" },
        -- yaml = { "prettier" },
        angular = { "prettier" },
        htmlangular = { "prettier" },
      },
    })

    -- format on save
    -- vim.api.nvim_create_autocmd("BufWritePre", {
    --   callback = function(args)
    --     conform.format({ bufnr = args.buf })
    --   end,
    -- })
  end,
}
