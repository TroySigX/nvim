local M = {}

local lang_based_plugins = {
  clangd = 'clangd-extension',
  rust_analyzer = 'rust-tools',
}

function M.setup()
  -- setup mason
  require('mason').setup({
    ui = {
      icons = {
        package_installed = '✓',
        package_pending = '➜',
        package_uninstalled = '✗',
      },
    },
  })

  local mason_lspcofig = require('mason-lspconfig')

  mason_lspcofig.setup({
    ensure_installed = { 'clangd', 'pyright', 'tsserver', 'lua_ls' },
  })

  -- setup lsp
  local default_capabilities = require('cmp_nvim_lsp').default_capabilities()

  mason_lspcofig.setup_handlers({
    function(server_name)
      local server_capabilities = default_capabilities

      if server_name == 'clangd' then
        server_capabilities.offsetEncoding = 'utf-8'
      end

      if not lang_based_plugins[server_name] then
        require('lspconfig')[server_name].setup({
          capabilities = server_capabilities,
        })
      else
        require('plugin-config.lsp.' .. lang_based_plugins[server_name]).setup(server_capabilities)
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
      border = 'rounded',
    },
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

    ['<C-k>'] = {
      function()
        require('lspsaga.diagnostic'):goto_prev({ severity = vim.diagnostic.severity.ERROR })
      end,
      'Go To Previous Error',
    },
    ['<C-j>'] = {
      function()
        require('lspsaga.diagnostic'):goto_next({ severity = vim.diagnostic.severity.ERROR })
      end,
      'Go To Next Error',
    },

    ['<leader>e'] = { ':Lspsaga show_line_diagnostics<CR>', 'Show [E]rrors on line' },
  })
end

return M
