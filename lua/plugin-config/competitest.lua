local M = {}

function M.setup()
  require('competitest').setup()
end

function M.keymaps()
  require('which-key').register({
    r = { '<cmd>CompetiTestRun<CR>', '[T]est [R]un' },
    o = { '<cmd>CompetiTestRunNE<CR>', '[T]est [O]pen' },
    d = {
      t = { '<cmd>CompetiTestReceive testcases<CR>', '[T]est [D]ownload [T]estcases' },
      p = { '<cmd>CompetiTestReceive problem<CR>', '[T]est [D]ownload [P]roblem' },
      c = { '<cmd>CompetiTestReceive contest<CR>', '[T]est [D]ownload [C]ontest' },
    },
    a = { '<cmd>CompetiTestAdd<CR>', '[T]est [A]dd' },
  }, { prefix = '<space>t' })

  require('which-key').register({
    ['<space>te'] = { '<cmd>CompetiTestEdit ', '[T]est [E]dit' },
  }, { silent = false })
end

return M
