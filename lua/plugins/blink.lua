return {
  { import = "nvchad.blink.lazyspec" },
  {
    {
      "saghen/blink.cmp",
      dependencies = { "rafamadriz/friendly-snippets" },
      build = "cargo +nightly build --release",
      --@module 'blink.cmp'
      --@type blink.cmp.Config
      opts = {
        appearance = {
          nerd_font_variant = "mono",
        },

        keymap = {
          ["<Tab>"] = {
            function(cmp)
              if cmp.is_visible() then
                cmp.accept()
                vim.schedule(function()
                  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<End>", true, false, true), "n", false)
                end)
                return true
              end
            end,
            "fallback",
          },
          ["<A-j>"] = { "select_next", "fallback" },
          ["<S-Tab>"] = { "hide", "fallback" },
          ["<C-u>"] = { "scroll_documentation_up" },
          ["<A-k>"] = { "select_prev", "fallback" },
          ["<C-d>"] = { "scroll_documentation_down" },
        },

        -- (Default) Only show the documentation popup when manually triggered
        completion = {
          ghost_text = {
            enabled = true,
          },
          documentation = {
            auto_show = true,
            auto_show_delay_ms = 0,
          },
          list = {
            max_items = 50, -- limit completion items for performance
          },
          trigger = {
            show_in_snippet = false, -- don't show completion while in snippet
          },
        },

        sources = {
          default = { "lsp", "path", "snippets", "buffer" },
          per_filetype = {
            markdown = { "buffer", "path" }, -- no LSP spam in markdown
          },
        },

        fuzzy = { implementation = "prefer_rust_with_warning" },
      },
      opts_extend = { "sources.default" },
    },
  },
}
