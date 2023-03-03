require('neogen').setup{
    snippet_engine = 'luasnip',
}

local map = vim.keymap.set
map('n', '<space>ng', require('neogen').generate, { desc = '[N]eo[G]en' })
