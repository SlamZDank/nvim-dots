local function on_attach(client, bufnr)
  require("nvchad.configs.lspconfig").on_attach(client, bufnr)
  vim.diagnostic.config {
    virtual_text = false,
  }
end

local capabilities = require("nvchad.configs.lspconfig").capabilities
local on_init = require("nvchad.configs.lspconfig").on_init

vim.lsp.config("*", {
  capabilities = capabilities,
  on_init = on_init,
  on_attach = on_attach,
})

local servers = {
  "html",
  "cssls",
  "ts_ls",
  "eslint",
  "emmet_language_server",
  "tailwindcss",
  "bashls",
  "postgres_lsp",
  "sqls",
  "texlab",
}

for _, server in ipairs(servers) do
  vim.lsp.enable(server)
end

-- lua
vim.lsp.config("lua_ls", {
  settings = {
    Lua = {
      runtime = { version = "LuaJIT" },
      workspace = {
        library = {
          vim.fn.expand "$VIMRUNTIME/lua",
          vim.fn.stdpath "data" .. "/lazy/ui/nvchad_types",
          vim.fn.stdpath "data" .. "/lazy/lazy.nvim/lua/lazy",
          "${3rd}/luv/library",
        },
      },
    },
  },
})
vim.lsp.enable "lua_ls"

-- C, C++
vim.lsp.config("clangd", {
  filetypes = { "c", "cpp" },
  cmd = {
    "clangd",
    "--background-index",
    "-j=12",
    "--query-driver=/usr/bin/**/clang-*,/bin/clang,/bin/clang++,/usr/bin/gcc,/usr/bin/g++",
    "--clang-tidy",
    "--clang-tidy-checks=*",
    "--all-scopes-completion",
    "--cross-file-rename",
    "--completion-style=detailed",
    "--header-insertion-decorators",
    "--header-insertion=iwyu",
    "--pch-storage=memory",
  },
})
vim.lsp.enable "clangd"

-- python
vim.lsp.config("basedpyright", {
  filetypes = { "python" },
  settings = {
    pyright = { autoImportCompletion = true },
    python = {
      analysis = {
        autoSearchPaths = true,
        diagnosticMode = "openFilesOnly",
        useLibraryCodeForTypes = true,
        typeCheckingMode = "off",
      },
    },
  },
})
vim.lsp.enable "basedpyright"

-- Export on_attach for other plugins to use
return {
  on_attach = on_attach,
}
