-- Themes
return {
  { 'rebelot/kanagawa.nvim', priority = 1000 },
  { 'rose-pine/neovim', priority = 1000 },
  { -- Switch dark/light theme based on system setting.
    'f-person/auto-dark-mode.nvim',
    config = function()
      require('auto-dark-mode').setup {
        update_interval = 5000,
        set_dark_mode = function()
          vim.opt.background = 'dark'
          vim.cmd 'colorscheme kanagawa'
        end,
        set_light_mode = function()
          vim.opt.background = 'light'
          vim.cmd 'colorscheme rose-pine-dawn'
        end,
      }
    end,
  },
}
