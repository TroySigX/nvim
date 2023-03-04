require('inc_rename').setup{}

local map = vim.keymap.set
map('n', '<space>rn', ':IncRename ', { desc = '[R]e[N]ame' })
