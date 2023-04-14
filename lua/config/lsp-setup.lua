local map = vim.keymap.set
map('n', 'K', vim.lsp.buf.definition, { desc = 'LSP Definition' })
map('n', '<space>ca', vim.lsp.buf.code_action, { desc = 'LSP [C]ode [A]ction' })

local capabilities = require('cmp_nvim_lsp').default_capabilities()
require('mason-lspconfig').setup_handlers {
  function (server_name)
    require('lspconfig')[server_name].setup {
      capabilities = capabilities
    }
  end,
}