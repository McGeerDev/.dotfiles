require('gitsigns').setup {
  signs = {
    add = { text = '+' },
    change = { text = '~' },
    delete = { text = '_' },
    topdelete = { text = '‾' },
    changedelete = { text = '~' },
  },
  current_line_blame = false,
  on_attach = function(bufnr)
    local gs = package.loaded.gitsigns

    local function map(mode, l, r, opts)
      opts = opts or {}
      opts.buffer = bufnr
      vim.keymap.set(mode, l, r, opts)
    end

    -- Navigation
    map('n', ']c', function()
      if vim.wo.diff then return ']c' end
      vim.schedule(function() gs.next_hunk() end)
      return '<Ignore>'
    end, { expr = true })

    map('n', '[c', function()
      if vim.wo.diff then return '[c' end
      vim.schedule(function() gs.prev_hunk() end)
      return '<Ignore>'
    end, { expr = true })

    -- Actions
    map({ 'n', 'v' }, '<leader>hs', gs.stage_hunk { vim.fn.line '.', vim.fn.line 'v' }, { desc = 'Gitsigns stage_hunk' })
    map({ 'n', 'v' }, '<leader>hr', gs.reset_hunk, { desc = 'Gitsigns reset_hunk' })
    map('n', '<leader>hS', gs.stage_buffer, { desc = 'Gitsigns stage_buffer' })
    --map('n', '<leader>ha', gs.stage_hunk, { desc = 'Gitsigns stage_hunk' })
    map('n', '<leader>hu', gs.undo_stage_hunk, { desc = 'Gitsigns undo_stage_hunk' })
    map('n', '<leader>hR', gs.reset_buffer, { desc = 'Gitsigns reset_buffer' })
    map('n', '<leader>hp', gs.preview_hunk, { desc = 'Gitsigns preview_hunk' })
    map('n', '<leader>hb', function() gs.blame_line { full = true } end, { desc = 'Gitsigns blame_line' })
    map('n', '<leader>hd', gs.diffthis, { desc = 'Gitsigns diffthis' })

    -- Toggles
    map('n', '<leader>td', gs.toggle_deleted, { desc = 'Gitsigns toggle_deleted' })
    map('n', '<leader>tb', gs.toggle_current_line_blame, { desc = 'Gitsigns toggle_current_line_blame' })
    map('n', '<leader>hD', function() gs.diffthis('~') end, { desc = 'Gitsigns toggle_blame_line' })

    -- Text object
    map({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
  end
}
