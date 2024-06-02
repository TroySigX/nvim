local M = {}

function M.setup(opts)
  -- neodev has to setup before lspconfig
  require('lspconfig')['lua_ls'].setup(opts)
end

return M
