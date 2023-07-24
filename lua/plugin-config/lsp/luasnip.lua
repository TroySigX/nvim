local M = {}

function M.setup()
  local luasnip = require('luasnip')
  luasnip.filetype_extend('javascript', { 'javascriptreact', 'html' })
  luasnip.filetype_extend('typescript', { 'javascript' })

  require('luasnip.loaders.from_snipmate').lazy_load({ paths = { '~/.config/nvim/snippets' } })
end

function M.keymaps()
  require('which-key').register({
    ['<C-j>'] = {
      function()
        require('luasnip').jump(1)
      end,
      'Go to next placeholder in snippet',
    },
    ['<C-k>'] = {
      function()
        require('luasnip').jump(-1)
      end,
      'Go to previous placeholder in snippet',
    },
  }, { mode = { 'i', 's' } })
end

return M
