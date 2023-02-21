local function open_tab_silent(node)
    local api = require('nvim-tree.api')

    api.node.open.tab(node)
    vim.cmd.tabprev()
end

local function open_tab(node)
    local api = require('nvim-tree.api')

    api.node.open.tab(node)
    vim.cmd.tabprev()
    api.tree.close()
    vim.cmd.tabnext()
end

local function goto_buffer_cwd()
  vim.cmd('wincmd l')
  local api = require('nvim-tree.api')
  api.tree.close()
  vim.cmd('NvimTreeFindFile!')
end

require('nvim-tree').setup({
  disable_netrw = true,
  view = {
    mappings = {
      list = {
        { key = '<C-t>', action = 'open_tab', action_cb = open_tab },
        { key = 'T', action = 'open_tab_silent', action_cb = open_tab_silent },
        { key = 'CD', action = 'goto_cwd', action_cb = goto_buffer_cwd },
      },
    }
  },
  git = {
      ignore = false,
  },
})

local map = vim.keymap.set
local api = require('nvim-tree.api')
map({ 'n', 'i', 'v' }, '<F2>', function() 
    vim.cmd.stopinsert()
    api.tree.toggle()
end, { desc = 'Toggle Tree' })
