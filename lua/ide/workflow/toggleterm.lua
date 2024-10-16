local M = {}

function M.setup()
  require('toggleterm').setup({
    direction = 'float',
    float_opts = {
      border = 'curved',
      width = 110,
      height = 35,
      winblend = 17,
    },
    persist_mode = false,
  })
end

function M.keymaps()
  local map = require('utils.keymaps').add_keymap
  map({
    '<F9>',
    function()
      require('toggleterm')
      vim.cmd.stopinsert()
      vim.cmd.ToggleTerm()
    end,
    'Toggle Terminal',
    mode = { 'n', 'i', 'x', 't' },
  })
  map({
    '<F45>',
    '<C-\\><C-n>:ToggleTermSetName ',
    'Set Terminal Name (<Ctrl-Shift-F9>)',
    mode = { 'n', 'i', 'x', 't' },
  })
  map({
    '<F57>',
    function()
      require('toggleterm.terminal').Terminal:new():toggle()
    end,
    'Create New Terminal (<Alt-F9>)',
    mode = { 'n', 'i', 'x', 't' },
  })
  map({
    '<F21>',
    function()
      require('toggleterm')
      vim.cmd.TermSelect()
    end,
    'Select Terminal (<Shift-F9>)',
    mode = { 'n', 'i', 'x', 't' },
  })
end

return M
