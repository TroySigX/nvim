local M = {}

function M.setup()
  require('competitest').setup()
end

function M.keymaps()
  return {
    { '<space>tr', vim.cmd.CompetiTestRun, silent = true, desc = 'Competi[T]est [R]un' },
    { '<space>to', vim.cmd.CompetiTestRunNE, silent = true, desc = 'Competi[T]est [O]pen' },
    {
      '<space>tdt',
      '<cmd>CompetiTestReceive testcases<CR>',
      silent = true,
      desc = 'Competi[T]est [D]ownload [T]estcases',
    },
    {
      '<space>tdp',
      '<cmd>CompetiTest receive problem<CR>',
      silent = true,
      desc = 'Competi[T]est [D]ownload [P]roblem',
    },
    {
      '<space>tdc',
      '<cmd>CompetiTest receive contest<CR>',
      silent = true,
      desc = 'Competi[T]est [D]ownload [C]ontest',
    },
    { '<space>ta', '<cmd>CompetiTest add_testcase<CR>', silent = true, desc = 'Competi[T]est [A]dd' },
    { '<space>te', '<cmd>CompetiTest edit_testcase ', desc = 'Competi[T]est [E]dit' },
  }
end

return M
