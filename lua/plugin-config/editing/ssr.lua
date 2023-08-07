local M = {}

function M.keymaps()
  require('which-key').register({
    ['<A-s>'] = {
      function()
        require('ssr').open()
      end,
      'Structural Search and Replace',
    },
  }, { mode = { 'n', 'x' } })
end

function M.setup()
  require('ssr').setup({
    border = 'rounded',
    min_width = 50,
    min_height = 5,
    max_width = 120,
    max_height = 25,
    keymaps = {
      close = 'q',
      next_match = 'n',
      prev_match = 'N',
      replace_confirm = '<cr>',
      replace_all = '<space><cr>',
    },
  })
end

return M
