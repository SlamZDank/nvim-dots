require "nvchad.options"

-- add yours here!

-- local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!
local options = {
  backup = false, -- creates a backup file
  clipboard = "unnamedplus", -- allows neovim to access the system clipboard
  cmdheight = 1, -- this causes multiple lines not to move correctly when set to 0.
  conceallevel = 0, -- so that `` is visible in markdown files
  fileencoding = "utf-8", -- the encoding written to a file
  hlsearch = true, -- highlight all matches on previous search pattern
  ignorecase = true, -- ignore case in search patterns
  mouse = "a", -- allow the mouse to be used in neovim
  showmode = false, -- we don't need to see things like -- INSERT -- anymore
  smartindent = true, -- make indenting smarter again
  splitbelow = true, -- force all horizontal splits to go below current window
  splitright = true, -- force all vertical splits to go to the right of current window
  swapfile = false, -- creates a swapfile
  smartcase = true, -- smart case
  termguicolors = true, -- set term gui colors (most terminals support this)
  undofile = true, -- enable persistent undo
  writebackup = false, -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
  expandtab = true, -- convert tabs to spaces
  shiftwidth = 2, -- the number of spaces inserted for each indentation
  tabstop = 2, -- insert 2 spaces for a tab
  cursorline = true, -- highlight the current line
  number = true, -- set numbered lines
  relativenumber = true, -- set relative numbered lines
  autoindent = true,
  numberwidth = 2, -- set number column width to 2 {default 4}
  signcolumn = "yes", -- always show the sign column, otherwise it would shift the text each time
  wrap = true, -- display lines as one long line
  linebreak = true, -- companion to wrap, don't split words
  scrolloff = 8, -- minimal number of screen lines to keep above and below the cursor
  sidescrolloff = 8, -- minimal number of screen columns either side of cursor if wrap is `false`
  guifont = "JetBrainsMono Nerd Font:h12", -- the font used in graphical neovim applications such as neovide
  whichwrap = "bs<>[]hl", -- which "horizontal" keys are allowed to travel to prev/next line
  foldmethod = "indent", -- folding method best suited for easily navigating code
  foldlevel = 99, -- do not fold everything by default, it is annoying to deal with
}

-- set all the oprions in the table above
for k, v in pairs(options) do
  vim.opt[k] = v
end

if vim.g.neovide then
  vim.g.neovide_opacity = 0.9
  vim.g.neovide_refresh_rate_idle = 5
  vim.g.neovide_floating_blur_amount_x = 1.0
  vim.g.neovide_floating_blur_amount_y = 1.0
  vim.g.neovide_cursor_animation_length = 0.2
  vim.g.neovide_scroll_animation_length = 0.2
  vim.g.neovide_cursor_trail = 1.8
  vim.g.neovide_underline_termcolors = false -- this makes the underlining of strings look much better
  vim.g.neovide_refresh_rate = 165
  vim.g.neovide_floating_shadow = true
  vim.g.neovide_floating_z_height = 10
  vim.g.neovide_light_angle_degrees = 45
  vim.g.neovide_light_radius = 5
end

-- vim.opt.shortmess = "ilmnrx"                        -- flags to shorten vim messages, see :help 'shortmess'
vim.opt.fillchars = { eob = " " } -- remove tildes in neovim
vim.opt.shortmess:append "c" -- don't give |ins-completion-menu| messages
vim.opt.iskeyword:append "-" -- hyphenated words recognized by searches
vim.opt.formatoptions:remove { "c", "r", "o" } -- don't insert the current comment leader automatically for auto-wrapping comments using 'textwidth', hitting <Enter> in insert mode, or hitting 'o' or 'O' in normal mode.
vim.opt.runtimepath:remove "/usr/share/vim/vimfiles" -- separate vim plugins from neovim in case vim still in use
vim.notify = function() end

vim.api.nvim_command [[aunmenu PopUp.How-to\ disable\ mouse]]
vim.api.nvim_command [[aunmenu PopUp.-1-]]
-- vim.cmd('highlight MsgArea guibg=#171B21 gui=bold guisp=NONE')
