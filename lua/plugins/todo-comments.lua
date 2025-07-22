return {
  "folke/todo-comments.nvim",
  event = "BufEnter",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    -- Default keywords
    -- @see https://github.com/folke/todo-comments.nvim/blob/main/lua/todo-comments/config.lua
    local default_keywords = {
      FIX = {
        icon = " ", -- icon used for the sign, and in search results
        color = "error", -- can be a hex color, or a named color (see below)
        alt = { "FIXME", "BUG", "FIXIT", "ISSUE" }, -- a set of other keywords that all map to this FIX keywords
        -- signs = false, -- configure signs for some keywords individually
      },
      TODO = { icon = " ", color = "info" },
      HACK = { icon = " ", color = "warning" },
      WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
      PERF = { icon = " ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
      NOTE = { icon = " ", color = "hint", alt = { "INFO" } },
      TEST = { icon = "⏲ ", color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
    }

    --see: 
    -- Custom keywords
    local keywords = {
      SEE = {
        icon = "",
        color = "info",
      },
    }

    keywords = vim.tbl_deep_extend("force", {}, default_keywords, keywords)
    -- Add lowercase versions of each keyword
    for key, val in pairs(keywords) do
      keywords[key:lower()] = val
    end

    require("todo-comments").setup({
      keywords = keywords,
    })
  end,
}
