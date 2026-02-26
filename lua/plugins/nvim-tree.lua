return {
  {
    "nvim-tree/nvim-tree.lua",
    cmd = { "NvimTreeToggle", "NvimTreeFocus", "NvimTreeOpen" },
    event = { "VimEnter" },
    keys = {
      { "<leader>e", "<cmd>NvimTreeToggle<CR>", desc = "Toggle NvimTree" },
    },
    opts = {
      sync_root_with_cwd = true,
      respect_buf_cwd = true,
      update_focused_file = {
        enable = true,
        update_root = true,
      },
      diagnostics = {
        enable = true,
        show_on_dirs = true,
        icons = {
          hint = "󱜸",
          info = "",
          warning = "",
          error = "",
        },
      },
      git = {
        enable = true,
        show_on_dirs = true,
        show_on_open_dirs = true,
      },
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
    config = function(_, opts)
      require("nvim-tree").setup(opts)
      local api = require "nvim-tree.api"
      local arg = vim.fn.argv(0)
      if arg and vim.fn.isdirectory(arg) == 1 then
        vim.cmd.cd(arg)
        vim.schedule(function()
          vim.cmd "bdelete"
          api.tree.open { path = arg }
        end)
      end
    end,
  },
}
