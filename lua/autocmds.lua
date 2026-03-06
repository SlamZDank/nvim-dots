require "nvchad.autocmds"

-- Custom diagnostic for lines > 80 chars
local line_length_ns = vim.api.nvim_create_namespace "line_length"

vim.api.nvim_create_autocmd({ "BufEnter", "TextChanged", "TextChangedI" }, {
  callback = function()
    local bufnr = vim.api.nvim_get_current_buf()
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
