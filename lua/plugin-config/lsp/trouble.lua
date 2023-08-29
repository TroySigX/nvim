local M = {}

function M.setup()
  require('trouble').setup({})
end

function M.keymaps()
  return {
    {
      '<F1>',
      function()
        vim.cmd.stopinsert()
        vim.cmd.TroubleToggle()
      end,
      silent = true,
      desc = 'Toggle Trouble(diagnostic) List',
      mode = { 'n', 'i', 'v' },
    },
  }
end

return M
