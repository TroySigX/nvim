local M = {}

function M.keymaps()
  require('which-key').register({
    J = { ':Lspsaga goto_definition<CR>', 'LSP Goto Definition' },
    K = { ':Lspsaga hover_doc<CR>', 'View LSP Doc' },

    ['<space>'] = {
      rn = {
        name = '[R]e[N]ame',
        p = { ':Lspsaga rename ++project<CR>', '[R]e[N]ame [P]roject' },
        f = { ':Lspsaga rename<CR>', '[R]e[N]ame [F]ile' },
      },
    },

    ['<leader>'] = {
      ca = { ':Lspsaga code_action<CR>', 'LSP Code Action' },
      e = { ':Lspsaga show_line_diagnostics<CR>', 'Show [E]rrors on line' },
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
  })
end

function M.setup()
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

return M
