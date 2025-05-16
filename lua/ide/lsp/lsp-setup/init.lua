local M = {}

local config_path = require('utils.path').config_dir('lsp.lsp-setup')

local custom_lsp = {
  ts_ls = true,
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

  -- setup lsp
  local default_lsp_opts = {
    capabilities = require('cmp_nvim_lsp').default_capabilities(),
  }

  local lspconfig = require('lspconfig')

  local installed_lsp_servers = require('mason-lspconfig').get_installed_servers()
  for _, server in pairs(installed_lsp_servers) do
    if server ~= 'ruff' then
      if custom_lsp[server] then
        require(config_path(server)).setup(default_lsp_opts)
      else
        lspconfig[server].setup(default_lsp_opts)
      end

      -- vim.lsp.enable(server)
    end
  end
end

return M
