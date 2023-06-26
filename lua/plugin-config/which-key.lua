vim.o.timeout = true
vim.o.timeoutlen = 300
require('which-key').setup({
  triggers_blacklist = {
    n = { 'v' },
  },
})

-- load keymaps
require('keymaps.competitest')
require('keymaps.dadbod')
require('keymaps.fzf-lua')
require('keymaps.knap')
require('keymaps.leap-nvim')
require('keymaps.lsp-setup')
require('keymaps.luasnip')
require('keymaps.muren')
require('keymaps.neogen')
require('keymaps.neogit')
require('keymaps.neorg')
require('keymaps.neotest')
require('keymaps.noice')
require('keymaps.nvim-dap')
require('keymaps.nvim-tree')
require('keymaps.open-browser')
require('keymaps.smart-splits')
require('keymaps.sniprun')
require('keymaps.tagbar')
require('keymaps.todo-comments')
require('keymaps.toggleterm')
require('keymaps.treesj')
require('keymaps.trouble')
require('keymaps.undotree')
