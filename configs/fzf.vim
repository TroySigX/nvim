let g:fzf_preview_window = ['right:50%']

map <silent> <F6> <Esc> :Files<CR>
imap <silent> <F6> <Esc> :Files<CR>
map <silent> <F30> <Esc> :History<CR>
imap <silent> <F30> <Esc> :History<CR>

let g:fzf_action = {
    \ 'ctrl-t': 'tab split',
	\ 'ctrl-s': 'vsplit' }
