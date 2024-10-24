local M = {}

function M.setup(opts)
  local server_opts = vim.tbl_deep_extend('keep', opts, {})
  server_opts.settings = {
    exportPdf = 'never',
  }
  server_opts.flags = {
    allow_incremental_sync = true,
  }
  require('lspconfig')['typst_lsp'].setup(server_opts)
end

return M
