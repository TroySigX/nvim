local M = {}

function M.setup()
  require('neotest').setup({
    adapters = {
      require('neotest-jest')({
        jestCommand = 'npm test --',
        jestConfigFile = 'custom.jest.config.ts',
        env = { CI = true },
        cwd = function()
          return vim.fn.getcwd()
        end,
      }),

      require('neotest-gtest').setup({}),

      require('neotest-python')({
        runner = 'pytest',
      }),
    },

    quickfix = {
      open = false,
    },
  })
end

function M.keymaps()
  require('which-key').register({
    t = {
      name = 'unit test',
      r = {
        function()
          require('neotest').run.run()
        end,
        'Neo[T]est [R]un',
      },
      R = {
        function()
          require('neotest').run.run(vim.fn.expand('%'))
        end,
        'Neo[T]est [R]un All',
      },
      s = {
        function()
          require('neotest').run.stop()
        end,
        'Neo[T]est [S]top',
      },
      S = {
        function()
          require('neotest').run.stop(vim.fn.expand('%'))
        end,
        'Neo[T]est [S]top All',
      },
      t = {
        function()
          require('neotest').summary.toggle()
          local win = vim.fn.bufwinid('Neotest Summary')
          if win > -1 then
            vim.api.nvim_set_current_win(win)
          end
        end,
        'Neo[T]est [T]oggle',
      },
      e = {
        function()
          require('neotest').output.open({ enter = true })
        end,
        'Neo[T]est [E]rrors',
      },
    },
  }, { prefix = '<leader>' })
end

return M
