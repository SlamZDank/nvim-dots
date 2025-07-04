return {
  "mrcjkb/rustaceanvim",
  version = "^6", -- Recommended
  lazy = false, -- This plugin is already lazy
  ft = "rust",
  config = function()
    -- local mason_registry = require "mason-registry"
    -- local codelldb = mason_registry.get_package "codelldb"
    local extension_path = vim.fn.expand("$MASON/bin/codelldb")
    local codelldb_path = extension_path .. "adapter/codelldb"
    local liblldb_path = extension_path .. "lldb/lib/liblldb.dylib"
    local cfg = require "rustaceanvim.config"

    vim.g.lazyvim_rust_diagnostics = "bacon-ls"

    vim.g.rustaceanvim = {
      dap = {
        adapter = cfg.get_codelldb_adapter(codelldb_path, liblldb_path),
      },
      server = {
        default_settings = {
          ['rust-analyzer'] = {
            checkOnSave = {
              enable = false,
            },
            diagnostics = {
              enable = false,
            },
          },
        },
      }
    }
  end,
}
