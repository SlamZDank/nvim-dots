return {
  {
    "nvim-tree/nvim-tree.lua",
    priority = 1000,
    lazy = false,
    opts = {
      filters = {
        git_ignored = false,
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
