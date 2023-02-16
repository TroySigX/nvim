require('chatgpt').setup()

local map = vim.keymap.set
map({ 'n', 'i', 'v' }, '<F11>', require('chatgpt').openChat, { desc = 'Open ChatGPT' })
