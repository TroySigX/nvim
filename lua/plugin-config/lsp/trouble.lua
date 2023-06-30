local M = {}

function M.setup()
  require('trouble').setup {}
end

function M.keymaps()
  return {
    { '<F1>', vim.cmd.TroubleToggle, silent = true, desc = 'Toggle Trouble List', mode = { 'n', 'i', 'v' } }
  }
end

return M
