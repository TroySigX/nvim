-- editor settings
require('settings')

-- plugins
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.uv.fs_stat(lazypath) then
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
    { import = 'ide.lsp.plugins' },
    { import = 'ide.editing.plugins' },
    { import = 'ide.explorer.plugins' },
    { import = 'ide.gui.plugins' },
    { import = 'ide.navigation.plugins' },
    { import = 'ide.workflow.plugins' },
    { import = 'ide.others.plugins' },
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
        'tohtml',
        'tutor',
      },
    },
  },
})

-- keymaps
require('ide.keymaps').setup()
