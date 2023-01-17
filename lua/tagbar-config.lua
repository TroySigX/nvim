local map = vim.keymap.set
local bufopts = { noremap = true, silent = true }

map('n', '<F8>', ":TagbarToggle<CR>", bufopts)
map('i', '<F8>', "<Esc>:TagbarToggle<CR>", bufopts)
map('v', '<F8>', "<Esc>:TagbarToggle<CR>", bufopts)
