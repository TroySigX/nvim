vim.o.foldcolumn = '1'
vim.o.foldlevel = 99
vim.o.foldlevelstart = 99
vim.o.foldenable = true
vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]

local builtin = require('statuscol.builtin')
require('statuscol').setup({
  relculright = true,
  segments = {
    { text = { builtin.foldfunc }, click = 'v:lua.ScFa' },
    { text = { '%s' }, click = 'v:lua.ScSa' },
    { text = { builtin.lnumfunc, ' ' }, click = 'v:lua.ScLa' },
  },
})

require('ufo').setup({
    provider_selector = function()
        return {'treesitter', 'indent'}
    end
})

local map = vim.keymap.set
map({ 'n', 'v' }, '<leader>fc', ':foldclose<CR>', { desc = '[F]old [C]lose', silent = true })
