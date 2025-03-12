return {
  {
    "nvim-tree/nvim-tree.lua",
    priority = 1000,
    lazy = false,
    opts = {
      filters = {
        dotfiles = false,
      },
      view = {
        side = "left",
        number = true,
        relativenumber = true,
        centralize_selection = true,
      },
    },
  },
}
