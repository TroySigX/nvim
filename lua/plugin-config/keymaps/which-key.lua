local M = {}

local function plugin_keymaps()
  local base_dir = 'plugin-config.'

  local function config_path(plugin_type)
    local path = base_dir .. plugin_type .. '.'

    return function(plugin)
      return path .. plugin
    end
  end

  local function editing()
    local path = config_path('editing')

    require(path('neogen')).keymaps()
    require(path('conform')).keymaps()
    require(path('treesj')).keymaps()
    require(path('ssr')).keymaps()
  end

  local function explorer()
    local path = config_path('explorer')

    require(path('nvim-tree')).keymaps()
    require(path('fzf-lua')).keymaps()
  end

  local function gui()
    local path = config_path('gui')

    require(path('notify')).keymaps()
    require(path('smart-splits')).keymaps()
  end

  local function lsp()
    local path = config_path('lsp')

    require(path('lspsaga')).keymaps()
    require(path('trouble')).keymaps()
    require(path('nvim-lint')).keymaps()
    require(path('luasnip')).keymaps()
    require(path('refactoring')).keymaps()
    require(path('ts-node-action')).keymaps()
  end

  local function navigation()
    local path = config_path('navigation')

    require(path('flash-nvim')).keymaps()
    require(path('aerial')).keymaps()
  end

  local function workflow()
    local path = config_path('workflow')

    require(path('neogit')).keymaps()
    require(path('neotest')).keymaps()
    require(path('nvim-dap')).keymaps()
    require(path('knap')).keymaps()
    require(path('todo-comments')).keymaps()
    require(path('package-info')).keymaps()
    require(path('venv-selector')).keymaps()
    require(path('crates')).keymaps()
  end

  return {
    setup = function()
      editing()
      explorer()
      gui()
      lsp()
      navigation()
      workflow()
    end,
  }
end

function M.setup()
  vim.o.timeout = true
  vim.o.timeoutlen = 299
  require('which-key').setup({
    triggers_blacklist = {
      n = { 'v' },
    },
  })

  -- load plugin keymaps
  plugin_keymaps().setup()

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
