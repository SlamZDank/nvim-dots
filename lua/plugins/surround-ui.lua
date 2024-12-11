return {
  "roobert/surround-ui.nvim",
  dependencies = {
    "kylechui/nvim-surround",
    "folke/which-key.nvim",
  },
  lazy = false,
  config = function()
    require("surround-ui").setup {
      root_key = "S",
    }
  end,
}
