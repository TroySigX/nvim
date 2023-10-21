local M = {}

local lsp_to_plugin = {
  tsserver = 'typescript-tools',
  rust_analyzer = 'rust-tools',
  lua_ls = 'neodev',
}

function M.setup()
  -- setup mason
  require('mason').setup({
    ui = {
      icons = {
        package_installed = '✓',
        package_pending = '➜',
        package_uninstalled = '✗',
      },
    },
  })

  local mason_lspconfig = require('mason-lspconfig')

  mason_lspconfig.setup({
    ensure_installed = { 'clangd', 'pyright', 'tsserver', 'lua_ls' },
  })

  -- setup lsp
  local default_capabilities = require('cmp_nvim_lsp').default_capabilities()
  local base_dir = 'plugin-config.lsp.'

  local function config_path(server_name)
    return base_dir .. server_name
  end

  mason_lspconfig.setup_handlers({
    function(server_name)
      if lsp_to_plugin[server_name] then
        require(config_path(lsp_to_plugin[server_name])).setup(default_capabilities)
      else
        require('lspconfig')[server_name].setup({
          capabilities = default_capabilities,
        })
      end
    end,

    ['clangd'] = function()
      local server_capabilities = default_capabilities
      server_capabilities.offsetEncoding = 'utf-8'
      require('lspconfig')['clangd'].setup({
        capabilities = server_capabilities,
      })
    end,
  })
end

return M
