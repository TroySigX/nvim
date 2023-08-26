local M = {}

function M.setup()
  local luasnip = require('luasnip')
  local path = require('lspconfig.util').path

  luasnip.filetype_extend('javascript', { 'javascriptreact', 'html' })
  luasnip.filetype_extend('typescript', { 'javascript' })
  luasnip.filetype_extend('cpp', { 'c' })

  require('luasnip.loaders.from_snipmate').lazy_load({ paths = { path.join(vim.fn.stdpath('config'), 'snippets') } })
  require('luasnip.loaders.from_vscode').lazy_load()
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
