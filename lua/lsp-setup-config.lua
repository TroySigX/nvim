local map = vim.keymap.set
local bufops = { noremap = true, silent = true }
map('n', 'K', vim.lsp.buf.definition, bufopts)
map('n', '<space>a', vim.lsp.buf.code_action, bufops)

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
