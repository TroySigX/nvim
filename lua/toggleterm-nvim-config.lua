local map = vim.keymap.set
map("n", "<F9>", ":ToggleTerm<CR>", {silent = true, noremap = true})
map("i", "<F9>", "<Esc>:ToggleTerm<CR>", {silent = true, noremap = true})
map("v", "<F9>", "<Esc>:ToggleTerm<CR>", {silent = true, noremap = true})
map("t", "<F9>", "<C-\\><C-N>:ToggleTerm<CR>", {silent = true, noremap = true})

require("toggleterm").setup{
  direction = 'float',
  float_opts = {
    border = 'curved',
    width = 75, 
    height = 20,
    winblend = 17,
  },
}
