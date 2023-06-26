require('which-key').register({
  t = { require('neotest').run.run, '[T]est Current Test' },
  at = { function() require('neotest').run.run(vim.fn.expand('%')) end, 'Run [A]ll [T]est' },
  T = { require('neotest').run.stop, 'Stop Current Test' },
  AT = { function() require('neotest').run.stop(vim.fn.expand('%')) end, 'Stop All Test' },
}, { prefix = '<leader>' })

require('which-key').register({
  ['<F4>'] = { function()
    require('neotest').summary.toggle()
    local win = vim.fn.bufwinid('Neotest Summary')
    if win > -1 then
      vim.api.nvim_set_current_win(win)
    end
  end, 'Toggle Neotest Summary' },
}, { mode = { 'n', 'i', 'v' } })
