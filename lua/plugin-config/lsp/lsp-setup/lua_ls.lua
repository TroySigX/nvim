local M = {}

function M.setup(opts)
  -- neodev has to setup before lspconfig
  require('lazydev').setup()
  require('lspconfig')['lua_ls'].setup(opts)
end

return M
