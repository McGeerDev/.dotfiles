local opts = { noremap = true, silent = true } 

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

-- Spacebar is leader
keymap("", "<Space>", "Nop", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Window Navigation made ez
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Ez file explorer
keymap("n", "<leader>e", ":Lex 30<CR>", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize +2<CR>", opts)
keymap("n", "<C-Down>", ":resize -2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Escape fast with jk
keymap("i", "jk", "<Esc>", opts)
keymap("v", "jk", "<Esc>", opts)

-- Yank to end of the line
keymap("n", "Y", "y$", opts)

-- Keep copied string even after overwrite(pasting)
keymap("v", "p", '"_dP', opts)

-- Set undo breakpoints
keymap("i", ".", ".<c-g>u", opts)
keymap("i", ",", ",<c-g>u", opts)
keymap("i", "!", "!<c-g>u", opts)
keymap("i", "?", "?<c-g>u", opts)

-- Keep cursor centered (While finding next occurance)
keymap("n", "n", "nzzzv", opts)
keymap("n", "N", "Nzzzv", opts)
keymap("n", "J", "mzJ`z", opts) -- Acts how normal <S-j> does except keeps cursor at the same place.

-- Managing Indents
keymap("v", ">", ">gv", opts) -- Indent Right
keymap("v", "<", "<gv", opts) -- Indent Left

-- Move text 
keymap("v", "K", ":m '<-2<CR>gv=gv", opts)
keymap("v", "J", ":m '>+1<CR>gv=gv", opts)
