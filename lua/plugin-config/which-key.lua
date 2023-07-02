local M = {}

function M.setup()
  vim.o.timeout = true
  vim.o.timeoutlen = 300
  require('which-key').setup({
    triggers_blacklist = {
      n = { 'v' },
    },
  })

  -- load plugin keymaps
  require('plugin-config.explorer.fzf-lua').keymaps()
  require('plugin-config.workflow.knap').keymaps()
  require('plugin-config.navigation.leap-nvim').keymaps()
  require('plugin-config.lsp.lsp-setup').keymaps()
  require('plugin-config.lsp.luasnip').keymaps()
  require('plugin-config.editing.muren').keymaps()
  require('plugin-config.editing.neogen').keymaps()
  require('plugin-config.workflow.neogit').keymaps()
  require('plugin-config.workflow.neotest').keymaps()
  require('plugin-config.gui.noice').keymaps()
  require('plugin-config.workflow.nvim-dap').keymaps()
  require('plugin-config.explorer.nvim-tree').keymaps()
  require('plugin-config.workflow.smart-splits').keymaps()
  require('plugin-config.workflow.todo-comments').keymaps()
  require('plugin-config.editing.treesj').keymaps()

  local map = require('which-key').register

  map({
    -- moving between tabs
    L = { 'gt', 'move to right tab' },
    H = { 'gT', 'move to left tab' },
    ['<leader>'] = {
      ['1'] = { '1gt', 'go to tab 1' },
      ['2'] = { '2gt', 'go to tab 2' },
      ['3'] = { '3gt', 'go to tab 3' },
      ['4'] = { '4gt', 'go to tab 4' },
      ['5'] = { '5gt', 'go to tab 5' },
      ['6'] = { '6gt', 'go to tab 6' },
      ['7'] = { '7gt', 'go to tab 7' },
      ['8'] = { '8gt', 'go to tab 8' },
      ['9'] = { '9gt', 'go to tab 9' },
      ['0'] = { ':tablast<CR>', 'go to last tab' },
    },

    -- insert new line without entering insert mode
    ['<space>'] = {
      nl = { 'm`o<Esc>``', 'Insering new line below without entering insert mode' },
      NL = { 'm`O<Esc>``', 'Inserting new line above without entering insert mode' },
    },
  })

  -- select all in the current buffer
  map({
    ['<C-a>'] = { '<Esc>ggVG', 'select all' },
  })

  map({
    ['<C-h>'] = { '<C-o>k', 'jump to above line in insert mode' },
    ['<C-l>'] = { '<C-o>j', 'jump to below line in insert mode' },
  }, { mode = 'i' })
end

return M
