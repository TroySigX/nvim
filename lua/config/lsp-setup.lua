local map = vim.keymap.set
map('n', 'K', vim.lsp.buf.definition, { desc = 'LSP Definition' })
map('n', '<space>ca', vim.lsp.buf.code_action, { desc = 'LSP [C]ode [A]ction' })

local capabilities = require('cmp_nvim_lsp').default_capabilities()
local lsp = require('lspconfig')
local servers = { 'clangd', 'pyright', 'tsserver', 'lua_ls', 'texlab' }
-- local servers = lsp.util.available_servers()
for _, ls in ipairs(servers) do
    lsp[ls].setup{
        capabilities = capabilities
    }
end
