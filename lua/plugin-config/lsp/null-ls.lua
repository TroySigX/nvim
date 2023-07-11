local M = {}

function M.keymaps()
  require('which-key').register({
    lf = { function() vim.lsp.buf.format() end, '[L]sp [F]ormat Code' },
  }, { prefix = '<space>', mode = { 'n', 'v' } })
end

function M.setup()
  local null_ls = require('null-ls')
  local formatting = null_ls.builtins.formatting
  local diagnostic = null_ls.builtins.diagnostics

  null_ls.setup({
    sources = {
      formatting.stylua,
      formatting.prettier,
      diagnostic.shellcheck,
      diagnostic.jsonlint,
    },
})
end

return M
