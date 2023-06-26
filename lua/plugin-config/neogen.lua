local M = {}

function M.setup()
  require('neogen').setup{
    snippet_engine = 'luasnip',
  }
end

function M.keymaps()
  require('which-key').register({
    ['<space>ng'] = { require('neogen').generate, '[N]eo[G]en' },
  })
end

return M
