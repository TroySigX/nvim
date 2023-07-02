local M = {}

function M.keymaps()
  return {
    { '<F4>', vim.cmd.OverseerRun, desc = 'Task Runner', mode = { 'n', 'i', 'v' } },
    { '<space>os', vim.cmd.OverseerToggle, desc = '[O]ver[S]eer Toggle', silent = true },
  }
end

function M.setup()
  require('overseer').setup({
    templates = { 'builtin', 'user.init' },
    strategy = {
      'toggleterm',
      use_shell = true,
    },
  })
end

return M
