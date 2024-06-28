local M = {}

function M.setup(opts)
  require('lazydev').setup()
  require('lspconfig')['lua_ls'].setup(opts)
end

return M
