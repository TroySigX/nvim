local M = {}

local function in_table(table, val)
  for _, v in pairs(table) do
    if v == val then
      return true
    end
  end

  return false
end

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
    ensure_installed = { 'clangd', 'pyright', 'tsserver', 'lua_ls', 'texlab', 'rust_analyzer' },
  })

  -- setup lsp
  local capabilities = require('cmp_nvim_lsp').default_capabilities()
  capabilities.offsetEncoding = 'utf-8'

  local exclude_server = { 'tsserver', 'rust_analyzer' }
  require('mason-lspconfig').setup_handlers({
    function (server_name)
      if not in_table(exclude_server, server_name) then
        require('lspconfig')[server_name].setup {
          capabilities = capabilities,
        }
      end
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
    J = { ':Lspsaga peek_definition<CR>', 'LSP Preview Definition' },
    K = { ':Lspsaga hover_doc<CR>', 'View LSP Doc' },

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
