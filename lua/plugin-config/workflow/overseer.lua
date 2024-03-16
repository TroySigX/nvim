local M = {}

function M.keymaps()
  return {
    { '<F5>', vim.cmd.OverseerRun, desc = 'Trigger Task Runner', mode = { 'n', 'i', 'x' } },
    {
      '<F17>',
      function()
        local overseer = require('overseer')
        local tasks = overseer.list_tasks({ recent_first = true })
        if vim.tbl_isempty(tasks) then
          vim.notify('No tasks found', vim.log.levels.WARN)
        else
          overseer.run_action(tasks[1], 'restart')
        end
      end,
      desc = 'Run Last Task',
      mode = { 'n', 'i', 'x' },
    },
    { '<space>os', vim.cmd.OverseerToggle, desc = '[O]ver[S]eer Toggle (toggle task runner window)', silent = true },
  }
end

local function formatter_tasks()
  local config_to_filetypes = {}
  for ft, ft_alias in pairs(require('formatter-config').filetypes()) do
    if config_to_filetypes[ft_alias] == nil then
      config_to_filetypes[ft_alias] = { ft }
    else
      table.insert(config_to_filetypes[ft_alias], ft)
    end
  end

  local overseer = require('overseer')
  for ft_alias, ft in pairs(config_to_filetypes) do
    local formatter = require('formatter-config.' .. ft_alias).formatter()
    if formatter.config_file_name ~= nil then
      overseer.register_template({
        name = '~generate ' .. formatter.config_file_name,
        builder = function()
          local input_file = formatter.config_file_path
          local output_file = formatter.config_file_name
          return {
            cmd = { 'cp' },
            args = { input_file, output_file },
          }
        end,
        condition = {
          filetype = ft,
        },
      })
    end
  end
end

function M.setup()
  require('overseer').setup({
    templates = { 'builtin', 'user' },
    strategy = {
      use_shell = true,
      'toggleterm',
      quit_on_exit = 'never',
    },
  })

  formatter_tasks()
end

return M
