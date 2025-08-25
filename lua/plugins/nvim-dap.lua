return {
  {
    "rcarriga/nvim-dap-ui",
    event = "VeryLazy",
    dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
    config = function()
      local dap = require "dap"
      local dapui = require "dapui"

      local keymap = vim.keymap.set

      keymap("n", "<Leader>dt", dap.toggle_breakpoint, { desc = "Toggle Debugger Breakpoint" })
      keymap("n", "<Leader>do", dap.continue, { desc = "Start or continue the Debugger" })
      keymap("n", "<Leader>dr", dap.repl.open, { desc = "Inspect the Element" })
      keymap("n", "<Leader>dx", dap.terminate, { desc = "Kill the Debugger" })

      keymap("n", "<Leader>dso", dap.step_over, { desc = "Step Over" })
      keymap("n", "<Leader>dsi", dap.step_into, { desc = "Step Into" })
      keymap("n", "<Leader>dsu", dap.step_out, { desc = "Step Out" })
      keymap("n", "<Leader>dl", dap.run_last, { desc = "Run Last" })

      keymap("n", "<Leader>duo", dapui.open, { desc = "Open the DebuggerUI" })
      keymap("n", "<Leader>dux", dapui.close, { desc = "Close the DebuggerUI" })

      dapui.setup()
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end

      dap.listeners.after.event_exited["dapui_config"] = function()
        dapui.close()
      end
    end,
  },

  {
    "jay-babu/mason-nvim-dap.nvim",
    event = "VeryLazy",
    dependencies = {
      "williamboman/mason.nvim",
      "mfussenegger/nvim-dap",
    },
    opts = {
      handlers = {},
      ensure_installed = {
        "codelldb",
      },
    },
  },
  {
    "mfussenegger/nvim-dap",
  },
  {
    "theHamsta/nvim-dap-virtual-text",
    config = function()
      require("nvim-dap-virtual-text").setup()
    end,

    requires = { "mfussenegger/nvim-dap" },
  },
}
