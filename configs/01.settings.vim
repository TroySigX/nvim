set nocompatible
filetype plugin on
syntax on
set termguicolors
set number
set autoindent
set tabstop=4
set shiftwidth=4
set smarttab
set softtabstop=4
set expandtab
set mouse=a
set splitright
set splitbelow
set clipboard=unnamedplus

let g:coc_node_path = '/usr/local/lib/nodejs/bin/node'
let g:ale_disable_lsp = 1

set encoding=UTF-8
set showmatch

"abbreviations
autocmd Filetype java :ab deprint System.out.print();
autocmd Filetype java :ab deprintln System.out.println();
autocmd Filetype python :ab main$ if __name__ == '__main__':

"moving between tabs
nmap <F7> gt
vmap <F7> <Esc> gt
imap <F7> <Esc> gt

noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
noremap <leader>0 :tablast<cr>

"template
autocmd Filetype cpp :nnoremap <space>t :-1read $HOME/.config/nvim/configs/templates/contest/main.cpp<CR>:148<CR>i
autocmd Filetype cpp :nnoremap <space>m :-1read $HOME/.config/nvim/configs/templates/main/main.cpp<CR>:6<CR>i
autocmd Filetype java :nnoremap <space>t :-1read $HOME/.config/nvim/configs/templates/contest/Main.java<CR>:24<CR>i
autocmd Filetype java :nnoremap <space>m :-1read $HOME/.config/nvim/configs/templates/main/Main.java<CR>:3<CR>i
