return {
  { import = "nvchad.blink.lazyspec" },
  {
    {
      "saghen/blink.cmp",
      -- optional: provides snippets for the snippet source
      dependencies = { "rafamadriz/friendly-snippets" },
      build = 'cargo +nightly build --release',
      --@module 'blink.cmp'
      --@type blink.cmp.Config
      opts = {
        -- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
        -- 'super-tab' for mappings similar to vscode (tab to accept)
        -- 'enter' for enter to accept
        -- 'none' for no mappings
        --
        -- All presets have the following mappings:
        -- C-space: Open menu or open docs if already open
        -- C-n/C-p or Up/Down: Select next/previous item
        -- C-e: Hide menu
        -- C-k: Toggle signature help (if signature.enabled = true)
        --
        -- See :h blink-cmp-config-keymap for defining your own keymap
        appearance = {
          nerd_font_variant = "mono",
        },

        keymap = {
          ['<Tab>'] = false,
          ['<S-Tab>'] = false,
          ['<A-j>'] = { 'select_next', 'fallback' },
          -- ['q'] = {'hide', 'fallback'},
          ['<C-u>'] = { 'scroll_documentation_up' },
          ['<A-k>'] = { 'select_prev', 'fallback' },
          ['<C-d>'] = { 'scroll_documentation_down' },
        },

        -- (Default) Only show the documentation popup when manually triggered
        completion = {
          ghost_text = {
            enabled = true,
          },
          documentation = {
            auto_show = true,
            auto_show_delay_ms = 500,
          }
        },

        sources = {
          default = { "lsp", "path", "snippets", "buffer" },
        },


        fuzzy = { implementation = "prefer_rust_with_warning" },
      },
      opts_extend = { "sources.default" },
    },
  },
}
