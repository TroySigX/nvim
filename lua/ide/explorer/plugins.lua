local config_path = require('utils.path').config_dir('explorer')
local conf = require(config_path())

return {
  {
    'ibhagwan/fzf-lua',
    lazy = true,
    init = function()
      conf.register_keymap('fzf-lua')
    end,
    dependencies = {
      {
        'junegunn/fzf',
        build = './install --bin',
      },
      'folke/tokyonight.nvim',
      'nvim-tree/nvim-web-devicons',
    },
    config = function()
      require(config_path('fzf-lua')).setup()
    end,
  },

  {
    'nvim-tree/nvim-tree.lua',
    lazy = true,
    init = function()
      conf.register_keymap('nvim-tree')
    end,
    dependencies = {
      'antosha417/nvim-lsp-file-operations',
      'nvim-tree/nvim-web-devicons',
      'b0o/nvim-tree-preview.lua',
    },
    config = function()
      require(config_path('nvim-tree')).setup()
    end,
  },

  {
    'nvim-telescope/telescope.nvim',
    lazy = true,
    dependencies = {
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build',
      },
      'nvim-lua/plenary.nvim',
      'folke/tokyonight.nvim',
    },
    config = function()
      require(config_path('telescope')).setup()
    end,
  },
}
