-- editor settings
require('settings')

-- plugins
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable',
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

vim.loader.enable()

require('lazy').setup({
  spec = {
    { import = 'plugin-config.lsp.plugins' },
    { import = 'plugin-config.editing.plugins' },
    { import = 'plugin-config.explorer.plugins' },
    { import = 'plugin-config.gui.plugins' },
    { import = 'plugin-config.navigation.plugins' },
    { import = 'plugin-config.workflow.plugins' },
    { import = 'plugin-config.others.plugins' },
  },

  -- disable built-in plugins
  performance = {
    rtp = {
      disabled_plugins = {
        '2html_plugin',
        'getscript',
        'getscriptPlugin',
        'netrw',
        'netrwPlugin',
        'netrwSettings',
        'netrwFileHandlers',
        'tar',
        'tarPlugin',
        'rrhelper',
        'vimball',
        'vimballPlugin',
      }
    },
  },
})

-- lang venv
require('virtualenv-config.init')
