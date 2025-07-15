return {
  "folke/neodev.nvim",
  opts = {},
  config = function()
    local neodev = require "neodev"
    neodev.setup()
    library = { plugins = { "nvim-dap-ui" }, types = true }
  end,
}
