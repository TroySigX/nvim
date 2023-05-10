require('competitest').setup()

local map = vim.keymap.set
map('n', '<space>tr', ':CompetiTestRun<CR>', { desc = '[T]est [R]un', noremap = true, silent = true })
map('n', '<space>td', function()
  local type = vim.fn.input('What to download? [T]estcase / [C]ontest / [P]roblem: ')
  type = string.lower(type)

  if type == 't' or type == 'testcase' then
    type = 'testcases'
  elseif type == 'c' or type == 'contest' then
    type = 'contest'
  elseif type == 'p' or type == 'problem' then
    type = 'problem'
  else
    type = ''
  end

  if type ~= '' then
    vim.cmd('CompetiTestReceive ' .. type)
  else
    print('Invalid input')
  end
end, { desc = '[T]est [D]ownload', noremap = true, silent = true })
