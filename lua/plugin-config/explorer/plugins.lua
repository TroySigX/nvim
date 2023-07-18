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
    config = function()
      require(config_path('nvim-tree')).setup()
    end,
  },
}
