return {
  "rachartier/tiny-inline-diagnostic.nvim",
  event = "BufEnter",
  priority = 1000,
  config = function()
    require('tiny-inline-diagnostic').setup({
      preset = "simple",
    })
  end
}
