require "nvchad.mappings"

local keymap = vim.keymap.set
local remove = vim.keymap.del

keymap("n", ";", ":", { desc = "CMD enter command mode" })

local keys = { 'i', 'I', 'a', 'A' }

local opts = { noremap = true, silent = true }
local term_opts = { silent = true }

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Remove some keybinds defined by the Distro
remove("n", "<leader>ds")
remove("n", "<leader>n")

-- Normal --
-- Better window navigation
keymap("n", "<leader>e", ":NvimTreeToggle<CR>", { desc = "Toggle the Nvim Tree" })
keymap(
  "n",
  "<leader>ca",
  "<cmd>lua vim.lsp.buf.code_action()<CR>",
  { desc = "Code Action", noremap = true, silent = true }
)

keymap("n", "<C-h>", "<C-w>h", { desc = "Switch to the window on the left " })
keymap("n", "<C-j>", "<C-w>j", { desc = "Switch to the window on the bottom" })
keymap("n", "<C-k>", "<C-w>k", { desc = "Switch to the window on top" })
keymap("n", "<C-l>", "<C-w>l", { desc = "Switch to the window on the right" })

-- Clear search highlights
keymap("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- Increment decrement
keymap("n", "<leader>+", "<C-a>", { desc = "Increment number" })
keymap("n", "<leader>-", "<C-x>", { desc = "Decrement number" })

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", { desc = "Resize window Upwards" })
keymap("n", "<C-Down>", ":resize +2<CR>", { desc = "Resize window Downwards" })
keymap("n", "<C-Left>", ":vertical resize -2<CR>", { desc = "Resize window to the right" })
keymap("n", "<C-Right>", ":vertical resize +2<CR>", { desc = "Resize windows to the left" })

-- Move text up and down
keymap("n", "<A-j>", ":m .+1<CR>==", { desc = "Move text up" })
keymap("n", "<A-k>", ":m .-2<CR>==", { desc = "Move text down" })

-- window management
keymap("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })                         -- split window vertically
keymap("n", "<leader>so", "<C-w>s", { desc = "Split window horizontally" })                       -- split window horizontally
keymap("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })                          -- make split windows equal width & height
keymap("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })                     -- close current split window

keymap("n", "<leader>wo", "<cmd>tabnew<CR>", { desc = "Open new workspace" })                     -- open new tab
keymap("n", "<leader>wx", "<cmd>tabclose<CR>", { desc = "Close current workspace" })              -- close current tab
keymap("n", "<leader>wn", "<cmd>tabn<CR>", { desc = "Go to next workspace" })                     --  go to next tab
keymap("n", "<leader>wp", "<cmd>tabp<CR>", { desc = "Go to previous workspace" })                 --  go to previous tab
keymap("n", "<leader>wf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new workspace" }) --  move current buffer to new tab

-- disable macros, (wtf were you thinking SlamZDank!)
-- keymap("n", "q", "", {})

-- diagnostic window
keymap('n', '<space>we', function() vim.diagnostic.open_float(0, { scope = 'line' }) end,
  { noremap = true, silent = true, desc = 'LSP Show line diagnostics' })

-- diagnostic list of errors
keymap("n", "<leader>ll", function()
  vim.diagnostic.setloclist()
end, { desc = "Show LSP diagnostics in loclist" })


-- add minty and menu and remove the default context menu and color meny
keymap("n", "<leader>rm", function()
  require("menu").open "default"
end, { desc = "Open the context menu" })

-- mouse users + nvimtree users!
keymap("n", "<RightMouse>", function()
  vim.cmd.exec '"normal! \\<RightMouse>"'

  local options = vim.bo.ft == "NvimTree" and "nvimtree" or "default"
  require("menu").open(options, { mouse = true })
end, { desc = "Open the context menu" })

-- use the new style of the theme picker
keymap("n", "<leader>th", function()
  require("nvchad.themes").open { style = "compact" }
end, { desc = "Telescope NvChad themes" })

-- diagnostic window
keymap('n', '<space>we', function() vim.diagnostic.open_float(0, { scope = 'line' }) end,
  { noremap = true, silent = true, desc = 'LSP Show line diagnostics' })

-- add minty and menu and remove the default context menu and color meny
keymap("n", "<leader>rm", function()
  require("menu").open "default"
end, { desc = "Open the context menu" })

-- mouse users + nvimtree users!
keymap("n", "<RightMouse>", function()
  vim.cmd.exec '"normal! \\<RightMouse>"'

  local options = vim.bo.ft == "NvimTree" and "nvimtree" or "default"
  require("menu").open(options, { mouse = true })
end, { desc = "Open the context menu" })

-- use the new style of the theme picker
keymap("n", "<leader>th", function()
  require("nvchad.themes").open { style = "compact" }
end, { desc = "Telescope NvChad themes" })

-- so it auto indents the upon finding an empty line
for _, key in ipairs(keys) do
  keymap('n', key, function()
    local line = vim.api.nvim_get_current_line()
    if string.match(line, '%g') == nil
        and vim.bo.buftype ~= "nofile"   -- Blocks Telescope/popups
        and vim.bo.buftype ~= "prompt"   -- Blocks command prompts
        and vim.bo.buftype ~= "terminal" -- Blocks terminals
    then
      return 'cc'
    else
      return key
    end
  end, { expr = true, noremap = true })
end

-- Insert --
-- Kde is the goat, caps lock is now escape

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv^", { desc = "Stay in indent mode" })
keymap("v", ">", ">gv^", { desc = "Stay in indent mode" })
keymap('v', 'y', 'ygv', { noremap = true, silent = true })

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":m '>+1<CR>gv=gv", { desc = "Move text down" })
keymap("x", "K", ":m '<-2<CR>gv=gv", { desc = "Move text up" })
keymap("x", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move text down" })
keymap("x", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move text up" })
