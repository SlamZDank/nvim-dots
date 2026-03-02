return {
  "rachartier/tiny-inline-diagnostic.nvim",
  event = "LspAttach",
  priority = 1000,
  config = function()
    vim.diagnostic.config { virtual_text = false }

    local tiny = require "tiny-inline-diagnostic"

    tiny.setup {
      preset = "simple",
      options = {
        throttle = 100, -- add throttling for performance
        multilines = false, -- disable multiline for speed
        virt_texts = {
          priority = 2048,
        },
        show_code = true,
        override_open_float = false,
        -- Ensure diagnostics attach on buffer/project switch
        overwrite_events = { "LspAttach", "BufEnter", "DiagnosticChanged" },
      },
    }

    -- Hide diagnostics when leaving a buffer
    vim.api.nvim_create_autocmd("BufLeave", {
      callback = function()
        tiny.disable()
      end,
    })

    -- Show diagnostics when entering a buffer
    vim.api.nvim_create_autocmd("BufEnter", {
      callback = function()
        tiny.enable()
      end,
    })
  end,
}
