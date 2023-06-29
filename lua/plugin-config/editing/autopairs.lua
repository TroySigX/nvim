local M = {}

function M.setup()
  -- setup endwise and autotag
  require('nvim-treesitter.configs').setup({
    endwise = {
      enable = true,
    },

    autotag = {
      enable = true,
    },
  })

  -- setup autopairs
  require('npairs-int-upair').setup({
    bs = 'u',
    map = 'n',
  })

  local Rule = require('nvim-autopairs.rule')
  local npairs = require('nvim-autopairs')
  local cond = require('nvim-autopairs.conds')
  npairs.add_rules({
    Rule('$', '$', { 'tex', 'latex' })
    :with_move(cond.none())
    :with_del(cond.done())
    :with_cr(cond.done())
  })
end

return M
