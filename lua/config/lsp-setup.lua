local capabilities = require('cmp_nvim_lsp').default_capabilities()
capabilities.offsetEncoding = 'utf-8'
require('mason-lspconfig').setup_handlers {
  function (server_name)
    require('lspconfig')[server_name].setup {
      capabilities = capabilities,
    }
  end,
}

require('lspsaga').setup({
  lightbulb = {
    sign = false,
    virtual_text = false,
  },

  symbol_in_winbar = {
    enable = false,
  },
})

local map = vim.keymap.set

map('n', 'K', ':Lspsaga peek_definition<CR>', { desc = 'LSP Definition', silent =true })
map('n', '<space>ca', ':Lspsaga code_action<CR>', { desc = 'LSP [C]ode [A]ction', silent = true })
map('n', '<leader>e', ':Lspsaga show_line_diagnostics<CR>', { desc = 'Show [E]rrors on line', silent = true })

map('n', '<C-k>', function()
  require('lspsaga.diagnostic'):goto_prev({ severity = vim.diagnostic.severity.ERROR })
end, { desc = 'Go To Previous Error' })

map('n', '<C-j>', function()
  require('lspsaga.diagnostic'):goto_next({ severity = vim.diagnostic.severity.ERROR })
end, { desc = 'Go To Next Error' })

map('n', '<space>rnp', '::Lspsaga rename ++project<CR>', { desc = '[R]e[N]ame [P]roject', silent = true })
map('n', '<space>rnf', '::Lspsaga rename<CR>', { desc = '[R]e[N]ame [F]ile', silent = true })
