local map = vim.keymap.set

map("n", "<F8>", ":TagbarToggle<CR>", {})
map("i", "<F8>", "<Esc>:TagbarToggle<CR>", {})
map("v", "<F8>", "<Esc>:TagbarToggle<CR>", {})
