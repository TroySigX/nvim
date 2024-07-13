local M = {}

function M.keymaps()
  local map = require('utils.keymaps').add_keymap
  map({
    'J',
    ':Lspsaga goto_definition<CR>',
    'LSP Goto Definition',
  })
  map({
    'K',
    ':Lspsaga hover_doc<CR>',
    'View LSP Doc',
  })

  require('which-key').add({ '<space>rn', group = '[R]e[N]ame' })
  map({
    '<space>rnp',
    ':Lspsaga rename ++project<CR>',
    '[R]e[N]ame [P]roject',
  })
  map({
    '<space>rnf',
    ':Lspsaga rename<CR>',
    '[R]e[N]ame [F]ile',
  })

  map({
    '<space>lr',
    ':Lspsaga finder<CR>',
    '[L]sp [R]eferences',
  })

  map({
    '<leader>ca',
    ':Lspsaga code_action<CR>',
    'LSP Code Action',
  })
  map({
    '<leader>e',
    ':Lspsaga show_line_diagnostics<CR>',
    'Show [E]rrors on line',
  })

  map({
    '<C-k>',
    function()
      require('lspsaga.diagnostic'):goto_prev({ severity = vim.diagnostic.severity.ERROR })
    end,
    'Go To Previous Error',
  })
  map({
    '<C-j>',
    function()
      require('lspsaga.diagnostic'):goto_next({ severity = vim.diagnostic.severity.ERROR })
    end,
    'Go To Next Error',
  })
end

function M.setup()
  require('lspsaga').setup({
    lightbulb = {
      enable = false,
    },

    finder = {
      keys = {
        vsplit = '<C-v>',
      },
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
