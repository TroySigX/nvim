local M = {}

function M.setup()
  require('toggleterm').setup{
    direction = 'float',
    float_opts = {
      border = 'curved',
      width = 110,
      height = 35,
      winblend = 17,
    },
    persist_mode = false,
  }
end

function M.keymaps()
  require('which-key').register({
    ['<F9>'] = { '<Esc>:ToggleTerm<CR>', 'Toggle Term' }
  }, { mode = { 'n', 'i', 'v' } })

  require('which-key').register({
    ['<F9>'] = { '<C-\\><C-N>:ToggleTerm<CR>', 'Toggle Term' }
  }, { mode = 't' })
end

return M
