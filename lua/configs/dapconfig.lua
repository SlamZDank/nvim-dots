local dap = require("dap")
dap.defaults.fallback.switchbuf = 'usevisible,uselast'

-- DAPs

-- CodeLLDB
dap.adapters.codelldb = {
  type = "executable",
  command = "codelldb",
}


-- Dap Configurations

-- C / C++ / Rust
dap.configurations.c = {
  {
    name = "Launch Executable",
    type = "codelldb",
    request = "launch",
    program = function()
      return vim.fn.input('Executable Path: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = '${workspaceFolder}',
    stopOnEntry = false,
  },
}

dap.configurations.cpp = {
  {
    name = "Launch Executable",
    type = "codelldb",
    request = "launch",
    program = function()
      return vim.fn.input('Executable Path: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = '${workspaceFolder}',
    stopOnEntry = false,
  },
}

-- TypeScript
