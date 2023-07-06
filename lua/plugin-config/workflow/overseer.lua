local M = {}

function M.keymaps()
  return {
    { '<F5>', vim.cmd.OverseerRun, desc = 'Trigger Task Runner', mode = { 'n', 'i', 'v' } },
    { '<F17>', function ()
      local overseer = require('overseer')
      local tasks = overseer.list_tasks({ recent_first = true })
      if vim.tbl_isempty(tasks) then
        vim.notify('No tasks found', vim.log.levels.WARN)
      else
        overseer.run_action(tasks[1], 'restart')
      end
    end, desc = 'Run Last Task', mode = { 'n', 'i', 'v' }},
    { '<space>os', vim.cmd.OverseerToggle, desc = '[O]ver[S]eer Toggle (toggle task runner window)', silent = true },
  }
end

function M.setup()
  require('overseer').setup({
    templates = { 'builtin', 'user.init' },
    strategy = {
      use_shell = true,
      'toggleterm',
      quit_on_exit = 'success',
    },
  })
end

return M
