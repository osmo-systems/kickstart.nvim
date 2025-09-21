return {
  'tpope/vim-fugitive',
  config = function()
    -- Optional keymaps
    vim.keymap.set('n', '<leader>gs', ':Git<CR>', { desc = 'Git status' })
    vim.keymap.set('n', '<leader>gb', ':Git blame<CR>', { desc = 'Git blame' })
  end,
}
