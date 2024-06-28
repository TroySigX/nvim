local M = {}

function M.keymaps()
  require('which-key').register({
    ['<leader>ct'] = {
      function()
        require('colorizer')
        vim.cmd.ColorizerToggle()
      end,
      '[C]olorizer [T]oggle',
    },
  })
end

function M.setup()
  require('colorizer').setup({})
end

return M
