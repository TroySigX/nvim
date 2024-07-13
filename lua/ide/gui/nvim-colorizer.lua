local M = {}

function M.keymaps()
  require('utils.keymaps').add_keymap({
    '<leader>ct',
    function()
      require('colorizer')
      vim.cmd.ColorizerToggle()
    end,
    '[C]olorizer [T]oggle',
  })
end

function M.setup()
  require('colorizer').setup({})
end

return M
