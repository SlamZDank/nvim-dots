return {
  "chrisgrieser/nvim-lsp-endhints",
  event = "LspAttach",
  opts = {},
  config = function()
    require("lsp-endhints").setup {
      label = {
        truncateAtChars = 9000,
      }
    }
  end,
}
