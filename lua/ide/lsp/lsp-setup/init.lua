local M = {}

local config_path = require('utils.path').config_dir('lsp.lsp-setup')

local custom_lsp = {
  tsserver = true,
  lua_ls = true,
  clangd = true,
  typst_lsp = true,
  rust_analyzer = true,
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
    ensure_installed = { 'lua_ls' },
  })

  -- setup lsp
  local default_lsp_opts = {
    capabilities = require('cmp_nvim_lsp').default_capabilities(),
  }

  local lspconfig = require('lspconfig')
  mason_lspconfig.setup_handlers({
    function(server_name)
      -- TODO: remove when ruff has auto-complete capability
      if server_name == 'ruff' then
        return
      end

      if custom_lsp[server_name] then
        require(config_path(server_name)).setup(default_lsp_opts)
      else
        lspconfig[server_name].setup(default_lsp_opts)
      end
    end,
  })
end

return M
