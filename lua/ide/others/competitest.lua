local M = {}

function M.setup()
  require('competitest').setup({
    testcases_directory = 'tests',
  })
end

function M.keymaps()
  require('which-key').register({
    ['<space>t'] = {
      d = {
        name = 'CompetiTest Download',
        t = {
          ':CompetiTest receive testcases<CR>',
          'Competi[T]est [D]ownload [T]estcases',
        },
        p = {
          ':CompetiTest receive problem<CR>',
          'Competi[T]est [D]ownload [P]roblem',
        },
        c = {
          ':CompetiTest receive contest<CR>',
          'Competi[T]est [D]ownload [C]ontest',
        },
      },

      r = {
        ':CompetiTest run<CR>',
        'Competi[T]est [R]un',
      },
      o = {
        ':CompetiTest show_ui<CR>',
        'Competi[T]est [O]pen',
      },
      a = {
        ':CompetiTest add_testcase<CR>',
        'Competi[T]est [A]dd',
      },
      e = {
        ':CompetiTest edit_testcase ',
        'Competi[T]est [E]dit',
      },
    },
  })
end

return M
