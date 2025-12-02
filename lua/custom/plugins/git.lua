return {
  {
    'tpope/vim-fugitive',
    config = function()
      -- Optional keymaps
      vim.keymap.set('n', '<leader>gs', ':Git<CR>', { desc = 'Git status' })
      vim.keymap.set('n', '<leader>gb', ':Git blame<CR>', { desc = 'Git blame' })
    end,
  },
  {
    'lewis6991/gitsigns.nvim',
    lazy = false,
    keys = {
      {
        '<leader>gsd',
        '<cmd>Gitsigns diffthis main<cr>',
      },
      opts = {
        current_line_blame = true,
      },
    },
    opts = {
      current_line_blame = true,
      current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = 'eol',
      },
    },
  },
  {
    'sindrets/diffview.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    cmd = {
      'DiffviewOpen',
      'DiffviewClose',
      'DiffviewToggleFiles',
      'DiffviewFocusFiles',
      'DiffviewFileHistory',
    },
    keys = {
      {
        '<leader>gd',
        ':DiffviewOpen ',
        desc = 'Diffview Open',
      },
      {
        '<leader>gdc',
        '<cmd>DiffviewClose<cr>',
        desc = 'Diffview Close',
      },
    },
    opts = {
      view = {
        merge_tool = {
          layout = 'diff3_mixed',
        },
      },
      file_panel = {
        listing_style = 'tree',
      },
      default_args = {
        DiffviewOpen = { '--imply-local' },
      },
      hooks = {
        diff_buf_read = function(bufnr)
          vim.opt_local.wrap = true
          vim.opt_local.linebreak = true
        end,
      },
    },
  },
}
