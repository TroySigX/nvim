local M = {}

function M.keymaps()
  local map = require('utils.keymaps').add_keymap
  map({
    '<leader>rf',
    function()
      require('refactoring').refactor('Extract Function')
    end,
    '[R]efactor extract [F]unction',
    mode = 'x',
  })
  map({
    '<leader>rve',
    function()
      require('refactoring').refactor('Extract Variable')
    end,
    '[R]efactor [V]ariable [E]xtract',
    mode = 'x',
  })
  map({
    '<leader>rvi',
    function()
      require('refactoring').refactor('Inline Variable')
    end,
    '[R]efactor [V]ariable [I]nline (opposite of extract variable)',
    mode = 'x',
  })

  map({
    '<leader>rb',
    function()
      require('refactoring').refactor('Extract Block')
    end,
    '[R]efactor extract [B]lock',
  })
  map({
    '<leader>rvi',
    function()
      require('refactoring').refactor('Inline Variable')
    end,
    '[R]efactor [V]ariable [I]nline (opposite of extract variable)',
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
