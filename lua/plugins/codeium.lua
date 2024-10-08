return {
  "Exafunction/codeium.vim",
  event = "BufEnter",
  config = function()
    -- Change '<C-g>' here to any keycode you like.
    vim.g.codeium_disable_bindings = 1
    vim.keymap.set("i", "<A-a>", function()
      return vim.fn["codeium#Accept"]()
    end, { expr = true, silent = true })
    vim.keymap.set("i", "<A-k>", function()
      return vim.fn["codeium#CycleCompletions"](1)
    end, { expr = true, silent = true })
    vim.keymap.set("i", "<A-j>", function()
      return vim.fn["codeium#CycleCompletions"](-1)
    end, { expr = true, silent = true })
    vim.keymap.set("i", "<A-c>", function()
      return vim.fn["codeium#Clear"]()
    end, { expr = true, silent = true })
  end,
}
