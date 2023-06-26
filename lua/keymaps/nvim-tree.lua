local api = require('nvim-tree.api')

require('which-key').register({
  ['<F2>'] = { function()
    vim.cmd.stopinsert()
    api.tree.toggle()
  end, 'Toggle Tree' },
}, { mode = { 'n', 'i', 'v' } })
