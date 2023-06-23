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

local map = vim.keymap.set
local function opts(desc)
  return { desc = desc, silent = true }
end

map('n', 'K', ':Lspsaga peek_definition<CR>', opts('LSP Definition'))
map('n', 'J', ':Lspsaga hover_doc<CR>', opts('LSP Doc'))
map('n', '<space>ca', ':Lspsaga code_action<CR>', opts('LSP [C]ode [A]ction'))
map('n', '<leader>e', ':Lspsaga show_line_diagnostics<CR>', opts('Show [E]rrors on line'))

map('n', '<C-k>', function()
  require('lspsaga.diagnostic'):goto_prev({ severity = vim.diagnostic.severity.ERROR })
end, { desc = 'Go To Previous Error' })

map('n', '<C-j>', function()
  require('lspsaga.diagnostic'):goto_next({ severity = vim.diagnostic.severity.ERROR })
end, { desc = 'Go To Next Error' })

map('n', '<space>rnp', ':Lspsaga rename ++project<CR>', opts('[R]e[N]ame [P]roject'))
map('n', '<space>rnf', ':Lspsaga rename<CR>', opts('[R]e[N]ame [F]ile'))
