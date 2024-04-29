local base_dir = 'plugin-config.explorer.'

local function config_path(plugin_name)
  return base_dir .. plugin_name
end

return {
  {
    'ibhagwan/fzf-lua',
    lazy = true,
    dependencies = {
      {
        'junegunn/fzf',
        build = './install --bin',
      },
      'nvim-tree/nvim-web-devicons',
    },
    config = function()
      require(config_path('fzf-lua')).setup()
    end,
  },

  {
    'nvim-tree/nvim-tree.lua',
    lazy = true,
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
    },
    config = function()
      require(config_path('telescope')).setup()
    end,
  },
}
