local M = {}

local lang_based_plugins = {
  rust_analyzer = 'rust-tools',
  tsserver = 'typescript-tools',
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

  local mason_lspcofig = require('mason-lspconfig')

  mason_lspcofig.setup({
    ensure_installed = { 'clangd', 'pyright', 'tsserver', 'lua_ls' },
  })

  -- setup lsp
  local default_capabilities = require('cmp_nvim_lsp').default_capabilities()

  mason_lspcofig.setup_handlers({
    function(server_name)
      local server_capabilities = default_capabilities

      if server_name == 'clangd' then
        server_capabilities.offsetEncoding = 'utf-8'
      end

      if not lang_based_plugins[server_name] then
        require('lspconfig')[server_name].setup({
          capabilities = server_capabilities,
        })
      else
        require('plugin-config.lsp.' .. lang_based_plugins[server_name]).setup(server_capabilities)
      end
    end,
  })
end

return M
