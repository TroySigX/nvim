local M = {}

function M.keymaps()
  require('which-key').register({
    l = {
      name = 'lsp',
      f = { function() vim.lsp.buf.format() end, '[L]sp [F]ormat Code' },
    },
  }, { prefix = '<space>', mode = { 'n', 'v' } })

  require('which-key').register({
    l = {
      i = { vim.cmd.NullLsInfo, 'Null-ls [L]sp [I]nfo' },
    },
  }, { prefix = '<space>' })
end

function M.setup()
  local null_ls = require('null-ls')
  local formatting = null_ls.builtins.formatting
  local diagnostic = null_ls.builtins.diagnostics

  null_ls.setup({
    sources = {
      formatting.stylua,
      formatting.prettier.with({ extra_args = { '--single-quote', '--jsx-single-quote' } }),
      diagnostic.shellcheck,
      diagnostic.jsonlint,
    },
})
end

return M
