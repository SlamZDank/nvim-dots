-- Linus torvalds Vibe codes now
-- what a world to live in

-- this is no longer useful, and is so ass at this point i want to code without ai
return {
  "NickvanDyke/opencode.nvim",
  enabled = false,
  event = "BufEnter",
  dependencies = {
    { "folke/snacks.nvim", opts = { input = {}, picker = {}, terminal = {} } },
  },

  config = function()
    vim.g.opencode_opts = {
      -- Your configuration, if any — see `lua/opencode/config.lua`, or "goto definition".
    }

    vim.o.autoread = true

    vim.keymap.set({ "n", "x" }, "<leader>oct", function()
      require("opencode").ask("@this: ", { submit = true })
    end, { desc = "Ask opencode" })
    vim.keymap.set({ "n", "x" }, "<leader>oca", function()
      require("opencode").select()
    end, { desc = "Execute opencode action…" })
    vim.keymap.set({ "n", "t" }, "<leader>oct", function()
      require("opencode").toggle()
    end, { desc = "Toggle opencode" })

    vim.keymap.set({ "n", "x" }, "<leader>ocr", function()
      return require("opencode").operator "@this "
    end, { expr = true, desc = "Add range to opencode" })

    vim.keymap.set("n", "<leader>ocl", function()
      return require("opencode").operator "@this " .. "_"
    end, { expr = true, desc = "Add line to opencode" })

    vim.keymap.set("n", "<leader>ocu", function()
      require("opencode").command "session.half.page.up"
    end, { desc = "opencode half page up" })
    vim.keymap.set("n", "<leader>ocd", function()
      require("opencode").command "session.half.page.down"
    end, { desc = "opencode half page down" })
  end,
}
