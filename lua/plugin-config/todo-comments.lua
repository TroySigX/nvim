local M = {}

function M.setup()
  require('todo-comments').setup()
end

function M.keymaps()
  local function toggle_quickfix_list()
    for _, win in pairs(vim.fn.getwininfo()) do
      if win['quickfix'] == 1 then
        vim.cmd.cclose()
        return
      end
    end

    vim.api.nvim_command('TodoQuickFix')
  end

  require('which-key').register({
    ['<F3>'] = { function()
      vim.cmd.stopinsert()
      toggle_quickfix_list()
    end, 'Toggle Quickfix List'
    }
  }, { mode = { 'n', 'i', 'v' } })
end

return M
