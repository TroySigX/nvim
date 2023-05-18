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

local map = vim.keymap.set

map({ 'n', 'i', 'v' }, '<F9>','<Esc>:ToggleTerm<CR>', { silent = true })
map('t', '<F9>', '<C-\\><C-N>:ToggleTerm<CR>', { desc = 'Toggle Term', silent = true })
