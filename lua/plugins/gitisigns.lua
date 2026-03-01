return {
  "lewis6991/gitsigns.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    require("gitsigns").setup {
      signs = {
        add = { text = "│" },
        change = { text = "│" },
        delete = { text = "󰍵" },
        topdelete = { text = "‾" },
        changedelete = { text = "~" },
        untracked = { text = "│" },
      },

      current_line_blame = true,
      current_line_blame_opts = {
        virt_text = false,
        delay = 0,
        ignore_whitespace = false,
      },

      current_line_blame_formatter = function(_, blame_info)
        local function time_since(epoch)
          local diff = os.time() - epoch
          if diff < 60 then
            return diff .. "s ago"
          elseif diff < 3600 then
            return math.floor(diff / 60) .. "m ago"
          elseif diff < 86400 then
            return math.floor(diff / 3600) .. "h ago"
          elseif diff < 2592000 then
            return math.floor(diff / 86400) .. "d ago"
          elseif diff < 31536000 then
            return math.floor(diff / 2592000) .. "mo ago"
          else
            return math.floor(diff / 31536000) .. "y ago"
          end
        end

        return {
          {
            string.format(
              " %s · %s · %s",
              blame_info.abbrev_sha,
              blame_info.author,
              time_since(blame_info.author_time)
            ),
            "GitSignsCurrentLineBlame",
          },
        }
      end,

      on_attach = function(bufnr)
        local gs = require "gitsigns"

        vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI", "BufWritePost" }, {
          buffer = bufnr,
          callback = function()
            vim.defer_fn(function()
              vim.cmd "redrawstatus"
            end, 65)
          end,
        })

        local function map(mode, lhs, rhs, desc)
          vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
        end

        -- Normal
        map("n", "<leader>gb", function()
          gs.blame_line()
        end, "Git blame line")
        map("n", "<leader>gB", "<cmd>Git blame<CR>", "Git blame")
        map("n", "<leader>gr", "<cmd>Gitsigns reset_hunk<CR>", "Git reset hunk")
        map("n", "<leader>gR", "<cmd>Git reset<CR>", "Git reset")
        map("n", "<leader>gs", "<cmd>Gitsigns stage_hunk<CR>", "Git stage hunk")
        map("n", "<leader>gS", "<cmd>Gitsigns stage_buffer<CR>", "Git stage buffer")
        map("n", "<leader>gu", "<cmd>Gitsigns undo_stage_hunk<CR>", "Git undo stage hunk")
        map("n", "<leader>gp", "<cmd>Gitsigns preview_hunk<CR>", "Git preview hunk")
        map("n", "<leader>gd", function()
          gs.diffthis()
        end, "Git diff buffer")
        map("n", "<leader>gD", function()
          gs.diffthis "~1"
        end, "Git diff buffer to last commit")

        -- Visual
        map("v", "<leader>gr", function()
          gs.reset_hunk { vim.fn.line ".", vim.fn.line "v" }
        end, "Git reset hunk")
        map("v", "<leader>gs", function()
          gs.stage_hunk { vim.fn.line ".", vim.fn.line "v" }
        end, "Git stage hunk")

        -- Text objects
        vim.keymap.set("x", "ih", ":<C-u>Gitsigns select_hunk<CR>", { buffer = bufnr })
        vim.keymap.set("o", "ih", "<cmd>Gitsigns select_hunk<CR>", { buffer = bufnr })

        vim.api.nvim_set_hl(0, "GitSignsCurrentLineBlame", { fg = "#6b6b6b" })
      end,
    }
  end,
}
