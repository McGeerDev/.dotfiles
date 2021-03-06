local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

-- Spacebar is leader
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Window Navigation made ez
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Ez file explorer
keymap("n", "<leader>e", ":NvimTreeToggle<CR>", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize +2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize -2<CR>", opts)

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

-- Comments
-- Visual mode
keymap("n", "<C-_>", '<ESC><cmd>lua require("Comment.api").toggle_current_linewise()<CR>', opts)
-- keymap("v", "<C-_>", '<ESC><CMD>lua require("Comment.api").toggle_blockwise_op(vim.fn.visualmode())<CR>', opts)

-- Move text
keymap("v", "K", ":m '<-2<CR>gv=gv", opts)
keymap("v", "J", ":m '>+1<CR>gv=gv", opts)

-- Terminal --
-- Better terminal navigation
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

-- keymap("n", "<leader>f", "<cmd>Telescope find_files<cr>", opts)
keymap("n", "<leader>f", ":lua vim.lsp.buf.formatting()<CR>", opts)
-- keymap("n", "<leader>f", "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false }))<cr>", opts)
-- keymap("n", "<c-t>", "<cmd>Telescope live_grep<cr>", opts)
