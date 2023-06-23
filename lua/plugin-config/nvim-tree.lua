local map = vim.keymap.set
local unmap = vim.keymap.del
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
  api.tree.find_file { open = true, update_root = '!' }
  api.tree.focus()
end

local function opts(bufnr)
  return { buffer = bufnr, nowait = true }
end

require('nvim-tree').setup({
  disable_netrw = true,

  on_attach = function(bufnr)
    api.config.mappings.default_on_attach(bufnr)

    -- custom mappings
    unmap('n', '<C-t>', { buffer = bufnr })
    map('n', '<C-t>', open_tab, opts(bufnr))
    map('n', 'T', open_tab_silent, opts(bufnr))
    map('n', 'CD', goto_buffer_cwd, opts(bufnr))
    map('n', '<C-s>', api.node.open.horizontal, opts(bufnr))
  end,

  git = {
    ignore = false,
  },

  view = {
    relativenumber = true,
  },
})

map({ 'n', 'i', 'v' }, '<F2>', function()
  vim.cmd.stopinsert()
  api.tree.toggle()
end, { desc = 'Toggle Tree' })
