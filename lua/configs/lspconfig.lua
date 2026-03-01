local lspconfig = require "nvchad.configs.lspconfig"

vim.lsp.config("*", {
  capabilities = lspconfig.capabilities,
  on_init = lspconfig.on_init,
  on_attach = lspconfig.on_attach,
})

-- Servers with no extra configuration
local servers = {
  "html",
  "cssls",
  "vtsls",
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

-- Servers with custom configuration
local custom_servers = {
  -- Rust (bacon-ls)
  ["bacon-ls"] = {
    cmd = { "bacon-ls" },
    filetypes = { "rust" },
    root_markers = { "Cargo.toml", "Cargo.lock" },
    settings = {
      ["bacon-ls"] = {
        updateOnSave = true,
        updateOnSaveWaitMillis = 1000,
        updateOnChange = true,
      },
    },
  },

  -- Lua
  lua_ls = {
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
  },

  -- C / C++ / CUDA
  clangd = {
    filetypes = { "c", "cpp", "cuda" },
    cmd = {
      "clangd",
      "--background-index",
      "-j=" .. tostring(math.max(1, math.floor(vim.uv.available_parallelism() / 2))),
      "--query-driver=/usr/bin/clang-*,/usr/bin/clang,/usr/bin/g++,/usr/bin/gcc",
      "--clang-tidy",
      "--all-scopes-completion",
      "--cross-file-rename",
      "--completion-style=detailed",
      "--header-insertion-decorators",
      "--header-insertion=iwyu",
      "--pch-storage=memory",
    },
  },

  -- Python
  basedpyright = {
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
  },
}

for server, config in pairs(custom_servers) do
  vim.lsp.config(server, config)
  vim.lsp.enable(server)
end

-- typos-lsp: attach to all buffers
vim.api.nvim_create_autocmd({ "BufReadPost", "BufEnter" }, {
  callback = function()
    vim.lsp.start {
      name = "typos_lsp",
      cmd = { "typos-lsp" },
      root_dir = vim.fs.root(0, { ".git" }) or vim.fn.getcwd(),
      settings = {
        diagnosticSeverity = "Warning",
      },
      on_attach = function(client, bufnr)
        require("nvchad.configs.lspconfig").on_attach(client, bufnr)
      end,
    }
  end,
})
