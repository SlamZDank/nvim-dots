return {
  "jglasovic/venv-lsp.nvim",
  config = function()
    require("venv-lsp").setup()
    vim.lsp.enable('basedpyright')
  end,
}
