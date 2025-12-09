-- Custom formatting plugin to ensure workspace-level Prettier config is used
return {
  {
    'stevearc/conform.nvim',
    optional = true,
    opts = function(_, opts)
      local util = require('conform.util')
      local root = util.root_file({
        'nx.json',
        '.prettierrc',
        '.prettierrc.json',
        '.prettierrc.yaml',
        '.prettierrc.yml',
        '.prettierrc.js',
        '.prettierrc.cjs',
        'prettier.config.js',
        'prettier.config.cjs',
      })
      opts.formatters = opts.formatters or {}
      opts.formatters.prettier = vim.tbl_deep_extend('force', opts.formatters.prettier or {}, {
        cwd = root,
      })
      opts.formatters.prettierd = vim.tbl_deep_extend('force', opts.formatters.prettierd or {}, {
        cwd = root,
      })
      -- Also apply to specific filetypes if needed
      opts.formatters_by_ft = opts.formatters_by_ft or {}
      local fb = opts.formatters_by_ft
      fb.javascript = fb.javascript or { 'prettierd', 'prettier', stop_after_first = true }
      fb.typescript = fb.typescript or { 'prettierd', 'prettier', stop_after_first = true }
      fb.javascriptreact = fb.javascriptreact or { 'prettierd', 'prettier', stop_after_first = true }
      fb.typescriptreact = fb.typescriptreact or { 'prettierd', 'prettier', stop_after_first = true }
      fb.json = fb.json or { 'prettierd', 'prettier', stop_after_first = true }
      fb.markdown = fb.markdown or { 'prettierd', 'prettier', stop_after_first = true }
      return opts
    end,
  },
}
