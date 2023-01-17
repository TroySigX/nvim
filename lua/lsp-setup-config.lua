local remap = vim.keymap.set
remap('n', 'K', vim.lsp.buf.definition, { noremap = true, silent = true })
remap('n', '<space>a', vim.lsp.buf.code_action, { noremap = true, silent = true })

local capabilities = require('cmp_nvim_lsp').default_capabilities()
require('lspconfig')['clangd'].setup {
    capabilities = capabilities
}
-- require('lspconfig')['pyright'].setup {
--     capabilities = capabilities
-- }
-- require('lspconfig')['jdtls'].setup {
--     capabilities = capabilities
-- }
