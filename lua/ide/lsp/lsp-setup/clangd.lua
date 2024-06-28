local M = {}

function M.setup(opts)
  local server_opts = vim.tbl_deep_extend('keep', opts, {})
  server_opts.capabilities.offsetEncoding = 'utf-8'
  require('lspconfig')['clangd'].setup(server_opts)
end

return M
