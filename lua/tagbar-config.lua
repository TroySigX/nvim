vim.g.tagbar_autofocus = 1
local map = vim.keymap.set
local bufopts = { silent = true }

map('n', '<F5>', ":TagbarToggle<CR>", { desc = "Toggle Tagbar", unpack(bufopts) })
map('i', '<F5>', "<ESC>:TagbarToggle<CR>", { desc = "Toggle Tagbar", unpack(bufopts) })
map('v', '<F5>', "<ESC>:TagbarToggle<CR>", { desc = "Toggle Tagbar", unpack(bufopts) })
