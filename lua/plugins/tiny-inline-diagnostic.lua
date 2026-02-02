return {
  "rachartier/tiny-inline-diagnostic.nvim",
  event = "LspAttach", -- loads only when LSP attaches (faster startup)
  priority = 1000,
  config = function()
    require("tiny-inline-diagnostic").setup({
      preset = "simple",
      throttle = 100, -- add throttling for performance
      options = {
        multilines = false, -- disable multiline for speed
      },
    })
  end,
}
