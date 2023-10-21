local M = {}

function M.setup(capabilities)
  -- neodev has to setup before lspconfig
  require('neodev').setup()
  require('lspconfig')['lua_ls'].setup({
    capabilities = capabilities,
  })
end

return M
