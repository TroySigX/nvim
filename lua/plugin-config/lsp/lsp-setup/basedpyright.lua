local M = {}

function M.setup(opts)
  local server_opts = vim.tbl_deep_extend('keep', opts, {})
  server_opts.settings = {
    basedpyright = {
      typeCheckingMode = 'standard',
    },
  }
  require('lspconfig')['basedpyright'].setup(server_opts)
end

return M
