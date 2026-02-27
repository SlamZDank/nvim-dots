return {
  "rachartier/tiny-inline-diagnostic.nvim",
  event = "LspAttach", -- loads only when LSP attaches (faster startup)
  priority = 1000,
  config = function()
    vim.diagnostic.config { virtual_text = false }
    require("tiny-inline-diagnostic").setup {
      preset = "simple",
      throttle = 100, -- add throttling for performance
      options = {
        multilines = false, -- disable multiline for speed
        virt_texts = {
          priority = 2048,
        },
        show_code = true,
        override_open_float = false,
      },
    }
  end,
}
