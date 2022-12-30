noremap <silent> <F9> :ToggleTerm<CR>
inoremap <silent> <F9> <C-\><C-n> :ToggleTerm<CR>
tnoremap <silent> <F9> <C-\><C-n> :ToggleTerm<CR>

lua << EOF
require("toggleterm").setup{
  direction = 'float',
  float_opts = {
    border = 'curved',
    width = 75, 
    height = 20,
    winblend = 17,
  },
}

EOF
