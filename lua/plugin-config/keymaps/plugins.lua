local base_dir = 'plugin-config.keymaps.'

local function config_path(plugin_name)
  return base_dir .. plugin_name
end

return {
  {
    'folke/which-key.nvim',
    event = 'VeryLazy',
    config = function()
      require(config_path('which-key')).setup()
    end,
  },


}
