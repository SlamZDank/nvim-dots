require "nvchad.mappings"

-- add yours here

local keymap = vim.keymap.set

keymap("n", ";", ":", { desc = "CMD enter command mode" })
keymap("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<leader>e", ":NvimTreeToggle<CR>", { desc = "Toggle the Nvim Tree" })

keymap("n", "<C-h>", "<C-w>h", { desc = "Switch to the window on the left " })
keymap("n", "<C-j>", "<C-w>j", { desc = "Switch to the window on the bottom" })
keymap("n", "<C-k>", "<C-w>k", { desc = "Switch to the window on top" })
keymap("n", "<C-l>", "<C-w>l", { desc = "Switch to the window on the right" })

-- DAP support
keymap("n", "<Leader>db", ":DapToggleBreakpoint<CR>", { desc = "Toggle debugger breakpoint" })
keymap("n", "<Leader>dr", ":DapContinue<CR>", { desc = "Start or continue the debugger" })
keymap("n", "<Leader>dx", ":DapTerminate<CR>", { desc = "Terminate debugger" })
keymap("n", "<Leader>do", ":DapStepOver<CR>", { desc = "Debugger step over" })

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

-- Insert --
-- Press jk fast to exit insert mode
keymap("i", "jk", "<ESC>", { desc = "Exit insert mode" })
keymap("i", "kj", "<ESC>", { desc = "Exit insert mode" })

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv^", { desc = "Stay in indent mode" })
keymap("v", ">", ">gv^", { desc = "Stay in indent mode" })

-- Move text up and down
keymap("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move text down" })
keymap("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move text up" })
keymap("v", "p", '"_dP', { desc = "Split window vertically" })

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":m '>+1<CR>gv=gv", { desc = "Move text down" })
keymap("x", "K", ":m '<-2<CR>gv=gv", { desc = "Move text up" })
keymap("x", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move text down" })
keymap("x", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move text up" })

-- window management
keymap("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
keymap("n", "<leader>so", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
keymap("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
keymap("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

keymap("n", "<leader>wo", "<cmd>tabnew<CR>", { desc = "Open new workspace" }) -- open new tab
keymap("n", "<leader>wx", "<cmd>tabclose<CR>", { desc = "Close current workspace" }) -- close current tab
keymap("n", "<leader>wn", "<cmd>tabn<CR>", { desc = "Go to next workspace" }) --  go to next tab
keymap("n", "<leader>wp", "<cmd>tabp<CR>", { desc = "Go to previous workspace" }) --  go to previous tab
keymap("n", "<leader>wf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new workspace" }) --  move current buffer to new tab

keymap("n", "q", "", {})
-- keymap("n", "<leader>tn", "<Tab>", { desc = "Go to next tab" }) --  go to next tab
-- keymap("n", "<leader>tp", "<S-Tab>", { desc = "Go to previous workspace" }) --  go to previous tab
