local M = {}

function M.setup()
  require('competitest').setup({
    testcases_directory = './tests',
  })
end

function M.keymaps()
  require('which-key').register({
    ['<space>td'] = {
      name = 'CompetiTest Download',
    },
  })
  return {
    { '<space>tr', '<cmd>CompetiTest run<CR>', silent = true, desc = 'Competi[T]est [R]un' },
    { '<space>to', '<cmd>CompetiTest show_ui<CR>', silent = true, desc = 'Competi[T]est [O]pen' },
    {
      '<space>tdt',
      '<cmd>CompetiTest receive testcases<CR>',
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
    { '<space>te', ':CompetiTest edit_testcase ', desc = 'Competi[T]est [E]dit' },
  }
end

return M
