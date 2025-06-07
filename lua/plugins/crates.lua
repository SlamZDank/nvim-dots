return {
  "saecki/crates.nvim",
  ft = { "toml" },
  config = function()
    require("crates").setup {
      lsp = {
        enabled = true,
        on_attach = require("nvchad.configs.lspconfig").on_attach,
        completion = true,
        actions = true,
      },
    }
  end,
}
