local map = vim.keymap.set
local bufopts = { noremap = true, silent = true }
map("n", "<F6>", ":lua require('fzf-lua').files()<CR>", bufopts)
map("i", "<F6>", "<Esc>:lua require('fzf-lua').files()<CR>", bufopts)
map("v", "<F6>", "<Esc>:lua require('fzf-lua').files()<CR>", bufopts)
map("t", "<F6>", "<C-\\><C-n>:lua require('fzf-lua').files()<CR>", bufopts)

map("n", "<F18>", ":lua require('fzf-lua').oldfiles()<CR>", bufopts)
map("i", "<F18>", "<Esc>:lua require('fzf-lua').oldfiles()<CR>", bufopts)
map("v", "<F18>", "<Esc>:lua require('fzf-lua').oldfiles()<CR>", bufopts)
map("t", "<F18>", "<C-\\><C-n>:lua require('fzf-lua').oldfiles()<CR>", bufopts)

map('n', '<space>gr', ":lua require('fzf-lua').live_grep()<CR>", bufopts)
