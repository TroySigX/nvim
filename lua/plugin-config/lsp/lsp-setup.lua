local M = {}

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

  local mason_lspcofig = require('mason-lspconfig')

  mason_lspcofig.setup({
    ensure_installed = { 'clangd', 'pyright', 'tsserver', 'lua_ls' },
  })

  -- setup lsp
  local default_capabilities = require('cmp_nvim_lsp').default_capabilities()
  local base_dir = 'plugin-config.lsp.'

  local function config_path(server_name)
    return base_dir .. server_name
  end

  mason_lspcofig.setup_handlers({
    function(server_name)
      require('lspconfig')[server_name].setup({
        capabilities = default_capabilities,
      })
    end,

    ['clangd'] = function()
      local server_capabilities = default_capabilities
      server_capabilities.offsetEncoding = 'utf-8'
      require('lspconfig')['clangd'].setup({
        capabilities = server_capabilities,
      })
    end,

    ['tsserver'] = function()
      require(config_path('typescript-tools')).setup(default_capabilities)
    end,

    ['rust_analyzer'] = function()
      require(config_path('rust-tools')).setup(default_capabilities)
    end,
  })
end

return M
