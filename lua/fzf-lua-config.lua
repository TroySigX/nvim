local map = vim.keymap.set
map("n", "<F6>", ":lua require('fzf-lua').files()<CR>", {silent = true})
map("i", "<F6>", "<Esc>:lua require('fzf-lua').files()<CR>", {silent = true})
map("v", "<F6>", "<Esc>:lua require('fzf-lua').files()<CR>", {silent = true})
map("t", "<F6>", "<C-\\><C-n>:lua require('fzf-lua').files()<CR>", {silent = true})

map("n", "<F18>", ":lua require('fzf-lua').oldfiles()<CR>", {silent = true})
map("i", "<F18>", "<Esc>:lua require('fzf-lua').oldfiles()<CR>", {silent = true})
map("v", "<F18>", "<Esc>:lua require('fzf-lua').oldfiles()<CR>", {silent = true})
map("t", "<F18>", "<C-\\><C-n>:lua require('fzf-lua').oldfiles()<CR>", {silent = true})
