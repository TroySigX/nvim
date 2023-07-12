local M = {}

function M.setup()
  local dap = require('dap')

  require('dap-python').setup(vim.fn.stdpath('data') .. '/mason/packages/debugpy/venv/bin/python')

  table.insert(dap.configurations.python, {
    type = 'python',
    request = 'launch',
    name = 'Django',
    program = vim.fn.getcwd() .. '/manage.py',
    args = { 'runserver' },
  })
end

return M
