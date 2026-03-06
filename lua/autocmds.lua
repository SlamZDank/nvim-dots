require "nvchad.autocmds"

-- Custom diagnostic for lines > 80 chars
local line_length_ns = vim.api.nvim_create_namespace "line_length"

local function has_coding_lsp(bufnr)
  local clients = vim.lsp.get_clients { bufnr = bufnr }
  for _, client in ipairs(clients) do
    if client.name ~= "typos_lsp" then
      return true
    end
  end
  return false
end

vim.api.nvim_create_autocmd({ "BufEnter", "TextChanged", "TextChangedI", "LspAttach", "LspDetach" }, {
  callback = function()
    local bufnr = vim.api.nvim_get_current_buf()

    if not has_coding_lsp(bufnr) then
      vim.diagnostic.set(line_length_ns, bufnr, {})
      return
    end

    local diagnostics = {}

    for i = 0, vim.api.nvim_buf_line_count(bufnr) - 1 do
      local line = vim.api.nvim_buf_get_lines(bufnr, i, i + 1, false)[1]
      if #line > 80 then
        table.insert(diagnostics, {
          lnum = i,
          col = 80,
          end_col = #line,
          message = "Line is too long, please wrap it!\nLength: " .. #line .. " > 80",
          severity = vim.diagnostic.severity.WARN,
          source = "linelen",
        })
      end
    end

    vim.diagnostic.set(line_length_ns, bufnr, diagnostics)
  end,
})
