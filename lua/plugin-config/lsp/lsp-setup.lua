local M = {}

function M.setup()
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
end

function M.keymaps()
  require('which-key').register({
    K = { ':Lspsaga peek_definition<CR>', 'LSP Preview Definition' },
    J = { ':Lspsaga hover_doc<CR>', 'LSP Doc' },

    ['<space>'] = {
      ca = { ':Lspsaga code_action<CR>', 'LSP [C]ode [A]ction' },
      rn = {
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
end

return M
