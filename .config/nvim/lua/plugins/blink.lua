return {
  'saghen/blink.cmp',
  -- optional: provides snippets for the snippet source
  dependencies = { 'rafamadriz/friendly-snippets' },
  version = '1.*',

  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    -- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
    -- 'super-tab' for mappings similar to vscode (tab to accept)
    -- 'enter' for enter to accept
    -- 'none' for no mappings
    keymap = {
      preset = 'none',
      ['<C-n>'] = { 'show', 'select_next', 'fallback_to_mappings' },
      ['<C-p>'] = { 'show', 'select_prev', 'fallback_to_mappings' },
      ['<C-e>'] = { 'hide' },
      ['<C-y>'] = { 'select_and_accept' },
      ['<C-u>'] = { 'cancel' },
      -- ['<CR>'] = { 'select_and_accept', 'fallback' },
      ['<Up>'] = { 'select_prev', 'fallback' },
      ['<Down>'] = { 'select_next', 'fallback' },
      ['<C-b>'] = { 'scroll_documentation_up', 'fallback' },
      ['<C-f>'] = { 'scroll_documentation_down', 'fallback' },
      ['<Tab>'] = { 'snippet_forward', 'fallback' },
      ['<S-Tab>'] = { 'snippet_backward', 'fallback' },
      -- ['<C-k>'] = { 'show_signature', 'hide_signature', 'fallback' }, -- uncommen if signature is enabled
    },

    signature = {
      enabled = false,
      window = {
        show_documentation = false,
        border = "single",
      },
    },

    completion = {
      menu = {
        auto_show = false,
        border = 'single',
        scrolloff = 0,
      },
      documentation = {
        window = {
          border = 'single',
        },
      },
      list = {
        selection = {
          preselect = true,
          auto_insert = false,
        },
      },
    },
  },
  opts_extend = { "sources.default" }
}
