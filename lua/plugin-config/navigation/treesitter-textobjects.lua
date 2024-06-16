local M = {}

function M.setup()
  require('which-key').register({
    [',,'] = {
      function()
        require('nvim-treesitter.textobjects.repeatable_move').repeat_last_move()
      end,
      'Repeat last textobjects movement',
    },
  }, { mode = 'n', 'x', 'o' })

  require('nvim-treesitter.configs').setup({
    textobjects = {
      select = {
        enable = true,

        lookahead = true,

        keymaps = {
          -- You can use the capture groups defined in textobjects.scm
          ['af'] = { query = '@function.outer', desc = 'Select outer part of function' },
          ['if'] = { query = '@function.inner', desc = 'Select inner part of function' },
          ['ac'] = { query = '@class.outer', desc = 'Select outer part (include def) of class' },
          ['ic'] = { query = '@class.inner', desc = 'Select inner part of class' },
        },

        selection_modes = {
          ['@parameter.outer'] = 'v',
          ['@function.outer'] = 'V',
          ['@class.outer'] = '<c-v>',
        },

        include_surrounding_whitespace = false,
      },

      move = {
        enable = true,
        set_jumps = true,
        goto_next_start = {
          [',f'] = { query = '@function.outer', desc = 'Go to next function' },
          [',c'] = { query = '@class.outer', desc = 'Go to next class' },
          [',z'] = { query = '@fold', query_group = 'folds', desc = 'Go to next fold' },
        },
        goto_next_end = {
          [',ef'] = { query = '@function.outer', desc = 'Go to end of function' },
          [',ec'] = { query = '@class.outer', desc = 'Go to end of class' },
          [',ez'] = { query = '@fold', query_group = 'folds', desc = 'Go to end of fold' },
        },
        goto_previous_start = {
          [',F'] = { query = '@function.outer', desc = 'Go to previous function' },
          [',C'] = { query = '@class.outer', desc = 'Go to previous class' },
          [',Z'] = { query = '@fold', query_group = 'folds', desc = 'Go to previous fold' },
        },
        goto_previous_end = {
          [',EF'] = { query = '@function.outer', desc = 'Go to end of previous function' },
          [',EC'] = { query = '@class.outer', desc = 'Go to end of previous class' },
          [',EZ'] = { query = '@fold', query_group = 'folds', desc = 'Go to end of previous fold' },
        },
      },
    },
  })
end

return M
