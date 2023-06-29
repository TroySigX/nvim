local M = {}

function M.setup()
  vim.o.timeout = true
  vim.o.timeoutlen = 300
  require('which-key').setup({
    triggers_blacklist = {
      n = { 'v' },
    },
  })

  local map = require('which-key').register

  -- moving between tabs
  map({
    L = { 'gt', 'move tab forward' },
    H = { 'gT', 'move tab backware' },
    ['<leader>'] = {
      name = 'go to specific tab',
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
  })

  -- insert new line without entering insert mode
  map({
    nl = { 'm`o<Esc>``', 'Insering new line below without entering insert mode' },
    NL = { 'm`O<Esc>``', 'Inserting new line above without entering insert mode' },
  }, { prefix = '<space>' })

  -- select all in the current buffer
  map({
    ['<C-a>'] = { '<Esc>ggVG', 'select all' },
  }, { mode = { 'n', 'i', 'v' } })


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
end

return M
