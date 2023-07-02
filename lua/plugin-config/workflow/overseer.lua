local M = {}

function M.keymaps()
  return {
    { '<F4>', vim.cmd.OverseerRun, desc = 'Trigger Task Runner', mode = { 'n', 'i', 'v' } },
    { '<space>os', vim.cmd.OverseerToggle, desc = '[O]ver[S]eer Toggle (toggle task runner window)', silent = true },
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
