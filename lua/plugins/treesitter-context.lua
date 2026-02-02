return {
  "nvim-treesitter/nvim-treesitter-context",
  event = "BufReadPost",
  opts = {
    max_lines = 3, -- limit context lines (default unlimited)
    min_window_height = 20, -- disable for small windows
    line_numbers = true,
    multiline_threshold = 5, -- max lines for multiline nodes
    trim_scope = "outer",
    mode = "cursor",
  },
}
