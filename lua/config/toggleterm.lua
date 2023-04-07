local map = vim.keymap.set

local toggleTerm = function()
  local api = vim.api
  local bufnr = api.nvim_get_current_buf()
  local filename = api.nvim_buf_get_name(bufnr)
  local modifiable = api.nvim_buf_get_option(bufnr, 'modifiable')

  if filename ~= '' and modifiable then
    api.nvim_command('write')
  end

  api.nvim_command('ToggleTerm')
end

map({ 'n', 'i', 'v' }, '<F9>', function()
  vim.cmd.stopinsert()
  toggleTerm()
end, { desc = 'Toggle Term', silent = true })
map('t', '<F9>', '<C-\\><C-N>:ToggleTerm<CR>', { desc = 'Toggle Term', silent = true })

require('toggleterm').setup{
  direction = 'float',
  float_opts = {
    border = 'curved',
    width = 110,
    height = 35,
    winblend = 17,
  },
}