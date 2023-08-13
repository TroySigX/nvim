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
  return {
    {
      '<F9>',
      vim.cmd.ToggleTerm,
      silent = true,
      desc = 'Toggle Terminal',
      mode = { 'n', 'i', 'v', 't' },
    },
    {
      '<F45>',
      '<C-\\><C-n>:ToggleTermSetName ',
      desc = 'Set Terminal Name (<Ctrl-Shift-F9>)',
      mode = { 'n', 'i', 'v', 't' },
    },
    { '<F57>', new_term, silent = true, desc = 'Create New Terminal (<Alt-F9>)', mode = { 'n', 'i', 'v', 't' } },
    {
      '<F21>',
      vim.cmd.TermSelect,
      silent = true,
      desc = 'Select Terminal (<Shift-F9>)',
      mode = { 'n', 'i', 'v', 't' },
    },
  }
end

return M
