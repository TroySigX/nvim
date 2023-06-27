local M = {}

function M.keymaps()
  return {
    { '<F7>', vim.cmd.UndotreeToggle, desc = 'Toggle UndoTree', mode = { 'n', 'i', 'v' } }
  }
end

return M
