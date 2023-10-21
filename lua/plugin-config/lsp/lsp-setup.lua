local M = {}

local base_dir = 'plugin-config.lsp.'

local function config_path(server_name)
  return base_dir .. server_name
end

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
    ensure_installed = { 'clangd', 'pyright', 'lua_ls' },
  })

  -- setup lsp
  local default_lsp_opts = {
    capabilities = require('cmp_nvim_lsp').default_capabilities(),
  }

  mason_lspconfig.setup_handlers({
    function(server_name)
      if lsp_to_plugin[server_name] then
        require(config_path(lsp_to_plugin[server_name])).setup(default_lsp_opts)
      else
        require('lspconfig')[server_name].setup(default_lsp_opts)
      end
    end,

    ['clangd'] = function()
      local server_opts = vim.tbl_deep_extend('keep', default_lsp_opts, {})
      server_opts.capabilities.offsetEncoding = 'utf-8'
      require('lspconfig')['clangd'].setup(server_opts)
    end,
  })
end

return M
