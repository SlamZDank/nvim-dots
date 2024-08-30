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
        number = true,
        relativenumber = true,
        centralize_selection = true,
      },
    },
  },
}
