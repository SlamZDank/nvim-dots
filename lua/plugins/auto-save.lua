return {
  "Pocco81/auto-save.nvim",
  event = { "InsertLeave", "TextChanged" },
  opts = {
    enabled = true,
    execution_message = {
      enabled = false, -- disable "saved at" messages for cleaner experience
    },
    trigger_events = { -- See :h events
      immediate_save = { "BufLeave" },
      defer_save = { "InsertLeave", "TextChanged" },
    },
    debounce_delay = 5000, -- delay before saving (in ms)
  },
}
