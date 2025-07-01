vim.g.rustaceanvim = {
  -- Plugin configuration
  tools = {},
  -- server configs with mason
  server = {
    cmd = function()
      local mason_registry = require "mason-registry"
      local ra_binary = mason_registry.is_installed "rust-analyzer"
          -- This may need to be tweaked, depending on the operating system.
          and mason_registry.get_package("rust-analyzer"):get_install_path() .. "/rust-analyzer"
        or "rust-analyzer"
      return { ra_binary } -- You can add args to the list, such as '--log-file'
    end,
    default_settings = {
      -- rust-analyzer language server configuration
      ["rust-analyzer"] = {
        cargo = {
          allFeatures = true,
        },
        checkOnSave = {
          enable = false,
          command = "clippy",
        },
        diagnostics = {
          enable = false,
        },
      },
    },
  },
  -- DAP configuration
  dap = {
     require("dapui").setup()
  },
}
