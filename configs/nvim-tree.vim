lua << EOF
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("nvim-tree").setup()

EOF

map <silent> <F2> <Esc>:NvimTreeToggle<CR>
imap <silent> <F2> <Esc>:NvimTreeToggle<CR>
tmap <silent> <F2> <Esc>:NvimTreeToggle<CR>
map <silent> CD :NvimTreeFindFile!<CR>
