require("chatgpt").setup()

local map = vim.keymap.set
map({ 'n' }, '<F11>', ':ChatGPT<CR>', { desc = 'Open ChatGPT' })
map({ 'i', 'v' }, '<F11>', '<Esc>:ChatGPT<CR>', { desc = 'Open ChatGPT' })
