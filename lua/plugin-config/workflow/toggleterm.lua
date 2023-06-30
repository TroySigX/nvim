local M = {}

function M.setup()
  require('toggleterm').setup{
    direction = 'float',
    float_opts = {
      border = 'curved',
      width = 110,
      height = 35,
      winblend = 17,
    },
    persist_mode = false,
  }
end

function M.keymaps()
  return {
    { '<F9>', vim.cmd.ToggleTerm, silent = true, desc = 'Toggle Term', mode = { 'n', 'i', 'v', 't' } },
  }
end

return M
