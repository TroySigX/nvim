local map = vim.keymap.set
local api = require('nvim-tree.api')

local function open_tab_silent(node)
  api.node.open.tab(node)
  vim.cmd.tabprev()
end

local function open_tab(node)
  api.node.open.tab(node)
  vim.cmd.tabprev()
  api.tree.close()
  vim.cmd.tabnext()
end

local function goto_buffer_cwd()
  vim.cmd('wincmd l')
  api.tree.close()
  vim.cmd('NvimTreeFindFile!')
end

require('nvim-tree').setup({
  disable_netrw = true,

  on_attach = function()
    map('n', '<C-t>', open_tab)
    map('n', 'T', open_tab_silent)
    map('n', 'CD', goto_buffer_cwd)
    map('n', '<Tab>', api.node.open.preview)
    map('n', '<CR>', api.node.open.edit)
  end,

  git = {
    ignore = false,
  },
})

map({ 'n', 'i', 'v' }, '<F2>', function()
  vim.cmd.stopinsert()
  api.tree.toggle()
end, { desc = 'Toggle Tree' })
