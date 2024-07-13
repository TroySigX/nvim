local M = {}

function M.setup()
  require('neogen').setup({
    snippet_engine = 'luasnip',
  })
end

function M.keymaps()
  require('utils.keymaps').add_keymap({
    '<space>ng',
    function()
      require('neogen').generate()
    end,
    '[N]eo[G]en (generate docs)',
  })
end

return M
