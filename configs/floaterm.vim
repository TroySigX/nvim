let g:floaterm_position = 'topright'
let g:floaterm_width = 0.6
let g:floaterm_height = 0.6

noremap <silent> <F9> :FloatermToggle<CR>
inoremap <silent> <F9> <C-\><C-n> :FloatermToggle<CR>
tnoremap <silent> <F9> <C-\><C-n> :FloatermToggle<CR>

set termguicolors
