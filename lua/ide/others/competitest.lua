local M = {}

function M.setup()
  require('competitest').setup({
    testcases_directory = 'tests',
  })
end

function M.keymaps()
  local map = require('utils.keymaps').add_keymap
  require('which-key').add({ '<space>td', group = 'CompetiTest Download' })
  map({
    '<space>tdt',
    ':CompetiTest receive testcases<CR>',
    'Competi[T]est [D]ownload [T]estcases',
  })
  map({
    '<space>tdp',
    ':CompetiTest receive problem<CR>',
    'Competi[T]est [D]ownload [P]roblem',
  })
  map({
    '<space>tdc',
    ':CompetiTest receive contest<CR>',
    'Competi[T]est [D]ownload [C]ontest',
  })

  map({
    '<space>tr',
    ':CompetiTest run<CR>',
    'Competi[T]est [R]un',
  })
  map({
    '<space>to',
    ':CompetiTest show_ui<CR>',
    'Competi[T]est [O]pen',
  })
  map({
    '<space>ta',
    ':CompetiTest add_testcase<CR>',
    'Competi[T]est [A]dd',
  })
  map({
    '<space>te',
    ':CompetiTest edit_testcase ',
    'Competi[T]est [E]dit',
  })
end

return M
