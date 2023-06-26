-- setup mason
require('mason').setup({
  ui = {
    icons = {
      package_installed = '✓',
      package_pending = '➜',
      package_uninstalled = '✗'
    }
  }
})

require('mason-lspconfig').setup({
  ensure_installed = { 'clangd', 'pyright', 'tsserver', 'lua_ls', 'texlab', 'sqlls' },
})

-- setup lsp
local capabilities = require('cmp_nvim_lsp').default_capabilities()
capabilities.offsetEncoding = 'utf-8'

require('mason-lspconfig').setup_handlers({
  function (server_name)
    require('lspconfig')[server_name].setup {
      capabilities = capabilities,
    }
  end,
})

require('lspsaga').setup({
  lightbulb = {
    sign = false,
    virtual_text = false,
  },

  symbol_in_winbar = {
    enable = false,
  },

  ui = {
    border = 'rounded'
  }
})
