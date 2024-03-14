-- [[ Basic Keymaps ]]
--
-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Add jk exit insert mode
vim.keymap.set('i', 'jk', '<ESC>', { desc = 'Exits insert mode' })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

-- Movement keymaps
vim.keymap.set('n', 'E', '$', { desc = 'Move to the end of the line' })
vim.keymap.set('n', 'B', '^', { desc = 'Move to the start of the line' })
vim.keymap.set('n', 'c-u', '<c-u>zz')
vim.keymap.set('n', 'c-d', '<c-d>zz')
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')
vim.keymap.set('n', '<leader>cf', '0<c-g>', { desc = 'Show full file path' })
vim.keymap.set('n', 'Q', '<nop>')

-- Windows
vim.keymap.set('n', '<c-k>', ':wincmd k<CR>', { noremap = false })
vim.keymap.set('n', '<c-j>', ':wincmd j<CR>', { noremap = false })
vim.keymap.set('n', '<c-h>', ':wincmd h<CR>', { noremap = false })
vim.keymap.set('n', '<c-l>', ':wincmd l<CR>', { noremap = false })

-- Buffers
vim.keymap.set("n", "tk", ":blast<enter>", { noremap = false, desc = "[T]arget the last buffer" })
vim.keymap.set("n", "tj", ":bfirst<enter>", { noremap = false })
vim.keymap.set("n", "th", ":bprev<enter>", { noremap = false })
vim.keymap.set("n", "tl", ":bnext<enter>", { noremap = false })
vim.keymap.set("n", "td", ":bdelete<enter>", { noremap = false })

-- Remove search highlight
vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>')

-- Twilight
vim.keymap.set("n", "tw", ":Twilight<enter>", { desc = "Toggle Twilight", noremap = false })
