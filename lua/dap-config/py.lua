local dap = require('dap')

require('dap-python').setup('~/.virtualenvs/debugpy/bin/python')

table.insert(dap.configurations.python, {
  type = 'python',
  request = 'launch',
  name = 'Django',
  program = vim.fn.getcwd() .. '/manage.py',
  args = {'runserver'},
})
