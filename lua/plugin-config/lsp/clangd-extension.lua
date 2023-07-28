local M = {}

function M.setup(capabilities)
  require('clangd_extensions').setup({
    server = {
      capabilities = capabilities,
    },
  })
end

return M
