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
  require('ultimate-autopair').setup({
    { '$', '$', suround = true, alpha = true, ft = { 'tex', 'latex' }, multiline = true },
  })
end

return M
