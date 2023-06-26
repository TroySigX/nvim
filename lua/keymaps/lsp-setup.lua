require('which-key').register({
  K = { ':Lspsaga preview_definition<CR>', 'LSP Preview Definition' },
  J = { ':Lspsaga hover_doc<CR>', 'LSP Doc' },

  ['<space>'] = {
    ca = { ':Lspsaga code_action<CR>', 'LSP [C]ode [A]ction' },
    r = {
      name = '[R]e[N]ame',
      p = { ':Lspsaga rename ++project<CR>', '[R]e[N]ame [P]roject' },
      f = { ':Lspsaga rename<CR>', '[R]e[N]ame [F]ile' },
    },
  },

  ['<C-k>'] = { function()
    require('lspsaga.diagnostic'):goto_prev({ severity = vim.diagnostic.severity.ERROR })
  end, 'Go To Previous Error' },
  ['<C-j>'] = { function()
    require('lspsaga.diagnostic'):goto_next({ severity = vim.diagnostic.severity.ERROR })
  end, 'Go To Next Error' },

  ['<leader>e'] = { ':Lspsaga show_line_diagnostics<CR>', 'Show [E]rrors on line' },
})
