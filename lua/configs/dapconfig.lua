local dap = require("dap")
dap.defaults.fallback.switchbuf = 'usevisible,uselast'

-- DAPs
-- https://codeberg.org/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation

-- CodeLLDB
dap.adapters.codelldb = {
  type = "executable",
  command = "codelldb",
}


-- Dap Configurations

-- C / C++
-- Rust is already available via RustaceanVIM
dap.configurations.c = {
  {
    name = "Launch C Executable",
    type = "codelldb",
    request = "launch",
    program = function()
      return vim.fn.input('Executable C Program Path: ', vim.fn.getcwd() .. '/', 'file')
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
      return vim.fn.input('Executable C++ Program Path: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = '${workspaceFolder}',
    stopOnEntry = false,
  },
}
