local map = vim.keymap.set
map('n', 'K', vim.lsp.buf.definition, { desc = 'LSP Definition' })
map('n', '<space>ca', vim.lsp.buf.code_action, { desc = 'LSP [C]ode [A]ction' })

local capabilities = require('cmp_nvim_lsp').default_capabilities()
local lsp = require('lspconfig')
lsp['clangd'].setup{
    capabilities = capabilities
}
lsp['tsserver'].setup{
    capabilities = capabilities
}
lsp['lua_ls'].setup{
    capabilities = capabilities
}
lsp['texlab'].setup{
    capabilities = capabilities
}
