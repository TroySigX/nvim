local M = {}

function M.setup()
  require('lualine').setup{
    options = {
      theme = 'ayu_mirage',
    },
    sections = {
      lualine_x = {
        'overseer',
        {
          require('noice').api.statusline.mode.get,
          cond = require('noice').api.statusline.mode.has,
          color = { fg = '#ff9e64' },
        }
      },
    },
  }
end

return M
