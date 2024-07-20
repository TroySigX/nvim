local M = {}

local function ide_keymaps()
  require('ide.editing').setup_keymaps()
  require('ide.explorer').setup_keymaps()
  require('ide.gui').setup_keymaps()
  require('ide.navigation').setup_keymaps()
  require('ide.others').setup_keymaps()
  require('ide.workflow').setup_keymaps()
  require('ide.lsp').setup_keymaps()
end

local function general_keymaps()
  local map = require('utils.keymaps').add_keymap

  -- moving between tabs
  map({ 'L', 'gt', 'go to right tab' })
  map({ 'H', 'gT', 'go to left tab' })
  map({ '<leader>1', '1gt', 'go to tab 1' })
  map({ '<leader>2', '2gt', 'go to tab 2' })
  map({ '<leader>3', '3gt', 'go to tab 3' })
  map({ '<leader>4', '4gt', 'go to tab 4' })
  map({ '<leader>5', '5gt', 'go to tab 5' })
  map({ '<leader>6', '6gt', 'go to tab 6' })
  map({ '<leader>7', '7gt', 'go to tab 7' })
  map({ '<leader>8', '8gt', 'go to tab 8' })
  map({ '<leader>9', '9gt', 'go to tab 9' })
  map({ '<leader>0', '<cmd>tablast<CR>', 'go to last tab' })

  -- insert new line without entering insert mode
  map({ '<space>nl', 'm`o<Esc>``', 'Insering new line below without entering insert mode' })
  map({ '<space>NL', 'm`O<Esc>``', 'Inserting new line above without entering insert mode' })

  -- select all in the current buffer
  map({ '<C-a>', '<Esc>ggVG', 'select all' })

  -- moving tab positions (to left/right)
  map({ '<A-H>', ':tabm -1<CR>', 'move tab to the left' })
  map({ '<A-L>', ':tabm +1<CR>', 'move tab to the right' })

  -- retain paste register after pasting
  map({ 'p', 'P', 'paste without losing paste register', mode = 'x' })

  -- Neovim save and quit
  map({ '<leader>q', ':q<CR>', 'quit' })
  map({ '<leader>Q', ':qa<CR>', 'quit all' })
  map({ '<leader>x', ':x<CR>', 'save and quit' })
  map({ '<leader>X', ':xa<CR>', 'save and quit all' })
  map({ '<leader>w', ':w<CR>', 'save' })
  map({ '<leader>bd', ':bd<CR>', 'close buffer' })
end

function M.setup()
  -- ide plugins keymaps
  ide_keymaps()

  -- general keymaps
  general_keymaps()
end

return M
