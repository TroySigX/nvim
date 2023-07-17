local keymap_config_path = 'plugin-config.keymaps.'

return {
  {
    'folke/which-key.nvim',
    event = 'VeryLazy',
    config = function()
      require(keymap_config_path .. 'which-key').setup()
    end,
  },


}
