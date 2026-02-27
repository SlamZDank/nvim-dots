return {
  "lewis6991/gitsigns.nvim",
  event = { "BufReadPre", "BufNewFile" },
  opts = {
    signs = {
      add          = { text = "│" },
      change       = { text = "│" },
      delete       = { text = "󰍵" },
      topdelete    = { text = "‾" },
      changedelete = { text = "~" },
      untracked    = { text = "│" },
    },

    current_line_blame = true,
    current_line_blame_opts = {
      virt_text = true,
      virt_text_pos = "eol",
      delay = 2000,
      ignore_whitespace = false,
    },
    current_line_blame_formatter = " <abbrev_sha> | <author_time:%d-%m-%Y> <author_time:%H:%M> | <author> | <summary> ",

    on_attach = function(bufnr)
      local gs = require "gitsigns"

      local function map(mode, lhs, rhs, desc)
        vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
      end

      -- Normal
      map("n", "<leader>gb", function() gs.blame_line() end,       "Git blame line")
      map("n", "<leader>gB", "<cmd>Git blame<CR>",                 "Git blame")
      map("n", "<leader>gr", "<cmd>Gitsigns reset_hunk<CR>",       "Git reset hunk")
      map("n", "<leader>gR", "<cmd>Git reset<CR>",                 "Git reset")
      map("n", "<leader>gs", "<cmd>Gitsigns stage_hunk<CR>",       "Git stage hunk")
      map("n", "<leader>gS", "<cmd>Gitsigns stage_buffer<CR>",     "Git stage buffer")
      map("n", "<leader>gu", "<cmd>Gitsigns undo_stage_hunk<CR>",  "Git undo stage hunk")
      map("n", "<leader>gp", "<cmd>Gitsigns preview_hunk<CR>",     "Git preview hunk")
      map("n", "<leader>gd", function() gs.diffthis() end,         "Git diff buffer")
      map("n", "<leader>gD", function() gs.diffthis "~1" end,      "Git diff buffer to last commit")

      -- Visual
      map("v", "<leader>gr", function()
        gs.reset_hunk { vim.fn.line ".", vim.fn.line "v" }
      end, "Git reset hunk")

      map("v", "<leader>gs", function()
        gs.stage_hunk { vim.fn.line ".", vim.fn.line "v" }
      end, "Git stage hunk")

      -- Text objects
      vim.keymap.set("x", "ih", ":<C-u>Gitsigns select_hunk<CR>", { buffer = bufnr })
      vim.keymap.set("o", "ih", "<cmd>Gitsigns select_hunk<CR>",   { buffer = bufnr })
    end,
  },
}
