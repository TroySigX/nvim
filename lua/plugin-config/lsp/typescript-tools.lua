local M = {}

function M.setup(capabilities)
  require('typescript-tools').setup({
    capabilities = capabilities,
  })
end

return M
