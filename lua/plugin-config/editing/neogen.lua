local M = {}

function M.setup()
  require('neogen').setup({
    snippet_engine = 'luasnip',
  })
end

function M.keymaps()
  require('which-key').register({
    ['<space>ng'] = {
      function()
        require('neogen').generate()
      end,
      '[N]eo[G]en (generate docs)',
    },
  })
end

return M
