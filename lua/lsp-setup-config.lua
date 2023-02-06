local map = vim.keymap.set
map('n', 'K', vim.lsp.buf.definition, { desc = 'LSP Definition' })
map('n', '<space>ca', vim.lsp.buf.code_action, { desc = 'LSP [C]ode [A]ction' })

local capabilities = require('cmp_nvim_lsp').default_capabilities()
require('lspconfig')['clangd'].setup {
    capabilities = capabilities
}
require('lspconfig')['tsserver'].setup {
    capabilities = capabilities
}
-- require('lspconfig')['pyright'].setup {
--     capabilities = capabilities
-- }
-- require('lspconfig')['jdtls'].setup {
--     capabilities = capabilities
-- }
