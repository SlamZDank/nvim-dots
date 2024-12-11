return {
  "kylechui/nvim-surround",
  version = "*", -- Use for stability; omit to use `main` branch for the latest features
  event = "VeryLazy",
  config = function()
    require("nvim-surround").setup {
      -- to setup later
      } -- Configuration here, or leave empty to use defaults
    -- Setup keymappings. Code borrowed from surround-ui
  end,
}
