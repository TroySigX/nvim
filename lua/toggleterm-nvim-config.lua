local map = vim.keymap.set
local bufopts = { silent = true }

map("n", "<F9>", ":ToggleTerm<CR>", bufopts)
map("i", "<F9>", "<Esc>:ToggleTerm<CR>", bufopts)
map("v", "<F9>", "<Esc>:ToggleTerm<CR>", bufopts)
map("t", "<F9>", "<C-\\><C-N>:ToggleTerm<CR>", bufopts)

require("toggleterm").setup{
  direction = 'float',
  float_opts = {
    border = 'curved',
    width = 75, 
    height = 20,
    winblend = 17,
  },
}
