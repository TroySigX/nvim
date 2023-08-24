local M = {}

function M.keymaps()
  local map = require('which-key').register

  map({
    r = {
      f = {
        function()
          require('refactoring').refactor('Extract Function')
        end,
        '[R]efactor extract [F]unction',
      },
    },
  }, { prefix = '<leader>', mode = 'x' })

  map({
    r = {
      b = {
        function()
          require('refactoring').refactor('Extract Block')
        end,
        '[R]efactor extract [B]lock',
      },
    },
  }, { prefix = '<leader>' })

  map({
    rv = {
      e = {
        function()
          require('refactoring').refactor('Extract Function')
        end,
        '[R]efactor [V]ariable [E]xtract',
      },
      i = {
        function()
          require('refactoring').refactor('Inline Variable')
        end,
        '[R]efactor [V]ariable [I]nline (opposite of extract variable)',
      },
    },
  })
end

function M.setup()
  require('refactoring').setup({
    -- prompt for return type
    prompt_func_return_type = {
      go = true,
      cpp = true,
      c = true,
      java = true,
    },
    -- prompt for function parameters
    prompt_func_param_type = {
      go = true,
      cpp = true,
      c = true,
      java = true,
    },
  })
end

return M
