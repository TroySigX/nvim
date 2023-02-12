local map = vim.keymap.set
local bufopts = { silent = true }

map('n', '<F9>', ":w<CR>:ToggleTerm<CR>", { desc = 'Toggle Terminal', unpack(bufopts) })
map('i', '<F9>', "<Esc>:w<CR>:ToggleTerm<CR>", { desc = 'Toggle Term', unpack(bufopts) })
map('v', '<F9>', "<Esc>:w<CR>:ToggleTerm<CR>", { desc = 'Toggle Term', unpack(bufopts) })
map('t', '<F9>', "<C-\\><C-N>:ToggleTerm<CR>", { desc = 'Toggle Term', unpack(bufopts) })

require("toggleterm").setup{
    direction = 'float',
    float_opts = {
        border = 'curved',
        width = 110, 
        height = 35,
        winblend = 17,
    },
}
