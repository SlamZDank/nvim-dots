return {
  {
    "nvim-tree/nvim-tree.lua",
    cmd = { "NvimTreeToggle", "NvimTreeFocus", "NvimTreeOpen" },
    keys = {
      { "<leader>e", "<cmd>NvimTreeToggle<CR>", desc = "Toggle NvimTree" },
    },
    opts = {
      filters = {
        git_ignored = false,
        dotfiles = false,
      },
      view = {
        side = "right",
        width = 40,
        number = true,
        relativenumber = true,
        centralize_selection = true,
      },
    },
  },
}
