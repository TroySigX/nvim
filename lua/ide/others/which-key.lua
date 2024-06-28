local M = {}

function M.setup()
  require('which-key').setup({
    triggers_blacklist = {
      n = { 'v', "'" },
    },
  })

  -- load plugin keymaps
  -- plugin_keymaps().setup()

  local map = require('which-key').register

  map({
    -- moving between tabs
    L = { 'gt', 'go to right tab' },
    H = { 'gT', 'go to left tab' },
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
      ['0'] = { '<cmd>tablast<CR>', 'go to last tab' },
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

  -- moving tab positions (to left/right)
  map({
    ['<A-H>'] = { ':tabm -1<CR>', 'move tab to the left' },
    ['<A-L>'] = { ':tabm +1<CR>', 'move tab to the right' },
  })

  -- retain paste register after pasting
  map({
    p = { 'P', 'paste without losing paste register' },
  }, { mode = 'x' })

  -- Neovim save and quit
  map({
    q = { ':q<CR>', 'quit' },
    Q = { ':qa<CR>', 'quit all' },
    x = { ':x<CR>', 'save and quit' },
    X = { ':xa<CR>', 'save and quit all' },
    w = { ':w<CR>', 'save' },
    bd = { ':bd<CR>', 'close buffer' },
  }, { prefix = '<leader>' })
end

return M
