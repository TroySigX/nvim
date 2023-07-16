local explorer_config_path = 'plugin-config.explorer.'

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
      require(explorer_config_path .. 'fzf-lua').setup()
    end,
  },

  {
    'nvim-tree/nvim-tree.lua',
    lazy = true,
    config = function()
      require(explorer_config_path .. 'nvim-tree').setup()
    end,
  },
}
