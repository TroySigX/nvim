local M = {}

function M.setup()
  require('treesj').setup({
    use_default_keymaps = false,
  })
end

function M.keymaps()
  require('which-key').register({
    gs = {
      function()
        require('treesj').toggle()
      end,
      'Toggle multi/single line',
    },
  })
end

return M
