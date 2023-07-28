local M = {}

function M.setup()
  local capabilities = require('cmp_nvim_lsp').default_capabilities()
  capabilities.offsetEncoding = 'utf-8'

  require('clangd_extensions').setup({
    server = {
      capabilities = capabilities,
    },
  })
end

return M
