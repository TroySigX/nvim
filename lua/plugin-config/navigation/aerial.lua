local M = {}

function M.setup()
  require('aerial').setup({
    layout = {
      max_width = 0.25,
      min_width = 0.23,
    },
  })
end

function M.keymaps()
  require('which-key').register({
    ['<F4>'] = {
      function()
        require('aerial').toggle()
      end,
      'Toggle Aerial (code outline)',
    },
  }, { mode = { 'n', 'v', 'i' } })
end

return M
