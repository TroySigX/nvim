vim.g.tagbar_autofocus = 1
local map = vim.keymap.set
local bufopts = { silent = true }

map('n', '<F8>', ":TagbarToggle<CR>", { desc = "Toggle Tagbar", unpack(bufopts) })
map('i', '<F8>', "<ESC>:TagbarToggle<CR>", { desc = "Toggle Tagbar", unpack(bufopts) })
map('v', '<F8>', "<ESC>:TagbarToggle<CR>", { desc = "Toggle Tagbar", unpack(bufopts) })
