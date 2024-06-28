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

local function new_term()
  require('toggleterm.terminal').Terminal:new():toggle()
end

function M.keymaps()
  require('which-key').register({
    ['<F9>'] = {
      function()
        require('toggleterm')
        vim.cmd.stopinsert()
        vim.cmd.ToggleTerm()
      end,
      'Toggle Terminal',
    },
    ['<F45>'] = {
      '<C-\\><C-n>:ToggleTermSetName ',
      'Set Terminal Name (<Ctrl-Shift-F9>)',
    },
    ['<F57>'] = {
      new_term,
      'Create New Terminal (<Alt-F9>)',
    },
    ['<F21>'] = {
      function()
        require('toggleterm')
        vim.cmd.TermSelect()
      end,
      'Select Terminal (<Shift-F9>)',
    },
  }, { mode = { 'n', 'i', 'x', 't' } })
end

return M
