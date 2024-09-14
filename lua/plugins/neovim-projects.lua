return {
  "coffebar/neovim-project",
  init = function()
    -- enable saving the state of plugins in the session
    vim.opt.sessionoptions:append "globals" -- save global variables that start with an uppercase letter and contain at least one lowercase letter.
  end,
  config = function()
    local neovim_project = require "neovim-project"
    neovim_project.setup {
      -- Project directories + home for simpler navigation
      projects = {
        "~/",
        "~/projects/*",
        "~/dev/*",
        "~/.config/*",
      },
      -- Path to store history and sessions
      datapath = vim.fn.stdpath "data", -- ~/.local/share/nvim/
      -- Load the most recent session on startup if not in the project directory
      last_session_on_startup = false,
      -- Dashboard mode prevent session autoload on startup
      dashboard_mode = false,
      -- Timeout in milliseconds before trigger FileType autocmd after session load
      -- to make sure lsp servers are attached to the current buffer.
      -- Set to 0 to disable triggering FileType autocmd
      filetype_autocmd_timeout = 200,

      -- Overwrite some of Session Manager options
      session_manager_opts = {
        autosave_ignore_dirs = {
          vim.fn.expand "~", -- don't create a session for $HOME/
          "/tmp",
        },
        autosave_ignore_filetypes = {},
      },
    }

    local keymap = vim.keymap

    keymap.set(
      "n",
      "<leader>pp",
      "<cmd>Telescope neovim-project discover<CR>",
      { desc = "Search all of the available projects" }
    ) -- Open a list of projects

    keymap.set(
      "n",
      "<leader>po",
      "<cmd>Telescope neovim-project history<CR>",
      { desc = "Search recently opened projects" }
    ) -- Open a list of projects
  end,
  dependencies = {
    { "nvim-lua/plenary.nvim" },
    { "nvim-telescope/telescope.nvim" },
    { "Shatur/neovim-session-manager" },
  },

  lazy = false,
}
