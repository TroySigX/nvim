local M = {}

function M.keymaps()
  return {
    {
      '<F7>',
      function()
        vim.cmd.stopinsert()
        vim.cmd.UndotreeToggle()
      end,
      desc = 'Toggle UndoTree',
      mode = { 'n', 'i', 'v' },
    },
  }
end

function M.setup()
  vim.g.undotree_SetFocusWhenToggle = 1
end

return M
